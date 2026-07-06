Return-Path: <linux-gpio+bounces-39528-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3yTpC63HS2qGaAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39528-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 17:20:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133A7127DB
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 17:20:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C61YYZZb;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39528-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39528-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2404431183A7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 14:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5AF36C9C2;
	Mon,  6 Jul 2026 14:46:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6303624A9
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 14:46:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349167; cv=none; b=VphNGVD6PdnwCEXWuRPI6VsVDVK4c2h/2Sdi2r45xbYfnmxF2Kuayqo4DsM94TXA2yv+XHv9DrTueUBQWKqUUabh/EvN5v8E9tfnunKaWlUyNmx/Pq2n32jCSI/Aa5I3wSfuAOmMZqRFBjVEVqyn30uKJoL8tUl56pxqdYu1/28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349167; c=relaxed/simple;
	bh=03JEDD1EY5FShOhPitKzB6awmNO37P408+N+vwTG3uU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PJfQv9oLX3fssH3nxV9MAG62zaY+2/GBYsk5Hb0/GhK9ARGFuNxha6/QQBqPDKC8a4r6wDwaIwQ+eRA1Rc2VNAcU5JUujHIfiKgOEu5eEb4ibD851Hj9pIUWjCrhe72lLMfDbNR7fDOHGKhJCr581c7HtUjWdNxjlVc5MY+kkYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C61YYZZb; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc827a68fbso3927775ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349165; x=1783953965; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TKmz61w8Qy4Dv2MzHhCOD3wXFt+43UEUSfOq+MGpvrc=;
        b=C61YYZZbNAEPQ66UuyCUVyu5lu4flx9SnBqcKZCgkLAF6DJ70e1LN7QfDCdhaSqo6k
         /s5sps0FNSO/TGSa7bMwVkAeBNJBDMZS6LHZyRfuzJBGOJv0oLmu8sqTZpCl1BRUF3Vi
         Pvde5c/KAoM2E08vuZeCq7FQWTUNyfzBvcNOkYEM6VJZrWJiJ/HUXQ4hqadx9EQbjSSn
         1l/em9njzuVuxID51VmGAci5uYThtuvxXJ1NLNWMEBu3caSn9iPm8sVaD+cwyVQLRlU+
         kX4v+/L0EpqoBDIADt97/TQsEi/n74QS3E11m51XfPqcnXsQsretAjifmRQKru1PNQOl
         hTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349165; x=1783953965;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKmz61w8Qy4Dv2MzHhCOD3wXFt+43UEUSfOq+MGpvrc=;
        b=Fu7XlLdAc2QQlh+NXO/T6WUk8tcslhPcHKpnkUKtfGj68egqJNCxCrp6ebvZKmVmHo
         3X17iZIeGdwIq15lfsyFLlyS5WntYdMYU50w1rXz9xPFQGfIKK9ywimiR3tozQ9v15Nl
         DeYA3pDkcMo25Qh6vHfmctNL3Y7ObpbB6gdmAbxz7OaJUruxycj+n7kEZ8JbEL/9PHqq
         gWyP8qEAMC5HMd2Qulfuw4MAsTgf9EKg4RzPOiKkiClkVAczPtCFBxbcdEnGK/SYHBOj
         n1kQvqRW+i4l/8qcbcltqiG+HBPQFgl54B+kThAIqQ+TC8GkPcSRMKuekiGOmuaKRXIz
         umlg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2kwZNv9GAEom4TWgoZva/1hyJdLPDtFzBXeFV99Mc9ffZs8hRCBels5oUlUg/SbelbLMayeAxzwHx@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJDdI5FHaGyArpb+sNH5ceSwHLLzrxEQKKNH35dPE8R9PSDp/
	FJ7kdCPiihZluTQdwQj6oqrRkLPEgYqCrIdl3ZW9/4eU9SzPRvIN9K2fPn5qrA==
X-Gm-Gg: AfdE7ckJ1RCq6I6buTUxWU9wsEpZPrejBDKbKfxYjQvZKeemhFWRJcKQFtYM5sprXCW
	k8EhozM7DZ5BMf8Eya6CDlimuOJ6QqmMDC2lhMVnVdGMmJWDbVebOj/hds9uPuDhjPwll2hQcG3
	Xx5yVZ0Oew0ZCk9a6VHmSjnfFu+FcyrBenyL6KRMQkEgKkVEbDgj0u1z3mEvnPfYREDpkg8MjEI
	91nQ0cHBpbM/NXE6CzT6Yp5F9Hq1PeQphIUpSAkEss1Z3rEto+Jme6dOTEAzub/RPk/RtFAzXQG
	rBT+aVouW501PFqhWOeX+XIK57NV3HcMCLZaNVW0Sh1TH1aHojbiGjq9qjzRiXuYek4HkCRbZL5
	nk3iTplMEo/ha+uOW8/LoGOPG25pcOvIfVdoXs3fXy2ebtnRuq7hPygauDFDwdRUO5CVPZSba3u
	zR21O6ZcNmTs6fy2qhzH0nV88=
X-Received: by 2002:a17:902:cf0d:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2cbb9ebba2emr61601865ad.4.1783349165341;
        Mon, 06 Jul 2026 07:46:05 -0700 (PDT)
Received: from smtpclient.apple ([2406:4440:0:105::41:a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7140a13sm51402605ad.30.2026.07.06.07.46.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:46:04 -0700 (PDT)
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
In-Reply-To: <fb6dbc208d771911988d60685f6145b6132c66b6.camel@xry111.site>
Date: Mon, 6 Jul 2026 22:45:48 +0800
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-Id: <782E1F07-5E90-42D2-A2E6-4404C53B4C05@gmail.com>
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
 <B6BABD9E-104C-405C-9D9C-8B063791B20F@gmail.com>
 <fb6dbc208d771911988d60685f6145b6132c66b6.camel@xry111.site>
To: Xi Ruoyao <xry111@xry111.site>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39528-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:brgl@kernel.org,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:chenhuacai@kernel.org,m:lvjianmin@loongson.cn,m:kernel@xen0n.name,m:jiaxun.yang@flygoat.com,m:linux-gpio@vger.kernel.org,m:zhuyinbo@loongson.cn,m:linusw@kernel.org,m:zhanghongchen@loongson.cn,m:liupeibao@loongson.cn,m:gaojuxin@loongson.cn,m:westeri@kernel.org,m:jeffbai@aosc.io,m:xry111@xry111.site,m:devnull@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5133A7127DB



> 2026=E5=B9=B47=E6=9C=886=E6=97=A5 22:26=EF=BC=8CXi Ruoyao =
<xry111@xry111.site> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, 2026-07-06 at 19:43 +0800, Miao Wang wrote:
>> Hi,
>>>=20
>>> Right.
>>>=20
>>> So, let me state again, we need an input from Loongson on =
clarification on what
>>> to do with the property. Because what I read from your reply is that =
property
>>> must stay and specification update was a wrong move.
>>>=20
>>=20
>> If Interrupt() repeated in _CRS is allowed, then I don't think it is =
a wrong
>> move, but we are considering about existing hardware and firmware =
which are
>> not following this change. If repeated Interrupt() is not allowed, =
then this
>> would be another story.
>=20
> If repeated Interrupt() is not allowed (I'm unsure yet if it's allowed
> too) we can still use the hard coded logic like m % 8 or MIN(m, 4)
> instead of gsi_idx_map.  AFAIK these mappings are hard-wired in the =
chip
> (i.e. not programmable by the firmware) so having the _HID is enough.

So will this PoC work? When irq resources cannot be fetched directly, =
try
to use a static backup mapping instead.

diff --git a/drivers/gpio/gpio-loongson-64bit.c =
b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344..5de05c61cc82 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -24,6 +24,12 @@ enum loongson_gpio_mode {
 	BYTE_CTRL_MODE,
 };
=20
+enum loongson_gpio_mapping_mode {
+	MAPPING_NONE,
+	MAPPING_MODULO,
+	MAPPING_CLAMP,
+};
+
 struct loongson_gpio_chip_data {
 	const char		*label;
 	enum loongson_gpio_mode	mode;
@@ -37,6 +43,7 @@ struct loongson_gpio_chip_data {
 	unsigned int		intsts_offset;
 	unsigned int		intdual_offset;
 	unsigned int		intr_num;
+	enum loongson_gpio_mapping_mode mapping_mode;
 	irq_flow_handler_t	irq_handler;
 	const struct irq_chip	*girqchip;
 };
@@ -130,11 +137,23 @@ static int loongson_gpio_set(struct gpio_chip =
*chip, unsigned int pin, int value
 	return 0;
 }
=20
+static unsigned int loongson_gpio_backup_irq_mapping(const struct =
loongson_gpio_chip_data *chip_data,
+						     unsigned int pin)
+{
+	if (chip_data->mapping_mode =3D=3D MAPPING_MODULO)
+		return pin % chip_data->intr_num;
+	else if (chip_data->mapping_mode =3D=3D MAPPING_CLAMP)
+		return MIN(pin, chip_data->intr_num - 1);
+
+	return pin;
+}
+
 static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int =
offset)
 {
 	unsigned int u;
 	struct platform_device *pdev =3D =
to_platform_device(chip->parent);
 	struct loongson_gpio_chip *lgpio =3D =
to_loongson_gpio_chip(chip);
+	int irq;
=20
 	if (lgpio->chip_data->mode =3D=3D BIT_CTRL_MODE) {
 		/* Get the register index from offset then multiply by =
bytes per register */
@@ -145,7 +164,13 @@ static int loongson_gpio_to_irq(struct gpio_chip =
*chip, unsigned int offset)
 		writeb(1, lgpio->reg_base + =
lgpio->chip_data->inten_offset + offset);
 	}
=20
-	return platform_get_irq(pdev, offset);
+	irq =3D platform_get_irq_optional(pdev, offset);
+	if (irq =3D=3D -ENXIO && lgpio->chip_data->intr_num !=3D 0) {
+		irq =3D platform_get_irq(pdev, =
loongson_gpio_backup_irq_mapping(lgpio->chip_data, offset));
+	} else if (irq < 0) {
+		irq =3D platform_get_irq(pdev, offset);
+	}
+	return irq;
 }
=20
 static void loongson_gpio_irq_ack(struct irq_data *data)
@@ -430,6 +455,8 @@ static const struct loongson_gpio_chip_data =
loongson_gpio_ls3a5000_data =3D {
 	.in_offset =3D 0xc,
 	.out_offset =3D 0x8,
 	.inten_offset =3D 0x14,
+	.intr_num =3D 8,
+	.mapping_mode =3D MAPPING_MODULO,
 };
=20
 static const struct loongson_gpio_chip_data loongson_gpio_ls7a_data =3D =
{
@@ -439,6 +466,8 @@ static const struct loongson_gpio_chip_data =
loongson_gpio_ls7a_data =3D {
 	.in_offset =3D 0xa00,
 	.out_offset =3D 0x900,
 	.inten_offset =3D 0xb00,
+	.intr_num =3D 5,
+	.mapping_mode =3D MAPPING_CLAMP,
 };
=20
 /* LS7A2000 chipset GPIO */
@@ -468,6 +497,8 @@ static const struct loongson_gpio_chip_data =
loongson_gpio_ls3a6000_data =3D {
 	.in_offset =3D 0xc,
 	.out_offset =3D 0x8,
 	.inten_offset =3D 0x14,
+	.intr_num =3D 8,
+	.mapping_mode =3D MAPPING_MODULO,
 };
=20
 static const struct of_device_id loongson_gpio_of_match[] =3D {



