Return-Path: <linux-gpio+bounces-39671-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hFxiALdJTmr1KAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39671-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:59:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB87268AC
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 14:59:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PsVYGQCs;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39671-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39671-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E93830071CC
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 12:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621B14534B9;
	Wed,  8 Jul 2026 12:55:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768744DB73
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:55:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515319; cv=none; b=WvUKhc50kUwLdh2aU/QbmH1Ynhp5YyTbjVjdP9i3AQTrfBWCLQh8hL4GDXHf9M6DU3e0o1cayahKQ0ezPu8jjMKUDmx4EExJCgUoMxcTgTqr1DsdkC7UdM1g/lopILqFfaSKMVS+FcCNKhJqtDybb9EwAQGvnVAOShru5jlUHtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515319; c=relaxed/simple;
	bh=+TMFHwBKZ8krcoCMZCLGxgHx7kx8SNd+ZsBZADGdDMs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRK8EGNoTUlnnzGunu2Hiw1lgSXAWNLCKOh7FqyENnm31xxwAAEyAveIEEzSG1SAs4u9ZUS3Dwuv5A73B0mXpsOlqVVhzxXHs/3UoTZMHT9J7UkCSWQyNrRphRc3qmCOuJgoFYXoVMSEfmUOxVay2FvUppevP7QPysor3Btgdog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsVYGQCs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA891F0155B
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783515317;
	bh=kikzu5yHjCHrYI+CpYYUdbBjsN4WJ34ORiqQtKuS/QI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PsVYGQCsaygkbYDUX8ClsdQd4ClXV4vvKASakMNhoeX2O/aMcCNUPpx/zE39zrZbI
	 SKspeoqb8xsJNsZz/GYsVYvkTPq+bTrr3zyjxZtMoGw0LzznWWMUfj44cEBrrj4tyd
	 gfFSgCZ8NbTGDuINWaGQ/bLX/DPtKQ8TVP7He8H3Pk9b+ilqUpRyCI4hvYqLs2rYSz
	 Hd0v2fsFSAb8Z2R7lAUy13eC5EI+lCKeoNpR5oELnEymHndaHD+Qh+xCDxw4uhIAf/
	 T1IWsQpV5hRqVcl8p4KWQQ9o5otQ1B9yeOFRejYHeyBXeB+kFgDtBZpxNvzPhTT2RZ
	 ny7JBC7iSn4Jw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b268e608eso6249471fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 05:55:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roeo1a3LPrMrF2eBuRSXDAr/ny0qrF12QYbCklzFiwayBIWxiuqiCYa2oGgvanERc+8ytTViaEo25Hw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsetnz7ea4eQ1MAMf9exuUYdzJvkVo+IC9zq6Whq6ZKlo0DYpA
	rMN1yAzEk6yovN/n7pvbtZS54r2ZgK0iWOuCVDYg9sQzynhpFZr8G8XRB8Nz1Gvvb8IooYx/bLO
	kS+3mvt0z1FeAGt/Ts0n+eVwwX84wA30lPOgKseIjeQ==
X-Received: by 2002:a2e:82d0:0:b0:39a:ec7b:6cc7 with SMTP id
 38308e7fff4ca-39c79a171d8mr4780281fa.24.1783515316229; Wed, 08 Jul 2026
 05:55:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:55:14 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:55:14 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <C8B03257-3909-4323-B183-331F7CB1DA3E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com> <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
 <C8B03257-3909-4323-B183-331F7CB1DA3E@gmail.com>
Date: Wed, 8 Jul 2026 05:55:14 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfbbQfzquf5tT-3an-EVtO_gkgh8To61Q=OAGbf=u3Xpg@mail.gmail.com>
X-Gm-Features: AVVi8Cf-b0wpzureZ5LYsD1gEyfLZXYdTpNSMQ2jjZOcsYfx4W8ngNITiPKXzoY
Message-ID: <CAMRc=MfbbQfzquf5tT-3an-EVtO_gkgh8To61Q=OAGbf=u3Xpg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39671-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:shankerwangmiao@gmail.com,m:devnull+shankerwangmiao.gmail.com@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:devnull@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,shankerwangmiao.gmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BAB87268AC

On Wed, 8 Jul 2026 14:15:55 +0200, Miao Wang <shankerwangmiao@gmail.com> sa=
id:
> Hi
>
>> 2026=E5=B9=B47=E6=9C=888=E6=97=A5 19:36=EF=BC=8CBartosz Golaszewski <brg=
l@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Tue, 7 Jul 2026 23:16:31 +0200, Miao Wang via B4 Relay
>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>> From: Miao Wang <shankerwangmiao@gmail.com>
>>>
>>> The reset event of BMC is captured through GPIO. However, this driver
>>> bypasses the GPIO framework and directly accesses the GPIO controller
>>> through the fixed address. When the same GPIO controller is also
>>> exposed through ACPI and probed by the corresponding GPIO driver,
>>> there would be a conflict between the two drivers.
>>>
>>> This patch will try to find the GPIO through declared GPIO pin in the
>>> _CRS resources of the ACPI node. If no such delaration is found, the
>>> driver will fall back to search for the correct GPIO controller and pin
>>> according to the fixed address and pin number. A possible DSDT
>>> declaration for the GPIO pin might be as follows:
>>>
>>>    Device (BMC0) {
>>>        Name (_ADR, ...) // Match the PCI address of the BMC device
>>>        // \_SB.GPO1 is the ACPI path of the GPIO controller
>>>        Name (_CRS, ResourceTemplate () {
>>>            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>>>                     "\\_SB.GPO1", 0) {
>>>                14 // 14 is the GPIO pin number
>>>            }
>>>    }
>>>
>>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>>> ---
>>> drivers/mfd/ls2k-bmc-core.c | 162 +++++++++++++++++++++++++++++++------=
-------
>>> 1 file changed, 115 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
>>> index f87224105b3720cca97dcef089dad63fe57bc8c2..7187b2dfddc3acfb9fdf3cb=
3b4675299928dd03a 100644
>>> --- a/drivers/mfd/ls2k-bmc-core.c
>>> +++ b/drivers/mfd/ls2k-bmc-core.c
>>> @@ -26,6 +26,9 @@
>>> #include <linux/stop_machine.h>
>>> #include <linux/vt_kern.h>
>>> #include <linux/console.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/gpio/driver.h>
>>> +#include <linux/gpio.h>
>>
>> I've stopped here because this is a legacy header that must not be inclu=
ded
>> and none of the interfaces in it must be used, as per the - very loud - =
comment
>> at the top of that file.
>
> I fully understand using the legacy interface is deprecated. However, the=
re
> seems no other way to obtain a gpio line description after a gpio device
> is found using gpio_device_find(). As the comment shows in the code below=
,
> the only place I use the legacy interface is:
>
> gdev =3D gpio_device_find(...);
> desc =3D gpio_device_get_desc(gdev, LS2K_BMC_RESET_GPIO);
>

No, new code using legacy API is *not* acceptable. That's an official NAK.

> // XXX: might be better to use gpiod_request()
> legacy_gpio =3D desc_to_gpio(desc);
> devm_gpio_request_one(..., legacy_gpio, ...);
> return gpio_to_desc(legacy_gpio);
>
> I just borrowed the legacy gpio interface to request the irq description.=
 I
> think that gpiod_request() should be better to be used here, but it is no=
t
> an interface that is exposed. As a result, I post this patch as a PoC her=
e
> to discuss and find a better way to achieve this.
>

If the firmware doesn't describe the GPIO, you have at least two alternativ=
es.
Please look at Documentation/driver-api/gpio/legacy-boards.rst. You should =
be
able to use either software nodes or GPIO lookup tables. This document
describes the conversion from the latter to the former but - while software
nodes are preferred - lookup tables are not deprecated so feel free to use
it to set up the descriptors.

Bart

