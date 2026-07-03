Return-Path: <linux-gpio+bounces-39433-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UWFtKBosSGpcnQAAu9opvQ
	(envelope-from <linux-gpio+bounces-39433-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:39:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD347705EFA
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:39:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KqTeeiLt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39433-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39433-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 111F830BE313
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB10334DCC8;
	Fri,  3 Jul 2026 21:25:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2B349B0A
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113931; cv=none; b=YtsOQfaB5jGIoYzXJAgtZYhSdNY9jgBAkweUfIuQxTrjZsl//cCPIIbDKmHmaxwkMQAGMo6RsXfaOu27LrV8btOOtcLH5jdgOQD7FfqylLCmQLGchN0SFdU1VZyLYbEhip4hsdPt22+i4Ox0rk8CycRWTp1WfrHqGNZYaglS738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113931; c=relaxed/simple;
	bh=ZIo9hYtnwoa4lpPa7Xwa4If21J3/Cxx76B0qA8S5lPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tlslHqUB+bvdocGkziJYbczJgYFTG7SpE1St9EUBSTgk3e1oJKooFAvhjEPr+/CMWkZM54v4e7qd3SJlxZThmCaJfoUg/3DsIgvKoVoUqoP8zj96rvcf9v72rtK+SPNJzo/bnz3Y9iVPJHO1F94afxvExGx+Uu8Y/gvh23Okw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqTeeiLt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439F61F00ACF
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783113930;
	bh=ZIo9hYtnwoa4lpPa7Xwa4If21J3/Cxx76B0qA8S5lPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KqTeeiLt9q8my1JaabPQ4d0g9Esh/J3maPLu+iK7H1hO6K1bqE4EWchsDK412VC0Q
	 AZJv9cefjhqGy7A5jBCzKTWrd+YztayeCJEYkC4+44uxzAPj0DWrG+GwW7KMSX2bHY
	 2h4PbCSfDxlpz3ry1H/ru/U6XpBJEhje/zlG/vldx4ItSl7IhSc8nZSlw5Cmg9AT/8
	 gG5oq+fcBsjn/Vj6ihJY8R2eZTpPuZjZ1A6201KwXwkW4fGLEYt2k56381tpXcREge
	 +NWJSMquxweh3jlcC1zPd2QXUnCqx5kyRWbFNscbyOdTfQlJKnxOR4JhaRrqnAHR+5
	 6cNGCeA+tugJQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aec5675c46so963974e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:25:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAQ08F5Eco3gI9IkJBUYXp8njQilNZcdBt41/qJg7OyTea4X/rzovq9M8KH4mhcU/1lhKsWIeW/keE@vger.kernel.org
X-Gm-Message-State: AOJu0YwBP1ps6oToUYVtvzWLK+xHeQ17DsdfOFH8sjxN5Iqbw2yJunoC
	XVJdxbVH7KPe4LrJWVbNoqdWTMAw2Rhv2mEMQaBevZpOwq0grkrppNJjSIzmIMaJPTKwElbG6sM
	hTCCQx5QVpZuRRpjntXJai5gEqMCXlXw=
X-Received: by 2002:a05:6512:3f1a:b0:5ae:b0ea:d32f with SMTP id
 2adb3069b0e04-5aed4f7f8e1mr85238e87.7.1783113929001; Fri, 03 Jul 2026
 14:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <20260315014205.471d6834@ryzen.lan> <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
 <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com>
In-Reply-To: <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:25:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
X-Gm-Features: AVVi8Cd-QlFZ2O4JbrCfo1X6e86n1ZAPD4Rw27tfv8nva12GIn1LhD3kssPEbgU
Message-ID: <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,icenowy.me,baylibre.com];
	TAGGED_FROM(0.00)[bounces-39433-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andre.przywara@arm.com,m:brgl@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,m:jbrunet@baylibre.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD347705EFA

On Fri, Jul 3, 2026 at 3:53=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> Hi Bartosz, Linus,
>
> so I wanted to come back to this, posting a A733 v2, with this patch
> included, and was wondering what the consensus on this matter would be?
(...)
> So personally I am leaning towards doing the change: most users can
> typically adapt - or they don't care because they don't update their
> kernels (beyond stable revisions). And to address the naming
> ambiguities, we could push for more gpio-line-names. That would make
> finding a GPIO much safer and easier, and works either way.

I agree.

> But if this patch's ABI breakage is a showstopper, I would need to know,
> so that I can rebase the A733 pinctrl patches without this one being the
> first patch in the series.

I am *FOR* this change.

Wikipedia has some policy like "avoid copyright paranoia", and
some days I feel we need an "avoid ABI paranoia" policy.
Rough consensus and running code.

Yours,
Linus Walleij

