Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC8244DC5E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhKKUI5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:08:57 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:38821 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhKKUI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:08:56 -0500
Received: by mail-oi1-f174.google.com with SMTP id r26so13627646oiw.5;
        Thu, 11 Nov 2021 12:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HuT29kr7jQT7cuNJmoGPLr0geLlUe5ftqPVAaDrc9ho=;
        b=A8NuL1wOy/ZRMKxUmj6nUeGV4uZXy0Xq37BWwEUa7RfeZM2KCMDmAwMzGrLK2fDywX
         L/gywIvzi8wVOHPINWuj7PSNj5JA6Z1O5y2snZRrDXxQCOyFtcpYQW4quACZCQrIwbW0
         3tBvIN80Xoy98MDOUq3oI4n4+6H+d7igxPqa85uV4wxhpOoD8XJEZvTjAsYyToHa5pdo
         DR6mHD+PvPqrs71tgi7GYEkF6nqSn+JwNPSCQ4aMqD0ZoaCIT/9opRRfSE1zu0OkmkEN
         MaP+sy3kHub/rJkS/4AtmvniWaz//IgwD9rIm6Zc8B0usLMfMI5nP8uC1nBfmhZx25EC
         5DTQ==
X-Gm-Message-State: AOAM532ZITjoE3SXyq16lW9L+lrrOBwix/mtKP0RPXw+BaIVFpyDzIzM
        DByszUn7F9SGuHTXhkI7TQ==
X-Google-Smtp-Source: ABdhPJwz5SIVcWpRIh29F5oJTI35LeD9ENrLRATSeuGMhvBuf8o4x0OWa36CzlMzxop2TVbYrGJDGw==
X-Received: by 2002:a05:6808:211f:: with SMTP id r31mr8393771oiw.64.1636661166208;
        Thu, 11 Nov 2021 12:06:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x23sm709471ooo.34.2021.11.11.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 12:06:05 -0800 (PST)
Received: (nullmailer pid 14106 invoked by uid 1000);
        Thu, 11 Nov 2021 20:06:04 -0000
Date:   Thu, 11 Nov 2021 14:06:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
Message-ID: <YY13rKxQpzcB4f0b@robh.at.kernel.org>
References: <20211110231436.8866-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211110231436.8866-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 12:14:36AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add support for "pins" node with pin@ subnodes. This allows specifying
> all pins (and their names) at DT level.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> While working with pinctrl in Linux I started wondering if we could
> start specifying pins in DT instead of Linux drivers. When working with
> DT we usually avoid hardcoding hardware description in drivers so it
> isn't clear to me why it doesn't apply to pins.
> 
> Please let me know if this makes sense. If by some chance I'm correct I
> think that specifying groups and functions could follow too.
> 
> FWIW: I didn't start working on Linux reading pins from DT yet.
> ---
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 12 +++++++++-
>  .../devicetree/bindings/pinctrl/pinctrl.yaml  | 23 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> index 8d1e5b1cdd5f..92a86b0822d6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> @@ -74,7 +74,7 @@ required:
>    - reg
>    - reg-names
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> @@ -83,6 +83,16 @@ examples:
>          reg = <0x1800c1c0 0x24>;
>          reg-names = "cru_gpio_control";
>  
> +        pins {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            pin@0 {
> +                reg = <0>;

Where does 'reg' value come from?

> +                label = "spi_clk";
> +            };

If you just want a list of pins names, then why not just a list of 
names?

Rob
