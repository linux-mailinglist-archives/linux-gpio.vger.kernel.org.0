Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F28264A61
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 18:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgIJQzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 12:55:20 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33638 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgIJQxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 12:53:15 -0400
Received: by mail-ed1-f68.google.com with SMTP id g4so7055591edk.0;
        Thu, 10 Sep 2020 09:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3nk4XRQ2S4e5AEFEFMDuymF8Jl6oZV0YsM2IeVg++t0=;
        b=On72LEkIvNUnORcGqc2Mc5kYADQ9+AadLn2X03TvyU8wdNzl4tfhMPVmOlnvSy3wXN
         bWe5KFO0NP+xVA5HoyCU2hN5bJSA51CDpTjAmRM+/LTjOPkWrbHmbmbxytPYtPelVea8
         qK0fQ/NEU+xxHC3hUJLCI+m0D1NkJkii8hu7+OB4B5uOtw7OAXH/FMrQODG8Ar6CjeJy
         9m4JHxxzFocIkhMZNS83qpCcbL8vJkNftdPPl2ougT50A2aQbcUXTPrgJq46vXr295Lt
         W3d1QrP76+VgGlGK09vHvz8m7T/PYv/dwdD+FfAzDFZ8CevwM46A6Xk5g5hakU86oyyK
         U0DQ==
X-Gm-Message-State: AOAM531ZVBsjjG46HtWGuxd3w55CmkGPfkPKcfclxjqGOvJBVGsHAhia
        hLcmbycsBsyz5CNufdF9Ks0=
X-Google-Smtp-Source: ABdhPJyquD6+nZSxDAFxh5wceHTIih3xdZbNqTBnMJD615DtbqdBY7qzu8F3twgU/y/4F0Tvr77Hdg==
X-Received: by 2002:a05:6402:cb4:: with SMTP id cn20mr10351438edb.369.1599756792337;
        Thu, 10 Sep 2020 09:53:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id 35sm7851689edg.71.2020.09.10.09.53.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 09:53:10 -0700 (PDT)
Date:   Thu, 10 Sep 2020 18:53:08 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 4/6] ARM: dts: aspeed: Fix PCA95xx GPIO expander
 properties on Portwell
Message-ID: <20200910165308.GA11510@kozik-lap>
References: <20200829094024.31842-1-krzk@kernel.org>
 <20200829094024.31842-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200829094024.31842-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 29, 2020 at 11:40:22AM +0200, Krzysztof Kozlowski wrote:
> The PCA95xx GPIO expander requires GPIO controller properties to operate
> properly.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 2 ++
>  1 file changed, 2 insertions(+)

Hi everyone,

Any comments here?

Best regards,
Krzysztof


> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> index 4a1ca8f5b6a7..03c161493ffc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
> @@ -121,6 +121,8 @@
>  	pca9555@27 {
>  		compatible = "nxp,pca9555";
>  		reg = <0x27>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
>  	};
>  };
>  
> -- 
> 2.17.1
> 
