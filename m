Return-Path: <linux-gpio+bounces-35424-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAoEOA9b6mnXyQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35424-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 19:46:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A5455B64
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 19:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C82C830125C1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 17:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE3B37B40B;
	Thu, 23 Apr 2026 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgxG5Rf0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B896B38736F
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776966399; cv=none; b=H+HRH61TyN0DFuA1WaPZ7xX5q0/UIFH8p1JiZrVrLjM8496XIz4anisQiOn5T4TV6k8QPOiRReVTF3UUJG7sObTwFZWOAQU5R5LU7MrpTYa9ZKVPQXUAcvksWnrtu7geXnLGFqbn+0fuLaY/OBlhd7z6Ui6PUzJY19ACaz3G5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776966399; c=relaxed/simple;
	bh=Q/08wWQ4SfuMhfDVP9sXEtWA2o3HnwK33N7dXefJmWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3Kczjqkh2mEaEaMlrNqLom12V1hO7EjWU3HWKFZEvVdHzBsRW0cquNemPRAxtkJmrImCQPLEkZz0Mm1lmZg9wmHBslNM0xv6e5a/WnCsNLH3f/ZKko6aH3r9Cf9Y5+LeoXQOYd36MsSPiFM8Vg7vmn+4XRaxZVZAUpE1dErj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgxG5Rf0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so68418895e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776966396; x=1777571196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKO0ZSfKpXY8aQTH5b7X8YGTTyGiXXEYMnXwkBPcBbk=;
        b=TgxG5Rf0D6+XEDnDW9xBvzpnyRDZDrymF543ek4kkzR+gYRk8/nffD/by7kRisi3D2
         q71qvkSVSdP2YG71S1mxZg3tKApvpAA4piUNIKDddPY/9hAbspQ3m6OjYu96sto8HlKx
         ucKLoK5148Y3oRXEjOBSpGKxlj11ApiqLapCdSPpMLp2PnVRuIdzvuyEgYn4Uq7Gg7MM
         WcGWWpU2dSAwB7UW1bAEFVw4RT1XafzBUa8k1/AswBlzt+l20RrLClMnUyjoor93ZVqY
         L618uq6XvNkDcvNIce5c+d9AOoDy1gDZCrRrElOtWC6W0VUu1QoxNcRjicwp864/ae0T
         zZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776966396; x=1777571196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKO0ZSfKpXY8aQTH5b7X8YGTTyGiXXEYMnXwkBPcBbk=;
        b=saCaxBZGEU10qexrv0iso9gSIFGn61K0tZ3A18oSzgNTTv4d/llGsTJy8PCp6/9etg
         s9jxl0PLC2xzzzCZFKaa7YqaaK44fNwpymUoyKnFXhK4s4KwAlCNHCh3r7wL5x4pPkqE
         +y4Rscn9F9C7UdQdLo/Kj72nZkNlX1IJPEmsy3NlhXyuYIZo4EeEIFB+b3nzQlP9BysH
         YxHIiTne68+o9NtD5sgiHsE9en15IjbVbJVn1uBtAgPZ2LZXRVpO2tvVXNNxsW/06hoT
         k5hMbxe/6FwZhBBb6DudKAMRKI7ZnAXGu4lybIBjLKvrvJxmig58kCyo9t6w5uyyiOmA
         8ghQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fVaRXqQewFGJqeoC129Ugj/YjMQb6XXa+0uY/PMHwFpoGGHNImD31wrIMjc1J9Xclg1SgddRXBQQP@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmnEqkHRC1Ux0q2bD+SK9R1EvOmT+UyewA+ZlBAy3ifatgL6r
	1E9TJSaTt/phCRqDtq84QTU0vC580dIe5UCNZEAKNersVtDZDEHyS6vY
X-Gm-Gg: AeBDieswxXFPpUl76POoUMFULqsUUwn0KkiQodEldIOvq3N9am/XdbAVHKnMeWkR1j2
	MVx33CjhSzhPrwO/95HTA6MPuchGmJBqRP2SOxbrH3R8nhPb35KalRVtORAaj5zjrndbeQmxkAs
	8Gch875pqWqxV7d23L4ZvxaZyK2Ggu820nHMhj/dh8OyaiTnbIKpl0BVCqGMInMlF5jPLz+oIgu
	cfBtJ1E3bPBbhD1pak8RKTga4xSpYKHkJFF++Bpnx2p7DoFAleULSHuxzMG06pyPb5ZPrxYpJiI
	N8wmipoyOSzAxKlViXfolHQoC3VJr2LV3FER3r/rsL/h8b3NU4EUoYtOLbxbinxNsqP3ppqPqzw
	/UyGMzdOlajzmmE/AeFh9wA5SwOXx11NYYag+dyPh6kbAIUfL1FiEr2CMd8o1vqu5Rw76ZRQ3Rc
	6CKJracYXs4w6ay4zeBEFtPE70rZSC4bcEOnbXW2JYNfwk13qawdp9/Vo3GozSVYlidYk06uULT
	LyNjuI=
X-Received: by 2002:a05:600c:6085:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488fb782618mr367619265e9.21.1776966395897;
        Thu, 23 Apr 2026 10:46:35 -0700 (PDT)
Received: from ?IPV6:2a01:e11:202b:40:3c42:f121:865e:1066? ([2a01:e11:202b:40:3c42:f121:865e:1066])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm916283675e9.3.2026.04.23.10.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 10:46:34 -0700 (PDT)
Message-ID: <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
Date: Thu, 23 Apr 2026 19:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Mario Limonciello <superm1@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Francesco Lauritano <francesco.lauritano1@protonmail.com>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "westeri@kernel.org" <westeri@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <e8ed4d4e-37e1-4577-bf80-62fcefbef7dc@kernel.org>
 <ReQS8sQSGy3UTuG6tyPvoOb8_037sC6A2yXsSFNuXY1PlTFtCcDHnjf8vufEsk8avBSIL46U0qE-ZjTJD1xsbVYZ6_d2-wlTOZ2NJ2coTsc=@protonmail.com>
 <20251218063954.GT2275908@black.igk.intel.com>
 <b57b44c3-ea96-4189-8b70-71bf4a80d29b@kernel.org>
 <20251218103831.GW2275908@black.igk.intel.com>
 <51f999d7-2064-47dc-8d9b-e262588bfbdb@gmail.com>
 <20260422090709.GB557136@black.igk.intel.com>
 <4e55e31e-a5e8-4098-8a7f-bb52476b882a@gmail.com>
 <20260422095558.GC557136@black.igk.intel.com>
 <5a36760d-5d1e-4eee-9006-3fed042aa2cd@gmail.com>
 <20260423044211.GD557136@black.igk.intel.com>
 <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
Content-Language: en-US
From: Marco Scardovi <mscardovi95@gmail.com>
In-Reply-To: <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35424-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.1.99:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.24:email,0.0.0.21:email]
X-Rspamd-Queue-Id: 148A5455B64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/23/26 07:15, Mario Limonciello wrote:
> On 4/22/26 23:42, Mika Westerberg wrote:
>> Hi,
>>
>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>> Assuming all the variants suffer the same problem would it be ok 
>>>>> to use a
>>>>> wildcard for it?
>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>
>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c 
>>>> b/drivers/gpio/gpiolib-acpi-quirks.c
>>>> index a0116f004975..e3a6111854e8 100644
>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id 
>>>> gpiolib_acpi_quirks[] __initconst = {
>>>>                .ignore_wake = "VEN_0488:00@355",
>>>>            },
>>>>        },
>>>> +    {
>>>> +        /*
>>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
>>>> +         * stall for ~36 seconds during boot so ignore the two
>>>> +         * interrupts involved.
>>>> +         *
>>>> +         * Found in BIOS G614PP.307.
>>>> +         */
>>>> +        .matches = {
>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>> +        },
>>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>> +        },
>>>> +    },
>>>>        {} /* Terminating entry */
>>>>    };
>>> As for now it seems working. I've reverted it on my kernel as I prefer
>>> remain as much as possible close to the CachyOS' one but hopefully 
>>> it will
>>> be implemented on 7.1, if someone propose the patch and it is 
>>> accepted. It
>>> would be amazing to see Asus more interested on Linux and more 
>>> strict with
>>> their BIOS but in the end I understand it's like asking for the moon.
>>
>> Okay thanks for checking. I guess this is what we have to live with 
>> for now
>> until someone finds a better way of dealing with these.
>>
>> @Francesco, would you like to submit a new version of the patch 
>> similar to
>> above or you want me to do that?
>
> Hans suggested that we might want to look at ripping out this edge 
> triggered events at boot earlier in the thread.
>
> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb 
>
>
> Hans - as you pointed out that the Surface lid state is the only real 
> issue left and you happen to have one do you think you could work up 
> some patches?
>
I see. Well, that makes totally sense

