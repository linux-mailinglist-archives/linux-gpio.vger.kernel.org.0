Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8675738D3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 16:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbiGMO3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 10:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbiGMO3D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 10:29:03 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A48A33A34
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 07:29:02 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id c15so13728205ljr.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tkoow3fvqNobh0Z0Fm1iQlmk1WvKd33czLctPY8NUUk=;
        b=BtBdnKWQ8M+XWyv7RZn7ZYmpSJhSucnf+p6MM/o2UIAAjxfbJQwo5jChdZyQF/qieO
         L+jWLYPTyPQcPgEeo3WTE7NaRej5JwBqEyGykzbyRI+wg4SVUphX/f+RHPjtq90t31qm
         5Ph8PCuWxltnqU6BaiIsEzmTQjpvM8RJfImviIsxpQNK69PPJSGKIRMd9d1ZTPLwIZ5s
         CgelLDIiVlBTYo71b+JEm5SEk8llgpa1SDpRL+sfzEcAnjH35LWrm2Di8YxRHlbRJYbS
         r5V8uxN2ffERsob0DJL/JWFBySFgvzhQ0Ou36h+6nRdmRNpDB9nxWiAX+7WLOzWFI8XX
         Rdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tkoow3fvqNobh0Z0Fm1iQlmk1WvKd33czLctPY8NUUk=;
        b=43snGElJJehg/AUbkjIVS9gNASV5ASS8eKy+9AWmdIm7sJ2V9Srfl2yrAZssAbG4Ak
         nh3lGrqMVfcMJo3tn4OW3h1d0m8gz8JcJVEDQ1X3745G02O9BrAKKo8lMrkXzGku5aza
         AwE5lSardgcb2GrwWzbH0YQaJt8HI5aJ5g5D2cjhgML6RVb57YkJQqJVz0psBWwNHDe4
         vM2jku7ODPJsjBDQr6rnvksqQ+3Zjpkw9P963Lcg/TNFEKSrVq9IgzdxkBtjQtCIQ99P
         nc8ZWNsbB0WEHWfDV3sr5SDzBT+sa5sX6DdR0Mzuu3phNb1HvWOJI2sC+4PoSXgY5783
         25zg==
X-Gm-Message-State: AJIora/iqkvJHUAAV3yEGrLCwTVWH52AETdbn7t2hTjavUGr8CkTaD0A
        eEQdF8Ts96zpkt8yfmeZJwhgDA==
X-Google-Smtp-Source: AGRyM1s0wCRklqZfZDg0CtJDPtzkFa3x9a1E5zKhkT8PO5l+kIj3kSsvlqE3LG/qbIaA230cykFwpA==
X-Received: by 2002:a2e:557:0:b0:25d:466a:31b8 with SMTP id 84-20020a2e0557000000b0025d466a31b8mr1874204ljf.243.1657722540371;
        Wed, 13 Jul 2022 07:29:00 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id j13-20020a056512344d00b00489de206812sm1906840lfr.151.2022.07.13.07.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 07:28:59 -0700 (PDT)
Message-ID: <d8bc7a14-a9c5-4d34-997a-48a8d27c5edd@linaro.org>
Date:   Wed, 13 Jul 2022 16:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO
 driver
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        zhengbin13@huawei.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
References: <20220710102110.39748-1-tmaimon77@gmail.com>
 <20220710102110.39748-3-tmaimon77@gmail.com>
 <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org>
 <CAP6Zq1geFJsKrdQEN5Vqjw6e8bsiArDe1tzJ-jkQm-2XT-0KyQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP6Zq1geFJsKrdQEN5Vqjw6e8bsiArDe1tzJ-jkQm-2XT-0KyQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13/07/2022 15:35, Tomer Maimon wrote:

>>> +static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
>>> +{
>>> +     struct npcm8xx_pinctrl *pctrl;
>>> +     int ret;
>>> +
>>> +     pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
>>> +     if (!pctrl)
>>> +             return -ENOMEM;
>>> +
>>> +     pctrl->dev = &pdev->dev;
>>> +     dev_set_drvdata(&pdev->dev, pctrl);
>>> +
>>> +     pctrl->gcr_regmap =
>>> +             syscon_regmap_lookup_by_compatible("nuvoton,npcm845-gcr");
>>
>> No. Use property. By this patchset, I would expect that you learnt from
>> previous mistakes around this. Why repeating the same trouble second time?
> You suggest to use phandle property like nuvoton,sysgcr even that the
> NPCM8XX pin controller driver is used only NPCM8XX SoC, so the only
> GCR node in the NPCM8XX SoC is nuvoton,npcm845-gcr?

Yes. The previous case (reset driver, AFAIR) was also about driver used
only in one SoC, wasn't it?

Best regards,
Krzysztof
