Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F14474D5A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 22:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhLNVup (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 16:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbhLNVuo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 16:50:44 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1C9C061574;
        Tue, 14 Dec 2021 13:50:43 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u3so39467210lfl.2;
        Tue, 14 Dec 2021 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=FqgdsUPhQStXGJkWEhhtjxSOJh3VXCpFEPus3dniUic=;
        b=VS+jPu4tt9JhiTjPUpYmUYydJI/PQZDzPIKIHGFjMgnIxjJHk/XDXP/yDAuJGmVLdm
         Jgo1l3N8lseht0focMcCN9NQ9W18ZrGzQukVlJAE8dgYkTMV5TBBNoeZ2bOmW/65sIma
         9tQZETj55CJ5625caXWAluS8hpM+cvWS2XUllyp0xGAIRoQLhWh0Uzqcl/Sb7Y7NTQF/
         pNBaInngYFsA97zzmy4BDAk3aDtd3g4rEPUHN5I3gAHx9w6Ke+o8DFwDtWsGPCLXeXtb
         qXVXzc67Vnn3tFnMUA5hOjKz6KoNvC9SZ3U3YKB0CJEXvRB7OhiEHJocXwWSBvS9lHue
         EyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FqgdsUPhQStXGJkWEhhtjxSOJh3VXCpFEPus3dniUic=;
        b=LIXfjYVbpmhZbG3hk5h4BG7xJo9epmxtotoaAEeEaXIeFVgD74HGQQMp8mE3IOgqBr
         DGeIdeO64zy+Knv1VrzGJth9uwdr7aH5H9Cxsb2kZ7Tqatehnc7sJ8NGTza5Gx7uz3xu
         w3b39tiAa2U2uXUfgTJ0YLQUsau/iVPhMJPLRoBW6+uxE7ZX3N4szs+ypoWNdS+ISbWz
         1eJ3xbIaRwrmqmZsXNzasBZEV300scZuCFkBpX+cNWaSmhIeUKjSitQPGwZU8hhARu9J
         az7rye2fVn3amKLZNeSjx5qwfOEEwozirkbM8GdHbZdDYhePyk21R8lTEJTrl5QpTZYP
         bfcg==
X-Gm-Message-State: AOAM532aXtT2AjN2uFbbyAkhhw7e0BLLIy8naPVixgVP+KMI84wjr7Y5
        0x/trNB34gI+U5vRAe5VEzI=
X-Google-Smtp-Source: ABdhPJypgbkd6H81g6vnx7OH4J5gTEvHNnisIdxh2h5pGVAUkK1A58KOXxzStHSG5RNevkt3pTDjJA==
X-Received: by 2002:a19:c30e:: with SMTP id t14mr6949504lff.375.1639518641649;
        Tue, 14 Dec 2021 13:50:41 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id m13sm155960lfl.131.2021.12.14.13.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 13:50:41 -0800 (PST)
Message-ID: <e017f3b3-7ba9-6b5f-e18f-830ab717f026@gmail.com>
Date:   Tue, 14 Dec 2021 22:50:35 +0100
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
 <756f55d2-f033-8066-7e51-005e1f0587ec@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <756f55d2-f033-8066-7e51-005e1f0587ec@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14.12.2021 21:10, Rafał Miłecki wrote:
> On 14.12.2021 20:59, Rob Herring wrote:
>> On Sat, Dec 11, 2021 at 12:16:25PM +0100, Rafał Miłecki wrote:
>>> Rob: please kindly comment on this idea of storing pins/groups/functions
>>> in DT.
>>
>> I was never a fan of stuffing pin mux/ctrl into DT for what's mostly a
>> one time stuffing of register values. And given how many things run
>> before getting to the kernel, doing proper pin configuration in the
>> kernel is much too late (or redundant because it was actually already
>> done).
> 
> OK, thanks for sharing that. Given a pretty limited optimism on this
> approach I'll simply drop it and do things the old good way.

I feel I need to post one more comment though.

***

What I find a really clean DT code for defining some BCM4908 groups:

groups {
	led_0_grp {
		pins = <&pin0 3>;
	};

	led_1_grp {
		pins = <&pin1 3>;
	};

	nand_grp {
		pins = <&pin32 0>, <&pin33 0>, <&pin34 0>, <&pin43 0>, <&pin44 0>, <&pin45 0>, <&pin56 1>;
	};
};

***

Gets a bit cumbersome (for me) when using ANSI C structs. I remain
unconvinced about ANSI C being a good place for storing such data.

Maybe I'm just getting too old & grumpy ;)

struct bcm4908_pinctrl_pin_setup {
	unsigned number;
	unsigned function;
};

static const struct bcm4908_pinctrl_pin_setup led_0_pins[] = {
	{ 0, 3 },
};

static const struct bcm4908_pinctrl_pin_setup led_1_pins[] = {
	{ 0, 3 },
};

static const struct bcm4908_pinctrl_pin_setup nand_pins[] = {
	{ 32, 0 }, { 33, 0 }, { 34, 0 }, { 43, 0 }, { 44, 0 }, { 45, 0 }, { 56, 1 },
};

struct bcm4908_pinctrl_grp {
	const char *name;
	const struct bcm4908_pinctrl_pin_setup *pins;
	const unsigned int num_pins;
};

static const struct bcm4908_pinctrl_grp bcm4908_pinctrl_grps[] = {
	{ "led_0_grp", led_0_pins, ARRAY_SIZE(led_0_pins) },
	{ "led_1_grp", led_1_pins, ARRAY_SIZE(led_1_pins) },
	{ "nand_grp", nand_pins, ARRAY_SIZE(nand_pins) },
};
