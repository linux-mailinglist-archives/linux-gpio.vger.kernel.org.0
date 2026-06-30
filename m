Return-Path: <linux-gpio+bounces-39259-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0rFAKORERGqvrgoAu9opvQ
	(envelope-from <linux-gpio+bounces-39259-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 00:36:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F876E870F
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 00:36:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NaFJ1rIJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39259-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39259-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EACE63013A44
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 22:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57354330305;
	Tue, 30 Jun 2026 22:31:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193F2F99B8
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782858709; cv=none; b=FPLtun2//f40Yn6tU/Y8bgOl1YDEGOgAsG4oG8hMyKWoFrW2YEIvnHdgVyO67gh9KNyTU6ArueAwVe7D7UhlKp5OAX68D3Mo7ySDD+9RwuOvUNjjlLRzO8dPE+IQNEHrCHV5sMyHBJ8bUOou5fWCIaMwShSUywmFNwGxJ4DbeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782858709; c=relaxed/simple;
	bh=0vyBcI5TrDUOJsKRP78Qn4UY47KkKEgHkVpg0R4944I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfsFe09Qi+tQSu/lDR5+iX9SboJeXHmOwlFMl/OE9t6bEywvEn3g+hTRUSuOppOjOZVcW5ETNHl+uzAqtqdXQ+XrTgz1fAIFCNj3UX6sos7w/x3jkT5kR8YPtN7jejnP/pz9EU8OcXP77Ql3dxicqiUk1o/4qJq4PtJb6n0bq2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaFJ1rIJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29F91F00ACF
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858707;
	bh=0vyBcI5TrDUOJsKRP78Qn4UY47KkKEgHkVpg0R4944I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NaFJ1rIJVlJTeP3ijFYuHHLRJ2LVGBSp02a3unMxIHx/YqdVkwo9eSFZhBjTRjgU8
	 tKwPgYi2JnxPfWj8vtLQdcHbV6XGYaGmB8PQfhxjzVVls/a5q1yA75FYCG14qPXBuP
	 juQaLMme73XBDXgJ0ipPO8qeMLZ3J2kiR64TlBPdc6SX4nvZqlbcPSpew1wZYdsxWL
	 qiQftyANALt+OgbQcB+m9plrzrwUt2yWgjH3l3K5RNhqZK9Rn3Ma9gQvih2jlQxDhm
	 mTmGjnRKGoe7zo5ch3456UV2UtT/GGziMVK/1iOdgFp+EuhyvgVTjiR6tHcldNJ1KG
	 EaEc4MsCyUYwg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so2692493e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 15:31:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5THfvDSqSj0aiEujjMI++f+oeY7/WpvRILuLRhpYHVFgH719vNxLoy2rrnGiiMDLE0zPaoUECapjY@vger.kernel.org
X-Gm-Message-State: AOJu0YxOAGUwWRhm+Dabhjz/nWwVYclE8/XvIOwFhENaUtTI94APFNxn
	aqnN4nut45+u1CmwZ0OGEy5Yr7Bagnf73Y+KqRCmpg9xv4dEJUA5YoMpuvDWA+KQyqm/MKbYCLs
	Auwa3ZxVkisw2T5i9sXFk5gR6IAHI2fg=
X-Received: by 2002:a05:6512:3d19:b0:5aa:6cfc:771e with SMTP id
 2adb3069b0e04-5aebdb7b9f3mr1476506e87.2.1782858706533; Tue, 30 Jun 2026
 15:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625115718.1678991-1-v@baodeep.com> <20260625115718.1678991-3-v@baodeep.com>
In-Reply-To: <20260625115718.1678991-3-v@baodeep.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:31:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmprP3Ur_BFB9K_we3wdRkZ7dqX3vX-4mPOZZD7WujxJA@mail.gmail.com>
X-Gm-Features: AVVi8CfDmpM_WBEsoCA-fJj4k4OCxE4dpL_nSqphbxmK4p2VO77ksQUbWW6IkQU
Message-ID: <CAD++jLmprP3Ur_BFB9K_we3wdRkZ7dqX3vX-4mPOZZD7WujxJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: meson: restore non-sleeping GPIO access
To: Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39259-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:v@baodeep.com,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:diederik@cknow-tech.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,samsung.com,arm.com,cknow-tech.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baodeep.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E3F876E870F

On Thu, Jun 25, 2026 at 1:58=E2=80=AFPM Viacheslav Bocharov <v@baodeep.com>=
 wrote:

> Commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
> sleeping") set gpio_chip.can_sleep =3D true to work around
> gpio-shared-proxy holding a spinlock across a sleeping pinctrl config
> path. That locking bug is now fixed in the shared-proxy itself ("gpio:
> shared-proxy: always serialize with a sleeping mutex"), so the
> controller-wide workaround is no longer needed; the meson GPIO
> controller does not sleep.
>
> meson_gpio_get/set/direction_* access MMIO through regmap. The
> regmap_mmio bus uses fast I/O (spinlock) locking, so these value
> callbacks do not contain sleeping operations. Since gpio_chip.can_sleep
> describes the get/set value path, restore can_sleep =3D false.
>
> Marking the controller sleeping also broke atomic value consumers such
> as w1-gpio (1-Wire bitbang): w1_io.c runs its read time slot under
> local_irq_save() and uses the non-cansleep gpiod_set_value() /
> gpiod_get_value(), which with can_sleep=3Dtrue trigger WARN_ON(can_sleep)
> in gpiolib on every transferred bit (from w1_gpio_write_bit() /
> w1_gpio_read_bit() via w1_reset_bus() and w1_search()). The printk and
> stack dump inside the IRQs-off, microsecond-scale time slot destroy the
> bit timing, so reset/presence detection and ROM search fail: the bus
> master registers but w1_master_slave_count stays at 0 and no devices
> are found. Verified on an Amlogic A113X board (DS18B20 on GPIOA_14):
> with can_sleep restored to false the warnings are gone and the sensor
> is detected and read again.
>
> This must not be applied or backported without the shared-proxy locking
> fix above; otherwise the original Khadas VIM3 splat returns on boards
> that genuinely share a meson GPIO.
>
> Fixes: 28f240683871 ("pinctrl: meson: mark the GPIO controller as sleepin=
g")
> Link: https://lore.kernel.org/all/20260105150509.56537-1-bartosz.golaszew=
ski@oss.qualcomm.com/
> Signed-off-by: Viacheslav Bocharov <v@baodeep.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

