Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C95D4D9DDC
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 15:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349348AbiCOOlA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 10:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349338AbiCOOk6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 10:40:58 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186A355756
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 07:39:46 -0700 (PDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC7673F62D
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647355184;
        bh=nPejALOuOdUqemhzHbmVuYnKHib7XI81pmDxKpjtzkE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=rkDdnnlFJ0FO+LAUXa+FOkDrffM+fLbgroFnudIvicOhMcRUxnFZvfjetHYnQGJVj
         4yq/y0f//+0yS9zF5SOrfKtN1oH8212rsv0W7pFfWK3wbyiR5Y5Gw6s+rFjL4BBeET
         hPmj//utUXlAB72dRxRvjjgtI66xOLDtcS4uWpxMX1oQyAkpJILyaF3rentDpQopGS
         8hY2jfynVIKeu0fK74RYvviaWHgL+6sDtkhHgELY0CT7OCWRQJ/SV+EyB0yy5Prpgb
         Pj2M2Q5q4z3trB/zbHmKYNIj4a7spiWukRYHCPeoyju7l2RVfYQer0cfyOQwMdtRoc
         Lw4NJ9yfHe+gQ==
Received: by mail-ed1-f72.google.com with SMTP id r28-20020a50aadc000000b00418572a365bso5711842edc.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 07:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nPejALOuOdUqemhzHbmVuYnKHib7XI81pmDxKpjtzkE=;
        b=Gbuhx8KQCtXHcZA1vCrZlvlkTl0Ev7dQQ5fpFQLkVlWlRCV4vWQsr2483Rky/C2EUT
         LxsG1ruUG/by+y51o6d3U3X4AYSvfWhVxSTH6eFxv1D06H6Yaj6NecqyNZlMUCVNzldI
         +8xQ2IbBU9vzm621rfXLa0Od6wDmp1dKENhKbyVHE6TaF5552+BJSB+kgndFET3orRZY
         pg4DdcNPZ5WnEyGmkYOx6Chk6HxxdF6YJoD9e5g+A4sk418wzdeCpN+DbKrFB9AR7KR2
         /gZEi/zXbgLp8B4ywCjMxg+i6kAuZk+muw9BRy7WdFLN5e3e7kcwwP0r5o5X2Ioi5v4M
         baLA==
X-Gm-Message-State: AOAM530VA0gTJL0IHrKGeYXD81IHpvkwzqkzpUx08wUjdEo0Zu1MPTXv
        gw2LvLXIuh4xJ6g5oqFt5t5K2+FN9qAeei9G6eex/oLOEbecytuDo5yMg8240QaNc7pwmxlc7QH
        su9hMq1Tbso1xeQHuP1nSbqC0Qq9H74QlMn8k2TQ=
X-Received: by 2002:aa7:c34d:0:b0:418:c96a:cb58 with SMTP id j13-20020aa7c34d000000b00418c96acb58mr2257783edr.49.1647355182013;
        Tue, 15 Mar 2022 07:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyigKXtRY+yKVzsglw5ybBL5p8Qv91o3EGBORJFXc7hNx9TUa56VJmCYe7gKusief6LkADMqA==
X-Received: by 2002:aa7:c34d:0:b0:418:c96a:cb58 with SMTP id j13-20020aa7c34d000000b00418c96acb58mr2257769edr.49.1647355181845;
        Tue, 15 Mar 2022 07:39:41 -0700 (PDT)
Received: from [192.168.0.156] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id r23-20020aa7da17000000b00415a1431488sm9739991eds.4.2022.03.15.07.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 07:39:41 -0700 (PDT)
Message-ID: <5d9d99d7-b4da-d794-0d2a-9739bb1f3d66@canonical.com>
Date:   Tue, 15 Mar 2022 15:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/8] pinctrl: mvebu: pinctrl driver for 98DX2530 SoC
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        huziji@marvell.com, ulf.hansson@linaro.org, robh+dt@kernel.org,
        davem@davemloft.net, kuba@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        adrian.hunter@intel.com, thomas.petazzoni@bootlin.com,
        kostap@marvell.com, robert.marko@sartura.hr,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220314213143.2404162-1-chris.packham@alliedtelesis.co.nz>
 <20220314213143.2404162-5-chris.packham@alliedtelesis.co.nz>
 <04ed13f1-671f-7416-61d0-0bf452ae862e@canonical.com>
 <YjCj07kxGh8n45GE@lunn.ch>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YjCj07kxGh8n45GE@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/03/2022 15:33, Andrew Lunn wrote:
>>> +static struct platform_driver ac5_pinctrl_driver = {
>>> +	.driver = {
>>> +		.name = "ac5-pinctrl",
>>> +		.of_match_table = of_match_ptr(ac5_pinctrl_of_match),
>>
>> of_match_ptr() does not look correct for OF-only platform. This should
>> complain in W=1 compile tests on !OF config.
> 
> The Marvell family of SoC which this embedded SoC borrows HW blocks
> from can boot using ACPI. I doubt anybody would boot this particularly
> SoC using ACPI, but the drivers Chris copied probably do build !OF for
> when ACPI is in us.

What I wanted to say - current setting should cause warnings. Therefore
choose:
1. For ACPI && !OF this should be still without of_match_ptr, to allow
ACPI matching by OF (PRP0001).
2. For !OF with of_match_ptr() (weird setup... how to match then?) the
ac5_pinctrl_of_match should be marked as maybe unused.


Best regards,
Krzysztof
