Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C2D478F2F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 16:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237993AbhLQPJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 10:09:35 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57596
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237982AbhLQPJ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Dec 2021 10:09:29 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B0C53FFD6
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639753768;
        bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Do/jdZyBbq4amroDFWhuro6C9gA/+dMiz461LOqJ7EDP83+1+6Zlos6EZcR2fChBu
         pQfklqmmaH428N4NFkFeGi19K4fTTdixySvSAP/NohYsHG2/kTgTQ7ei+D10FuG+q+
         sdE94PpCdLfkqlTyRlbZW1COjJVlccskMv+GxF3XcFwEELVdKHD+v6q0HsgKzhhL8F
         AKowHhom6nJ+gOqEe0/h8OGEKaSRyYgiV+9VNl4ovOFGQhcAquJ8dxmUPzp3XFb24X
         godsKSK8Pf3RKekg/PuPqVx7HmNqqGNhs7CvVsKNKF8IsKKb/g46btmO4ByHM+5yTE
         OGJgTTJgD6xKg==
Received: by mail-wm1-f70.google.com with SMTP id b83-20020a1c1b56000000b0033283ea5facso1977818wmb.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 07:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ekcv8bNIXIYPhjro0Nb278CmOGUMMLIkTcaAs3AM2AE=;
        b=jr0HG14PEqglxzFIeh9oKDNzd+grI8wgOrDT4yokFTu1c4yX+ehBHbZY5Qh5juIEZW
         QYTQnWmL1uoDYJBH/3ZH3K4v+Bfc0zxlzGAmzt0hscyT31EYXTR97GqW9WLyWlwrurHb
         Gg+UP9orVb6Zmw2S3X72ZLUQd2TOz9bU9EqyhMH8DnRKGKv0nrUcDGdtSNcwh2AF66ec
         /xW2cpczS527HIuwnvHv10w19+xsHQEsKYYBj5YBhMQOVG9J+2sn34ZYwy0u+k20XC/O
         jTdKTK6GZTzRCYMbYsNXLy5vYatOIa7yW6dPN/2V1rTIStL3HFAUVFBXfWV7mwDUx6UF
         UeYg==
X-Gm-Message-State: AOAM531TmKCapRhZMl5GQDA3zYW2gY9PS0rs3LQE8vLVPU9WbypI8+EF
        9Txe6RcMSvYGaQXTrqvypGD8j3J2cv+549DFupP1GHIAz6nTNreuta1QtZw3FMqvp8Iq/PiBhwe
        57ki3NVohq5C1qwN9BPk2m9kYFX4gnkZEFwmOlRU=
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr3004606ljp.188.1639753756751;
        Fri, 17 Dec 2021 07:09:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHJzYnX2gs6VoqK9iRkmiSREooJ2FXXIbMDOX3XDHzAr4mBWfowLrbkwZGknR7FEjLbWDk2Q==
X-Received: by 2002:a05:651c:324:: with SMTP id b4mr3004581ljp.188.1639753756369;
        Fri, 17 Dec 2021 07:09:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d4sm1429654lfg.82.2021.12.17.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:09:15 -0800 (PST)
Message-ID: <61ae4cfd-a544-96d3-d521-877b8b38b5fc@canonical.com>
Date:   Fri, 17 Dec 2021 16:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 17/17] MAINTAINERS: update riscv/microchip entry
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
        ivan.griffin@microchip.com, atish.patra@wdc.com
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-18-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211217093325.30612-18-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Update the RISC-V/Microchip entry by adding the microchip dts
> directory and myself as maintainer
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..3b1d6be7bd56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16348,8 +16348,10 @@ K:	riscv
>  
>  RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>  M:	Lewis Hanly <lewis.hanly@microchip.com>
> +M:	Conor Dooley <conor.dooley@microchip.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Supported
> +F:	arch/riscv/boot/dts/microchip/
>  F:	drivers/mailbox/mailbox-mpfs.c
>  F:	drivers/soc/microchip/
>  F:	include/soc/microchip/mpfs.h
> 

Good to have the DTS covered, so FWIW:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

You still should get Lewis' ack (unless he merges it)

Best regards,
Krzysztof
