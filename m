Return-Path: <linux-gpio+bounces-39676-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p8btOXBdTmpcLQIAu9opvQ
	(envelope-from <linux-gpio+bounces-39676-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 16:23:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6625972747C
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 16:23:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IWkErtN5;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39676-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39676-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58635300D729
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 14:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C50744B67D;
	Wed,  8 Jul 2026 14:17:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208541610A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 14:17:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520232; cv=none; b=OzVQURlrlmHBUVsNtOBT2VXuAOKQ+iNv31mjO0rHQtv2WnaijlrrmqRGmw23VGhW2FyG87xWEgCbMI0LzHo2MjmaEwMy0qsLysCoIHb+66cB1xzwr9gx2pQW9J6zXBkmk3c3iTHzF3rCJB+Tee4TKDX8lCa8lxC5sqqIhj0e93U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520232; c=relaxed/simple;
	bh=KytUjyWbmgxMPWGG2wJePUNjrnm6PwIYazV5AliXqU0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=h9TBjOvd2FU0CjH8MRwZXRojIcjwk9CdD0jMYN6+PAykJGZ2tj3NPjECOwy+PBPYa+txCExwYKnwSAczsKT1rjK6KB7CXGuwHeVRws2jJyd5DHcq6Y9kJGl8vKLq+yp6uxPlx0EpH96so8sk6bg87YQid0Go8V/hZRgfhWfpiAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWkErtN5; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc827a68fbso1585375ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520230; x=1784125030; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d4xgsEpJa1JkMfAC5lrqnM5nTtBq2Z6cq/mQ8FHTkeQ=;
        b=IWkErtN5dBvDANp0UB00pDxyB0qZkdxrKGh2F7Vg6IY+2GSqJIf2HORF7MQNUFGez7
         pxTppYVpeQdWpXUU7thrJcNBdEp14L9G/Q40842qe9Nvt/tp0CWm2ljwEnUh/T9gewyd
         G9G3Pu+3ZqPEdxwpFaHhQLDyrS65cYb2RH1fI8wz4pilqkOCOHXKa7rCMotfIb8P64Mp
         8Vv9MQiOknDb3htjEb4p63Utjuy55AS6wsLpit52eezkWEFYQwmRe9eWyDoXlSzx8hJw
         qM374lw3fKx9rYFE8gqy5ZQUZlDfjUy3I0Z/7MyyPobLjucigehZJtdUDjPsS6F8dTq1
         yw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520230; x=1784125030;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4xgsEpJa1JkMfAC5lrqnM5nTtBq2Z6cq/mQ8FHTkeQ=;
        b=rO92fMRz0Rq2FrQC+0rwgseFNSIkw3ABK2tV7M1OpsviRUrKiO6mXk8hmOsZZCX4Gh
         2QhAvdyv7gAubCxX3aSNAXLbo+V2ECcg+mX5Hg67pobO1kV+S7hQZlv+tVK3LbK7UPVx
         0OcqnrWGtOn/O4igbpRqw7Ccd/M0+YWeoN30qaKGESBDkDVL72Yvxl3FodW23c1MrYE1
         m2MBoyV3OHP5nyeCw+ttbrmABQEDf2JaaTHRtVre0Xsi2d0XRxjFo88txgRcwiZJ5sjQ
         hly3DBjGGvLDZSQx4yMc2jF7IYC7MdsEBl1cMTG1JNIwqHOAu8RIHkKlG+LWRisZkDh4
         7L9g==
X-Forwarded-Encrypted: i=1; AHgh+RpNYAstMCSWfA5UWo28Ry8vU1UcLOk7YgjK0rSoGpOhMMv4Pl2ptIJdtWHS8vqrZ74a5qp6x+MSS8Aj@vger.kernel.org
X-Gm-Message-State: AOJu0YwIE6jeMALF92Ii0a20DmHaDvI49MMyui1GGWTBKV/v8xA6xQoA
	nd9pxwG0ms1WZEp0IQfM03vnXuuRSOzmJGcZUIt3qaS0WtjMOfvqMY8zgy1X96Ad
X-Gm-Gg: AfdE7ckjbP5spvwLqyRUIzDVOngWnjVR8SjiAz0+xEQV1UtEW1tAXaJMo42Ed7kwdNs
	mEy2e7pCaOSLzILf9XdcSn3YYn2rgSelAiSuQAqmqx2EGOGr1CEaFlDnPfuDCmKXJ6b6Gi1/AFr
	GzeaJmJS41sniFUAA1RG4Jyr+j96cOi8hIGvk0TO7+uZCeSi4qF2nn1ln2aB0+Gl37mmz9ewhud
	VxLWjYCsmKbe2DfQHXTm4K2os943qVMWTts3ok5jQi5/8gPrGMhTNaQkXovfsNob6YiZGRCwwOB
	1FqllQ2DC3K9aEgZ1XJpBiZe2SavayDu0U19Z7V9YCT9nV4TvDF5lCTBlpvzrJn6LdxZiGSmYCl
	sPx6E7rWg8+k9wawQWwCKJpU9tY6DWbF2rbgGDGiYRBamwIlDGWIZrjCMqNg5ThKzeVmkegg9iB
	bEJ8qQS51HbXGMNNrBOp+nSDA3igi/JKZYWkVQUhSyuwqEQw==
X-Received: by 2002:a17:903:2352:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2ccea2af751mr20982635ad.2.1783520230041;
        Wed, 08 Jul 2026 07:17:10 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e29asm28773865ad.52.2026.07.08.07.17.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:17:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <5d6ea500e983035a2e5748e1bbf8ed6c26ac6f4b.camel@xry111.site>
Date: Wed, 8 Jul 2026 22:16:49 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <D141EDD3-BEC0-458B-B477-9227B3FB93AC@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
 <5d6ea500e983035a2e5748e1bbf8ed6c26ac6f4b.camel@xry111.site>
To: Xi Ruoyao <xry111@xry111.site>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39676-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:xry111@xry111.site,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shankerwangmiao@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6625972747C

Hi,

> 2026=E5=B9=B47=E6=9C=888=E6=97=A5 21:14=EF=BC=8CXi Ruoyao =
<xry111@xry111.site> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, 2026-07-08 at 05:16 +0800, Miao Wang via B4 Relay wrote:
>> From: Miao Wang <shankerwangmiao@gmail.com>
>>=20
>> The reset event of BMC is captured through GPIO. However, this driver
>> bypasses the GPIO framework and directly accesses the GPIO controller
>> through the fixed address. When the same GPIO controller is also
>> exposed through ACPI and probed by the corresponding GPIO driver,
>> there would be a conflict between the two drivers.
>>=20
>> This patch will try to find the GPIO through declared GPIO pin in the
>> _CRS resources of the ACPI node. If no such delaration is found, the
>> driver will fall back to search for the correct GPIO controller and =
pin
>> according to the fixed address and pin number. A possible DSDT
>> declaration for the GPIO pin might be as follows:
>>=20
>>     Device (BMC0) {
>>         Name (_ADR, ...) // Match the PCI address of the BMC device
>>         // \_SB.GPO1 is the ACPI path of the GPIO controller
>>         Name (_CRS, ResourceTemplate () {
>>             GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>>                      "\\_SB.GPO1", 0) {
>>                 14 // 14 is the GPIO pin number
>>             }
>>     }
>=20
> I think this is a proposal without real implementation yet?  If so...
>=20
> /* snip */
>=20
>> + adev =3D to_acpi_device_node(fwnode);
>> + if (!adev)
>> + goto out;
>> +
>> + INIT_LIST_HEAD(&resource_list);
>> +
>> + ret =3D acpi_dev_get_memory_resources(adev, &resource_list);
>> + if (ret < 0)
>> + goto out;
>> + rentry =3D list_first_entry_or_null(&resource_list, struct =
resource_entry, node);
>> + if (!rentry)
>> + goto free_resource_list;
>> + if (rentry->res->start =3D=3D start_addr)
>> + found =3D 1;
>> +
>> +free_resource_list:
>> + acpi_dev_free_resource_list(&resource_list);
>=20
> ... consider adding a _DSD method to label (like "bmc-reset") the GPIO
> for the proposed BMC0 device so you can use devm_gpiod_get to get the
> GPIO, instead of using the hand-brew code to parse the ACPI node.=20
> See =
https://www.kernel.org/doc/html/latest/firmware-guide/acpi/gpio-properties=
.html.

Yes, it is a proposal. GpioInt() in the _CRS() should be at least
required to associate the BMC device to the GPIO pin. Having a _DSD
might be better to label the gpio pin with human readable label. I
however don't think _DSD is important because there is only one pin
needed, and devm_gpiod_get_index can be used to obtain the gpio line
description using the index in _CRS()

>=20
> Combining this with Bartosz's comment, the logic would be like:
>=20
>  if (missing the ACPI node)
>    assign a swnode to label "gpio14" as "bmc-reset";

I'll further look into whether swnode can be used.

>  gpio_desc =3D devm_gpiod_get(&dev, "bmc-reset", GPIOD_IN);
>=20
> And such a proposal will need to be discussed with Loongson.  Yes I =
know
> people may hate the "control" from the vendor, but having some
> effectively dead code (i.e. supporting some non-exist firmware) in the
> kernel is worse.

I'm open with such discussions.

Cheers,

Miao Wang



