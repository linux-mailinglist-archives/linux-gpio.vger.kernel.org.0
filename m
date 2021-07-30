Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB0D3DBD13
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 18:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhG3QcG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 12:32:06 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:39980
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229811AbhG3QcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 12:32:04 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 331D53F23E
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 16:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627662719;
        bh=cdkeBF7KTOrwZe4RSaJRZayxTRjOsHfP6nNB8Tio5O4=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=rG+bgKRwDIX/UsNOF6STVxLV3FgOxuEhUE/B8TeOvzK64f5CvghKHW95AnA5hX+CN
         p8YdEm1TBqIAJuAClTKGASuTlw7C+JC2Jcrik8ZQNRfrMSpxJceC0kiebifkkqfDyM
         1eiK69G4CNsGSyXeWtW+g24eiMm0o/FRs0q9nu3aS8bLEzNuwawLDDC/+iFMsrXLqs
         oMV07immcxeJkBmRuHHK25/ZuCkRCEwoIbjSAAovslooApSwIC3Qbytqs91apvOfYP
         g9rIoIa9n57z6VHPpqd0G0yhmwHTIVmhLRo8gxYsKWXH2slQDRzrevlHdKdJqPc/5R
         USqgsHB68SEvQ==
Received: by mail-ed1-f69.google.com with SMTP id u25-20020aa7d8990000b02903bb6a903d90so4865576edq.17
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 09:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cdkeBF7KTOrwZe4RSaJRZayxTRjOsHfP6nNB8Tio5O4=;
        b=fLq5R6vELUXKV3SxEerwXQlsy1sJlU2gyq6Vuw02reQI/O+D3K2RV0E6XW6Xfr7lle
         ZHEdTk5ZpqtWweX7BVfTzOB803BKVwG9SMQ43/Ia3UwJJC4iZMxsq6RD8/2tbGjYuQQr
         /cdoSePhIhMdorbj9glZwAg3hfzi7oKI2iNCIHi4ZEFycuYkB/pwZV7oxHg+WOUe00cv
         UYQj0xfLdGB7rEyg/W6iS/F2roNRnFupKzo6XSGrrSD4xu9yrUprTiAJI/yi3teW/TsD
         CIkji+o1S2JyjtcX0MIcURxh2NEaWZ+Zy97jjiwalBGsdkUhLjE5q4WYMR34gnsvo88V
         +l7w==
X-Gm-Message-State: AOAM531lcAt2Bwre7ADMEjfwmaiMbOvOeEKRORKEE411nbNnRGZN0wd7
        JSdeMpsdjQy6HXMfygvTvooa6yN7rrLoTOkswdnwAflD7C9IjOa560cShkvglfdhnKla69bOvvT
        n1s6xdi1RUA4loMleWFLzzRzx5moUfFFMKf/uzus=
X-Received: by 2002:a50:fb18:: with SMTP id d24mr3933044edq.225.1627662718869;
        Fri, 30 Jul 2021 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznpHPrHjFlOb+VuZi7FIsAImjbSiLLF3mhXsmZY17xgLFw6xzBdtYFFywclnCr3+C+w8ivdg==
X-Received: by 2002:a50:fb18:: with SMTP id d24mr3933008edq.225.1627662718644;
        Fri, 30 Jul 2021 09:31:58 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id q8sm896087edv.95.2021.07.30.09.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 09:31:58 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 04/12] tty: serial: samsung: Init USI to keep clocks
 running
Message-ID: <a1701931-136e-235c-8392-a3f64c050d74@canonical.com>
Date:   Fri, 30 Jul 2021 18:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> UART block is a part of USI (Universal Serial Interface) IP-core in
> Samsung SoCs since Exynos9810 (e.g. in Exynos850). USI allows one to
> enable one of three types of serial interface: UART, SPI or I2C. That's
> possible because USI shares almost all internal circuits within each
> protocol. USI also provides some additional registers so it's possible
> to configure it.
> 
> One USI register called USI_OPTION has reset value of 0x0. Because of
> this the clock gating behavior is controlled by hardware (HWACG =
> Hardware Auto Clock Gating), which simply means the serial won't work
> after reset as is. In order to make it work, USI_OPTION[2:1] bits must
> be set to 0b01, so that HWACG is controlled manually (by software).
> Bits meaning:
>   - CLKREQ_ON = 1: clock is continuously provided to IP
>   - CLKSTOP_ON = 0: drive IP_CLKREQ to High (needs to be set along with
>                     CLKREQ_ON = 1)
> 
> USI is not present on older chips, like s3c2410, s3c2412, s3c2440,
> s3c6400, s5pv210, exynos5433, exynos4210. So the new boolean field
> '.has_usi' was added to struct s3c24xx_uart_info. USI registers will be
> only actually accessed when '.has_usi' field is set to "1".
> 
> This feature is needed for further serial enablement on Exynos850, but
> some other new Exynos chips (like Exynos9810) may benefit from this
> feature as well.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 33 +++++++++++++++++++++++++++++++-
>  include/linux/serial_s3c.h       |  9 +++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 9fbc61151c2e..0f3cbd0b37e3 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -65,6 +65,7 @@ enum s3c24xx_port_type {
>  struct s3c24xx_uart_info {
>  	char			*name;
>  	enum s3c24xx_port_type	type;
> +	unsigned int		has_usi;
>  	unsigned int		port_type;
>  	unsigned int		fifosize;
>  	unsigned long		rx_fifomask;
> @@ -1352,6 +1353,29 @@ static int apple_s5l_serial_startup(struct uart_port *port)
>  	return ret;
>  }
>  
> +static void exynos_usi_init(struct uart_port *port)
> +{
> +	struct s3c24xx_uart_port *ourport = to_ourport(port);
> +	struct s3c24xx_uart_info *info = ourport->info;
> +
> +	if (!info->has_usi)
> +		return;
> +
> +	/*
> +	 * USI_RESET is an active High signal. Reset value of USI_RESET is 0x1
> +	 * to drive stable value to PAD. Due to this feature, the USI_RESET must
> +	 * be cleared (set as 0x0) before starting a transaction.

"before starting a transaction" suggests it is related with transaction
or something before starting it. Don't you need it simply after reset or
resume?

> +	 */
> +	wr_regl(port, USI_CON, USI_RESET);

You are clearing entire register, not only USI_RESET bitfield. Is it
really what you want?

> +	udelay(1);
> +
> +	/*
> +	 * Set the HWACG option bit in case of UART Rx mode.
> +	 * CLKREQ_ON = 1, CLKSTOP_ON = 0 (set USI_OPTION[2:1] = 0x1).
> +	 */
> +	wr_regl(port, USI_OPTION, USI_HWACG_CLKREQ_ON);
> +}
> +
>  /* power power management control */
>  
>  static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
> @@ -1379,6 +1403,7 @@ static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
>  		if (!IS_ERR(ourport->baudclk))
>  			clk_prepare_enable(ourport->baudclk);
>  
> +		exynos_usi_init(port);
>  		break;
>  	default:
>  		dev_err(port->dev, "s3c24xx_serial: unknown pm %d\n", level);
> @@ -2102,6 +2127,8 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
>  	if (ret)
>  		pr_warn("uart: failed to enable baudclk\n");
>  
> +	exynos_usi_init(port);
> +
>  	/* Keep all interrupts masked and cleared */
>  	switch (ourport->info->type) {
>  	case TYPE_S3C6400:
> @@ -2750,10 +2777,11 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>  #endif
>  
>  #if defined(CONFIG_ARCH_EXYNOS)
> -#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
> +#define EXYNOS_COMMON_SERIAL_DRV_DATA_USI(_has_usi)		\
>  	.info = &(struct s3c24xx_uart_info) {			\
>  		.name		= "Samsung Exynos UART",	\
>  		.type		= TYPE_S3C6400,			\
> +		.has_usi	= _has_usi,			\
>  		.port_type	= PORT_S3C6400,			\
>  		.has_divslot	= 1,				\
>  		.rx_fifomask	= S5PV210_UFSTAT_RXMASK,	\
> @@ -2773,6 +2801,9 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>  		.has_fracval	= 1,				\
>  	}							\
>  
> +#define EXYNOS_COMMON_SERIAL_DRV_DATA				\
> +	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(0)
> +
>  static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
>  	EXYNOS_COMMON_SERIAL_DRV_DATA,
>  	.fifosize = { 256, 64, 16, 16 },
> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
> index f6c3323fc4c5..013c2646863e 100644
> --- a/include/linux/serial_s3c.h
> +++ b/include/linux/serial_s3c.h
> @@ -28,6 +28,15 @@
>  #define S3C2410_UFSTAT	  (0x18)
>  #define S3C2410_UMSTAT	  (0x1C)
>  
> +/* USI Control Register offset */
> +#define USI_CON			(0xC4)
> +/* USI Option Register offset */
> +#define USI_OPTION		(0xC8)
> +/* USI_CON[0] = 0b0: clear USI global software reset (Active High) */
> +#define USI_RESET		(0<<0)

Just 0x0. I understand you wanted to hint it is a bit field, but the
shift of 0 actually creates more questions.


Best regards,
Krzysztof
