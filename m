Return-Path: <linux-gpio+bounces-39504-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cKatHEuAS2rgSQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39504-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:15:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79970F000
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:15:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c7ezCPs1;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39504-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39504-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B01B318A053
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27283F65EA;
	Mon,  6 Jul 2026 09:20:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457D4DA549
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:20:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329615; cv=none; b=MZjCVG2aCUUC1NsL8bABb3w3ulJ0a5zN6QeBGcgeNdYJJ+wva1dt5+oql992Grb0lxxEKXTnh0zQLDhebS0c8bgtdbP90/50PWlPTfMHTwvSLHN6YzTyvKOFfXcA12EnoZUWJA+dTuPRPKPYDnGXnzNG1rjXFYd4sb+gINqCoMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329615; c=relaxed/simple;
	bh=mMOHKFFZAAczlMc6WVTA48dAzb0rmPjbxJcYFNK20Dw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZnS7Cx8jPp8ymsn0THgi5ZM/gZr/hFHgMJilAiNIYQ1V48hgBgu43Y6V/3CQQIWzps3MR4gwRdZlJvLqo4DP89YCSwiWBQM9ARplOOdVeC7s9U9KWo/srvPKHMV59FrV1TPtTFwHtHNfL3BuKF5VShSUGKTrRWJx4jsdQ7ZM6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7ezCPs1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3674E1F00ADB
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783329610;
	bh=mMOHKFFZAAczlMc6WVTA48dAzb0rmPjbxJcYFNK20Dw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c7ezCPs1TAZYrSCWESJaoMLcN7mbvuewNN6WqS1K8nCCyUWtiq9uoxQTwZ4MST6l6
	 gnZdA5WkNUybFyOwehuwKN12VmkTgmIdruDyFpYMF15fd9RYQXQc8eC/GjfpHBou7W
	 Sn818PHsFiisEq/9dKZSXvRImRaPPLI5mikbVOHLQb64lvI46yCjxcb8EoBp6JFOBo
	 VI8xY7ln/KI99rBgrn00pUtF8FP6AjtvNdAVa+tKakYzPjscvKqMg4LXwx964med2b
	 saFog7u7XctdEnSV/Z0rLpTMZukWd33MbrcLAHrl5pJ0rJY88uyGykvi+y45uWMTkg
	 u0ixVO5MfXBiQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso23360931fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 02:20:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roj3StKRAGMOq44HriXTxu7HXZOPlYju6rpEb3Ikx/M2K/0ZkbJEB9p71xOmr07XBvk2mQbgdSTCQsx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/i1Qnb4Tpm4nMV5oxl8GYJEIMv61HOmXNJEKSW/KIrQusdxN
	WEvrIGw3gnoBoJIVTXEkTvrVM2HUiVmqTgXh/P/jAJJeuwOMfBixE+WsQP5jKiKzK1PGSE64NN9
	u7AOSOwGEvtR9lElfPr6OsaYACxWno0XVbwNmLdjE+w==
X-Received: by 2002:a05:651c:1141:b0:393:a31a:ab3c with SMTP id
 38308e7fff4ca-39b53cd3647mr17735411fa.25.1783329608951; Mon, 06 Jul 2026
 02:20:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 05:20:07 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 05:20:07 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <20260315014205.471d6834@ryzen.lan> <CAMRc=MeorQJvA8TBosjnDU+x-FD6GhkbXwXOjCD0nmCs16ERfQ@mail.gmail.com>
 <72ccedfb-742c-4af7-8439-0f37fff2853d@arm.com> <CAD++jLn0BSwS1CZ22CbZQnY4mKzikRwJrfO4sV=WVsSG93WzJg@mail.gmail.com>
Date: Mon, 6 Jul 2026 05:20:07 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfn_02MHq7+6a+EW3G3k-sBiwsWm=ZdgmRyUzzqxQ9wfw@mail.gmail.com>
X-Gm-Features: AVVi8CculI4vXkTb9WSQaLZ6xCxpZAUy7ZfCjLrW5Zsan3hxafIZ3f8Vh1j3nQY
Message-ID: <CAMRc=Mfn_02MHq7+6a+EW3G3k-sBiwsWm=ZdgmRyUzzqxQ9wfw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andre Przywara <andre.przywara@arm.com>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39504-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:uwu@icenowy.me,m:jbrunet@baylibre.com,m:andre.przywara@arm.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,icenowy.me,baylibre.com,arm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC79970F000

On Fri, 3 Jul 2026 23:25:16 +0200, Linus Walleij <linusw@kernel.org> said:
> On Fri, Jul 3, 2026 at 3:53=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
>> Hi Bartosz, Linus,
>>
>> so I wanted to come back to this, posting a A733 v2, with this patch
>> included, and was wondering what the consensus on this matter would be?
> (...)
>> So personally I am leaning towards doing the change: most users can
>> typically adapt - or they don't care because they don't update their
>> kernels (beyond stable revisions). And to address the naming
>> ambiguities, we could push for more gpio-line-names. That would make
>> finding a GPIO much safer and easier, and works either way.
>
> I agree.
>
>> But if this patch's ABI breakage is a showstopper, I would need to know,
>> so that I can rebase the A733 pinctrl patches without this one being the
>> first patch in the series.
>
> I am *FOR* this change.
>
> Wikipedia has some policy like "avoid copyright paranoia", and
> some days I feel we need an "avoid ABI paranoia" policy.
> Rough consensus and running code.
>

Agreed. Let's do this.

Bart

