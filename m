Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 476EDC1B1B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2019 07:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfI3FsB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 01:48:01 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:39411 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbfI3FsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Sep 2019 01:48:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 861E850C;
        Mon, 30 Sep 2019 01:47:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 30 Sep 2019 01:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=vzT1ByUgeJKjxPkK+JWawNEjyLQKq1/
        ZnFXbt0DlL6o=; b=GT1/oaQDZnoXsYa7QAIEmkfRiL7bhXzJ2d961vIza+zm1xW
        6edvh+lPd5uRBv8lhbyQVvw/aNO4pI5Sdl8/847pUBp60GBfDhFV+SCmvfvVBUfJ
        GRFl3YWNk5edW7SSpyl1PSG34LF707BZ2VCt57I5u6hGyFWaufSQv+aPqhNmVUkp
        RvDL0cQBXF5j+wvbnyiBvSqfBOVakmbyfd0kAoZidGHNfonavldG5138RhM9nH03
        fVpOqjCuIKrIsvbZdXW6M3Nr63MtBiuUQUg98y5JA4ucEh8GwQX8njtrBPKIwBGt
        T1plBlMiK4EXUA+mFIbjtjsgtMbrAHTTCyzbbAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vzT1By
        UgeJKjxPkK+JWawNEjyLQKq1/ZnFXbt0DlL6o=; b=p158RKfZ7NU2THmNxjC13l
        g2lou/FMbjSDIYmRGeaFiikEKuzd7eIH02bqg0G8LIJhPhY1Pi1Z7OpK2VRh4wFH
        J4iGyfThzgwFoPTfOfe8QW1AJqU4cWA/7ydS7ZYuvteqkonnZrebBiI8onk3peQn
        HmVqs8j8yZKyIvkWwhSMZGjBti6v7vQ8a0BOGnbdQd7FfGG9GzbXAYx6bdck3gFk
        2/AWt0loh6+su7E0GnPJ6Iwer5Acgdf4cDTkwW3Ibd9pUzqKDswru08ZBE+JM48K
        eoiMZtSoAWDOJWHJbYWqStEn02kIY3zxU8HGGEg4X6S+gwO6HuLdENojHsQ+QyTw
        ==
X-ME-Sender: <xms:DpeRXeAVTpI24rylQ010yLIXhe1EQYT8MPckr0L4l8CyvFAeDQMmgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgedugdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:DpeRXSXY0VDQaO1GXqKhIoOVpFL7mLtDKV4dXQRp5j1GRFtDQgYz6w>
    <xmx:DpeRXQYxT09VfvK_3ROADuc5Qu6ba-xc8DaWwVV6tZtPfQ8h5Qxivw>
    <xmx:DpeRXYJtsO7cFoWQLYVl7U9eu8fBfw9jB2bcq1ZXS1ZmImKJUbUfkg>
    <xmx:D5eRXXGHBX-rdIIIgkaMpli5eO6FOdofv-x550crm2hpwgeqt9pJkw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 9EB03E00A5; Mon, 30 Sep 2019 01:47:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <b76831b5-a3e2-4b73-9b0d-7e792d48933b@www.fastmail.com>
In-Reply-To: <20190927114833.12551-1-linus.walleij@linaro.org>
References: <20190927114833.12551-1-linus.walleij@linaro.org>
Date:   Mon, 30 Sep 2019 15:18:46 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        "Hongwei Zhang" <hongweiz@ami.com>
Subject: Re: [PATCH] gpio: aspeed-sgpio: Rename and add Kconfig/Makefile
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 27 Sep 2019, at 21:18, Linus Walleij wrote:
> This renames the "gpio-aspeed" driver to conform with other
> GPIO drivers as "gpio-aspeed-sgpio.c". All GPIO drivers
> should start with the string "gpio-" no special exceptions.
> 
> Also the Kconfig and Makefile entries should normally
> go with the driver but I missed this in my review, sorry
> for mistake. "CONFIG_GPIO_ASPEED_SGPIO" is used to
> activate this driver.
> 
> Cc: Hongwei Zhang <hongweiz@ami.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/gpio/Kconfig                                 | 8 ++++++++
>  drivers/gpio/Makefile                                | 1 +
>  drivers/gpio/{sgpio-aspeed.c => gpio-aspeed-sgpio.c} | 0
>  3 files changed, 9 insertions(+)
>  rename drivers/gpio/{sgpio-aspeed.c => gpio-aspeed-sgpio.c} (100%)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..7138290cdd36 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -120,6 +120,14 @@ config GPIO_ASPEED
>  	help
>  	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
>  
> +config GPIO_ASPEED_SGPIO
> +	bool "Aspeed SGPIO support"
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
> +	select GPIO_GENERIC
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say Y here to support Aspeed AST2500 SGPIO functionality.
> +
>  config GPIO_ATH79
>  	tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
>  	default y if ATH79
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d2fd19c15bae..e4599f90f702 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
>  obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
>  obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
>  obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
> +obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
>  obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
>  obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
>  obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
> diff --git a/drivers/gpio/sgpio-aspeed.c b/drivers/gpio/gpio-aspeed-sgpio.c
> similarity index 100%
> rename from drivers/gpio/sgpio-aspeed.c
> rename to drivers/gpio/gpio-aspeed-sgpio.c
> -- 
> 2.21.0
> 
>
