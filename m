Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA6C54AA463
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Feb 2022 00:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbiBDXd4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Feb 2022 18:33:56 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:6610 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbiBDXdz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Feb 2022 18:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644017634; x=1675553634;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kjitzkvpd5SHLeNm/aAzpQh3TCApea/ZtTpr7Lpfw+k=;
  b=LxW6YD9qOYjQ55y121FeCfPXkdoJuD6TRJZKvnhda4+e9yjQtPEivanQ
   HfN/Fl6pdn2/zz4tlnCotnUwxXR6AS6Ozn2EYZztZ9lbrl1GzGZftaO00
   U2NgqLv3qUVmEW3P1DxAJFV77wVfp6TS/l9Dqk3lPeudRsDf/Ehzr3lS/
   J7pplTjxE6bW/etRtdJz/R1fg2eVLYkQxAaaQyel+oW/CQuCnOMVFWZIx
   KWKw9u9F1FfT4jDKshCJjOiEXU91Nn4SUJaEKKCfVV12OflV5q16BKK1q
   94FkHaIK5ULxO8yeR0vC3JNK2tvjUcyYNZ3ykJPU0IqgRtE3FGiXncU4U
   w==;
X-IronPort-AV: E=Sophos;i="5.88,344,1635177600"; 
   d="scan'208";a="197016075"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2022 07:33:54 +0800
IronPort-SDR: aMDrg3D2U04SRRuZVOC1qrASGAOSw3tCgkIkxdKDcQ/Tqr5kxFQp2j+R4WwVD0xtCH7ajSs7su
 PKvdayixx8ImewrlU1rUlpxW0adDOldmZUOelKAsjc22wN8lyejuUHO5PqFr+UpVyehRBMz8uF
 ytr1cEWOX0tK+bLTcBd80nXFvmkc7YLO1eQV5bAlui8SgtJje55G571WxyCI/y9aDv4m8Od0kx
 qk3HWUibZG3K3Z4UdAp4J2UhtMPSvHD4G77r49cFIO6Rca9A7XzwkFsUW0XEU20TjLCMA9cdHQ
 BhfxwlHneYEIxsOjCjPpvK7t
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 15:07:00 -0800
IronPort-SDR: GlmTEG/R0DqTi9AJDBWgrVY7zDm/oPad+QGQvTdGG94pxCRNP9j2DlIdAXKPHjR14UwDlNvVCL
 apa57cuyX89aMJEDP5Agjn1ESmh8DgXjvYPjZEZmFMYjOsgGDTKrydiu4Ch6o6liBz3vVgKkmi
 k4Wm/AzYqzJQpS4Vo+oeLVcU4TGzfKoe7+cBFmzfN0bxmQtPLkeGmw4IR5K9bbBzalUcHNY5Ss
 C6Ojpc9uGFiKIXv/aQB2uHWEr8IXtWhLSr0zaPjshW3bhUCyRIMDKlUF2n15a5oHQ8VroDvexX
 9D8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 15:33:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JrBgl0LH5z1SVp1
        for <linux-gpio@vger.kernel.org>; Fri,  4 Feb 2022 15:33:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1644017634; x=1646609635; bh=kjitzkvpd5SHLeNm/aAzpQh3TCApea/ZtTp
        r7Lpfw+k=; b=Ud9XcBPEO4foBjPZWtgbcp4HaJh16SXnC1ucMgsalervNql1nQS
        IETQYPPEcImSmwASS7Cwge+t4cwEyhBWNf1RJ4u+gLhS7R6YPCQao479EYe61lsl
        lnwXVG4Jq4j9DEsUcjsUhNZ5z+dDrnEvKz+st7zGQ6vROmiymhShhCZbP3c+acoh
        tM1TvvzsYjElp4n1iSASsQ8QOK4R6vber+fOxwMyKRIcj/Ccj+qZmprFh7c9EvOD
        x7WCrvz1Xvm+D5BXgJQUXvYRoBRBVrpQsfHMCjOXAOCBhoF5rSIvHcWrsRhxpF1V
        3HfzLmSTdQzJmWtVl35OQlrI8Moo209GAmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id LTMGzpPz7Qo6 for <linux-gpio@vger.kernel.org>;
        Fri,  4 Feb 2022 15:33:54 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JrBgj2gvNz1Rwrw;
        Fri,  4 Feb 2022 15:33:53 -0800 (PST)
Message-ID: <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
Date:   Sat, 5 Feb 2022 08:33:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output
 values
Content-Language: en-US
To:     Niklas Cassel <Niklas.Cassel@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220204130142.21727-1-Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/4/22 22:02, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> reading the same GPIO using gpiod_get_value(), will currently yield an
> incorrect result.
> 
> This is because the SiFive GPIO device stores the output values in reg_set,
> not reg_dat.
> 
> Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> generic driver reads the correct register.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

This probably needs a Fixes tag. I have not checked which patch though.

> ---
> The patch was tested on a canaan,k210 board (canaan,k210-gpiohs compatible
> string). It would be nice with a Tested-by from someone with a SiFive board.
> 
> However, the u-boot driver for this device already behaves exactly the same
> as this driver does after my patch, for all platforms using the driver.
> 
>  drivers/gpio/gpio-sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 403f9e833d6a..7d82388b4ab7 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>  			 NULL,
>  			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
>  			 chip->base + SIFIVE_GPIO_INPUT_EN,
> -			 0);
> +			 BGPIOF_READ_OUTPUT_REG_SET);
>  	if (ret) {
>  		dev_err(dev, "unable to init generic GPIO\n");
>  		return ret;


-- 
Damien Le Moal
Western Digital Research
