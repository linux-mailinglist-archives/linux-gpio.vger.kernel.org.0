Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668FE1CEA18
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 03:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgELBXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 21:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbgELBXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 May 2020 21:23:00 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B889C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2020 18:22:59 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z1so5576037pfn.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2020 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rvNxntDeexCd7VZSGnVRoemTH38Jc+aBjHlUNupdABc=;
        b=atSBublTcto3epYtRg/c05QtyAez9kHSmO/iI2vtHSUL852U5XYG6lL9rI91Sczfm9
         hHwAb1SFlPi0hAdtbcwA1eW0j5JB6cb8JDfo7qB10p5i2XJzOBUS+e1SxSs1qoBlbnXv
         /ihzDqNEJOFRSR4cE4JSeJQq+dbzFO51Zj3DYji0TapflR6qrRdRiUTXTGcbufd34olp
         50dJVZamCy+Hd1GVFUYKJO32EnOKXBvZb29fprkErsxg0byPS4L6Mc1pD4mkbzriYUzd
         ci/XuL+CfsDz/bcY4jThdLN0w2hIFdgtUoRfEHNws76lzJf0vzwm+t0Ho+bV1OWeZh3s
         HhvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rvNxntDeexCd7VZSGnVRoemTH38Jc+aBjHlUNupdABc=;
        b=J+BDyMjnNCiGx0kUTsx/hs8sSKxkQdLPLZbZxv+LilRKsSwWTbSMNZRz/aqTDDnodG
         b6vCFPKl1ikoeSlRJXHr8JJv7vBiSpiWL4kGyOdlH4+QfBF4WzVyh1vrsHeGqc+ZtYT2
         kMZZKQRswJdNZBqtDpY8JZpFx8W1kT4bLAdgO8IFzh3d+Y/WgLs3b59n5RJyfFUzmuG0
         dpT5DjUBJoMt7Zkk+kJtvDFeLy2wI6LMdv5b2aJdWoeugJYi7bftmuAj4aHjnKBmXJK1
         37xZge3iWqx0hGUKcFshkPYulDYP9Ah8YOn7LGJfSj4LakYoE31nnnzdeIh8l8pWAZvs
         K+VA==
X-Gm-Message-State: AGi0PubERawAEOPSEhDCVAv3KWrlh8FnI0lRxEwMsCezNAl+/4+0Fvt5
        u5Xv5+0wiFasl6Om18so6vD3zw==
X-Google-Smtp-Source: APiQypLn6g4IZcdlvBjSJuJuDl2/3qY5ewye8c0iiWpzkOBNDc6PtG12DjCtqf0G3JBWZY21cS/tsg==
X-Received: by 2002:a62:3644:: with SMTP id d65mr18205186pfa.186.1589246578672;
        Mon, 11 May 2020 18:22:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w11sm10245851pfq.100.2020.05.11.18.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 18:22:57 -0700 (PDT)
Date:   Mon, 11 May 2020 18:21:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org,
        jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, swboyd@chromium.org,
        jernej.skrabec@siol.net, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on
 cheza
Message-ID: <20200512012123.GC57962@builder.lan>
References: <20200507213500.241695-1-dianders@chromium.org>
 <20200507143354.v5.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507143354.v5.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu 07 May 14:35 PDT 2020, Douglas Anderson wrote:

> We don't have the HPD line hooked up to the bridge chip.  Add it as
> suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
> Document no-hpd").
> 
> NOTE: this patch isn't expected to have any effect but just keeps us
> cleaner for the future.  Currently the driver in Linux just assumes
> that nobody has HPD hooked up.  This change allows us to later
> implement HPD support in the driver without messing up sdm845-cheza.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Applied this patch for 5.8 in the Qualcomm SoC tree.

Regards,
Bjorn

> ---
> 
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - ("arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on cheza") new for v2.
> 
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index 9070be43a309..5938f8b2aa2f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -548,6 +548,8 @@ sn65dsi86_bridge: bridge@2d {
>  		clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
>  		clock-names = "refclk";
>  
> +		no-hpd;
> +
>  		ports {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -- 
> 2.26.2.645.ge9eca65c58-goog
> 
