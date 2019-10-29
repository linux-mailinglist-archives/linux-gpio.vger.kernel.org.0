Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33785E922C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 22:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfJ2ViA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 17:38:00 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36359 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbfJ2ViA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 17:38:00 -0400
Received: by mail-ot1-f68.google.com with SMTP id c7so269535otm.3;
        Tue, 29 Oct 2019 14:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HPk/5F3b4dwjuAgfQmnttu0kTaOON9LgkQM/V749G3U=;
        b=ldPZRMNoOEsvxQSLrVsZsB2vaAyJMN9JWGghaVvDXtP4u5ecCVsnf9cPa9MCHgY3BD
         RCVqiSfQJBvo8gHGyuSjeI4SNGjY7AMEvUyW10N2dveXWgnmuFdNr33NMsI7ZbKug887
         Zc18rEx44urVurPllxdsBjOghfg4v4VyCauNZ41bGId/hgY6zXznaqk8t61vAmWFqNYR
         CYyaSEDel0TJa+yntGZeQjxuC4HT/vJcTMdNsEEHVI5fdKXh1w8WjYXUgXY+JZu+Sio4
         fgzFJX/l3obqAL2l+bR8+zC/4Vl6T+WnaMBdDERRjmA/N3k7phxdnDNQAW8u27cYAudt
         Sn4g==
X-Gm-Message-State: APjAAAVRR4xeZRZ+w8Cwf+Jyi/hgYlWXPEY4UW07hIekiVGg/kNpAto2
        6u5Uv3FPgJ/FCIYU+ULOSw==
X-Google-Smtp-Source: APXvYqy7vhLoX8SU0VKqi+P/9oYgBPX9zkqE7WV/iDYFf8wu0E5QI6Ui9HTTqSZxoCU6ChBhHps5bQ==
X-Received: by 2002:a9d:6655:: with SMTP id q21mr16322722otm.47.1572385079003;
        Tue, 29 Oct 2019 14:37:59 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k10sm4175oig.25.2019.10.29.14.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 14:37:58 -0700 (PDT)
Date:   Tue, 29 Oct 2019 16:37:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ludovic.desroches@microchip.com, linus.walleij@linaro.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com
Subject: Re: [PATCH] pinctrl: at91: Enable slewrate by default on SAM9X60
Message-ID: <20191029213757.GA8829@bogus>
References: <20191024172234.5267-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024172234.5267-1-codrin.ciubotariu@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 24, 2019 at 08:22:34PM +0300, Codrin Ciubotariu wrote:
> On SAM9X60, slewrate should be enabled on pins with a switching frequency
> below 50Mhz. Since most of our pins do not exceed this value, we enable
> slewrate by default. Pins with a switching value that exceeds 50Mhz will
> have to explicitly disable slewrate.
> 
> Suggested-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  drivers/pinctrl/pinctrl-at91.c     | 4 ++--
>  include/dt-bindings/pinctrl/at91.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index 117075b5798f..c135149e84e9 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -85,8 +85,8 @@ enum drive_strength_bit {
>  					 DRIVE_STRENGTH_SHIFT)
>  
>  enum slewrate_bit {
> -	SLEWRATE_BIT_DIS,
>  	SLEWRATE_BIT_ENA,
> +	SLEWRATE_BIT_DIS,
>  };
>  
>  #define SLEWRATE_BIT_MSK(name)		(SLEWRATE_BIT_##name << SLEWRATE_SHIFT)
> @@ -669,7 +669,7 @@ static void at91_mux_sam9x60_set_slewrate(void __iomem *pio, unsigned pin,
>  {
>  	unsigned int tmp;
>  
> -	if (setting < SLEWRATE_BIT_DIS || setting > SLEWRATE_BIT_ENA)
> +	if (setting < SLEWRATE_BIT_ENA || setting > SLEWRATE_BIT_DIS)
>  		return;
>  
>  	tmp = readl_relaxed(pio + SAM9X60_PIO_SLEWR);
> diff --git a/include/dt-bindings/pinctrl/at91.h b/include/dt-bindings/pinctrl/at91.h
> index 3831f91fb3ba..e8e117306b1b 100644
> --- a/include/dt-bindings/pinctrl/at91.h
> +++ b/include/dt-bindings/pinctrl/at91.h
> @@ -27,8 +27,8 @@
>  #define AT91_PINCTRL_DRIVE_STRENGTH_MED			(0x2 << 5)
>  #define AT91_PINCTRL_DRIVE_STRENGTH_HI			(0x3 << 5)
>  
> -#define AT91_PINCTRL_SLEWRATE_DIS	(0x0 << 9)
> -#define AT91_PINCTRL_SLEWRATE_ENA	(0x1 << 9)
> +#define AT91_PINCTRL_SLEWRATE_ENA	(0x0 << 9)
> +#define AT91_PINCTRL_SLEWRATE_DIS	(0x1 << 9)

This is an ABI. You can't just change the definition.

Rob
