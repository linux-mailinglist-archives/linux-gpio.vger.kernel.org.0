Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C6A5EF7AD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Sep 2022 16:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbiI2Oe3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Sep 2022 10:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235165AbiI2Oe2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Sep 2022 10:34:28 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81E811BEA55
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 07:34:25 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bs18so168977ljb.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Sep 2022 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xqO7boSGntSno3tBpht/Rqvzj2qvhSRjOWUVkdWFtBQ=;
        b=iH8BCt8voVsR0DnJ5f3TdhbiQ7B8m+riiYjqCQ5iXuWI00SIyrE/nPJP6e5UZHHgiD
         qyn9zwnx4xWCNEXkkGqNfVreJU4vfOl6MSBJfStcqVwYngUY/JuWVDnA532tBX/8XJhN
         SSZg/cOzMluTNkVPzwWkrhq7Xnxp1bHBNtivIW3F1Rwb1SSYtu9vgEnwj4skaNmomst5
         QWv6zYbXQJnVaEajlHZdoKV3UGR8SlIUJM8AdhrL4FZ/BntmeKNsRtggifuPNJc0isnF
         7eEUUFc5pUHf7BsZRWJKoS17X68rIWIa1+W3hxity1H7Vg7LsB8k50wSs3fcZqkf4VIV
         LPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xqO7boSGntSno3tBpht/Rqvzj2qvhSRjOWUVkdWFtBQ=;
        b=Rv984nD2x6ODyYGrxywFw4Zk3GrgCA5oWxH8xlurqGY9CHDcV7F7mTbhmxVhj2iKXY
         Mwd28FhUEF7PUE6DB3CAT6DpLIeOwgK8uAvxERreAxXvNnPs8rMFvg7BgkmucYuM4imJ
         A7BFnI647DX3/8jlj6hJJO1GsrpgHpCdUDntdYYlZlnpBYCgZw0Lsx5Re85RcFkYbrlV
         x2YDYYpHo/l5LP+s4U5IP4/ijheeVpvDAw4a4gN1pJ/fCozuNkxPIUZ9xWoOohEHht5g
         OPAfdhch3z4X1LdmZdil9akVy8RRtdo7FJ0+jqXFm7U0TXz+Xkx+SyinFICpDgd2QbPu
         zd5A==
X-Gm-Message-State: ACrzQf2vQGq9H8ACcPCZWeTIDlHPVihhp94ghqOYrkhedqRTAP/9XOph
        rlGnQ5YfQpcz/He+s4zyDZffjQ==
X-Google-Smtp-Source: AMsMyM7Z/LaoxosbVcWiuMFaeyweVvrU8N+LBV3Off9sKT066Le2b1TIDHKPXaqvM4w9Rai6ijyMDw==
X-Received: by 2002:a2e:1f01:0:b0:25f:ea3a:4ef0 with SMTP id f1-20020a2e1f01000000b0025fea3a4ef0mr1283681ljf.330.1664462063936;
        Thu, 29 Sep 2022 07:34:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f08000000b00497aae401edsm798124lfq.109.2022.09.29.07.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:34:23 -0700 (PDT)
Message-ID: <5cd77839-d75b-9290-5d34-90d6464938d6@linaro.org>
Date:   Thu, 29 Sep 2022 16:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 01/30] dt-bindings: riscv: Add StarFive JH7110 bindings
Content-Language: en-US
To:     Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929143225.17907-2-hal.feng@linux.starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-2-hal.feng@linux.starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2022 16:31, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>

Drop last "bindings" from subject, it's redundant.

> 
> Add device tree bindings for the StarFive JH7110 RISC-V SoC and the
> VisionFive2 board for it.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 5b36243fd674..543be573921d 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -21,6 +21,9 @@ properties:
>        - items:
>            - const: beagle,beaglev-starlight-jh7100-r0
>            - const: starfive,jh7100

Blank line.

> +      - items:
> +          - const: starfive,visionfive-v2
> +          - const: starfive,jh7110
>  
>  additionalProperties: true
>  

Best regards,
Krzysztof

