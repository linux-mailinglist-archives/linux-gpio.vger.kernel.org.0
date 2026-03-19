Return-Path: <linux-gpio+bounces-33821-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMn2NqcDvGmurAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33821-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:09:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5412CC6EF
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 15:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1567D30B8E74
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 14:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61AF2C21C1;
	Thu, 19 Mar 2026 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ootwNNm4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6891C2E1758
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929229; cv=none; b=tIenNjnCwXj3cIKmeS/LiB3nb+878Qzxd0EucKhNwMVZFTALnlqfTjbZ72sC3HsTzJkRqb1qsxtXq4aHRQqm7LfG/fBnj8bQltrJdx7XVLMclOs+8Y+B4PEzEKYHAvZ2GMj2d+UI9sd72HIxfFf26crTnR1SYIDBAmesWw5aBKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929229; c=relaxed/simple;
	bh=2qZmPjwf9sxJxy3MIbxj/C2IpScaTeLYjR+ICQrWCi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtnYds1xahutVHAdsQLNIU+w6uzCtrvG624qqHmZcFvps4XurhBxgewP4i6TvwfrGu4yHJxy3JxJAZE/ALAVy3vAH/7lZGX8Izcfs+KKB3fA+oIj1C3llkkhCwEJVEM1t7Vpt+siwHcm/3NIYqwuxMCJyz5RDLml9I4rN0CEfBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ootwNNm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49975C2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929229;
	bh=2qZmPjwf9sxJxy3MIbxj/C2IpScaTeLYjR+ICQrWCi8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ootwNNm4cuQxYY4EJRwzOCAabm63S0eKokeqZ0ji686cHJCQmo1YwIRPncnFpXhD5
	 Hv4IVZ0w5vdWtUb+CIuIUjDPY45pSfruqBJZV41WyE0LZSgNzndGqulgugmT6hr3uD
	 kYgP5ab58lgplsOMNHjUfoGb2h+HWHQXBURkEgDS1FA6YfxijSbA8QH7uC8nHyRIAP
	 eZ24RTjHBRvyqdIrIjawFcypJjx8lZjodzgdCfLGQ3cKz+iEV3MGSegtZp068OQ881
	 OwRq3o0wu+lnqHyNE3zoWp3X6p+DhCYdATKJ4ozgAPF3kKufzmvJVeq1cRvMabgFgj
	 qt4kOfXi1KQZQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3878de20527so7351471fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 07:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1PeUiPaHm4DBpQOD4IXzebk5GSzzQIBPt4SGulmHHA9YFctqcn8MWvGkJ8u7qCYi+ZerGQVu1gBuY@vger.kernel.org
X-Gm-Message-State: AOJu0YxrFliwoYPViZcl9B+roodZK+1pECcJR2Y/pV10g4uVGflluaGI
	oNZ/+77tkKKlCHgnYfcnHxQ0/V3KHHomf8KYP437PV/wlo+s/QEN0pZgcilqp8tAU2AzXvU1E/2
	l+FQHgWH+6vXIjl36gXnRaqJq8KdRhf8=
X-Received: by 2002:a2e:ab83:0:b0:38a:7fc1:8da4 with SMTP id
 38308e7fff4ca-38bd57d7b01mr30183221fa.13.1773929227663; Thu, 19 Mar 2026
 07:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl> <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
In-Reply-To: <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 22:06:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
X-Gm-Features: AaiRm507880ksTyPae_Tfo3kI5iCdDkoO5nmPHO2zqtp2PgnkBXyA4BbQFNuT5U
Message-ID: <CAGb2v64mBzT0_4a5qfDFVzSgZQkmkyi0TLz9qLWVtUnsG47TwA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Linus Walleij <linusw@kernel.org>, Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33821-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.890];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	HAS_REPLYTO(0.00)[wens@kernel.org]
X-Rspamd-Queue-Id: 6E5412CC6EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 9:46=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Sat, Mar 14, 2026 at 9:10=E2=80=AFAM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
>
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a=
.
> >
> > The issue is caused by gpiochip_lock_as_irq() which is failing when gpi=
o
> > is in unitialized state.
> >
> > Solution is to set pinmux to GPIO INPUT in
> > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > earlier.
> >
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>
> Should this have a Fixes: tag and should it be applied as an urgent fix?

Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()")

> Tag for stable?

The original patch wasn't tagged for stable. And it doesn't seem like it
was auto picked.

> Also: is there consensus with Andre that this is the way to proceed?

As Andre mentioned, the mux value for "disabled" is different between
generations. So we likely need to make the value part of
|struct sunxi_pinctrl_desc|.

Michal, can you respin a version so that we can get this fixed in the
same release?


ChenYu

