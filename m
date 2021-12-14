Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC40474C7E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 21:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbhLNUKb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 15:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbhLNUKb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 15:10:31 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47D5C061574;
        Tue, 14 Dec 2021 12:10:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id c32so39080912lfv.4;
        Tue, 14 Dec 2021 12:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=wDOjfX89K4jV2QmbYL8mv7kdW3lt3D+ymF+NwV8p2I0=;
        b=FjeTlU1gqXo1oiL249LpY+VC0cljWSePEX76d5hcv+1yDKUFDgso6stfsjW2ItspwN
         FiOTo3GGEzbetydE3PKiYucu8+buxmWxii26SMiVq7z2j8KQ0i4A5JWoDQh6E9nRpMdf
         kivxf84vYZrG/VuAiv9W2WrZu2/tDXLMsAGT6GUxZgl0JvQcZWfWDPq6NY9QbTXbTMzD
         peNokkFssJNKfGUz+tTvS8ZkJrwjyK1hmtj6yLjWKb/TNRnbloPnFJm29nqJ5uaSY4B4
         PjcAJAyl+SHDoiFTEN280ICvY6B+aDfKF+Xga1WvR6ECnh1EaBW1742LmGomqqVSHa7u
         wiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wDOjfX89K4jV2QmbYL8mv7kdW3lt3D+ymF+NwV8p2I0=;
        b=ZrH3n0bSLqHCdXzozQjA31kCJM+lktvAAEXLS1VK6hGOfSJieP91wMxO/jOMpi5qKr
         oo8v9VNDIm8M/UrAm05Fj1Iw1rHo2zsnChf8Cw5SmmltJrmiMqkD2voq99tcXwOPgsnF
         nPSIKY+4P17mMOlgWz++WXc/ddD823AuA3IBeAOkfigm4KBpuFSOTWjZZG93DuSwruoa
         IivMuKCCRX0sbfSulVryY2hTQztj27rzLNpVnyf5pUKgFBZ/xiUMr8GgwA5hI0XGjZNR
         KvJew7usT2cOuFtl2TccLPJHurhl85znjKKIz0gW6kefBuzbYrbktFCOKww7kcW48g2F
         Ecpg==
X-Gm-Message-State: AOAM531IjFnWPa6wo+eqg/Yjg+VX8Ys6Gox7DrAy6gMSKTtVnp6IUHVD
        xkFYKHrR6+DY8X17F33oed4=
X-Google-Smtp-Source: ABdhPJxFU/5LC4AVHpjlhJR6g4yqpt5qfmH7HHYPP3Jq9LfptdoAyGt/4Akm+61mHnPo6+3ewVOp4A==
X-Received: by 2002:a05:6512:104a:: with SMTP id c10mr6849829lfb.204.1639512629017;
        Tue, 14 Dec 2021 12:10:29 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id o11sm130006ljc.100.2021.12.14.12.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 12:10:28 -0800 (PST)
Message-ID: <756f55d2-f033-8066-7e51-005e1f0587ec@gmail.com>
Date:   Tue, 14 Dec 2021 21:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: support specifying pins,
 groups & functions
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <20211210114222.26581-1-zajec5@gmail.com>
 <20211210114222.26581-2-zajec5@gmail.com>
 <CACRpkdbsb63EN5hmGws1eLaARg2VRXXhz+5AM_x7OhaS_ceGow@mail.gmail.com>
 <cadb38fd-a193-2706-b20e-2a1e5e64f9ca@milecki.pl>
 <Ybj3k4BOcc3IKs0w@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <Ybj3k4BOcc3IKs0w@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14.12.2021 20:59, Rob Herring wrote:
> On Sat, Dec 11, 2021 at 12:16:25PM +0100, Rafał Miłecki wrote:
>> Rob: please kindly comment on this idea of storing pins/groups/functions
>> in DT.
> 
> I was never a fan of stuffing pin mux/ctrl into DT for what's mostly a
> one time stuffing of register values. And given how many things run
> before getting to the kernel, doing proper pin configuration in the
> kernel is much too late (or redundant because it was actually already
> done).

OK, thanks for sharing that. Given a pretty limited optimism on this
approach I'll simply drop it and do things the old good way.

I thought it's a better desing but I probably was wrong. It was still
worth a try :)

Thanks to everyone involved in this discussion.


>> For a sample Linux implementation you can check (incomplete):
>> [PATCH V2 4/6] pinctrl: support reading pins, groups & functions from DT
>> https://patchwork.ozlabs.org/project/linux-gpio/patch/20211124230439.17531-5-zajec5@gmail.com/
>>
>> For a real life DT usage you can check:
>> [PATCH V2 6/6] ARM: dts: BCM5301X: add pinctrl pins, groups & functions
>> https://patchwork.ozlabs.org/project/linux-gpio/patch/20211124230439.17531-7-zajec5@gmail.com/
> 
> What about h/w with no concept of 'groups'?

It could probably be handled with sth like

functions {
	bar {
		pins = <&foo>;
	}
}

but my binding didn't cover that indeed.


>> Also see below inline comments.
>>
>>
>> On 11.12.2021 00:26, Linus Walleij wrote:
>>> On Fri, Dec 10, 2021 at 12:42 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>>>
>>>> This binding change is meant to introduce a generic way of describing
>>>> pinctrl blocks details. Every pinmux block is expected to have:
>>>> 1. Named pins
>>>> 2. Named groups containing one or more pins
>>>> 3. Named functions referencing one or more groups
>>>>
>>>> It doesn't describe how hw should be programmed. That remains binding
>>>> and driver specific.
>>>
>>> So what this does is to take a large chunk of data that we known to be
>>> associated with the compatible string (names of pins, groups and functions,
>>> etc) and put it into the device tree instead of the alternative, which is
>>> what most drivers do, and that is to compile in the data into the
>>> operating system and just look it up by using a compatible
>>> string.
>>
>> Correct. It changes the place of storing platform specific data.
>>
>>
>>> The DT maintainers have already indicated that this is not desirable
>>> and I don't see it getting merged before it has a Reviewed-by
>>> tag from one of the DT binding maintainers.
>>
>> Tony pointed out that it was back in 2011. It's worth reconsidering.
>> https://patchwork.ozlabs.org/comment/2786915/
>>
>> Rob said it depends on whether "data be static (complete) and correct"
>> https://patchwork.ozlabs.org/comment/2786688/
> 
> I haven't seen an answer for that question...
> 
> That and working for multiple platforms (from different vendors) are the
> main things that matter to me.

I thought my design description & BCM5301X DTS patch may be a proof of
that but apparently it wasn't enough ;)
