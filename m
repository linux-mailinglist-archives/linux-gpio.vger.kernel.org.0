Return-Path: <linux-gpio+bounces-35528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGIZORsn7WnBgAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 22:42:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86748467A88
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 22:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35CCF300BC87
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 20:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC43E31194C;
	Sat, 25 Apr 2026 20:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XYdbaqX5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D72244684;
	Sat, 25 Apr 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777149718; cv=none; b=TAfotRSSqiFNL5I4plCaBGCd80FAja497IYwiCdlYWYxI9CMQMi/UoVQ6DWtsxpNrs3Te7o8bhu6ZpGJzSjTOQTBlF45WW5eFINrIp3ey8QKTPBBMVak6uAviCqAdYkZ/jCwbaJYR3T1RY2o2hith+Yc41PqeRhljrrZCkcqAQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777149718; c=relaxed/simple;
	bh=ALe2hiR1cGBhEsOKkej0n+EcSJjr2bwZaVzDeECNu38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpjhlyKWYljjXNcLN7qdDcMd0p02gzNTINAucqawSATojhpPmInZuTz9oPVACHYc5nF72VLptgQs44Xh+vw2LKR83PfJ24HkzOqxgSvyyxaY9PlfwGQFXLQ0I9ZDTEZm0g9HAu5YKkf0Z+VTtV0iaL998hfSzz2urcGmTl4yyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XYdbaqX5; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777149710; x=1777754510; i=w_armin@gmx.de;
	bh=ALe2hiR1cGBhEsOKkej0n+EcSJjr2bwZaVzDeECNu38=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XYdbaqX5yZjU+3u0fCMGizkgjZ8BsdJVsUnJd9zWdBswW7F2UF/Mr7kci74EyJL4
	 ipFhUNhWd3JdI/dU7pFvDapwmHJH+FruieJgAj2aDnNbBFu/sLHkmMKKG00+wK9n8
	 gZN7MaQiHxKzxrX20bLECcTpi+w/F1brJrZNsayYrg9xwuYYjM2RdPw5irLYrLRBB
	 B8lC7V5XyL5mc16xWSwUJe4IZ0SZK7UHfTZ81VY4y2+NSFSC+IijdL2qpVShTCJ3y
	 rgSujPoP6B+CvVWxijPc5Y2kqCbokgx5Ek3k5luGWnekPWATO/kxxKLuZwBfhTkFa
	 ATMKWSc9YM98npNmZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1w4Kh63Za1-002ecu; Sat, 25
 Apr 2026 22:41:50 +0200
Message-ID: <bcdd110b-489e-4f09-892d-b2d6ce4b0ff0@gmx.de>
Date: Sat, 25 Apr 2026 22:41:46 +0200
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
 Marco Scardovi <mscardovi95@gmail.com>,
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
 <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
 <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
 <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f4979d43-f61f-4387-8490-ccec7043c940@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zmCdLrwRtFPH2B9/xz+Sk2cFg9nUsUAM2e7MBmQ32Idv/x0PB3h
 OTewia28zHhG4eVPUZofd+OUaeK8ZxetkjhWVZJnWDXuz21kLFxAdg+vH4nq7+8TvQRR+67
 ZRq+XdrDpkO88CT7966IQ+hAiJOg8QG43jngIgrCwxRO8enDrp68PzqdaX0Il3QSK+pz8uV
 uPPOD7zfjnouc73FYXArw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:S8Db+N6vjeA=;8HpJckFivVyLBPJdLUnoWkjMuY1
 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
 BYwhcg==
X-Rspamd-Queue-Id: 86748467A88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35528-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux.intel.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.1.99:email,0.0.0.21:email];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,gmx.de:dkim,gmx.de:mid,0.0.0.24:email]

Am 25.04.26 um 17:15 schrieb Mario Limonciello:

> On 4/24/26 15:02, Armin Wolf wrote:
>> Am 23.04.26 um 19:46 schrieb Marco Scardovi:
>>
>>>
>>> On 4/23/26 07:15, Mario Limonciello wrote:
>>>> On 4/22/26 23:42, Mika Westerberg wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>>>>> Assuming all the variants suffer the same problem would it be=20
>>>>>>>> ok to use a
>>>>>>>> wildcard for it?
>>>>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>>>>
>>>>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/=20
>>>>>>> gpiolib-acpi-quirks.c
>>>>>>> index a0116f004975..e3a6111854e8 100644
>>>>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id=20
>>>>>>> gpiolib_acpi_quirks[] __initconst =3D {
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .ignore_wake =3D "VEN_0488:00@355",
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The ASUS ROG S=
trix G16 (2025) ACPI GPIO configuration
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * causes acpi_gp=
io_handle_deferred_request_irqs() to
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * stall for ~36 =
seconds during boot so ignore the two
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * interrupts inv=
olved.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Found in BIOS =
G614PP.307.
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D &(str=
uct acpi_gpiolib_dmi_quirk) {
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .ignore_interrupt =3D "AMDI0030:00@21,AMDI0030:00@24",
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {} /* Terminating entry */
>>>>>>> =C2=A0=C2=A0 };
>>>>>> As for now it seems working. I've reverted it on my kernel as I=20
>>>>>> prefer
>>>>>> remain as much as possible close to the CachyOS' one but=20
>>>>>> hopefully it will
>>>>>> be implemented on 7.1, if someone propose the patch and it is=20
>>>>>> accepted. It
>>>>>> would be amazing to see Asus more interested on Linux and more=20
>>>>>> strict with
>>>>>> their BIOS but in the end I understand it's like asking for the=20
>>>>>> moon.
>>>>>
>>>>> Okay thanks for checking. I guess this is what we have to live=20
>>>>> with for now
>>>>> until someone finds a better way of dealing with these.
>>>>>
>>>>> @Francesco, would you like to submit a new version of the patch=20
>>>>> similar to
>>>>> above or you want me to do that?
>>>>
>>>> Hans suggested that we might want to look at ripping out this edge=20
>>>> triggered events at boot earlier in the thread.
>>>>
>>>> https://lore.kernel.org/platform-driver-=20
>>>> x86/20260423044211.GD557136@black.igk.intel.com/T/=20
>>>> #mdca882e6606d3a894ec7499d3b742d040933dbdb
>>>>
>>>> Hans - as you pointed out that the Surface lid state is the only=20
>>>> real issue left and you happen to have one do you think you could=20
>>>> work up some patches?
>>>>
>>> I see. Well, that makes totally sense=20
>>
>> Hi,
>>
>> according to the Microsoft documentation=20
>> (https://learn.microsoft.com/=20
>> en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
>> section "GPIO controllers and ActiveBoth interrupts"), triggering=20
>> GPIO interrupts marked as ActiveBoth during initialization is
>> correct as long as the associated GPIO line is already "asserted"=20
>> (aka logic level low). I think the problem is that we also trigger
>> edge-based GPIO interrupts _not_ marked as ActiveBoth.
>>
>> Based on this i agree with Hans, except that we should continue you=20
>> trigger ActiveBoth GPIO interrupts as long as the above
>> condition applies.
>>
>> Thanks,
>> Armin Wolf
>>
>
> So maybe something like this (attached)?

Yes, exactly.

Thanks,
Armin Wolf


