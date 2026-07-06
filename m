Return-Path: <linux-gpio+bounces-39515-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DHvmDPSUS2rCVwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39515-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:43:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC5710024
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 13:43:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jUFdggw7;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39515-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39515-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 124983015C35
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 11:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E12E420E72;
	Mon,  6 Jul 2026 11:43:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EBC3DD85B
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 11:43:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338214; cv=none; b=rxeQYnTfpJNUdmlna3IzEOn2aFTa1BPqMULTAaXKI4BC9svzpNA+ul4ohDmS85yNtdf3yY0v/2Od8BUZ9lYsjsK23L1AV0Vke+5inQ2QbKNafGbmuwX5ODEHGMpNHSIEmad/NHAjNi1MQU3n2n9rSPgiJAae1E2+zdrneS2E0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338214; c=relaxed/simple;
	bh=7BNAGUj/RstihQuUDspJydP0v0WezniD3L10w5SZrzk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=igujGYYznGyOVZC+hIsOpwnxRGEM+4hCaOWYMDYALw1u+3+2JEb7Y5ESl1426A5vSjPEdx8VpQTpmiOSNLzx+oaNHegh9TIpZG9Ho/mjg8POnPzF8MaT0TXYPm34Juj0Nj1WCAteA43DacwCR2fbRF5ndnhPgYEsSqaoDGU5XzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUFdggw7; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caf18d4904so1295845ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783338212; x=1783943012; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWcy3UTsCFyep0wcjgkLGewejnMAVbkkicTqFeKByXY=;
        b=jUFdggw7QQDHedtJufiTnwudy1r38ZOG0bexWu4p5TDSlvD5uK0fVJtiqIX6m4Xce4
         oO2HsWkaioSrn4KnWHKNqD1FSiDNath8JzbpfEeVNoiPl7JwbTmLzeh1BwmFANqmKGx+
         ht+LbpmiF2rHHqHiy0P+gbxsim+lpKCrKRg3W9OXxeabOkCeAkZiiGay2rMiRnK3ZOlJ
         gq5l4cylCirSa1Vg/bGeB9roVgREsglAmxdmUIMOAp5G/JwCaszIHB9Tprup/kQlCwNw
         fk5lbvWkndtZpnrqAFGu0xMGXtgn4F65fYY761wexjhoAtnn4agOH096QF4zHe0a/f+L
         sgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338212; x=1783943012;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWcy3UTsCFyep0wcjgkLGewejnMAVbkkicTqFeKByXY=;
        b=IcuMQMZdCVTGf82pAZeOOF9+kypgBJ7aNwgOaB7qo4dLiNAhZh+JPV+hSZxy0hhp62
         8j4g28Bdoau3GE1hoM++5fYZ+5ZhWcKKZnsZt6p4igB2waOnsIs2F9OPD5Iz6P+6CrfW
         neHDf4G+WGrmTReTK5/T4in462t5E0rcVTbvh0fi06ARAONyscsJp4lFWJFm00plBJcy
         aRrclbr/rc+QKLUWPmTDG0Ia5o9nmAU+GvIrtG4B4OkcrgSboZIOSjbsZsYcaUzS2JQL
         x6vhEfYOdn94ei2ONCvhSpKw8aHeOSSeegXXH3RgdnRwJs+7T1J5R0AGnmPEuMbE/wMP
         TwhA==
X-Forwarded-Encrypted: i=1; AHgh+RoLahGo9aBjVzLLjn1uAA4Inal/1qIL+ZC7sdudFvIaKLItwBlNcOPnK4JHdtjoHuaGlw9YP4Mq//DR@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJyt77P9oQEFbP8fWj7fIZxJV3F+yRZV1rsauVTcT8QWDLoqF
	LsDWsi52SLIeqk2pDbnnyodNZb3MWW7xn2xJhKCVxOHelsES/UDY81OE6Y4hjw==
X-Gm-Gg: AfdE7cncRn+zic4NOAUtTU54kysrWrynVxSn0EPQTugD7IjnaUVlgDzmjvI+EjoYGBt
	zvYoyyIPE4GMJerdY9VXbDO9mh1/O/bLvVI2rDdoAu2Q2yoJKoNXXTDmx41CGOk5QHQZ6PmAMQp
	KHXlZDgdeHbavu2sXZOevbZZhp1wbPNc0+6zELEOYC9NvKqsFmwrdqoh09VfQkAfOOcBhZvaT3Q
	NZJUdj1APa9XigqizwQvf5v4vk+Udvtm/dIYKY6hYYHiAd0gGiTcMCT2W7yJkbkUdDaBcD+hVTZ
	qOazPSTPArxUomveezU1rUJsHL3pmdkB86puyHT9rtCs3SXmvZ5DooYG+8n9Sy8DZyM8Lr2Y2j/
	wjWWAItzvH2Z3W5fzoNTAtAu4GPJRTu/uXMX0Rhsrje6ta28PiFerDV/rJIvvqQsI85GIWm4xq0
	voSA/dIJdxGKPiXWeZqRtTkmKuAYWnr359L2k=
X-Received: by 2002:a05:6a00:1706:b0:845:cf73:5bd8 with SMTP id d2e1a72fcca58-847f6d3940emr5482877b3a.1.1783338211839;
        Mon, 06 Jul 2026 04:43:31 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d85bd9sm3449562b3a.51.2026.07.06.04.43.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:43:31 -0700 (PDT)
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
In-Reply-To: <aks67K3v2VNIkyRF@ashevche-desk.local>
Date: Mon, 6 Jul 2026 19:43:14 +0800
Cc: Xi Ruoyao <xry111@xry111.site>,
 Bartosz Golaszewski <brgl@kernel.org>,
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
 Mika Westerberg <westeri@kernel.org>,
 Mingcong Bai <jeffbai@aosc.io>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6BABD9E-104C-405C-9D9C-8B063791B20F@gmail.com>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
 <akTDj-YJjuDOBc0i@ashevche-desk.local>
 <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
 <akTRyQqXuSU6pl71@ashevche-desk.local>
 <AA7111AC-196F-41F7-A47B-E5118F7D26F2@gmail.com>
 <akThvlKr5MdbNloj@ashevche-desk.local>
 <73df1090f513777f3c0c4bfd1b9fc01f430ce9c3.camel@xry111.site>
 <aks67K3v2VNIkyRF@ashevche-desk.local>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39515-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xry111@xry111.site,m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:jeffbai@aosc.io,m:andriy.shevchenko@linux.intel.com,m:devnull@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7CC5710024

Hi,

> 2026=E5=B9=B47=E6=9C=886=E6=97=A5 13:19=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, Jul 06, 2026 at 01:55:57AM +0800, Xi Ruoyao wrote:
>> On Wed, 2026-07-01 at 12:45 +0300, Andy Shevchenko wrote:
>>> On Wed, Jul 01, 2026 at 04:56:11PM +0800, Miao Wang wrote:
>>>>> 2026=E5=B9=B47=E6=9C=881=E6=97=A5 16:37=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>> On Wed, Jul 01, 2026 at 04:07:43PM +0800, Miao Wang wrote:
>>>>>>> 2026=E5=B9=B47=E6=9C=881=E6=97=A5 15:36=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>>> On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
>>>>>>>>> 2026=E5=B9=B46=E6=9C=8830=E6=97=A5 20:07=EF=BC=8CAndy =
Shevchenko <andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A=

>>>>>>>>> On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski =
wrote:
>>>>>>>>>> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
>>>>>>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>=20
> ...
>=20
>>>>>>>>>>> This patch adds back the support for gsi_idx_map, which is =
used in the
>>>>>>>>>>> ACPI DSDT table to describe the mapping between the GPIO =
line number to
>>>>>>>>>>> the index of the interrupt number in the declared interrupt =
resources.
>>>>>>>>>>>=20
>>>>>>>>>>> This property was removed in Loongson CPU Universal =
Specification for
>>>>>>>>>>> Interface Between PC/Server System Firmware and Kernel v4.1 =
in November,
>>>>>>>>>>> 2023, but still in use in firmwares released this year. A =
sample of
>>>>>>>>>>> an affected DSDT entry from a 3C6000 board I'm currently =
using is:
>>>>>>>>>=20
>>>>>>>>> Oh my gosh, can somebody actually try to consult first with =
the Linux kernel
>>>>>>>>> developers before adding non-standard and wrongly named =
properties, please?
>>>>>>>>=20
>>>>>>>> Inferred from the time when gsi_idx_map was removed from the =
spec, I believe
>>>>>>>> that the removal might be because the maintainers suggestion =
against introducing
>>>>>>>> gsi_idx_map. However, the firmwares "in the wild" have not =
followed the change.
>>>>>>>=20
>>>>>>> But what is the outcome of not using that mapping. Do you have =
something wrong
>>>>>>> or not working?
>>>>>>=20
>>>>>> Yes. As shown in the DSDT entry, when the mapping is given by the =
firmware, the
>>>>>> number of given interrupts in _CRS does not equal to ngpios. In =
my example,
>>>>>> ngpios is 32, but the number of interrupts given in _CRS is 8, =
and the request
>>>>>> for irq on gpio lines whose number larger than 8 will fail with =
-ENXIO. To
>>>>>> clarify, the entry is taken from the firmware I am currently =
using, and the
>>>>>> firmware is released on February this year.
>>>>>=20
>>>>> Right, so with the given example everything can be done without =
using the (now)
>>>>> unspecified property. Do you have more examples of DSDT of these =
platforms?
>>>>=20
>>>> Sorry, I only possess limited number of loongarch devices.
>=20
>>> Yeah, we definitely need some input from Loongson people.
>=20
> ^^^^
>=20
>>>>>>>>>>> Device (GPO1) {
>>>>>>>>>>> Name (_HID, "LOON000F")
>>>>>>>>>>> Name (_CRS, ResourceTemplate () {
>>>>>>>>>>>  QWordMemory ( // Omitted, not related
>>>>>>>>>>>  )
>>>>>>>>>>>  Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, =
,, ) {
>>>>>>>>>>>    0x00000010, 0x00000011, 0x00000012, 0x00000013,
>>>>>>>>>>>    0x00000014, 0x00000015, 0x00000016, 0x00000017,
>>>>>>>>>>>  }
>>>>>>>>>>> Name (_DSD, Package (0x02) {
>>>>>>>>>>>  ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
>>>>>>>>>>>  Package (0x03) {
>>>>>>>>>>>    Package (0x02) { "gpio_base", 0x50 } // Ignored by the =
driver
>>>>>>>>>=20
>>>>>>>>> Yes, it's non-standard property. It's a broken one in terms of =
the style.
>>>>>>>>> See DT binding documentation.
>>>>>>>>=20
>>>>>>>> To clarify, I agree that this property should be redundant and =
ignored by
>>>>>>>> the driver and global gpio numbers should be assigned =
dynamically by the
>>>>>>>> kernel.
>>>>>>>>=20
>>>>>>>>>>>    Package (0x02) { "ngpios", 0x20 }
>>>>>>>>>>>    Package (0x02) { "gsi_idx_map", Package (0x20) {
>>>>>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>>>>>      0, 1, 2, 3, 4, 5, 6, 7,
>>>>>>>>>>>    }}
>>>>>>>>>>>  }
>>>>>>>>>>> }
>>>>>>>>>>> }
>>>>>>>>>>>=20
>>>>>>>>>>> As can be seen in the DSDT entry, the mapping is essential =
for obtaining
>>>>>>>>>>> the IRQ number from a GPIO line number. Otherwise, when IRQ =
is requested
>>>>>>>>>>> for the line numbers largers than 7, it will fail with =
-ENXIO.
>>>>>>>>>=20
>>>>>>>>> This doesn't look good. Why can't we simply hardcode the =
proper behaviour based
>>>>>>>>> on the _HID? The gsi_idx_map seems quite regular and periodic, =
do you have some
>>>>>>>>> other examples with different mapping?
>>>>>>>>=20
>>>>>>>> According to the manual, the gpio controllers in HID LOON0007 =
and LOON000F are
>>>>>>>> actually embedded into the CPU chip and the interrupt lines are =
hard wired so
>>>>>>>> that all the gpio lines of the gpio controller share in total 8 =
irqs such that
>>>>>>>> the i-th line is wired to the (i%8)-th irq. So the mapping for =
these two models
>>>>>>>> are fixed. I have no idea about the behavior of other kinds of =
controllers, which
>>>>>>>> should be answered by Loongson personales.
>>>>>>>=20
>>>>>>> OK.
>>>>>>>=20
>>>>>>>> So far, there are known to be 2 styles of DSDT entries. One is =
defined by
>>>>>>>> the latest Firmware Spec, to list all the irq numbers in _CRS, =
e.g. Name (_CRS,
>>>>>>>> ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, =
0x10, 0x11, ..., 0x17,
>>>>>>>> ... (in total ngpios entries) } }). The other is defined by the =
previous Firmware
>>>>>>>> spec, to use the property `gsi_idx_map` to map the gpio line =
number to the irq
>>>>>>>> number listed in the ResourceTemplate. The former should now be =
compatible with
>>>>>>>> the current implementation of the driver in the kernel, while =
the later not. I
>>>>>>>> believe that although being abandoned by the spec, the later =
should also be
>>>>>>>> considered and supported by the driver, since it is used by the =
firmwares in the
>>>>>>>> wild.
>>>>>>>=20
>>>>>>> This is clear. What's unclear is the necessity of adding this =
mapping. Is that
>>>>>>> mapping shuffled in an arbitrary way?
>>>>>>=20
>>>>>> According to the partial information I currently have, I don't =
think the mapping
>>>>>> would shuffle arbitrarily.
>>>>>>=20
>>>>>>> Second question, why one can't update firmware to fix this to =
follow the
>>>>>>> specification? =46rom above DSDT I do *not* see the need in this =
mapping.
>>>>>>> Everything can be simply deducted from the number of Interrupt() =
resources
>>>>>>> and ngpios at run-time without touching the property.
>>>>>>=20
>>>>>> I have no idea why on the firmware side the spec was not followed =
for three
>>>>>> years. When ignoring this mapping, there would be a problem if =
the number
>>>>>> of given Interrupt() resources is less than ngpios. When this =
mapping is
>>>>>> referred, there will be a ground truth for which irq number a =
gpio line
>>>>>> belongs to. To be specific, suppose the number of Interrupt() =
resources
>>>>>> is m and ngpios is n. In the current spec, where m equals to n, =
such ground
>>>>>> truth also exists. However, when m is less than n and this =
mapping is
>>>>>> ignored, the mapping will become ambiguous. Should the irq number =
be i%m
>>>>>> for gpio line i, or i%8 and reject the irq requests when m is =
less than 8?
>>=20
>> It's not true for the HID LOON000D (7A2000 GPIO controller) which is
>> also handled by this driver.  In that controller, each of GPIO 0-3 =
has
>> one dedicated IRQ line but the others GPIOs (4-55) share one IRQ =
line.=20
>> See https://github.com/AOSC-Tracking/linux/commit/31bd7e208e5b for =
how I
>> worked it around downstream.  IIUC reading gsi_idx_map should resolve
>> the issue for LOON000D as well.
>>=20
>> We can also hard code i % 8 or MIN(i, 4) but then we'd need to check =
the
>> HID.  I can live with either way.
>>=20
>> But in either way I'd want to keep the big sticking-out warning, like
>> "gsi_idx_map property is deprecated, consider upgrading your =
firmware"
>> in this patch.  If we use the hard coded logic it can be "having
>> Interrupt() resources less than ngpios is deprecated, consider =
upgrading
>> your firmware."
>=20
> But I am not sure it would work for the case you just described. I =
don't
> remember if duplicates are allowed in the _CRS for the same device, id =
est
> Interrupt(foo) repeated as many times as you need.
>=20
>> Some vendors of Loongson-based board firmwares have a bad tendency to
>> only issue a firmware update if the OEM pays them for some money like
>> $100,000 and the OEMs are often reluctant to pay.  Loongson itself =
does
>> things better: their own board products receive periodical firmware
>> update for free.  But Loongson itself does not produce laptops so the
>> laptops based on Loongson CPU often ships a firmware from such a =
rogue
>> vendor, and if the laptop uses a I2C-HID touchpad it will not work
>> without the LOON000D hack as HID-over-I2C have to use a GPIO as
>> interrupt source.  Then the users cannot use the upstream kernel.
>>=20
>> Yes we should try to punish the rouge vendors (maybe even changing =
the
>> warning to "please avoid any product from this firmware vendor in the
>> future":
>=20
> We (Linux kernel) are grown from that type of nagging. The polite way =
is to
> dev_warn(dev, FW_BUG) or similar. But this should be confirmed by =
Loongson.
>=20
>> I do recommend the users to avoid one particular firmware
>> vendor whenever I have to explain this issue to a frustrated user who
>> just found the touchpad is not working).  But IMO we shouldn't banish
>> the users to some "commercial" distros with downstream patches: we'd =
be
>> actually "awarding" those rogue firmware vendors by pushing the users =
to
>> a commercial solution, as the commerical distro vendors are likely
>> affiliated with the rogue firmware vendors on the stock market.
>=20
> Right.
>=20
> So, let me state again, we need an input from Loongson on =
clarification on what
> to do with the property. Because what I read from your reply is that =
property
> must stay and specification update was a wrong move.
>=20

If Interrupt() repeated in _CRS is allowed, then I don't think it is a =
wrong
move, but we are considering about existing hardware and firmware which =
are
not following this change. If repeated Interrupt() is not allowed, then =
this
would be another story.

Cheers,

Miao Wang




