Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA24271D5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 22:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhJHUKs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 16:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhJHUKr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 16:10:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF3FC061570;
        Fri,  8 Oct 2021 13:08:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j21so25875697lfe.0;
        Fri, 08 Oct 2021 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SvSecvKN+CG0meIBIuOZ66lX5o0E6MQFEWg90R8UlQw=;
        b=fVOINyEbOLrsm+S5bai0uYf9CSlDbUG0AtM46n93N7B1iv84zSLST92obxzsd0oIjG
         A2yrL8VzgBMF0NXrBT84XLdLHqKEJtgdZZUbq6nHpjtRiRzBemsqvwrRBdI3lTxzjwBx
         eOEJykY8NveLzv/4AIgIDPYYTVy4FYN0YvgidtfnMHW/+qiwNsO3U4y37ihNr6470R2S
         tHP05t4Ct4L2MQxfMY8/V7Z5wenp4Ifap8ASADub5NGLvvClu3+JcbCeb2ZWY0D2lceg
         S940ebtZyLk8aVco4CQMojrNZkGtXFldAJht8Uz9GHgq4FOiqMJ8r3atXnzCfnRlj76+
         juqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SvSecvKN+CG0meIBIuOZ66lX5o0E6MQFEWg90R8UlQw=;
        b=f3NUbHTg6fajqJbT/cBQ6AEJavt4Pf7RnEhihsh5BLWVMxym88VcN7w5oCDh2b+1Hu
         AwGecGgLVmPCCE1lgAMI0zYq122puFe9im5vqLwi9PkeX3cNny7DmCG5cRtm6RCgE+Ms
         UfWhTIdH5c7E2V52UNsFCU7OsIDVv2szwzKErmbz4v0725WN2AshJ6/E2280RgiUbm/T
         AfrtZ85EK6yzg3Y0EIvppE8uuYLY6HigJgthgTgshlkGkISdtd2zlgOCq7u4NjZFgJ44
         USIGDmIFAASfStIOjW2RgAU3yhJB7ge7d7O3+bdnG1Et3Ki/KC7MCmSbWm72aSjR4jT0
         FM0A==
X-Gm-Message-State: AOAM531zmwOTCE4g/4xF97quaWHl56+gd7rt/eNYdqAG5Zmo40R43bRb
        X6nV6/HLVVks9AI/O601ubY=
X-Google-Smtp-Source: ABdhPJz0lsQ4+eQVLaSuW5oMxXBEX6xuS3cSfnTO6tjJGmU+oiw07uhmWLWXNu5NTGunXYTgFgt/lQ==
X-Received: by 2002:a05:6512:3083:: with SMTP id z3mr12588754lfd.242.1633723730320;
        Fri, 08 Oct 2021 13:08:50 -0700 (PDT)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id b21sm24580lfs.49.2021.10.08.13.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 13:08:49 -0700 (PDT)
Subject: Re: [PATCH V2 linux-pinctrl 1/2] Revert "dt-bindings: pinctrl:
 bcm4708-pinmux: rework binding to use syscon"
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Scott Branden <sbranden@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20211008153939.19685-1-zajec5@gmail.com>
 <1633722536.868012.3211952.nullmailer@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <cf2ca705-d6d7-d69a-3c66-59f7c997f6b8@gmail.com>
Date:   Fri, 8 Oct 2021 22:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1633722536.868012.3211952.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.10.2021 21:48, Rob Herring wrote:
> On Fri, 08 Oct 2021 17:39:38 +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.
>>
>> My rework was unneeded & wrong. It replaced a clear & correct "reg"
>> property usage with a custom "offset" one.
>>
>> Back then I didn't understand how to properly handle CRU block binding.
>> I heard / read about syscon and tried to use it in a totally invalid
>> way. That change also missed Rob's review (obviously).
>>
>> Northstar's pin controller is a simple consistent hardware block that
>> can be cleanly mapped using a 0x24 long reg space.
>>
>> Since the rework commit there wasn't any follow up modifying in-kernel
>> DTS files to use the new binding. Broadcom also isn't known to use that
>> bugged binding. There is close to zero chance this revert may actually
>> cause problems / regressions.
>>
>> This commit is a simple revert. Example binding may (should) be updated
>> / cleaned up but that can be handled separately.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Update brcm,cru.yaml to avoid new yamllint warnings/errors
>> ---
>>   .../devicetree/bindings/mfd/brcm,cru.yaml     | 11 +++++----
>>   .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
>>   2 files changed, 19 insertions(+), 15 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml: cru@1800c100: $nodename:0: 'cru@1800c100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/simple-bus.yaml

It's warning we already have and not something introduced by this
revert.

As a revert this commit should introduce as little non-revert changes
as possible. I'm planning to improve that example later in a separated
commit.

Can you take a look at this commit despite your bot warning, please?
