Return-Path: <linux-gpio+bounces-32464-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPKmEiIAqGnynAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32464-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:49:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBD1FDE15
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42CE130205D2
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 09:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C82B39F16F;
	Wed,  4 Mar 2026 09:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoFzSPLZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B9239F167
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617754; cv=none; b=uIaUQXN4LIAzogcoftTYZhcGix7rquQYLetwehwdTumiUKfmmGxl0AY8PNVFIDX3UlWH1y0574i45LTNNbmhc4L0HCmOIOx3rvPM8JgnrUCodukMt8L7W9FbkO9Le+f6tGZp84VM0OhnE6XHJ+Sr5twW7tl8E9g/fERnw9hwwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617754; c=relaxed/simple;
	bh=yu3Ohj5106ejuArJ0T+/SYvwZDLiNDKZYAtfRj9AIuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HiGl7S74xV5ADcq5Nvv5B0JQp0nzUSn8hyASpM/UvsznWELbPhY91GbGRrSY0GfdIt5SeWrb0fiVzB6M+wKB+d2MHxLuTqoE/gO3aE+7oKNhY3/ovCF32sVTcQon7xjIY61FZ6OxqrOVc5CjbyOqhb9K7sElcK/LkNz1vs9KTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoFzSPLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286F9C19425
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772617754;
	bh=yu3Ohj5106ejuArJ0T+/SYvwZDLiNDKZYAtfRj9AIuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PoFzSPLZDU1yPTkitoUdCLIvZMReO4WU6KkFENlQGQ5KSAkC8BXiSnyss74+eSyYU
	 IAsB7bVSvsS0J71vPSsQpKbfqgzCDtOFTnpiHPVUMhlqWNcfVnnjg0kkniMJ2TtArl
	 GA6gg10RbXvjSa0zSMQ8zBoAZZLo8TAvQwe303poC2ZeYDWMnagBCo+pNDN9atMPuo
	 tJAorZla81hEtbM61a13auTIwNE+sfa1qla0C3fSPz0dm6fWEf9NHoUQS2iKSAPFxy
	 RK4Jgn+Gfij4O6QeipXbRg7O0GanoLNhLHJoskQYgNWLGWICbtRq9I0/c0sb7dzr/O
	 RHWFcAWZRvJJQ==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca2b32f46so4955736d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Mar 2026 01:49:14 -0800 (PST)
X-Gm-Message-State: AOJu0YxrDqoFY8tYTvqjFi/NqRpQhzx8SBlUmhNG1u+akRbrssP6S82E
	0qejBoMG/Ac/6+8sXReOdJP5RVnf+WB99LCgvBIGfTP045X+u5K3S0nfGdy2RPMi+eoy+W+G3sv
	ptFOSUQNpotjo6k2x1nzV/ORwyR3CIgk=
X-Received: by 2002:a05:690e:e8c:b0:64c:a1b9:ff9d with SMTP id
 956f58d0204a3-64cf9b5f174mr1114523d50.9.1772617753524; Wed, 04 Mar 2026
 01:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304084808.440955-1-xujialu@vimux.org> <4C2D1422EF70337D+20260304084808.440955-3-xujialu@vimux.org>
In-Reply-To: <4C2D1422EF70337D+20260304084808.440955-3-xujialu@vimux.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Mar 2026 10:49:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLmWt0Z=Bb1z0BSwMY-1KDzF=HXR6zudWCzouWDQqdotVw@mail.gmail.com>
X-Gm-Features: AaiRm51UtuYv9UvdVNDDFXnK1E5LWVdQ5W4i_Q3gUoYOTbFETcfV_ORzij7CO8M
Message-ID: <CAD++jLmWt0Z=Bb1z0BSwMY-1KDzF=HXR6zudWCzouWDQqdotVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] nfc: nfcmrvl: convert to gpio descriptors
To: Jialu Xu <xujialu@vimux.org>
Cc: linux-gpio@vger.kernel.org, netdev@vger.kernel.org, brgl@kernel.org, 
	krzk@kernel.org, kees@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ACCBD1FDE15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32464-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,vimux.org:email]
X-Rspamd-Action: no action

Hi Jialu,

thanks for your patch!

On Wed, Mar 4, 2026 at 9:48=E2=80=AFAM Jialu Xu <xujialu@vimux.org> wrote:

> +               priv->config.reset_gpio =3D
> +                       devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_L=
OW);
(...)
> -       reset_n_io =3D of_get_named_gpio(node, "reset-n-io", 0);

This isn't gonna work, sadly. The property is named  "reset-n-io"
in the device tree, not "reset-gpios".

To handle this, add code to drivers/gpio/gpiolib-of.c in the
of_find_gpio_rename() function to make it pretend this
custom property is handled as "reset-gpios".

Yours,
Linus Walleij

