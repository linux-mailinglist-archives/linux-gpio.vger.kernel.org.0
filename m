Return-Path: <linux-gpio+bounces-38343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BCZjF9iqKmq/ugMAu9opvQ
	(envelope-from <linux-gpio+bounces-38343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:32:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A31A4671DC5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:32:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jVJcbnPw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38343-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38343-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE08A30C9D08
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3183F411A;
	Thu, 11 Jun 2026 12:29:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CACF2D1F40
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:29:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180961; cv=none; b=stlEzZ68r9Di/J851juEF1yZE3/kjQM7ay0p+OXJpyKNhBocAbjn1jhs+PPUfiDy9tY3dO4f45FYBC4Uv0rK3Umr/3wpnJKK9NXyci+Yr+tUgSOei9r34h3sjMnYOoVj531BlZyWx6lvaVyaSiaNz9TigEb8lNpN0t0G1vUHAL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180961; c=relaxed/simple;
	bh=1+TNx/0SZfh3qmrMb71qDbZor8AbRo60ZuWGQJHwLeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xj4nC41OAwZUqjum0MOQAm5sCGhiy1bOFJ+ljfjbmlT5j3b3mM7o/yIHs4r3taQrN2j/ytfmo2QfidrAeFufWoRL8NgBNoACuhC+6qfDe50QaLXKfZMTq/bcA1RW1A0bv4JzAvlNMAm/ELAjfQN7FYuZ1Eod7Y/h50W5QUrLSN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVJcbnPw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABC11F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180960;
	bh=dKoX7OkqxME2ExNCL+OP3Bt5b792TQWetkiAZ4FrIJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jVJcbnPwq8VjJ50HuCofn3edDDcScQkUIhM9AOjob/H271Xfk2gci+v2OK8D+SGwN
	 OoXciUJbOjAH8PPRTKq6UceWo6jevYxLihG1kjQxRoLQd3pWD0lWCWiq+6p5cU5FRZ
	 +DGzJK4mKli90WbMDNjYuueBqaii1RP6LB3jpLsLIIh2mkGacOXi6mrRmSMpK+h7B4
	 ZkH5YSIJ40iOn8BAUojvDnBdJepat27Pa8/2qZ/rIITBdoOox3X8onWBY2TaEPjL2d
	 /N6xRFGPLRR0hqdlqm4lhrqSx5HKIp3mjPfOmqRoyDQoDYoIEZcdfTXBjmBJdA3a21
	 BDi+1eQDijgIg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso9561083e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:29:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/vR4J5gR5Muymltjyr79xprjLPWK/FDcOduY7PVXXscdoVsleHkKtgKkkF3XE7vNd63uLGdUs4GQIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGHMpQqXhjVWsHQNU3rnSOx10N6oX6hqDmYqt0XdAFDcesXfCP
	1ieowh1z67aTz+n+4Nv3Mtn/XpPSaWlbJgW8d/NFTAJgj6iL1wxSr2kzJ+IXgb+3F1Q7HVZKnqK
	nrTi3e0FZLMN8jBvEdW/X0QduKIfGs5o=
X-Received: by 2002:ac2:51c6:0:b0:5a8:f6fd:f48d with SMTP id
 2adb3069b0e04-5ad27fb7e63mr758107e87.40.1781180959098; Thu, 11 Jun 2026
 05:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
 <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-2-8185d2abbfb1@gmail.com>
In-Reply-To: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-2-8185d2abbfb1@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:29:07 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ZM72UhCxw2Ubx7dSUhrUAfynjJbWMHN9TuMNoK5xBhg@mail.gmail.com>
X-Gm-Features: AVVi8CfpKz9QkL00EKq_YsKCCBm4wm5FT5WvaVWhC9omcBreEOLnznhemTBoLIA
Message-ID: <CAD++jL=ZM72UhCxw2Ubx7dSUhrUAfynjJbWMHN9TuMNoK5xBhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: GaryWang <is0124@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Thomas Richard <thomas.richard@bootlin.com>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38343-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:is0124@gmail.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A31A4671DC5

Hi Gary,

thanks for your patch!

On Wed, Jun 10, 2026 at 11:00=E2=80=AFAM GaryWang <is0124@gmail.com> wrote:

> +static const struct pinctrl_map pinctrl_map_adl[] =3D {
> +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c0=
_grp", "i2c0"),
> +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "i2c1=
_grp", "i2c1"),
> +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "pwm0=
_grp", "pwm0"),
> +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "uart=
1_grp", "uart1"),
> +       PIN_MAP_MUX_GROUP_DEFAULT("upboard-pinctrl", "INTC1055:00", "ssp2=
_grp", "ssp2"),
> +};

This looks very ACPI so I do not dare to merge it unless Andy or Mika ACKs =
it.

Yours,
Linus Walleij

