Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79BE978A644
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Aug 2023 09:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjH1HJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Aug 2023 03:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjH1HI7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Aug 2023 03:08:59 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5D2D8
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 00:08:56 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c1f6f3884so349617766b.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Aug 2023 00:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693206535; x=1693811335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Fjh+AsPwGWfAeeK+z7IrBU2G+qo3XACJME7+hcOOoM=;
        b=aAodCLavUxGAJb8r8Z8zZvCWR9QUG0Hl1j2+y/hoKTlBnKBr31zDBJYweBKj/abWO0
         3j2VCWSLshoUqDILmNNY5S32638NKwOBRdB472oUq4tFi25uC3ZTm5XHlKpTSqmfKVgW
         eHReVx6ONaVGhdqm2uDeOsAYYYeyZ0CdH6ykf6hA/Stus2xEcHiEjqavpmMLMeYovt09
         6sxJy+k6N47+a5/CVvkUN4qR263XxGNgaz1048OjtOqjbvdi3IGzClAiHJD2p0mTufaV
         8pqzIPgDIlyd9S332w5lHjry3IwqoBsdaCFIEBjYT/H1NtKXwSN4TAItR5G+VzK519Qd
         qVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693206535; x=1693811335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Fjh+AsPwGWfAeeK+z7IrBU2G+qo3XACJME7+hcOOoM=;
        b=IdAJy/yca7KzDw2vFg9pHcVmlQq25wgfHhDU5WIq2L9ueYlKScDPAZ9TEddqxeRwZK
         8EmpQym573Ajec8ZAaxXf3zS/PQcbwF6Uy9JPw2Xwb11cKu1k7+S3mowNzu52G8B8bu8
         ceefog6UANqB2sZ89rJKLGTPIiQHWHgmaNnc7f47daXowt1jIuKamQLWJj9N2LPMDBg6
         /ZjiqdRVH7CH2m/258B/nMIEJQRNFI1L9mbzKm1FiBcadomYGu0WocbO488p/AaJw0Rk
         Di6Gh4UGjfjs36fhBl9VU+jWn9pOVWpIUZ8OT9rfRHURPsos7PENgYFdWrzCy84rzW5d
         /4hA==
X-Gm-Message-State: AOJu0YwuA9BsFYSVVvsFzy/oNeVZ4ZNQgDxF1GM4t8XxJyyIoCOu/5nF
        e7UDcPpl0QP/2jjWfBc6HohjbQ==
X-Google-Smtp-Source: AGHT+IGmEmncJ+rXpxubTVTj/W2rzAzuJYfYRoXO6BpljDxiuqvOKiXXUx5PcIRQUNsqrBeOCrP2pA==
X-Received: by 2002:a17:906:5347:b0:9a1:ec69:23ec with SMTP id j7-20020a170906534700b009a1ec6923ecmr10608655ejo.17.1693206535352;
        Mon, 28 Aug 2023 00:08:55 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id w10-20020a170906480a00b00992b510089asm4310424ejq.84.2023.08.28.00.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 00:08:54 -0700 (PDT)
Message-ID: <3a00066b-ec4e-bfdd-91bf-9f35edd72da1@linaro.org>
Date:   Mon, 28 Aug 2023 09:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO
 driver
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
        joel@jms.id.au, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, j.neuschaefer@gmx.net
Cc:     openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230827203612.173562-1-tmaimon77@gmail.com>
 <20230827203612.173562-3-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230827203612.173562-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/08/2023 22:36, Tomer Maimon wrote:
> Add pinctrl and GPIO controller driver support to Arbel BMC NPCM8XX SoC.
> 
> Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
> pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
> period time.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/pinctrl/nuvoton/Kconfig           |   14 +
>  drivers/pinctrl/nuvoton/Makefile          |    1 +
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2491 +++++++++++++++++++++
>  3 files changed, 2506 insertions(+)
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> 
> diff --git a/drivers/pinctrl/nuvoton/Kconfig b/drivers/pinctrl/nuvoton/Kconfig
> index 8fe61b348181..e5883f99c749 100644
> --- a/drivers/pinctrl/nuvoton/Kconfig
> +++ b/drivers/pinctrl/nuvoton/Kconfig
> @@ -32,3 +32,17 @@ config PINCTRL_NPCM7XX
>  	help
>  	  Say Y here to enable pin controller and GPIO support
>  	  for Nuvoton NPCM750/730/715/705 SoCs.
> +
> +config PINCTRL_NPCM8XX
> +	tristate "Pinctrl and GPIO driver for Nuvoton NPCM8XX"
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	select PINMUX
> +	select PINCONF
> +	select GENERIC_PINCONF
> +	select GPIOLIB
> +	select GPIO_GENERIC
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say Y or M here to enable pin controller and GPIO support for
> +	  the Nuvoton NPCM8XX SoC. This is strongly recommended when
> +	  building a kernel that will run on this chip.
> \ No newline at end of file

Still wrong. Please check your commit or your patches before sending.

Best regards,
Krzysztof

