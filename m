Return-Path: <linux-gpio+bounces-31509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ8GJYyxh2nwbwQAu9opvQ
	(envelope-from <linux-gpio+bounces-31509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 22:41:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 035911072F5
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Feb 2026 22:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FAE301324E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Feb 2026 21:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38C13557F0;
	Sat,  7 Feb 2026 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PADG2YQr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A1C2D3EEA
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770500487; cv=none; b=ivEMyVea5tjVQd1jsboBQ/YpmNKdD2wHQPgedD25NvNkUQ7maEfpm+qJ34R1joMwMEhH3hnc2E2BRxnK6r4uYLW6Mb2r7+KfaOBCkEnyN0STNa/57kGLxmMYjBjNZuR71+jsqzRtey+8R5HQJqFfTT7IRSAzsD4+R04+M8A1P0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770500487; c=relaxed/simple;
	bh=bu7sc6fm8R3ogR5RmPOZUc2BmaR7LgDj+vCm3snNvok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddRVVHfEnn8i2cDjlzcLcfBYLUZfynW5lbtTPEHgITwmE+/K9+QGssPcTZSB6U3CZEAvby0SkDAhGggVSNm9um1HWCGrh0D7HsaAXSPS1AvhupUPSvVpvDmRrSnHLB+jM10WdZ0DTHWPiSSD1IyPsaqH64n9YnCZXdFV0HEaTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PADG2YQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5530FC4AF09
	for <linux-gpio@vger.kernel.org>; Sat,  7 Feb 2026 21:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770500487;
	bh=bu7sc6fm8R3ogR5RmPOZUc2BmaR7LgDj+vCm3snNvok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PADG2YQriX2d1jZtVnYKoqO8C61eyVj16Mf+0LMCs1hm5pkB/MzxzHwF41RWk+Xae
	 2QQSmy8I0/mw208VM4VMharZOdIwjJVfHppqu8m/BcY7kWfxLy90oEVqSgOtEaWy8U
	 vAE4vksJfObhxZInp6We8CnHXKysMP1pdORz66/mlhfMv4OtqvEFjr6NIPF+elfTFB
	 dDNpBfwtbRaykCKM5kmJM3f5ameU39ZUUvqqQXfRQQfua3+OhxdHwaYAWiy4lktGWr
	 V1jsC2Us1Vu3c0ImyJEQjuugUdCOhhYuuLrafN0CJNCYc1wQ6nclj8kkCaPu0rOYg+
	 8XvygYiPl49qw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad79df972so684702d50.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Feb 2026 13:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxeE2yo9ghqOH/v0twPjxCwdwkmBWeanaldU2V0KKbdYeGRXwE1MU32/hAdWhvtvtBWjy/geStyvjv@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+nbiJptoKW1kymZiPPGN+YEV5UA/5vfdxk89GjUVUv4ElTOz
	27pJFFhhrrRshWlrusoGl0ENu5Jqk3p1FAzeCO0SUqva1ZHFIebfhkok80zrwQci//6Z1VNT97I
	qnaYmkrC413YhFP1hDRVmd9aEMTlgk/0=
X-Received: by 2002:a05:690e:c4c:b0:64a:cee0:fa9 with SMTP id
 956f58d0204a3-64acee0115fmr4746840d50.17.1770500486519; Sat, 07 Feb 2026
 13:41:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_326708D02875274DF25B10B91402B3828606@qq.com> <20260207134950.0f064905@jic23-huawei>
In-Reply-To: <20260207134950.0f064905@jic23-huawei>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 7 Feb 2026 22:41:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLmTJBct_+HW3S7D6mSFeXE_ma5gj8HRakDgy9PWre0rLw@mail.gmail.com>
X-Gm-Features: AZwV_QgRuQJn1GJ5TzWCm4YZTt_ZCj02-KSODdHSjrSbfw-XPmoRYjwL7CB846A
Message-ID: <CAD++jLmTJBct_+HW3S7D6mSFeXE_ma5gj8HRakDgy9PWre0rLw@mail.gmail.com>
Subject: Re: [PATCH] tof: Add VL53L4CX TOF drivers
To: Jonathan Cameron <jic23@kernel.org>
Cc: 434779359@qq.com, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, liufulin <frank.liu@faiot.com>, 
	Waqar Hameed <waqar.hameed@axis.com>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31509-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[qq.com,baylibre.com,analog.com,kernel.org,gmail.com,faiot.com,axis.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 035911072F5
X-Rspamd-Action: no action

On Sat, Feb 7, 2026 at 2:50=E2=80=AFPM Jonathan Cameron <jic23@kernel.org> =
wrote:
> 434779359@qq.com wrote:

> > +#include <linux/of_gpio.h>
>
> Whilst I haven't checked yet it would be very usual to need
> to include of_gpio.h in an IIO driver. That may imply using wrong
> level of interfaces or just a stray include.

This is a legacy header that should not be used in new
code.

<linux/gpio/consumer.h> should suffice for consumers,
<linux/gpio/driver.h> should suffice for producers.

Yours,
Linus Walleij

