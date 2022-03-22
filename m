Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D006E4E3B0A
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 09:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbiCVIql (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 04:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiCVIqk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 04:46:40 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A042046660
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 01:45:10 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C257A3F1AC
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647938708;
        bh=neGecA7HBSwD46fG4cAmxThQpgGejbSlPRN3sQKWp0I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=G1GV1jo4GhDvShqjVA5zAct6OuJbDJRivDVlx047iy4OmGDROxZDAfpUxiTY6bsyo
         gYdBRrB6zgDtWEUPaqj5/Us6J0WcqzCyxA9CVXLoNSMkwTN7VULezUiriX34zy+4Mn
         h/UScrQ/bdDGd85CFRr9cwCX+rYoJM/bprOh8PqNEaPrUf/9T34e6RsdyFdo8AoZTh
         kQmY45r9zCnhqO6wXXZTlfSEQEaEslaPpFL5wH6C8PN7NFNWoEl6V2ZudO8KPxpa7D
         0awDy/I9bdpJzj5XkOwL1CWLk8LGdMnSCg6g1+e8Ep1Pq/h2aNmRfAqW0z5avtWPGj
         YvRFRStDiwRtg==
Received: by mail-wm1-f72.google.com with SMTP id o19-20020a05600c379300b0038c7117460dso537030wmr.6
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 01:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=neGecA7HBSwD46fG4cAmxThQpgGejbSlPRN3sQKWp0I=;
        b=Q441m1eRmgA7/PFRKXszpY5VvbrJXfhBdTZdNoB98eJzCauaaD0r0gPDLxMiYkbHpD
         a3hbvnyGVDQQdEnrbeFdN8+IfIJgJIIFiPH6iBrtBMzjz/YKpHLAgYy0g7HiaMOYwrLV
         q8dgptUROQ5bI1mXridBA8GQfha1iP50L+ajUZNLy/OSXptFSCaX/DhK6jueJ6RbwCQQ
         G8csyKY+tFI2EggqxZtgcRi1l/iBAfD4GLT/Ane989fzq9Ur8RHgYl/sS4/lo+2YTLsB
         arHN6SreOC0KO6cwp51sm195ObTCbYcuUwPjlRctZEUzG2bb3hv4y4tKl93/hzUBkCEU
         uFdg==
X-Gm-Message-State: AOAM533x7LfweH31TIUMNximuutZDGET3qlbFO1fBrdipUz21CFpv713
        NWWEzIwhtQK60bmTadOl7GJtGD2f/nDFHxV+TAqgWwU4gfh5OAeCjVpn68r4Z4jOR69KCJQ5xd0
        yn6MHyGcwdT28mcShI8iVaE8tUr0ZqjAcjV3LGL8=
X-Received: by 2002:a5d:59a1:0:b0:204:1777:fc08 with SMTP id p1-20020a5d59a1000000b002041777fc08mr5740179wrr.545.1647938708523;
        Tue, 22 Mar 2022 01:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw04a3TswDavls/3TZ+Ylafig5G9XRM4IJdq5o+8htxAoCK7PnTDqyBAOY10yAJcYtgnX428g==
X-Received: by 2002:a5d:59a1:0:b0:204:1777:fc08 with SMTP id p1-20020a5d59a1000000b002041777fc08mr5740165wrr.545.1647938708324;
        Tue, 22 Mar 2022 01:45:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c4e8900b0038c740951ebsm1522235wmq.24.2022.03.22.01.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 01:45:07 -0700 (PDT)
Message-ID: <a8290aa4-8a2c-68c3-bc55-82abcd27385e@canonical.com>
Date:   Tue, 22 Mar 2022 09:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dt-bindings: clock: drop useless consumer example
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Shiyan <shc_work@mail.ru>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20220316130858.93455-1-krzysztof.kozlowski@canonical.com>
 <20220316130858.93455-2-krzysztof.kozlowski@canonical.com>
 <YjjCpQ9vwFoEmFFi@robh.at.kernel.org>
 <ca6c4fe5-93c5-9ad4-0c9f-86ec3213d44e@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ca6c4fe5-93c5-9ad4-0c9f-86ec3213d44e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22/03/2022 02:45, Jesse Taube wrote:
> 
> 
> On 3/21/22 14:23, Rob Herring wrote:
>> On Wed, Mar 16, 2022 at 02:08:58PM +0100, Krzysztof Kozlowski wrote:
>>> Consumer examples in the bindings of resource providers are trivial,
>>> useless and duplication of code.  Remove the example code for consumer
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>   .../bindings/clock/bitmain,bm1880-clk.yaml           | 12 ------------
>>>   .../devicetree/bindings/clock/idt,versaclock5.yaml   |  7 -------
>>>   .../devicetree/bindings/clock/imx1-clock.yaml        |  9 ---------
>>>   .../devicetree/bindings/clock/imx21-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx23-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx25-clock.yaml       |  8 --------
>>>   .../devicetree/bindings/clock/imx27-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx28-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx31-clock.yaml       |  8 --------
>>>   .../devicetree/bindings/clock/imx35-clock.yaml       |  8 --------
>>>   .../devicetree/bindings/clock/imx7ulp-pcc-clock.yaml | 11 -----------
>>>   .../devicetree/bindings/clock/imx7ulp-scg-clock.yaml | 11 -----------
>>>   .../devicetree/bindings/clock/imx8qxp-lpcg.yaml      | 11 -----------
>>>   .../devicetree/bindings/clock/imxrt1050-clock.yaml   |  8 --------
>>>   .../bindings/clock/nvidia,tegra124-car.yaml          |  7 -------
>>>   .../bindings/clock/nvidia,tegra20-car.yaml           |  7 -------
>>>   16 files changed, 143 deletions(-)
>>
>> Doesn't apply to my tree (no imxrt1050-clock.yaml), so
> merge against linux-next I can submit another patch if needed.
>> Acked-by: Rob Herring <robh@kernel.org>

Let me send it after the merge window - all dependencies should be there.


Best regards,
Krzysztof
