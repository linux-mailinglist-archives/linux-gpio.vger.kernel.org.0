Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F82930576A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 10:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbhA0Jwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 04:52:43 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:58743 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235585AbhA0Jt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 04:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611740996; x=1643276996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+3i+bsPM/grhoAZtDpyUhjFVOODZ7Fc6Eq84gg2f818=;
  b=JAxjt3M5KA3kJapUnVehhhYxkVl+vY9GJXFQ9NG4N6Hm6+DvPb0oTj07
   qepgs1yPKj3KLfBliWcL7cHYlNdpcxks/FStT30g9GGqFwfrIniHr99l0
   jwg6c/olmSllOVPKGBJMPOTDIQ6S7e2h3pLZBA6ZVYMYInvL5bo6muTot
   /KSYVg5i/oWwQsqDLBMgUYtnkEb/flwSQphIpmMl86bZWR7gO4JT+AwcK
   lCQSpZJVTPqHkH/w+6+C3ZGFexVavO8usPQbkC6i0mKgdfPnMOA4pTnO3
   Md9Lx6KFlEA+SF+YbgyE2hVZ6RXdexpkrTh5MoHspx+aLq83bRZ+R41+8
   A==;
IronPort-SDR: dFPHY0sCCTNNwPne0kBOloW2EeIse7t/zz+h+MNximRmMgEYikXlR4mu5raGqGuDas0NdvqZ5E
 nZXqVJPLK6BBFBpvrLV0DRlsroaJgdUfYVaz+n8PiAi/aSf4CeWOJmTUH45d7J7PEjUdoQB4d0
 r3NQwcGOTDo2SH6N914fukbtpxL+n0NrsecMEZxYJ/i+hqrZcYLoKZ3KJOaW5ZDMtlDaXb0S9L
 zgnUMyZgf+OacryWxzKtNch+aVKhDhv7GdXzIAaz/zQD40YiOzthcFEeHV0zrDTenHkMrsc3Kt
 2pE=
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="106951920"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jan 2021 02:48:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 27 Jan 2021 02:48:37 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 27 Jan 2021 02:48:37 -0700
Date:   Wed, 27 Jan 2021 10:48:36 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
CC:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: at91-pio4: add slew-rate
Message-ID: <20210127094836.xwmhl7dd4oalykzz@sekiro>
References: <1611569954-23279-1-git-send-email-claudiu.beznea@microchip.com>
 <1611569954-23279-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1611569954-23279-2-git-send-email-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2021 at 12:19:12PM +0200, Claudiu Beznea wrote:
> Document slew-rate DT binding for SAMA7G5.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt       | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> index 265015bc0603..e2b861ce16d8 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> @@ -35,9 +35,11 @@ ioset settings. Use the macros from boot/dts/<soc>-pinfunc.h file to get the
>  right representation of the pin.
>  
>  Optional properties:
> -- GENERIC_PINCONFIG: generic pinconfig options to use, bias-disable,
> -bias-pull-down, bias-pull-up, drive-open-drain, input-schmitt-enable,
> -input-debounce, output-low, output-high.
> +- GENERIC_PINCONFIG: generic pinconfig options to use:
> +	- bias-disable, bias-pull-down, bias-pull-up, drive-open-drain,
> +	  input-schmitt-enable, input-debounce, output-low, output-high.
> +	- for microchip,sama7g5-pinctrl only:
> +		- slew-rate: 0 - disabled, 1 - enabled (default)
>  - atmel,drive-strength: 0 or 1 for low drive, 2 for medium drive and 3 for
>  high drive. The default value is low drive.
>  
> -- 
> 2.7.4
> 
