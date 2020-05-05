Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D861C632E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2020 23:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgEEViV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 May 2020 17:38:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60772 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgEEViU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2020 17:38:20 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FAB1542;
        Tue,  5 May 2020 23:38:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588714698;
        bh=M5j/b8gzH+fEUm7+KYZDdahsQo0EipSPaFfxodU1oig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bv9ht1WdBhg5CG4w/4P+SK85qmX/CvOLXcCs97A7poVWrT2LdnEqelj9shuNxri23
         q+7yrOU1+3pUmQ9bPZT1IQmdPG+EUdXY08/5sotkN0gT4/e7xHTlMi5/1yOEmRdUtF
         KGW4DTMbakP9826lut/JbXBtDvAaovgd0KwXycFQ=
Date:   Wed, 6 May 2020 00:38:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        spanda@codeaurora.org, linux-gpio@vger.kernel.org, jonas@kwiboo.se,
        robdclark@chromium.org, bjorn.andersson@linaro.org,
        jeffrey.l.hugo@gmail.com, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: display: Add hpd-gpios to
 panel-common bindings
Message-ID: <20200505213813.GC8640@pendragon.ideasonboard.com>
References: <20200430194617.197510-1-dianders@chromium.org>
 <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200430124442.v4.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Thu, Apr 30, 2020 at 12:46:13PM -0700, Douglas Anderson wrote:
> In the cases where there is no connector in a system there's no great
> place to put "hpd-gpios".  As per discussion [1] the best place to put
> it is in the panel.  Add this to the device tree bindings.
> 
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - ("dt-bindings: display: Add hpd-gpios to panel-common...") new for v2
> 
>  .../devicetree/bindings/display/panel/panel-common.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index ed051ba12084..e9a04a3a4f5f 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -96,6 +96,12 @@ properties:
>        (hot plug detect) signal, but the signal isn't hooked up so we should
>        hardcode the max delay from the panel spec when powering up the panel.
>  
> +  hpd-gpios:
> +    maxItems: 1
> +    description:
> +      If Hot Plug Detect (HPD) is connected to a GPIO in the system rather
> +      than a dedicated HPD pin the pin can be specified here.
> +
>    # Control I/Os
>  
>    # Many display panels can be controlled through pins driven by GPIOs. The nature

-- 
Regards,

Laurent Pinchart
