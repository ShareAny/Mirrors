{assign var="keywords" value=""}
{assign var="description" value=""}
{extends file="../base/base.tpl"}
{block name="body"}
    {if not empty($about)}
        <div style="background-color: #008cd6;color:#fff; padding:8px;">
            {if not empty($logo)}
                <div style="text-align: center;"><img src="{$logo}" style="max-height:100px;width:auto;"></div>
            {/if}
            <div>{$about}</div>
        </div>
    {/if}
    <table class="table table-hover table-bordered" id="project">
        <tr class="active">
            <th colspan="3">
                <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>&nbsp;
                <a href="{$root}" title="CacheDream">CacheDream</a> /
                <a href="{$root}web/" title="Web Static File">Web Static File</a>

                {foreach from=$crumbs key=key item=value}
                    {if $key neq 'Root'}
                        /
                    {/if}
                    <a href="{$value}" title="{$key}">{$key}</a>
                {/foreach}
            </th>
        </tr>
        <tr class="active">
            <th>File</th>
            <th>Type</th>
            <th>Code</th>
        </tr>
        {foreach from=$list item=value}
            <tr class="project" data-text="{$value['file']}">
                {if $value['type'] eq 'hide'}
                {elseif $value['type'] eq 'folder'}
                    <td><a href="{$value['link']}" title="{$value['file']}">{$value['file']}</a></td>
                    <td>Folder</td>
                    <td></td>
                {elseif $value['type'] eq 'js'}
                    <td><a href="{$value['cdn']}" title="{$value['file']}" target="_blank">{$value['file']}</a></td>
                    <td>JavaScript</td>
                    <td>&lt;script src=&quot;{$value['cdn']}&quot;&gt;&lt;/script&gt;</td>
                {elseif $value['type'] eq 'css'}
                    <td><a href="{$value['cdn']}" title="{$value['file']}" target="_blank">{$value['file']}</a></td>
                    <td>Style Sheet</td>
                    <td>&lt;link rel=&quot;stylesheet&quot; href=&quot;{$value['cdn']}&quot;&gt;</td>
                {elseif $value['type'] eq 'png'}
                    <td><a href="{$value['cdn']}" target="_blank">{$value['file']}</a></td>
                    <td>Image</td>
                    <td>&lt;img src=&quot;{$value['cdn']}&quot;&gt;</td>
                {elseif $value['type'] eq 'jpg'}
                    <td><a href="{$value['cdn']}" target="_blank">{$value['file']}</a></td>
                    <td>Image</td>
                    <td>&lt;img src=&quot;{$value['cdn']}&quot;&gt;</td>
                {elseif $value['type'] eq 'jpeg'}
                    <td><a href="{$value['cdn']}" target="_blank">{$value['file']}</a></td>
                    <td>Image</td>
                    <td>&lt;img src=&quot;{$value['cdn']}&quot;&gt;</td>
                {elseif $value['type'] eq 'gif'}
                    <td><a href="{$value['cdn']}" target="_blank">{$value['file']}</a></td>
                    <td>Image</td>
                    <td>&lt;img src=&quot;{$value['cdn']}&quot;&gt;</td>
                {elseif $value['type'] eq 'bmp'}
                    <td><a href="{$value['cdn']}" target="_blank">{$value['file']}</a></td>
                    <td>Image</td>
                    <td>&lt;img src=&quot;{$value['cdn']}&quot;&gt;</td>
                {else}
                    <td><a href="{$value['cdn']}" title="{$value['file']}" target="_blank">{$value['file']}</a></td>
                    <td>Unknown</td>
                    <td></td>
                {/if}
            </tr>
        {/foreach}
    </table>
{/block}
{block name="style"}
    <link rel="stylesheet" href="{$static}/style/index.css">
{/block}
{block name="script"}
    <script>
        function search() {
            $("#project").find("tr.project").each(function () {
                var text = $.trim(String($(this).attr('data-text'))).toLowerCase();
                var keyword = $.trim(String($("#search_input").val())).toLowerCase();
                if (keyword == "") {
                    $(this).show();
                } else {
                    if (text.indexOf(keyword) >= 0) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                }
            });
        }
        $("#search_input").keydown(function () {
            if (event.keyCode == "13") {
                search();
            }
        });
        $("#search_input").on("input", function () {
            search();
        });
    </script>
{/block}