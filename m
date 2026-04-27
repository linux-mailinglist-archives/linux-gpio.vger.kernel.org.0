Return-Path: <linux-gpio+bounces-35603-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JolB9mD72kMCAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35603-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:42:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AB47564D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 17:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A16BF30BA43B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA263D649F;
	Mon, 27 Apr 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEq5F+Z8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B632AAA3;
	Mon, 27 Apr 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303843; cv=none; b=UAmFgQbx9EN5+7l9VYbjf97MQMctKVfA6BenNeXXvMfoowmtqbqWt2eYUAsyC6IH35TtBwZuk8NT+YEtqRzbv94Pq0MKJZFlyGsudjwLrNl4NyI9fNVuqmpj2q5PDVo4ioTs05H90ffukBbi+H+OsPF8bwdoBJmB+ZYiFdyzBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303843; c=relaxed/simple;
	bh=kssKR+WdqyY4GkBrJrl8u9664Ih9+DVxDxRUaEyrjAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGFcyOt6sAhvicz6Zqyem12aSvc/xbLDS30HZs+/HVMrBWPrGxcP0xbeCCxQsSdTppw9MjLJWfZQa/ByaD4BB83/O0eLJtJnyPooH35bRgJARuNp0/RTHa19pTykJZXFYk7GEEaJRZNbIUUNBJBcEsd7tDDgEaSmdzinbbR5yaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEq5F+Z8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EB6C19425;
	Mon, 27 Apr 2026 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777303842;
	bh=kssKR+WdqyY4GkBrJrl8u9664Ih9+DVxDxRUaEyrjAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TEq5F+Z8eoambtc6oD/iC99d2HUmA/R4/+euq7miyU2GDtOzq+dBYAIVYAmxnjpeo
	 4I1ZPwuzxYUrY/LL6kP+ETaVSyVr4CiG2/5m/qGsE1DjThXui0VpEycjz4SVH2TrM0
	 Gj8JINskL0XbKaLoRUfFnivl13gHwZgrxG1094VzBE8p2eMqqCPsBA4XbRvwGw4FIS
	 VLOdcQbvGmta/1Rqpg9AcjGGJb6I6etvXPwFqEqirC3aUNEVtgKXgUHhzCTrbmQVqS
	 vWRjNAgy6Sk9GC531/x8ivMZyXt7za2IjwXLOOKVAXspCrM7sTk7okUL2tiGvO5KsZ
	 QMz0h8bLhwL4g==
Message-ID: <f8efd77f-6c49-4ec1-9d16-a855c2577908@kernel.org>
Date: Mon, 27 Apr 2026 17:30:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] 36-second boot delay due to by
 acpi_gpio_handle_deferred_request_irqs on ASUS ROG Strix G16 (2025)
To: Marco Scardovi <mscardovi95@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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
 <edac84e9-93c0-4248-b28f-c121583b9f65@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <edac84e9-93c0-4248-b28f-c121583b9f65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A81AB47564D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35603-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.24:email,0.0.1.99:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.21:email]

Hi,

On 27-Apr-26 14:41, Marco Scardovi wrote:
> 
> Il 27/04/26 14:28, Mika Westerberg ha scritto:
>> On Mon, Apr 27, 2026 at 01:46:03PM +0200, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 23-Apr-26 07:15, Mario Limonciello wrote:
>>>> On 4/22/26 23:42, Mika Westerberg wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>>>>> Assuming all the variants suffer the same problem would it be ok to use a
>>>>>>>> wildcard for it?
>>>>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>>>>
>>>>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>> index a0116f004975..e3a6111854e8 100644
>>>>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
>>>>>>>                 .ignore_wake = "VEN_0488:00@355",
>>>>>>>             },
>>>>>>>         },
>>>>>>> +    {
>>>>>>> +        /*
>>>>>>> +         * The ASUS ROG Strix G16 (2025) ACPI GPIO configuration
>>>>>>> +         * causes acpi_gpio_handle_deferred_request_irqs() to
>>>>>>> +         * stall for ~36 seconds during boot so ignore the two
>>>>>>> +         * interrupts involved.
>>>>>>> +         *
>>>>>>> +         * Found in BIOS G614PP.307.
>>>>>>> +         */
>>>>>>> +        .matches = {
>>>>>>> +            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>>>>> +        },
>>>>>>> +        .driver_data = &(struct acpi_gpiolib_dmi_quirk) {
>>>>>>> +            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>>>>> +        },
>>>>>>> +    },
>>>>>>>         {} /* Terminating entry */
>>>>>>>     };
>>>>>> As for now it seems working. I've reverted it on my kernel as I prefer
>>>>>> remain as much as possible close to the CachyOS' one but hopefully it will
>>>>>> be implemented on 7.1, if someone propose the patch and it is accepted. It
>>>>>> would be amazing to see Asus more interested on Linux and more strict with
>>>>>> their BIOS but in the end I understand it's like asking for the moon.
>>>>> Okay thanks for checking. I guess this is what we have to live with for now
>>>>> until someone finds a better way of dealing with these.
>>>>>
>>>>> @Francesco, would you like to submit a new version of the patch similar to
>>>>> above or you want me to do that?
>>>> Hans suggested that we might want to look at ripping out this edge triggered events at boot earlier in the thread.
>>>>
>>>> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb
>>>>
>>>> Hans - as you pointed out that the Surface lid state is the only real issue left and you happen to have one do you think you could work up some patches?
>>> Right, so I read further in the thread that Armin has a maybe better suggestion,
>>> after that has been merged I can check a bunch of the current devices with
>>> .no_edge_events_on_boot which I still have and see if those quirks can be
>>> dropped now.
>>>
>>> But the above quirk for the ASUS ROG Strix G16 (2025) does not use
>>> .no_edge_events_on_boot which just disables the initial run of
>>> the ACPI event handler at boot. Instead it uses:
>>>
>>>              .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",
>>>
>>> which *completely* disables the ACPI event handlers for the mentioned pins.
>> Oh, I've completely lost track of all the quirks that were added after I
>> did anything with the ACPI GPIO stuff :(. Sorry about missing this. I will
>> stay silent from now on ;-)
> 
> Hi Everyone,
> 
> @hans, I tried it and can confirm it does the trick as well.

Great, that is good news.

Thank you for testing.

Can you try Mario's patch from:

https://lore.kernel.org/platform-driver-x86/f4979d43-f61f-4387-8490-ccec7043c940@kernel.org/

That changes the run-edge-events-at-boot behavior to only run
under the same conditions as it does under Windows (according to
the Windows docs). So maybe that will fix things without needing
a quirk ?

If you give this a test please remember to remove any other
workarounds like the kernel commandline option.

Regards,

Hans



