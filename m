Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7C0698557
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Feb 2023 21:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjBOUPR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Feb 2023 15:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjBOUPP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Feb 2023 15:15:15 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD01D3D904
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 12:15:12 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id fi26so25464902edb.7
        for <linux-gpio@vger.kernel.org>; Wed, 15 Feb 2023 12:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlmPTOnb/uWLfvlA407oM/Uo2zpIEnCfaCV3rCJXuTk=;
        b=PGgGoS9veoto+MdZyUsqJVCgiRm48C+bKGg/BNzqmRyAgBduWvjwLSIA9hJVRCTPfC
         tyB77nflObOintmTohjswFYX8+ae/eoY8EUA9VzdFWhQp+l+rdx9MaUxF3bHu7BGf1z4
         ihoqE5AsCngkijR4DrhLF37fMhF63uDOtAp47ig+OQrTn6A/BW4tD73y6TWMJ6ZntKCD
         5J7V2so5FtVjGXPEzP3RkldnxZi/61DuY0BKamJLit8SyoEJhI6Iry0TNH3SjOFUMvOs
         ylwlFYZ0vqzHuuFjGZthLTlIEN+jkgmc3/J4WC1ojPxdLwqSMhWj4QeGZs3hM1Fkn91Q
         y/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlmPTOnb/uWLfvlA407oM/Uo2zpIEnCfaCV3rCJXuTk=;
        b=nHZCoOmL93XNud2wllkJtS7CqjCuxKH9NNBwMTWjPsu8ZkPEZltKzjPB5H+X18ZMYK
         lRWX4QQa6aia8XX+e6+Z6wxhRyAwbVOa5l+kVuH+Sl7VhnjRkZXnlB7PTSd8BLTGcAxD
         BbNi1jdmxoY74pgYgP8kuA0URE4BlC6sNBb4ttsXifo/Rr1c0IND29FSfjGRiss4IF+A
         D3vuma11RAo3ZjlyRURMXP8qV/9PY9q86QSusxcY+SMlHjCVaT9F5Ah3PkVv3JdppfvA
         ejNTGRnZzZZoI3ZX23wZSRZTh4MmNY0SacgqemWD12/zbOmeE1aq/1P52THnvHrr2gbu
         sqeg==
X-Gm-Message-State: AO0yUKVrd+lx39jctxhtyBpvq/CY8NeELd/ckzdQ3Gre47YMNsft3CVW
        exK/f0ibtcFIj6juYhEpPezIIA==
X-Google-Smtp-Source: AK7set8lzJ0tcYwuFqn55W8bMUH7MpsMOhrCOTOKKSzf2FZ8WDQaVfnJzAccK7AFJKoOa77PZC0Ivg==
X-Received: by 2002:a17:907:7e8b:b0:8b1:472a:758d with SMTP id qb11-20020a1709077e8b00b008b1472a758dmr702577ejc.18.1676492111277;
        Wed, 15 Feb 2023 12:15:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y7-20020a170906070700b008b14bd356d9sm638926ejb.37.2023.02.15.12.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:15:10 -0800 (PST)
Message-ID: <0b053e6d-79c5-38fc-5f6f-d7cd13fcefd9@linaro.org>
Date:   Wed, 15 Feb 2023 21:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/8] dt-bindings: gpio: rockchip,gpio-bank: add
 compatible string per SoC
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        heiko@sntech.de, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
 <CACRpkdbmXri1vtRShm7a3N0sRA7Qg_ni5FpAtiEv+72a6g9Wng@mail.gmail.com>
 <CAMRc=MeKdb=xmidwXQiNxtJpb1xii1D-43m1z6cNtF1VxFwogg@mail.gmail.com>
 <e0bf4347-ec24-a4e2-0851-d5cdf850cc28@linaro.org>
 <CAMRc=MdZOmxSTvtKaPo7cnx6q+dg8ANQYuM8PeuN+KQ7fqV61g@mail.gmail.com>
 <e0168826-2276-405e-2d31-4b396335d02a@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0168826-2276-405e-2d31-4b396335d02a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/02/2023 17:14, Johan Jonker wrote:

> 
>> Johan, please address the enum issue and resend just this patch.
> 
> I changed to oneOf, because with enum I didn't get it working.
> With 2 enum's it complains about: is not of type 'string'.
> I'm out of ideas...
> Maybe it's something simple that I overlook.
> Could Krzysztof give an example?

Documentation/devicetree/bindings/arm/l2c2x0.yaml

It should look like this, if my email did not mess up indents:

+    oneOf:
+      - enum:
+          - rockchip,gpio-bank
+          - rockchip,rk3188-gpio-bank0
+      - items:
+          - enum:

Best regards,
Krzysztof

