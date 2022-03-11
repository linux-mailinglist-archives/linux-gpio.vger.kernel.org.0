Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237C84D5E38
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Mar 2022 10:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347312AbiCKJTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Mar 2022 04:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347326AbiCKJTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2022 04:19:35 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56A41B8BF1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2022 01:18:32 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 648E83F62D
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2022 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646990311;
        bh=IxdbcL7k69aeR5PAgcBMvpQeQoS7r//O6hQJcwASqCA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=I0eZDy0GtIpTQhJBGwD64Y6oyAfoa7V9AZ0pLo7RxS0gtvoixWXntX5Z0LNcADEbj
         tvHL0pd+msZaLBSG1gpX8E6Zkj6IuDeaG5lEm4yer1rs4poEg23fDoIkntJ8sH52ys
         EHfzRgEotj9MoOCC2X5dXlrMen9K5vvGkV9dKBPCf7tW4xKufIJs7hV7rKEY9BBHiw
         XrJmKh89NjEO7MuSOBnyh3t+OJid7Ge8q9dmj34WEXWxhKRhVK7BCIZumc7Gwl2YX6
         ZP/uqcPBmofMkU0vyq415OAOhhhQuX/ADXjStwHOEs7bkb4lRbKNHoRhHn6AciVFZa
         ZY/Pyamsc8CTA==
Received: by mail-ej1-f71.google.com with SMTP id gz16-20020a170907a05000b006db8b2baa10so2203393ejc.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2022 01:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IxdbcL7k69aeR5PAgcBMvpQeQoS7r//O6hQJcwASqCA=;
        b=cWTVefNo6eiAAbPm3ArL7b1a4QD3DaKoYqxiWC1/wTvjhBixgTgWUjzg7MF+g4oLmf
         OMWmeItqY1nSFWaB5wDC+v0NDtBHdubrQFyDog9zPgntPhWxOKrxgmJY4iKHsmoU0yVw
         jCpe1nSxDrQYIUk6iSL0XHpMHJFNPIMAGWYIdzrpcNqa135U3jBfEq7M21k1qnKNi8AK
         AnivbZ0tWQJMt67ppfSAtd70evsraRWDweq/Rp+YVlqlu3osfNmrdh0yhRc8DOsLMhWW
         1ZQazKfPEyLDySjhdt9WIheYx/u/yR8RMdghA8OqoLm3w9BnxLugdOfusH188I85rbd8
         p4TQ==
X-Gm-Message-State: AOAM532AfzKooxb7YvipdK7y7TwIKS/gS2Y6aB99MPUXT9fQ/rKahBSb
        FgfkUJuIc1QQDwWqQRUYru2wS8u2k1JkgpibHFSS6OQimUMZPnQsCe+sVHmyL6epBOZDpIW+zJL
        TVzXxsaALl/xcUK4gc4vUOsmzze5M2r0hLZzwJ4w=
X-Received: by 2002:a05:6402:10d5:b0:408:f881:f0f3 with SMTP id p21-20020a05640210d500b00408f881f0f3mr7969312edu.112.1646990309093;
        Fri, 11 Mar 2022 01:18:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJx30zZcpXpgPnCtN4/x64kV31WgzQQ1W7CmqqYo9CyZbalXQfJsGU39fnHARIBZSBH2iX0Q==
X-Received: by 2002:a05:6402:10d5:b0:408:f881:f0f3 with SMTP id p21-20020a05640210d500b00408f881f0f3mr7969298edu.112.1646990308915;
        Fri, 11 Mar 2022 01:18:28 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906078900b006dac5f336f8sm2712366ejc.124.2022.03.11.01.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 01:18:28 -0800 (PST)
Message-ID: <3f77c8c8-4bba-007b-fae9-5fb47f44719c@canonical.com>
Date:   Fri, 11 Mar 2022 10:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/3] dts: add Nuvoton sgpio feature
Content-Language: en-US
To:     jimliu2 <jim.t90615@gmail.com>, JJLIU0@nuvoton.com,
        KWLIU@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl,
        robh+dt@kernel.org, avifishman70@gmail.com, tmaimon77@gmail.com,
        tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, CTCCHIEN@nuvoton.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
 <20220311060936.10663-2-JJLIU0@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311060936.10663-2-JJLIU0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/03/2022 07:09, jimliu2 wrote:
> add Nuvoton sgpio feature
> 
> Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 3696980a3da1..58f4b463c745 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -329,6 +329,36 @@
>  				status = "disabled";
>  			};
>  
> +			sgpio1: sgpio@101000 {

Generic node name.

> +				clocks = <&clk NPCM7XX_CLK_APB3>;
> +				compatible = "nuvoton,npcm750-sgpio";
> +				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&iox1_pins>;
> +				bus-frequency = <16000000>;
> +				nin_gpios = <64>;
> +				nout_gpios = <64>;
> +				reg = <0x101000 0x200>;

In each node first goes compatible, then reg.

Best regards,
Krzysztof
