Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668BF44698F
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 21:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhKEUX0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 16:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbhKEUXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Nov 2021 16:23:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE98C061205;
        Fri,  5 Nov 2021 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=JM5OcWSj/uvIM0P0oV03d0hsFAmhe3IcSfBjxydt9zY=; b=duXCwzRWi3idNZSBBqLyeCNkeb
        HBgxUwE7HZqtco+n3ioHzvlqZZecpvOTM80DJ74vD6MkJtlo2VbQcmg0oS0QgnlmpNygmBjTGDjWx
        Uk93+/S6+3KB8l/r5pESYxZK2cvMn+Zx4At1T1lej92PqKCZ4YylGM5WgFESeT81mKsc5CyrGJOAC
        6PHmjPMgPruYS9kqixvrKWumJqLLKGjU+YSNLj5R8nKU6oT0ObB8RE0Dnjw1sQGBuzg74iiHZ3fLi
        jEJRW0+uxASg87cILeTHTKj90xK8z2bnUL6DuCbKiZR3kW85pfQT9nvIq0Na7hFut/Bo2cr+9XQnG
        HXDYg1bg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mj5hR-00CGzR-Kh; Fri, 05 Nov 2021 20:20:33 +0000
Subject: Re: [PATCH v8 2/6] gpio: Add Delta TN48M CPLD GPIO driver
To:     Robert Marko <robert.marko@sartura.hr>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        lee.jones@linaro.org, p.zabel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        michael@walle.cc
Cc:     luka.perkov@sartura.hr
References: <20211105113859.101868-1-robert.marko@sartura.hr>
 <20211105113859.101868-2-robert.marko@sartura.hr>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cd6bbd90-a9ed-1c63-93a0-bc30e6ab4fb0@infradead.org>
Date:   Fri, 5 Nov 2021 13:20:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105113859.101868-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/5/21 4:38 AM, Robert Marko wrote:
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index fab571016adf..31b83271f954 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1344,6 +1344,18 @@ config GPIO_TIMBERDALE
>   	help
>   	Add support for the GPIO IP in the timberdale FPGA.
>   
> +config GPIO_TN48M_CPLD
> +	tristate "Delta Networks TN48M switch CPLD GPIO driver"
> +	depends on MFD_TN48M_CPLD
> +	select GPIO_REGMAP
> +	help
> +	  This enables support for the GPIOs found on the Delta
> +	  Networks TN48M switch Lattice CPLD. It provides 12 pins in total,
> +	  they are input-only or ouput-only type.

	                         output-only

> +
> +	  This driver can also be built as a module. If so, the
> +	  module will be called gpio-tn48m.


-- 
~Randy
