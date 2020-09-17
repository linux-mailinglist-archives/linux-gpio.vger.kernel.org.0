Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CF926DE7E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 16:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbgIQOeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 10:34:11 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:12045 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgIQObx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 10:31:53 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 10:31:52 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600353112; x=1631889112;
  h=subject:to:references:cc:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=pcB7Vqix5jNYAUHlOiUVOFo7qoy2vxGRDHeSPTeeH9w=;
  b=zWOSIUEN26Lf/2d1soetR0oazqAwnGZfIt8LShUd0pcQp7OhIp21guQ6
   Yl186ZFSI7ui9rFpdCsdBeRaNX9HlS9IrNnLVI5ep1WcN8Tu/ZoZFII0n
   mxnw1KiCxq6Kf2bScnvATes/+j8ES6uP+Es+umCrAW7PDTOLXE4iLaYKP
   zwjywlV3DRIAYXkIdy69PqLyS0Ad/caFdt6Iyn3DapZL/ltRFgZ0NJPI2
   zDVQtTBQ9jYSKE9hykZloni7t2Kfyb3IrxYHIXlebgdlHvTM/A/FwZrt7
   oVhSyvZbvscWnEIDVrobG9EA8spFurfHU05C1nq3nhkGT6uP6Cw6Szh5B
   g==;
IronPort-SDR: fnEBkDi3nNWSo7sFldDrtvZoNT7WUldhku6KwZ/uSXL1SHE9kgEe0FANpXWuDcIDx1OzWwO6Pi
 dvG+6d+IDnXkBuaa4OYz8pFiYMDb/hxjcKqO/6VVWUR4FirKqay2tszXZn+Yk+RHp1JRL+fbwG
 aMRez9IrX1yYGTgEQxijGivd+pgGRiDNhYcvqqgLAzVuMRk018RFo3PRL2JTZnu+MM8ickfjj7
 ypNkUWABncH+LdRzTwyBoYDsyKsg8Ncv4Xus+Jhkc3fayWshFP5V2uJGoxgu/GvQrixo9mNkZJ
 prA=
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="92186358"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Sep 2020 07:28:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 07:27:40 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 17 Sep 2020 07:27:39 -0700
Subject: Re: [PATCH 2/2] pinctrl: at91-pio4: add support for sama7g5 SoC
To:     Eugen Hristev <eugen.hristev@microchip.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
 <20200917131257.273882-2-eugen.hristev@microchip.com>
CC:     Ludovic Desroches <ludovic.desroches@microchip.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <d8eef101-1014-4ed1-509c-c16062b4f25c@microchip.com>
Date:   Thu, 17 Sep 2020 16:28:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917131257.273882-2-eugen.hristev@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/09/2020 at 15:12, Eugen Hristev wrote:
> Add support for sama7g5 pinctrl block, which has 5 PIO banks.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/pinctrl/pinctrl-at91-pio4.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
> index 1c852293cb96..9f62152d0a62 100644
> --- a/drivers/pinctrl/pinctrl-at91-pio4.c
> +++ b/drivers/pinctrl/pinctrl-at91-pio4.c
> @@ -999,10 +999,17 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
>   	.nbanks		= 4,
>   };
>   
> +static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
> +	.nbanks		= 5,
> +};
> +
>   static const struct of_device_id atmel_pctrl_of_match[] = {
>   	{
>   		.compatible = "atmel,sama5d2-pinctrl",
>   		.data = &atmel_sama5d2_pioctrl_data,
> +	}, {
> +		.compatible = "microchip,sama7g5-pinctrl",
> +		.data = &microchip_sama7g5_pioctrl_data,
>   	}, {
>   		/* sentinel */
>   	}
> 

Thanks Eugen, regards,
-- 
Nicolas Ferre
