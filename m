Return-Path: <linux-gpio+bounces-35511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fmY7NoLM62llRgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:03:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC1463178
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C25C30137AA
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 20:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E3236CDE2;
	Fri, 24 Apr 2026 20:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dF3zHBEq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38BC266581;
	Fri, 24 Apr 2026 20:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777060989; cv=none; b=ADz1hicYAWWx0dpGTFRgZQqoFYpBN9bSXoDNo/oEtyjBtg0B9bJy+k9TvLpYgYTIe0du0jNyg5+Tn6ytgaoQsM9tyOEY+HW35xbDsWSCDDfQhmdcVQ2VloL1RX1K8p/zfgtq/4N3892NLLzEY+Rf3++sRZ3TCQTqA+tgNpOS47k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777060989; c=relaxed/simple;
	bh=wwnkcgYybOKw3n8eHhLHnbbUrdzVZOLQ9gVLh3rQGLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Chlha0dsEwypjA2UD0HtBYc3jtCNutKrsaYSWXbbazsrAFrBzAOuR69zeSAQQ8nsOf95jtfaE5ELsrbNzFZ2PdqItSV/RJEa+xbYjU9MAcjLwn8tXEx6qbtK0HNjwmn9IsPxn1d9Pp0/8eCZgjWNQiJlRZMvs/AyPqLYZpvFZY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dF3zHBEq; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777060980; x=1777665780; i=w_armin@gmx.de;
	bh=wwnkcgYybOKw3n8eHhLHnbbUrdzVZOLQ9gVLh3rQGLQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dF3zHBEqu9Ny1t8VI9BIac18EFpGcQnvNFs/Q/hS3g5orvrIfGCWVTblicC7XGG4
	 d1t2S5R+qGCZ9cFMfBaMI5FgKtkf4axxzpI0hzev/pmNrRpqF/V+khG/PgYqDnid4
	 u25Dwr/dvg/chOWyjRJxuTZwQBxrB97PKlmJBCA8V+B7aHv+634W1jrp89o4OTtvP
	 onxlN4PFSUzLyGoG6buFynhbXduwGCmCh9LrBLB1W892Coec12ZOzQ6WjNUXlNRri
	 hgkVla6m56aq8zkwGIlUN2mys4RxZWDjhDXhq10K8zwzVg/ygMlKZy9XXCsiIn2v2
	 AfJ44nE0BlDMCBByVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQe5u-1w3f8c28gQ-00RuCc; Fri, 24
 Apr 2026 22:03:00 +0200
Message-ID: <a2a187d9-363c-48fe-8301-6a199366c478@gmx.de>
Date: Fri, 24 Apr 2026 22:02:59 +0200
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
 Mario Limonciello <superm1@kernel.org>,
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f72a1da5-2cc1-4e08-9441-ea252062b4e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VMEO/yYJujXEx5zsvdiDZQ07ut5pkDFrW8sirlsGo5Kxzn+M15L
 YleJ86f7hDQc3cG8BKIfRRfiflrNYUVeiPTFyCdi77IAZAzYTq4PzU7ZEFl66ieeUU39IRK
 l5tkQgXhFqW1AVWJIDcZypSzK3vAS2d8uJ1+Ehh1GgAaZl6ANVOUdKc9bspCOVmyj2yy8g5
 kUIf7PTBsvYqyTMfiPeSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Bk1Vi9lGTW8=;yD0NiKNpyArw5jz/lBFK33cePOO
 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
 Cy1p5hKrR4lTzHfCWclNrsdlKvw=
X-Rspamd-Queue-Id: 84AC1463178
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
	TAGGED_FROM(0.00)[bounces-35511-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[W_Armin@gmx.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmx.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]

Am 23.04.26 um 19:46 schrieb Marco Scardovi:

>
> On 4/23/26 07:15, Mario Limonciello wrote:
>> On 4/22/26 23:42, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Wed, Apr 22, 2026 at 02:08:29PM +0200, Marco Scardovi wrote:
>>>>>> Assuming all the variants suffer the same problem would it be ok=20
>>>>>> to use a
>>>>>> wildcard for it?
>>>>> Yeah, we could expand it to all "ROG Strix G16" I think:
>>>>>
>>>>> diff --git a/drivers/gpio/gpiolib-acpi-quirks.c=20
>>>>> b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>> index a0116f004975..e3a6111854e8 100644
>>>>> --- a/drivers/gpio/gpiolib-acpi-quirks.c
>>>>> +++ b/drivers/gpio/gpiolib-acpi-quirks.c
>>>>> @@ -392,6 +392,23 @@ static const struct dmi_system_id=20
>>>>> gpiolib_acpi_quirks[] __initconst =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 .ignore_wake =3D "VEN_0488:00@355",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The ASUS ROG Str=
ix G16 (2025) ACPI GPIO configuration
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * causes acpi_gpio=
_handle_deferred_request_irqs() to
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * stall for ~36 se=
conds during boot so ignore the two
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * interrupts invol=
ved.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Found in BIOS G6=
14PP.307.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_PRODUCT_NAME, "ROG Strix G16"),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D &(struc=
t acpi_gpiolib_dmi_quirk) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.ignore_interrupt =3D "AMDI0030:00@21,AMDI0030:00@24",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {} /* Terminating entry */
>>>>> =C2=A0=C2=A0 };
>>>> As for now it seems working. I've reverted it on my kernel as I prefe=
r
>>>> remain as much as possible close to the CachyOS' one but hopefully=20
>>>> it will
>>>> be implemented on 7.1, if someone propose the patch and it is=20
>>>> accepted. It
>>>> would be amazing to see Asus more interested on Linux and more=20
>>>> strict with
>>>> their BIOS but in the end I understand it's like asking for the moon.
>>>
>>> Okay thanks for checking. I guess this is what we have to live with=20
>>> for now
>>> until someone finds a better way of dealing with these.
>>>
>>> @Francesco, would you like to submit a new version of the patch=20
>>> similar to
>>> above or you want me to do that?
>>
>> Hans suggested that we might want to look at ripping out this edge=20
>> triggered events at boot earlier in the thread.
>>
>> https://lore.kernel.org/platform-driver-x86/20260423044211.GD557136@bla=
ck.igk.intel.com/T/#mdca882e6606d3a894ec7499d3b742d040933dbdb=20
>>
>>
>> Hans - as you pointed out that the Surface lid state is the only real=
=20
>> issue left and you happen to have one do you think you could work up=20
>> some patches?
>>
> I see. Well, that makes totally sense=20

Hi,

according to the Microsoft documentation (https://learn.microsoft.com/en-u=
s/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-,
section "GPIO controllers and ActiveBoth interrupts"), triggering GPIO int=
errupts marked as ActiveBoth during initialization is
correct as long as the associated GPIO line is already "asserted" (aka log=
ic level low). I think the problem is that we also trigger
edge-based GPIO interrupts _not_ marked as ActiveBoth.

Based on this i agree with Hans, except that we should continue you trigge=
r ActiveBoth GPIO interrupts as long as the above
condition applies.

Thanks,
Armin Wolf


