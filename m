Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9866355B141
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Jun 2022 12:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbiFZKk6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 06:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbiFZKk5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 06:40:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173E912AD3
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 03:40:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id e40so9305957eda.2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q4+WebREhrskYuhUVuLUrooDmlZJOKXpzsob3raz6Bo=;
        b=FcsmgP8vmiG6TOcvRPSgf9n3gtKB6t0w7/LRLPiYfWq371Hx956ly+7K1yTBnkGtXo
         QqXva2Eglbwr8Jn1+swcSsA3Ygtc73lGNQOObRn4VhXYY3eZc+HvWbuzTPPpxvndZj+E
         q4iChszOAiDWP0h32k/1QFR80+tf1GJJCfUqxbNoibfq3gGUf7MzhBTSuLVMEj5WQR2b
         lrPDl7wUmkp8vBh6V0EGBGL7diio74UODWVfhTfHYGVWI6OPkYH11ihg084teMO/yTO/
         LxCtBTpJGeioY7ptc01MpDJLw1UIHKylh0ZEsx5om0BkVwXzaETxW5dY/042w3NM/Bc0
         dWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q4+WebREhrskYuhUVuLUrooDmlZJOKXpzsob3raz6Bo=;
        b=WGKtLTu8rsj7A9kTLgTx5Uujge25fg2aX5ShvBd17W4yzXUwHv5tiQcM8uX4F6/Hjt
         F1Mn4fliMNdJJ31Ie5nhE3Iq0ehcRBztxJ+cJAn03kbv2nWq8iBUcgPm5mUdoRd+PP/D
         KLOd1EARkiDmHFgut+RIa9nfInDXrVd7tQ3HGO1tMJzkKwgzQ+5M7bpw1s3JLFhMerzj
         Ksr2a4lDRC5D+hRBQWGSw4+xOd2DYQz2tiKJVKKDDzU3b+g2Aq+hknlxAFXrSVgltT6X
         KVHcbqvp2O7B+kHdObM0NyS5T66vhh5iPtUV6yjBGt2naFdwN49fgQKFn5AROsR/nOS+
         pb8Q==
X-Gm-Message-State: AJIora8co6fgoHcI67b46TSKuC8EO5ecV3O96MBeMKqac3d/TFOJ6vGm
        GBqPNSV9gecZRrrADsGPeVEcuA==
X-Google-Smtp-Source: AGRyM1ujblys53c/doFLs1tNCPxiQXzbfVGV2CxHwKEoNB6kxufWSdCKFEJEY+HnZ8N4gXIq0ayM4w==
X-Received: by 2002:a05:6402:4387:b0:435:94c6:716d with SMTP id o7-20020a056402438700b0043594c6716dmr10451854edc.298.1656240054712;
        Sun, 26 Jun 2022 03:40:54 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b00722e52d043dsm3665646ejf.114.2022.06.26.03.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:40:54 -0700 (PDT)
Message-ID: <14b3fc53-e7da-a4e8-801a-29908bc03f55@linaro.org>
Date:   Sun, 26 Jun 2022 12:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] dt-bindings: gpio: gpio-thunderx: Describe pin-cfg
 option
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Piyush Malgujar <pmalgujar@marvell.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, rric@kernel.org,
        cchavva@marvell.com, wsadowski@marvell.com
References: <20220427144620.9105-1-pmalgujar@marvell.com>
 <20220427144620.9105-3-pmalgujar@marvell.com>
 <CACRpkdaqeTs-jHPBmtdiz+LdMM0pz0zqt4diX=e+YpgaGr0Jbw@mail.gmail.com>
 <20220603090618.GA27121@Dell2s-9>
 <CACRpkdaOd0-k_mt0ZrKT-DbVc3f0b5uXXmXpBNH=hq3BGCB+vQ@mail.gmail.com>
 <20220613080452.GA1884@Dell2s-9>
 <CACRpkdY-+D1tkNJoWLpQH9-2AcE1xb546eJx5Nuq+Tw3WKj6mw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdY-+D1tkNJoWLpQH9-2AcE1xb546eJx5Nuq+Tw3WKj6mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/06/2022 00:59, Linus Walleij wrote:
> On Mon, Jun 13, 2022 at 10:04 AM Piyush Malgujar <pmalgujar@marvell.com> wrote:
> 
>> Thanks for the reply.
>> But as in this case, we expect a 32 bit reg value via DTS for this driver
>> only from user with internal understanding of marvell soc and this reg bit
>> value can have many different combinations as the register fields can vary
>> for different marvell SoCs.
>> This patch just reads the reg value from DTS and writes it to the register.
> 
> I understand that this is convenient but it does not use the right kernel
> abstractions and it does not use device tree bindings the right way
> either.
> 
> Rewrite the patches using definitions and fine control and move away
> from magic numbers to be poked into registers.

+1

Let's don't repeat the same pattern Samsung pinctrl has.

Best regards,
Krzysztof
