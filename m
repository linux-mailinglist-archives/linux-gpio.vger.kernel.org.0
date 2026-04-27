Return-Path: <linux-gpio+bounces-35564-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILJ9GdBa72llAgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35564-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:47:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBC5472B54
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 14:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2D0630B4A7C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC52F3B95F6;
	Mon, 27 Apr 2026 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kp5MbLO0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7693B9D81
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293701; cv=none; b=aTREzSQnoYlLB5hTtB/eqYVpw6GwvbzOn5GJcDu5xfK/Xj2PRRtPTwG0+AvfEhhtwmgx6lQGzuAazTtcg6NyfxQyicEhiZaRSMdRpzzU6+l05eM715Fz6nRMO8/ZaPpVYRr35HdLW8FVbzI2mFkeRcHP5gqCsHK7xAdVSSRXV6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293701; c=relaxed/simple;
	bh=2vEY9g+jd2zsiuvJOyMZ3k5klcsAKucqskQWVdm7nIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axFYH9TP2YLudDJwYRR93URDxHCAWwOuv77grBC0a5QYgciid0+ESue7hQhejQJtoB6TXqXQwHrlwFpKm4SsnD/pFSTzwtNN7XjMEMwbF8RKpPWtmzQ0oS8zTJjaVKpq5K73buEtbXByQfpcNuPeVB2c4QMzd4qQZ8rrZ7unZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kp5MbLO0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so87149555e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777293698; x=1777898498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z0ouDnSC+T9ZSB+2JJ/MTzlB9sk99toFQYA8zN4EEOs=;
        b=kp5MbLO0VCy1JbI5L+iD8oIg12pUFRmbJDNRhWo2QAQNpVOTvxC4Ot2RWO7Xlgu0xh
         T6FDg7KEk7zelFW7VbHD14cWrPLQJD8kMQpmmuA0TgDVMLdrbzFGOkdSUur1ZkM3lUA4
         f4i95SURw4yIS/i3kWmsqn7X5GY4yAh13k1hhaxbXMG0fn7+CN1+KV8oa8dTX9gdYrEM
         4r2JRfn+XN45JswjwQunEPGjXpNbjOw2mRC991ARn0HR7hcxpJE51LJCXO9PMiraMo/u
         PJdyXf0vytYPjK2T9Lnwlqh4jGL4Jh1xF42maNHIISl4KxkGg96ydhkNDAiYFZpaIW39
         RBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777293698; x=1777898498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0ouDnSC+T9ZSB+2JJ/MTzlB9sk99toFQYA8zN4EEOs=;
        b=MCb1LuqYqYeJ8CgrrceYSg/zkv0BQpizZ+sxLO7kaXYg6kKbsYrs5w9hAFAC1XR9ef
         ozCk3yzkV7YeC1TfiR9oQ9wb2no3XL4E3hs+md7DefgvulmdhHwoxOWCKNs/WAr8j8Ek
         ehezTTQMD4clkDJ9Ay1F80cQkdkXrusXozo2C7RAv1rBVs1QxKQRHAAzbHd+AEWGTRuf
         g/Wpxu8RkAHmilxil7tPvWRRipZuWXZxbQgQ8+L1UUWIrYrkq2aYiiqJWo51tBco9pix
         XirXyLOTsjuY9FqnY6AvyBPWmet/cX7B0LO70mH8QbWVZfRJnA0GUXDdDnKjPeG3rQHx
         4OuA==
X-Forwarded-Encrypted: i=1; AFNElJ9fkWuarBp4V6moILYjhmdgSzyg12ANSJ+Gjc7pjZD3Ege6JHA7UvBSXx16RNaFFyS4K9IFrIc8CkLX@vger.kernel.org
X-Gm-Message-State: AOJu0YxFdJl5becBMIhj1Nzsdpt9Z5gFUXUZYELlL8K+WzlY9e46uxeh
	baGYXkM7eOXTJXnOjpoq/8o03xrZbReWKpDLijo3W3k9o2JLjIZsxZnX
X-Gm-Gg: AeBDiesJhwgsm9l3vOQvXzAArw632R7OJlj0Bm6XBph7eagh1PR4eIb891wmb855osY
	Q442CQV9coLeBSWcjLMlrZ85vAcMQQxvpnUQsygU8/KFCR4nPQhvi1LezW9Emy42JIpwQk8tx80
	NxChUdkfICfOY1unxwQKzAl8NTv8hsiWepMCZSkDazRgWnYRNTeENosq4gLAaZz+RM3/qL47meq
	F4l7+ujxne06IJGnBuo5pMsxrtYPJSREqjrmuPQxIds1tJUcBnmCb3mBBw2y/ggrE4M2pPed6K8
	AHM8G3RRbM++bj0FgqQRcxKUwvGhoyDU4s6DPOLchol2tma+sZPmuan0cZuCbtDIk30aGCJg1xS
	gxi8uNdGxszYuq5j5CIhfhd+UCD0ZbMueFXNn2MnsiOzbNVQ8jGA3O0R4nfvk+IC05FzABkBSqw
	gw5GX2AMn+TEmFkZ0d8kvcDnTBRa1nJkMAa5sfwQFe4RpeXf7aZm3b89HDfRN2CnSgVCZXgitr/
	/14ryo=
X-Received: by 2002:a05:600c:3150:b0:485:3b00:f93b with SMTP id 5b1f17b1804b1-488fb79df09mr631479005e9.31.1777293698059;
        Mon, 27 Apr 2026 05:41:38 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:a4dd:2777:84a8:bc7b? ([2a01:e11:202b:40:a4dd:2777:84a8:bc7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55dc9f58sm948747075e9.6.2026.04.27.05.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:41:37 -0700 (PDT)
Message-ID: <edac84e9-93c0-4248-b28f-c121583b9f65@gmail.com>
Date: Mon, 27 Apr 2026 14:41:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
 Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
 <c55b55ea-a8d5-481e-916f-eb92aeb2e06d@kernel.org>
 <20260427122806.GN557136@black.igk.intel.com>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <20260427122806.GN557136@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDBC5472B54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35564-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.24:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.21:email,0.0.1.99:email]


Il 27/04/26 14:28, Mika Westerberg ha scritto:
> On Mon, Apr 27, 2026 at 01:46:03PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 23-Apr-26 07:15, Mario Limonciello wrote:
>>> On 4/22/26 23:42, Mika Westerberg wrote:
>>>> Hi,
>>>>
>>>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>>>> Assuming all the variants suffer the same problem would it be ok to use a
>>>>>>> wildcard for it?
>>>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>>>
>>>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>> index a0116f004975..e3a6111854e8 100644
>>>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>>>>>>                 .ignore_wake = "VEN_0488:00@355",
>>>>>>             },
>>>>>>         },
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>>>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
>>>>>> +         * stall for ~36 seconds during boot so ignore the two
>>>>>> +         * interrupts involved.
>>>>>> +         *
>>>>>> +         * Found in BIOS G614PP.307.
>>>>>> +         */
>>>>>> +        .matches = {
>>>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>>>> +        },
>>>>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>>>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>>>> +        },
>>>>>> +    },
>>>>>>         {} /* Terminating entry */
>>>>>>     };
>>>>> As for now it seems working. I've reverted it on my kernel as I prefer
>>>>> remain as much as possible close to the CachyOS' one but hopefully it will
>>>>> be implemented on 7.1, if someone propose the patch and it is accepted. It
>>>>> would be amazing to see Asus more interested on Linux and more strict with
>>>>> their BIOS but in the end I understand it's like asking for the moon.
>>>> Okay thanks for checking. I guess this is what we have to live with for now
>>>> until someone finds a better way of dealing with these.
>>>>
>>>> @Francesco, would you like to submit a new version of the patch similar to
>>>> above or you want me to do that?
>>> Hans suggested that we might want to look at ripping out this edge triggered events at boot earlier in the thread.
>>>
>>> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb
>>>
>>> Hans - as you pointed out that the Surface lid state is the only real issue left and you happen to have one do you think you could work up some patches?
>> Right, so I read further in the thread that Armin has a maybe better suggestion,
>> after that has been merged I can check a bunch of the current devices with
>> .no_edge_events_on_boot which I still have and see if those quirks can be
>> dropped now.
>>
>> But the above quirk for the ASUS ROG Strix G16 (2025) does not use
>> .no_edge_events_on_boot which just disables the initial run of
>> the ACPI event handler at boot. Instead it uses:
>>
>>              .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>
>> which *completely* disables the ACPI event handlers for the mentioned pins.
> Oh, I've completely lost track of all the quirks that were added after I
> did anything with the ACPI GPIO stuff :(. Sorry about missing this. I will
> stay silent from now on ;-)

Hi Everyone,

@hans, I tried it and can confirm it does the trick as well.


Best regards,

Marco


