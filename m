Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360F3449DB2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 22:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239865AbhKHVNd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 16:13:33 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42654
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239825AbhKHVNc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 16:13:32 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 621AA3F044
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 21:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636405847;
        bh=mwPFRn0AEGOneXePTnmoZQRi4asMCrfCLz0IrMjqCXA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=DKhDC7F7lG4RVE4qNWgrKjnY/dvBbqJUWACN2l7Q8M60U9wCQA4QJgEehUtC3MdW9
         5pJ331lKyUtm0tVPWbqoRa+i99e3WD1XDloL+fHW1YKkBvLJViJER83V78uFjpkUiO
         DTS1RNB+ZuUAHy6E5eLTHASCx4KO44FhSWOZ/LsiC1990j56vjx/jsrJVSzJnbE8B7
         AufpFT2m+HstTIxCjZMN4iJpIqHlKNF2a7kIP5U+/AXsLHw6IixuXeQ8cZnB1pAIzP
         YnxII2IOnGo4XBhPznbQ92VWJKzYLwZvrjBORGNML6t+1hgXHrq723l+/ARDjBNxye
         86hLzC1TC372Q==
Received: by mail-lj1-f200.google.com with SMTP id e13-20020a2e9e0d000000b00216ace8e8e5so5672152ljk.10
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 13:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mwPFRn0AEGOneXePTnmoZQRi4asMCrfCLz0IrMjqCXA=;
        b=2nTMPWrGqLkaBHkNbmMVUDp5J/AzGmPHHVlkjr3PD/GaJ0wrDlW3sj3wTTdyOGnHCF
         81FtJMy20m2cvhqLJMxjlm6brZJ0hygcnyvs4duyBeeQk2TSdsRA89gPNuVX3S6FrFdm
         +0MqLeAELiCrNxS9s31UPLaIas+9eK/id6FfVqy94+GY8MgjOUMlOMXXv/9bvnywzrw7
         kg5fvnohJBdpXcUTWEd49D/xEtZc67IRGGfBlKoqcE9PEsJf1cswZW+tSYhd38cLPze1
         wDcEmPP2c+iS+Drh5ATTTWVx/N/ZsszsgeVfdCa6sriBxpLA90oWi8sI7QR1dqWP0mcP
         94VA==
X-Gm-Message-State: AOAM533YF4phTltaFGTpYj62IVCm+KFsTW+beoZ/fioHJ6iU/9fT21Jf
        eLNDkke3NiifZLBIlGE7dO6p1dZO8UtaLAhJvmbyjB/D0n5jCeINrQgdc6i5dCHObtACxMvaUWt
        FcVHx8hZfJ7vzHyD9HYEXdd+zNAtY2cbvZxuCYWw=
X-Received: by 2002:a05:651c:246:: with SMTP id x6mr2094952ljn.49.1636405836526;
        Mon, 08 Nov 2021 13:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZb4LKcW1A1+MA8CuLWPJQDB5phDB0potg5NQYQwGvOUd0o3C/EZkqT0mWfTObhT2/wWNBag==
X-Received: by 2002:a05:651c:246:: with SMTP id x6mr2094920ljn.49.1636405836357;
        Mon, 08 Nov 2021 13:10:36 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a16sm1929374lfu.274.2021.11.08.13.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 13:10:36 -0800 (PST)
Message-ID: <8343f11a-89e8-c043-6296-000f7ba3e3d2@canonical.com>
Date:   Mon, 8 Nov 2021 22:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire
 binds
Content-Language: en-US
To:     conor.dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, lewis.hanly@microchip.com,
        daire.mcnamara@microchip.com, atish.patra@wdc.com,
        ivan.griffin@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     geert@linux-m68k.org, bin.meng@windriver.com
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-5-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108150554.4457-5-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add mpfs-soc to clear undocumented binding warning

What warnings? There is no such compatible used.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> index 3f981e897126..1ff7a5224bbc 100644
> --- a/Documentation/devicetree/bindings/riscv/microchip.yaml
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -21,6 +21,7 @@ properties:
>        - enum:
>            - microchip,mpfs-icicle-kit
>        - const: microchip,mpfs
> +      - const: microchip,mpfs-soc
>  
>  additionalProperties: true
>  
> 


Best regards,
Krzysztof
