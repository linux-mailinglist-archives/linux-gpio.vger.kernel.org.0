Return-Path: <linux-gpio+bounces-39280-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/ERO9bLRGo71AoAu9opvQ
	(envelope-from <linux-gpio+bounces-39280-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:12:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 469296EAFA8
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 10:12:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SpVAQy9u;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39280-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39280-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A223301456C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 08:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECA93C871D;
	Wed,  1 Jul 2026 08:08:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040043BBFCF
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 08:08:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893284; cv=none; b=Ghv2cwMl7sHqDOfUA7J6pHrx13UHaC2OQMmX3hLR9vvEyulrgcK+8kvmG1l7cb0S7VdlZtHAHdcBm0TPiKgR2u0UIbLnmi53nKWeNYfA9rc5t/Hb1b0P+4r3slkd0xiSg/eoeSY8X1vVbnrWxjHO3Bb75QYqodhR+njJE8dVyCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893284; c=relaxed/simple;
	bh=/oeqjUBgDfiBHaTU+sOLCJzpuMyj3U7ERfvvKxwtG7E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o+bKWYneqZ/NYNHfV+l12R5eDleVBLxrS3lO1vA/PdbMnNn1V39ziochRnfoVBs4/h5/AD51GYTtmtxXNG/+nONWnVW7uqmmCIBCpnjwiA/YhL7a+DiF0L4ilFgYOgWns7mOHvlU0PlgO/1OpkZxxMbTMjy412gLZPWUmDTUkAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpVAQy9u; arc=none smtp.client-ip=209.85.215.174
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c887ad05211so38523a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782893281; x=1783498081; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BmcmCchL3adiRlfrPGMzFaQ7sZ5cR4HpV1lcz/fkbus=;
        b=SpVAQy9uURpZeRa4C1DCMubO8wd8VdkH6pb3GjQNeh0U2hLklplrsF9/fKTqjdUfS/
         yGjuz0ZdU086kxxsq257HmMd4lK+GZUuPIKaOm9Vm/ToKaayRq1VLVmRi2gyUuYI+W3O
         47IlkFjF9+ayB2Inmq13u/LioILoOCw5bmoAk54JnMRt5oxxINeJYGy6r1AvSFSNlT/P
         HPkdJeACowwC9uOtfpR5/rqQEZvn1QN27eOgnvFsZqcq1TTDjr6eWWDObMiXl7jPA7py
         HKYx+7o3St0v6H1hY5NNPtPv7gAX5HpM+D7H5gXAloEdpa3n8W1XzhZ8tWc8HzowD998
         iKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893281; x=1783498081;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmcmCchL3adiRlfrPGMzFaQ7sZ5cR4HpV1lcz/fkbus=;
        b=JX09sxPaSP/QApEcyamVezYgMaj/G0lwb2cngTNOdyujc6tnu1r07ZOELTR0QqcJc4
         nFljL7nUR8znOH+PorQn16VWOpiI3OWqL/JgQMwDNTwBlGXRJrqf3iqZ9WMhT/Cf+3Oe
         eE2ypXNqo7wyGgMRMyJNdyA97b6s3t7TMAQ5rcu/PxoT8uzx+foDxl+RJx5crMsyMQTL
         HRyEe2R6hgMu01p7aVXNg5J9KmYvnh0WoNxdYhIFOGWu/P4ynv3ajGsqCAHH54n2lbmS
         6lRVy/GvHOpDyeYuX5yGV2QanN6WRXrANSHnuU2PvsBMprx6URmEYBfDArqCdtyVxRMR
         4UUA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu97pO+okas67fkExvfQGK869i9+SxE8Vl3m2pgEbDxSTK0ivSZH8pb6A+iBxnU2m0/I+Ygwl9iypD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21ANDdO9yR97YHd4z7ZQeI13zSMsgaHIcn73QBFlrymlwSAKH
	bPQwuxz1hC6CBfr5mtIkOAiC6dbkXQRW6wEGHaZD4iXaIWNgAYF9fmmR
X-Gm-Gg: AfdE7cntw2quMiAetRApVVO4a4kkSeWRzyjrPsnOgiy04moc/P03mtEVB4I5Stj/JQX
	Gzt7FgrxNkQink/xAqVLSqnV7VLuaMDSJ75uJpwX/nuZpZmBmFvyCFz9y+A4d5arwjIJGqUg3KW
	TA5jpVjCeMpnYwF9UKH0ilRXXHwg/wsy6YRYLhvI35hZ8OL5PFiV7kCd1nUDwaEqvbgIHALL44u
	NtohAw/QqO0zUHBHiXKGMOwbnoH3RD0aW+mJx0TKEjGT157ICV9EeoKg5hdxRn8tfvMuJVgypxz
	Lcwkd1xK/1LgWA+Jw9HUSRLVKV4KtqJE8sSGkR/MEq0ry9hRRh8ALHhhNsOtDx5Tvt/ltWUGuVA
	ElIX+6mfuedKdxiQ6iqlst5BxK+Urgrcuy+TKnkdM/7Y1XURvZL1tV7QrrucyFN8steaKEq06ZA
	PhaOX2SQqkIVx5tlWwYDPajlM=
X-Received: by 2002:a17:903:2f86:b0:2ca:de3:15eb with SMTP id d9443c01a7336-2ca7e556940mr5016085ad.0.1782893280869;
        Wed, 01 Jul 2026 01:08:00 -0700 (PDT)
Received: from smtpclient.apple ([2406:4440:0:105::41:a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm27262315ad.55.2026.07.01.01.07.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Jul 2026 01:08:00 -0700 (PDT)
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
In-Reply-To: <akTDj-YJjuDOBc0i@ashevche-desk.local>
Date: Wed, 1 Jul 2026 16:07:43 +0800
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
Message-Id: <A12FA264-0A0B-4CB3-BBCC-51380591F0E1@gmail.com>
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
 <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
 <akOxdBR_-rOweHXB@ashevche-desk.local>
 <B77A4E49-774C-4DB2-9CA6-FFBE14F1EF94@gmail.com>
 <akTDj-YJjuDOBc0i@ashevche-desk.local>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39280-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:devnull@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 469296EAFA8

Hi,

> 2026=E5=B9=B47=E6=9C=881=E6=97=A5 15:36=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Jun 30, 2026 at 08:42:43PM +0800, Miao Wang wrote:
>>> 2026=E5=B9=B46=E6=9C=8830=E6=97=A5 20:07=EF=BC=8CAndy Shevchenko =
<andriy.shevchenko@linux.intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>>> On Tue, Jun 30, 2026 at 07:45:52AM +0000, Bartosz Golaszewski wrote:
>>>> On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>>=20
>>>>> This patch adds back the support for gsi_idx_map, which is used in =
the
>>>>> ACPI DSDT table to describe the mapping between the GPIO line =
number to
>>>>> the index of the interrupt number in the declared interrupt =
resources.
>>>>>=20
>>>>> This property was removed in Loongson CPU Universal Specification =
for
>>>>> Interface Between PC/Server System Firmware and Kernel v4.1 in =
November,
>>>>> 2023, but still in use in firmwares released this year. A sample =
of
>>>>> an affected DSDT entry from a 3C6000 board I'm currently using is:
>>>=20
>>> Oh my gosh, can somebody actually try to consult first with the =
Linux kernel
>>> developers before adding non-standard and wrongly named properties, =
please?
>>=20
>> Inferred from the time when gsi_idx_map was removed from the spec, I =
believe
>> that the removal might be because the maintainers suggestion against =
introducing
>> gsi_idx_map. However, the firmwares "in the wild" have not followed =
the change.
>=20
> But what is the outcome of not using that mapping. Do you have =
something wrong
> or not working?

Yes. As shown in the DSDT entry, when the mapping is given by the =
firmware, the
number of given interrupts in _CRS does not equal to ngpios. In my =
example,
ngpios is 32, but the number of interrupts given in _CRS is 8, and the =
request
for irq on gpio lines whose number larger than 8 will fail with -ENXIO. =
To
clarify, the entry is taken from the firmware I am currently using, and =
the
firmware is released on February this year.

>>>>> Device (GPO1) {
>>>>> Name (_HID, "LOON000F")
>>>>> Name (_CRS, ResourceTemplate () {
>>>>>   QWordMemory ( // Omitted, not related
>>>>>   )
>>>>>   Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) =
{
>>>>>     0x00000010, 0x00000011, 0x00000012, 0x00000013,
>>>>>     0x00000014, 0x00000015, 0x00000016, 0x00000017,
>>>>>   }
>>>>> Name (_DSD, Package (0x02) {
>>>>>   ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
>>>>>   Package (0x03) {
>>>>>     Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
>>>=20
>>> Yes, it's non-standard property. It's a broken one in terms of the =
style.
>>> See DT binding documentation.
>>=20
>> To clarify, I agree that this property should be redundant and =
ignored by
>> the driver and global gpio numbers should be assigned dynamically by =
the
>> kernel.
>>=20
>>>>>     Package (0x02) { "ngpios", 0x20 }
>>>>>     Package (0x02) { "gsi_idx_map", Package (0x20) {
>>>>>       0, 1, 2, 3, 4, 5, 6, 7,
>>>>>       0, 1, 2, 3, 4, 5, 6, 7,
>>>>>       0, 1, 2, 3, 4, 5, 6, 7,
>>>>>       0, 1, 2, 3, 4, 5, 6, 7,
>>>>>     }}
>>>>>   }
>>>>> }
>>>>> }
>>>>>=20
>>>>> As can be seen in the DSDT entry, the mapping is essential for =
obtaining
>>>>> the IRQ number from a GPIO line number. Otherwise, when IRQ is =
requested
>>>>> for the line numbers largers than 7, it will fail with -ENXIO.
>>>=20
>>> This doesn't look good. Why can't we simply hardcode the proper =
behaviour based
>>> on the _HID? The gsi_idx_map seems quite regular and periodic, do =
you have some
>>> other examples with different mapping?
>>=20
>> According to the manual, the gpio controllers in HID LOON0007 and =
LOON000F are
>> actually embedded into the CPU chip and the interrupt lines are hard =
wired so
>> that all the gpio lines of the gpio controller share in total 8 irqs =
such that
>> the i-th line is wired to the (i%8)-th irq. So the mapping for these =
two models
>> are fixed. I have no idea about the behavior of other kinds of =
controllers, which
>> should be answered by Loongson personales.
>=20
> OK.
>=20
>> So far, there are known to be 2 styles of DSDT entries. One is =
defined by
>> the latest Firmware Spec, to list all the irq numbers in _CRS, e.g. =
Name (_CRS,
>> ResourceTemplate () { Interrupt () { 0x10, 0x11, .., 0x17, 0x10, =
0x11, ..., 0x17,
>> ... (in total ngpios entries) } }). The other is defined by the =
previous Firmware
>> spec, to use the property `gsi_idx_map` to map the gpio line number =
to the irq
>> number listed in the ResourceTemplate. The former should now be =
compatible with
>> the current implementation of the driver in the kernel, while the =
later not. I
>> believe that although being abandoned by the spec, the later should =
also be
>> considered and supported by the driver, since it is used by the =
firmwares in the
>> wild.
>=20
> This is clear. What's unclear is the necessity of adding this mapping. =
Is that
> mapping shuffled in an arbitrary way?

According to the partial information I currently have, I don't think the =
mapping
would shuffle arbitrarily.

> Second question, why one can't update firmware to fix this to follow =
the
> specification? =46rom above DSDT I do *not* see the need in this =
mapping.
> Everything can be simply deducted from the number of Interrupt() =
resources
> and ngpios at run-time without touching the property.

I have no idea why on the firmware side the spec was not followed for =
three
years. When ignoring this mapping, there would be a problem if the =
number
of given Interrupt() resources is less than ngpios. When this mapping is
referred, there will be a ground truth for which irq number a gpio line
belongs to. To be specific, suppose the number of Interrupt() resources
is m and ngpios is n. In the current spec, where m equals to n, such =
ground
truth also exists. However, when m is less than n and this mapping is
ignored, the mapping will become ambiguous. Should the irq number be i%m
for gpio line i, or i%8 and reject the irq requests when m is less than =
8?

Cheers,

Miao Wang



