Return-Path: <linux-gpio+bounces-35557-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMlhB4VM72kEAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35557-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:46:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA12D471EF9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 13:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC77830107CD
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 11:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE22E30F924;
	Mon, 27 Apr 2026 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="of5yp/Ko"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740AC270EC3;
	Mon, 27 Apr 2026 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290367; cv=none; b=aOfdlKugbwJN1eop/FkxsOfh8Idnk606nYq4Q1dkJYgdwC7j7M3Gbt/Nj+oRoFkLmBXDvfQfphkSmthW7igiy48lLEY/h07XCMJ2qM1cjspvDjpt1870TOmz8GyOVSU3FkPIMCkfDb/5nFMDchSEpQrZ+6YLpO4suauHK6rsEQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290367; c=relaxed/simple;
	bh=A04kvKesBHSkpPbcNW+ARy0smW82/E5vU4pNuts1UXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pG2ht9JeqPfzZRe1JyKJxWA7pkQyR2NH+sOXh5P2y/q02jD8avCnh+mi5uLZCyF3NobVLuAvHPuU2fYPNSamWAOLkiuXW5xbU414yHMNkEvHpHq0lHtz1n5NZ2jBRTDqza15kPFt1ENBs+Cac6xvBBVHezTFWnD1ejhukDkAK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=of5yp/Ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C377C19425;
	Mon, 27 Apr 2026 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777290367;
	bh=A04kvKesBHSkpPbcNW+ARy0smW82/E5vU4pNuts1UXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=of5yp/Ko12TZAVJBRrG9/6BsSRnQXUKcvOBnblcPPz5Nl/RgXe0y44xGnlzBco67A
	 3eqI0Iavmau+ZwBQH9nZQuOOfo6HU4D6V4kcUTNbNMPzBF0Trdknf+bhbmaLVVfxPx
	 A6k+cp6b3PQ8FYuc+e5rB1oBr5kiJk6/bWG5l8ZQY3ngtJ2aUibgOvaNCGHP6h6yNX
	 xnCvb+040EpyrTAJsVr7ugTuQ9RnBvaqj1ObsgqFygf80/QRX4+udhmbIwaX19f05g
	 +rscnjOV5O0lzhuapHg7/kRTBTQ3vOkfet7FNBeyUllO/1FWKrjMuzbWNTRr+Cg6TM
	 Odn5BQlH6BBEw==
Message-ID: <c55b55ea-a8d5-481e-916f-eb92aeb2e06d@kernel.org>
Date: Mon, 27 Apr 2026 13:46:03 +0200
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
 Marco Scardovi <mscardovi95@gmail.com>
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3d562963-9581-4e0f-b9a0-5f0fe28d2495@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA12D471EF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,kernel.org];
	TAGGED_FROM(0.00)[bounces-35557-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.24:email,0.0.0.21:email,0.0.1.99:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi,

On 23-Apr-26 07:15, Mario Limonciello wrote:
> On 4/22/26 23:42, Mika Westerberg wrote:
>> Hi,
>>
>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>> Assuming all the variants suffer the same problem would it be ok to use a
>>>>> wildcard for it?
>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>
>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
>>>> index a0116f004975..e3a6111854e8 100644
>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
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
>>> remain as much as possible close to the CachyOS' one but hopefully it will
>>> be implemented on 7.1, if someone propose the patch and it is accepted. It
>>> would be amazing to see Asus more interested on Linux and more strict with
>>> their BIOS but in the end I understand it's like asking for the moon.
>>
>> Okay thanks for checking. I guess this is what we have to live with for now
>> until someone finds a better way of dealing with these.
>>
>> @Francesco, would you like to submit a new version of the patch similar to
>> above or you want me to do that?
> 
> Hans suggested that we might want to look at ripping out this edge triggered events at boot earlier in the thread.
> 
> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@black.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb
> 
> Hans - as you pointed out that the Surface lid state is the only real issue left and you happen to have one do you think you could work up some patches?

Right, so I read further in the thread that Armin has a maybe better suggestion,
after that has been merged I can check a bunch of the current devices with
.no_edge_events_on_boot which I still have and see if those quirks can be
dropped now.

But the above quirk for the ASUS ROG Strix G16 (2025) does not use
.no_edge_events_on_boot which just disables the initial run of
the ACPI event handler at boot. Instead it uses:

            .ignore_interrupt = "AMDI0030:00@21,AMDI0030:00@24",

which *completely* disables the ACPI event handlers for the mentioned pins.

So for the 36-second boot delay issue we first need to see if
switching to ".no_edge_events_on_boot = true" helps.

Marco (Scardovi) can you test if passing gpiolib_acpi.run_edge_events_on_boot=-1
also fixes the 36 second boot delay ?

Regards,

Hans




