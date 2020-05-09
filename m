Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E2E1CC477
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 22:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgEIUPR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 16:15:17 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:33350 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgEIUPR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 16:15:17 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 8DA4C8040D;
        Sat,  9 May 2020 22:15:12 +0200 (CEST)
Date:   Sat, 9 May 2020 22:15:11 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org,
        robdclark@chromium.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, jeffrey.l.hugo@gmail.com,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, linux-gpio@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] drm: Prepare to use a GPIO on ti-sn65dsi86 for
 Hot Plug Detect
Message-ID: <20200509201511.GD30802@ravnborg.org>
References: <20200507213500.241695-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507213500.241695-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=xIMv8E6STwWXap7QaoUA:9
        a=MmyVcT6jqkqIQj2q:21 a=ybJrlLe2WBs5tQMk:21 a=CjuIK1q_8ugA:10
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Douglas.

On Thu, May 07, 2020 at 02:34:54PM -0700, Douglas Anderson wrote:
> 
> As talked about in commit c2bfc223882d ("drm/bridge: ti-sn65dsi86:
> Remove the mystery delay"), the normal HPD pin on ti-sn65dsi86 is
> kinda useless, at least for embedded DisplayPort (eDP).  However,
> despite the fact that the actual HPD pin on the bridge is mostly
> useless for eDP, the concept of HPD for eDP still makes sense.  It
> allows us to optimize out a hardcoded delay that many panels need if
> HPD isn't hooked up.  Panel timing diagrams show HPD as one of the
> events to measure timing from and we have to assume the worst case if
> we can't actually read HPD.
> 
> One way to use HPD for eDP without using the mostly useless HPD pin on
> ti-sn65dsi86 is to route the panel's HPD somewhere else in the system,
> like to a GPIO.  This works great because eDP panels aren't physically
> hotplugged.  That means the debouncing logic that caused us problems
> wasn't really needed and a raw GPIO works great.
> 
> As per the above, a smart board designer would realize the value of
> HPD and choose to route it to a GPIO somewhere on the board to avoid
> the silly sn65dsi86 debouncing.  While said "smart designer" could
> theoretically route HPD anywhere on the board, a really smart designer
> would realize that there are several GPIOs on the bridge itself that
> are nearly useless for anything but this purpose and route HPD to one
> of those.
> 
> This series of patches is intended to allow the scenario described
> above.
> 
> This patch has been tested on a board that is not yet mainline.  On
> the hardware I have:
> - Panel spec says HPD could take up to 200 ms to come up, so without
>   HPD hooked up we need to delay 200 ms.
> - On my board the panel is powered by the same rail as the
>   touchscreen.  By chance of probe order the touchscreen comes up
>   first.  This means by the time we check HPD in ti_sn_bridge_enable()
>   it's already up.  Thus we can use the panel on 200 ms earlier.
> - If I measure HPD on this pane it comes up ~56 ms after the panel is
>   powered.  This means I can save 144 ms of delay.
> 
> Side effects (though not main goals) of this series are:
> - ti-sn65dsi86 GPIOs are now exported in Linux.
> - ti-sn65dsi86 bindings are converted to yaml.
> - Common panel bindings now have "hpd-gpios" listed.
> - The simple-panel driver in Linux can delay in prepare based on
>   "hpd-gpios"
> - ti-sn65dsi86 bindings (and current user) now specifies "no-hpd"
>   if HPD isn't hooked up.
> 
> Changes in v5:
> - Use of_xlate so that numbers in dts start at 1, not 0.
> - Squash https://lore.kernel.org/r/20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid/
> 
> Changes in v4:
> - Don't include gpio.h
> - Use gpiochip_get_data() instead of container_of() to get data.
> - GPIOF_DIR_XXX => GPIO_LINE_DIRECTION_XXX
> - Use Linus W's favorite syntax to read a bit from a bitfield.
> - Define and use SN_GPIO_MUX_MASK.
> - Add a comment about why we use a bitmap for gchip_output.
> - Tacked on "or is otherwise unusable." to description.
> 
> Changes in v3:
> - Becaue => Because
> - Add a kernel-doc to our pdata to clarify double-duty of gchip_output.
> - More comments about how powering off affects us (get_dir, dir_input).
> - Cleanup tail of ti_sn_setup_gpio_controller() to avoid one "return".
> - Use a bitmap rather than rolling my own.
> - Remind how gpio_get_optional() works in the commit message.
> - useful implement => useful to implement
> 
> Changes in v2:
> - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
> - ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
> - ("simple...hpd-gpios") is 1/2 of replacement for ("Allow...bridge GPIOs")
> - specification => specifier.
> - power up => power.
> - Added back missing suspend-gpios.
> - data-lanes and lane-polarities are are the right place now.
> - endpoints don't need to be patternProperties.
> - Specified more details for data-lanes and lane-polarities.
> - Added old example back in, fixing bugs in it.
> - Example i2c bus is just called "i2c", not "i2c1" now.
> - ("dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd") new for v2.
> - ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.
> 
> Douglas Anderson (6):
>   drm/bridge: ti-sn65dsi86: Export bridge GPIOs to Linux
>   dt-bindings: display: Add hpd-gpios to panel-common bindings
>   drm/panel-simple: Support hpd-gpios for delaying prepare()
>   dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
>   dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
>   arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza

Applied:
>   dt-bindings: display: Add hpd-gpios to panel-common bindings
>   drm/panel-simple: Support hpd-gpios for delaying prepare()
to drm-misc-next.

The others was missing reviews so we need to wait for feedback.

	Sam
