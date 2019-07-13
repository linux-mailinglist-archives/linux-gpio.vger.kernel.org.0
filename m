Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC9067A9E
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jul 2019 16:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbfGMOgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jul 2019 10:36:55 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34607 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbfGMOgz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Jul 2019 10:36:55 -0400
Received: from [192.168.1.110] ([95.114.35.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MEmpp-1hfxbZ3JOt-00GLtU; Sat, 13 Jul 2019 16:36:38 +0200
Subject: Re: [PATCH] platform/x86: pcengines-apu2 needs gpiolib
To:     Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org
References: <20190712085437.4007720-1-arnd@arndb.de>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <fb36b507-e637-e4d9-fdd4-2947eb7faf14@metux.net>
Date:   Sat, 13 Jul 2019 16:36:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190712085437.4007720-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:F7Bx1iEZ00JHjygR9CYKTD/F5605d0pFDcWaxn95S/PAyp3hxEu
 UhrALD/kDGETh91QL+CLArgovGI5jvHFpDE315r684R/9HdQBsfNO94teG1gdgkcDMTlsa6
 D/9RpuO0V74lqkluprvr10GH0XtYdCwzHAKlkB0kO8BlLzCZXx/bfw+kPrs/TQ6uWwso4Lj
 7f91K33um10ysGW4rqL8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FCEWFvElarQ=:ecKfbDh8tqANzzRfepbk+8
 lFD3DwMrEvYRmSqY1PvotZA7Zca0hqcK/EcGLhXXlJv5amv65ryvRsxr6HWRYA3D3TCxmuT/4
 pTOpj0hSB299DR+944uhPt5EC/kauFVxI/Tu7nPB3ulu1VU37hmGXhU/sEHlYJy7EYit3wxNk
 dkvWns1zMioVeV3qjOEWlE2QKMipYT1qedF9ZzFP2btmrj3Acb5FVqFhu2t3UUJ9seUunDrVu
 ywXR7XN9aaLtTCl5miIJ9YO+A0QVl6HeaUIkQkUwAeTSqWh2sZK+mOW3ydk+3zs7xCKeuaMu/
 oWJNlTzMyv8zr7oBNaTcokMdXMA27618xdNijW6NiG52Von1j0h+06zMjNZZDUNSv+IxaAJ2o
 fPv5i2C1zNYwUXyw+B+Bo7qN6gmCP+bx8mTDIpkFXgKA7A8zQCiSplJ/I5R8BmVvAQdxckwDz
 NJjGt+5OiFvD77hYhUwiL4tLS4nMejtvf/4FK+ygnz7Eju8w3sI7uV1dQP5JZ26+OZ3mqOMXw
 bJpMbyrTs9PirwtLsn4S8yfikBcnliZiyo974YtbeDbCfF2VLvjnz48jKak8ewXAUuZfxB0NH
 PK5X2PYAOqQDOmBRE3VZQMraMv7fiOEPi+1BJwapy4p/MTsEzePoFSeVAeOKbgFlcdA+Yb4E0
 6DZHU6dXwUXoDqhP1RWMVOj+en40KPjgb22FxZm1BDIK0L/McATYZPutFBGufRhjYsk3U5LDD
 NtYlEp1aN3pUwiXpc4raOYlR5Ba3cdcj519OmY73mVBd80Lm/jl5kD8CyRc=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12.07.19 10:54, Arnd Bergmann wrote:

Hi,

> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e869a5c760b6..cf48b9068843 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1324,8 +1324,8 @@ config PCENGINES_APU2
>  	tristate "PC Engines APUv2/3 front button and LEDs driver"
>  	depends on INPUT && INPUT_KEYBOARD
>  	depends on LEDS_CLASS
> -	select GPIO_AMD_FCH
> -	select KEYBOARD_GPIO_POLLED
> +	select GPIO_AMD_FCH if GPIOLIB
> +	select KEYBOARD_GPIO_POLLED if GPIOLIB
>  	select LEDS_GPIO
>  	help
>  	  This driver provides support for the front button and LEDs on

That might compile but the driver won't work, if KEYBOARD_GPIO_POLLED
or GPIO_AMD_FCH isn't there.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
