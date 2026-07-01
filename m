Return-Path: <linux-gpio+bounces-39288-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MxYDA6vXRGqv1woAu9opvQ
	(envelope-from <linux-gpio+bounces-39288-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 11:02:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA66EB6AE
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 11:02:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YLurAXhn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39288-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39288-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 008DD305A210
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65583EEADF;
	Wed,  1 Jul 2026 08:56:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3E3E3165
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:56:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896191; cv=none; b=KBXWR1O/vOgEuLjOKfOydReIP21TpEx++k5g88wNfioqrTeB2Ovym1kkXdQi9ku0xbS7ZBJROynG4oXtJSei0VjxfIbk9aWzws6b11xfaaRPYbHnhAwXa6WvH7ZDPDbRv+bQViEr0gWUI8xzWT1/4YGll4XkC3SnBj2JwCLpa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896191; c=relaxed/simple;
	bh=Q/Ee8UEosH5HcKcdYgBTh0JMMmQuw7yAsR/IJXwVX1A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=u0L2Wiex2rXuY1eMYwweA3F04hB/2/awU9Y+RSiipDjosWOJSdeuZZtGsbGAhTVjfb7YVTrSOdQAXQvsNfIla6HWaOm/jMAPGbY3KNq2oECMJo8PmStI2RoA2xORR5LpqAQpr5qunjpQz2MRygK+hJnBof65TaTXLY4QbUmYCyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLurAXhn; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c99db7f763so653935ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782896189; x=1783500989; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7b1kRHluAn2Yg95eVnJuMF1lRPMgONF4R7PVAPCSBmQ=;
        b=YLurAXhnUiuXKGgIcP36WhbFj34z8L1by1YXCh5KEwFU8OCRtWEIOAsDZTaITLYzCm
         fVLzrauE7x2mD/SxV0tfT96L00JN8OHLDmfLck+roKpuYv5iR/fL65ap1lJo32SfSJdB
         hj6CKfVzLS73UQXmprrKvrMCUjziIZLdWEvtE8EG0SYUDr79XX9W+TrThMZBzD3SKEg7
         wULHuUht4Vb4QHa9IG2/ty4QtlNs+C6keq+CWE3hJpXccgfZp5nP1Q22zRv9OVHDmotx
         JxbfaEOO8NqBI4INANfEVxQAggI0QQwMn9qE8bQUs1emsoqOHSk7UXiXuN8fUsheKu5U
         e0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896189; x=1783500989;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b1kRHluAn2Yg95eVnJuMF1lRPMgONF4R7PVAPCSBmQ=;
        b=JtqFYpf2Sogtd/n2E5tCGhWYA3GNnqyOU4kKjo5JT3HNVHmawuuvpPQ8epAlENwh2N
         X8DMffz0wEhoDBN3DCHkeeyGk9VHLE206TM8OA43qihE3hlKIRYW6BbqE8JRNrZ6NwGC
         9jhjnaFKsPHSt9SuRrF55DWNT11zdsnBBxuwtbbCh+yY323m2jCscayE5ex8WwSHasyY
         zV7m24xc9n5fKMrJV/NsEkoqDC4iF3sAJksqg8WSH9iK9217J3kp5duRf60Er+2GDLdG
         SxJwyv2dEGRSrbjUFgfL0wWKh9s4qm/4obu09ADRSfjXu2b8X6GvM5Chml3P3lIVKTd8
         zDSg==
X-Forwarded-Encrypted: i=1; AFNElJ8+YjcfurS8tbyUvo5KEl1tSjqq7vqmnnjm6+CWCNMq5iPrfCiAdSVpBWVHR5q4CMAIOO8pZrKi4z+G@vger.kernel.org
X-Gm-Message-State: AOJu0YxJu+SxBVTsTUWt9FDakEI2e5OFXmSL6rWMl85OvJw1B/A/hI14
	++DX2Em6NwANqf4aG5DwJSLfJQ2rSqtnhNahCnQa5C9qxdz90C4vmDI4
X-Gm-Gg: AfdE7ckgNnv6k2/yyL50CI/5HIq6j73AMput6KVrwsWWP8XnhcsaUQbZDmldMR6qYME
	LgxClDzcmxpYepD02wnMduhPJsSk7MXUmQX29CLUXmgMiEjgtAoyytPIWynY8AZQzWgr0Nc972F
	c33qebq9kOp7YSgo5UNHqoiXDj/GChmwfMdQuvDw0CfQOAwSCkCyfgTIyp8CxuVGuQL8YRU0vb/
	RfQ0GlyyntPBBruj0kNo5NB3VWfKG0D+VpR1kWiIQNh+OwZ/egu2tcoWFHWYRERkKLnGEyQtNJu
	7WE0wnNMdd5Eufkz1Ug8ZTTK6SPdnTmUzEZJyqITsAhMia0tHbOmrSPSHE5t8dQDTE93J4Fy1MN
	K3XPcN1h0mYVrxcPxuR1Mk7IyHUb0EGitaCBK1cpOttSDxfpc19d4Cbku605GtFFfkEB+JHhBa9
	JXYv0Yu0MJAucUhuQKQ335gi0=
X-Received: by 2002:a05:6a00:2da5:b0:845:3ffb:ac1d with SMTP id d2e1a72fcca58-847c0690f59mr413240b3a.2.1782896189258;
        Wed, 01 Jul 2026 01:56:29 -0700 (PDT)
Received: from smtpclient.apple ([2406:4440:0:105::41:a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02ced41sm3546555b3a.36.2026.07.01.01.56.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:56:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for
 gsi_idx_map
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <akTRyQqXuSU6pl71@ashevche-desk.local>
Date: Wed, 1 Jul 2026 16:56:11 +0800
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jianmin Lv <lvjianmin@loongson.cn>,
 WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Linus Walleij <linusw@kernel.org>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Liu Peibao <liupeibao@loongson.cn>,
 Juxin Gao <gaojuxin@loongson.cn>,
 Mika Westerberg <westeri@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA7111AC-196F-41F7-A47B-E5118F7D26F2@gmail.com>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
 <akTDj-YJjuDOBc0i@ashevche-desk.local>
 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
 <akTRyQqXuSU6pl71@ashevche-desk.local>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39288-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORGED_SENDER(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:devnull@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03AA66EB6AE

Hi,

> 2026=E5=B9=B47=E6=9C=881=E6=97=A5 16:37=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Jul 01, 2026 at 04:07:43PM +0800, Miao Wang wrote:
>>> 2026=E5=B9=B47=E6=9C=881=E6=97=A5 15:36=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>>> On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
>>>>> 2026=E5=B9=B46=E6=9C=8830=E6=97=A5 20:07=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>> On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski =
wrote:
>>>>>> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
>>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>=20
> ...
>=20
>>>>>>> This patch adds back the support for gsi_idx_map, which is used =
in the
>>>>>>> ACPI DSDT table to describe the mapping between the GPIO line =
number to
>>>>>>> the index of the interrupt number in the declared interrupt =
resources.
>>>>>>>=20
>>>>>>> This property was removed in Loongson CPU Universal =
Specification for
>>>>>>> Interface Between PC/Server System Firmware and Kernel v4.1 in =
November,
>>>>>>> 2023, but still in use in firmwares released this year. A sample =
of
>>>>>>> an affected DSDT entry from a 3C6000 board I'm currently using =
is:
>>>>>=20
>>>>> Oh my gosh, can somebody actually try to consult first with the =
Linux kernel
>>>>> developers before adding non-standard and wrongly named =
properties, please?
>>>>=20
>>>> Inferred from the time when gsi_idx_map was removed from the spec, =
I believe
>>>> that the removal might be because the maintainers suggestion =
against introducing
>>>> gsi_idx_map. However, the firmwares "in the wild" have not followed =
the change.
>>>=20
>>> But what is the outcome of not using that mapping. Do you have =
something wrong
>>> or not working?
>>=20
>> Yes. As shown in the DSDT entry, when the mapping is given by the =
firmware, the
>> number of given interrupts in _CRS does not equal to ngpios. In my =
example,
>> ngpios is 32, but the number of interrupts given in _CRS is 8, and =
the request
>> for irq on gpio lines whose number larger than 8 will fail with =
-ENXIO. To
>> clarify, the entry is taken from the firmware I am currently using, =
and the
>> firmware is released on February this year.
>=20
> Right, so with the given example everything can be done without using =
the (now)
> unspecified property. Do you have more examples of DSDT of these =
platforms?

Sorry, I only possess limited number of loongarch devices.

>>>>>>> Device (GPO1) {
>>>>>>> Name (_HID, "LOON000F")
>>>>>>> Name (_CRS, ResourceTemplate () {
>>>>>>>  QWordMemory ( // Omitted, not related
>>>>>>>  )
>>>>>>>  Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) =
{
>>>>>>>    0x00000010, 0x00000011, 0x00000012, 0x00000013,
>>>>>>>    0x00000014, 0x00000015, 0x00000016, 0x00000017,
>>>>>>>  }
>>>>>>> Name (_DSD, Package (0x02) {
>>>>>>>  ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
>>>>>>>  Package (0x03) {
>>>>>>>    Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
>>>>>=20
>>>>> Yes, it's non-standard property. It's a broken one in terms of the =
style.
>>>>> See DT binding documentation.
>>>>=20
>>>> To clarify, I agree that this property should be redundant and =
ignored by
>>>> the driver and global gpio numbers should be assigned dynamically =
by the
>>>> kernel.
>>>>=20
>>>>>>>    Package (0x02) { "ngpios", 0x20 }
>>>>>>>    Package (0x02) { "gsi_idx_map", Package (0x20) {
>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>    }}
>>>>>>>  }
>>>>>>> }
>>>>>>> }
>>>>>>>=20
>>>>>>> As can be seen in the DSDT entry, the mapping is essential for =
obtaining
>>>>>>> the IRQ number from a GPIO line number. Otherwise, when IRQ is =
requested
>>>>>>> for the line numbers largers than 7, it will fail with -ENXIO.
>>>>>=20
>>>>> This doesn't look good. Why can't we simply hardcode the proper =
behaviour based
>>>>> on the _HID? The gsi_idx_map seems quite regular and periodic, do =
you have some
>>>>> other examples with different mapping?
>>>>=20
>>>> According to the manual, the gpio controllers in HID LOON0007 and =
LOON000F are
>>>> actually embedded into the CPU chip and the interrupt lines are =
hard wired so
>>>> that all the gpio lines of the gpio controller share in total 8 =
irqs such that
>>>> the i-th line is wired to the (i%8)-th irq. So the mapping for =
these two models
>>>> are fixed. I have no idea about the behavior of other kinds of =
controllers, which
>>>> should be answered by Loongson personales.
>>>=20
>>> OK.
>>>=20
>>>> So far, there are known to be 2 styles of DSDT entries. One is =
defined by
>>>> the latest Firmware Spec, to list all the irq numbers in _CRS, e.g. =
Name (_CRS,
>>>> ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10, =
0x11, ..., 0x17,
>>>> ... (in total ngpios entries) } }). The other is defined by the =
previous Firmware
>>>> spec, to use the property `gsi_idx_map` to map the gpio line number =
to the irq
>>>> number listed in the ResourceTemplate. The former should now be =
compatible with
>>>> the current implementation of the driver in the kernel, while the =
later not. I
>>>> believe that although being abandoned by the spec, the later should =
also be
>>>> considered and supported by the driver, since it is used by the =
firmwares in the
>>>> wild.
>>>=20
>>> This is clear. What's unclear is the necessity of adding this =
mapping. Is that
>>> mapping shuffled in an arbitrary way?
>>=20
>> According to the partial information I currently have, I don't think =
the mapping
>> would shuffle arbitrarily.
>>=20
>>> Second question, why one can't update firmware to fix this to follow =
the
>>> specification? =46rom above DSDT I do *not* see the need in this =
mapping.
>>> Everything can be simply deducted from the number of Interrupt() =
resources
>>> and ngpios at run-time without touching the property.
>>=20
>> I have no idea why on the firmware side the spec was not followed for =
three
>> years. When ignoring this mapping, there would be a problem if the =
number
>> of given Interrupt() resources is less than ngpios. When this mapping =
is
>> referred, there will be a ground truth for which irq number a gpio =
line
>> belongs to. To be specific, suppose the number of Interrupt() =
resources
>> is m and ngpios is n. In the current spec, where m equals to n, such =
ground
>> truth also exists. However, when m is less than n and this mapping is
>> ignored, the mapping will become ambiguous. Should the irq number be =
i%m
>> for gpio line i, or i%8 and reject the irq requests when m is less =
than 8?
>=20
> My suggestion is to restore the logic in the code for the above-like =
mappings.
>=20
> You count Interrupt() resources, you have 'ngpios' property. Now, when =
you
> do need to map an IRQ line, you simply do it in a way of
>=20
> IRQ line % amount of Interrupt() resources
>=20
> It will give you the same without reading that property. I believe =
that's why
> the specification removed the need, because in this case it's not =
needed and
> may be easily derived from the existing information.

Yes, but actually from the hardware specs, the mapping between gpio =
lines and
the irq lines is actually taking modulo of 8. If the given number of =
Interrupt()
is 8, this will be right. What if the given number of Interrupt() is not =
8, say
9 or anything else? I think to be fail-safe, when the amount of =
Interrupt()
resources is less than ngpios, we should only allow 8 Interrupt()'s =
given.

> Can somebody from Loongson shed a light on what's going on here?
>=20


