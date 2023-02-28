Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54AB6A57A3
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 12:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjB1LSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Feb 2023 06:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbjB1LSs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2023 06:18:48 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814B96583
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 03:18:44 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id bv17so9326477wrb.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVoyC8wrd+bTb+TPTb4Bl/kNMNJ5socmwXem2vdIaJo=;
        b=NHhkM6XWjGereQscqBrss1KgjdsC4Uw7hMUfqTgTCppgDbPYH4HmZvWHbf1YptSK2v
         RY2HNVoOcTiJwSKMta9OCE1XR6dozHgkeOdm1pUhcWqbAIygIsF49f8wrQaFJCmcmKtw
         SLGt+1Drnm5QJqtXw7gdHTBVOvQh4pFmPtyCC8iljFLSiSTLJe7/LQaSL7Jv4kmFHDCd
         8UnCNtmZN/5ZKldUT3wIRCokoLwDsY+YrCz2365mu+thrNSg4rJME8cDHNRVIzl7ajmf
         qTr1RLxYhEQM5eCRjVDnbYlyeVHD3INXy/NlGNUi2XgJ6moIIQ9R8zm48HaisrQqTeqk
         CFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVoyC8wrd+bTb+TPTb4Bl/kNMNJ5socmwXem2vdIaJo=;
        b=vusV2qUFOiWudPpK2KFgCkPOjByCAkET9zqF+NouyoR70cTVvNGHLNpSd+6CcabTCW
         b93c1kK+0bkOCRj+VaAhKWjcI7wnEj5H0bqP9ILFXbouDwk5TQ1mApJx5LFpNkWBhu7S
         a+0b5wqee1+Xny7m8kuQy9K1GdI2kV/1FB0lbsiVFeANq1i+V+pH6BmhgwxLCBNbKlqS
         Jv0dk8lb8hC2BZgNcvPdGDbzRRt9I+wk9bBOLhlfycoj8T7KnVzyl+F6aBTUp5v0tn5N
         HV95eB/3gc82NvMAyIv8hr2s72B5mVqoxUN4kiqW+gByrp50Cs09TLjkcLBiqF1n5BWY
         XUJg==
X-Gm-Message-State: AO0yUKWX2OefmQnAozFEDsAgJ46npAbmEA1DzKHNnEPSrI/ZGA9uwNB1
        FqC61Ixo8s4WjLxb7fhIobmleA==
X-Google-Smtp-Source: AK7set8SssAP4PkOqN8PR49y6R5vCMxua5W3zRYjs7yGeGL5s0LFqTaxTjp7CcBvtRCJSDHFZSLQiw==
X-Received: by 2002:a5d:4b87:0:b0:2c9:a8c7:b48d with SMTP id b7-20020a5d4b87000000b002c9a8c7b48dmr1857468wrt.10.1677583122951;
        Tue, 28 Feb 2023 03:18:42 -0800 (PST)
Received: from [10.2.4.117] (lfbn-nic-1-295-18.w90-116.abo.wanadoo.fr. [90.116.132.18])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d464e000000b002c558869934sm9633925wrs.81.2023.02.28.03.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:18:42 -0800 (PST)
Message-ID: <741eb8c3-ad05-19e2-2604-9cd9c97c4ef4@baylibre.com>
Date:   Tue, 28 Feb 2023 12:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] gpio: tps65219: add GPIO support for TPS65219 PMIC
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jon Cormier <jcormier@criticallink.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, tony@atomide.com,
        lee@kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230224113837.874264-1-jneanne@baylibre.com>
 <20230224113837.874264-2-jneanne@baylibre.com> <Y/iqhsEIvHgnZ+5l@surfacebook>
 <CADL8D3bm82+=LwYnve04FB2zsSJ6ceKQHycV9oNWoYFiOQnVCA@mail.gmail.com>
 <CAHp75Vc52cqPaTFTvi2E-3Gg6gAsDWc7wSWjn7wMuhcxWqFXBA@mail.gmail.com>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <CAHp75Vc52cqPaTFTvi2E-3Gg6gAsDWc7wSWjn7wMuhcxWqFXBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 27/02/2023 20:51, Andy Shevchenko wrote:
>>>> Signed-off-by: Jonathan Cormier<jcormier@criticallink.com>
>>>> Signed-off-by: Jerome Neanne<jneanne@baylibre.com>
>>> Not sure how to interpet this along with the From line.
>> Are two sign-offs not allowed/expected?  I wrote the initial
>> implementation of this driver and Jerome updated it and is handling
>> submitting it since he did the rest of the TPS65219 drivers.
> 1. Submitter's SoB must be the last SoB in the chain.
> 2. Developers also need to be marked with Co-developed-by.
Got it! My mistake. I'll fix following your instructions.
