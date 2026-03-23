Return-Path: <linux-gpio+bounces-34007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J+gFL4QwWk7QQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:06:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA942EFAAC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3602A30C556E
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62B6389102;
	Mon, 23 Mar 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVs1kieT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F5927B327
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260026; cv=none; b=tTCktX9Je834Juuwl+WR+sD8FEtafFfBgRoNzd0JU3S/hKba0tsUvVM8KG8XR7Hi2Q0aOTQaWYS9MC4eU0HVVHtJC0VVlCu41Yj3cqqwvJKrgPbvkA2hIkS0ynPTLOD3twJvLCnGre8gdMHlbwKsXPpMsaO8zN2k/NXiJCnf+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260026; c=relaxed/simple;
	bh=2ZEySTGjzvEYD0+oL2rPnTK8VnmzmCs5n7mzP302FTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRDcC2ZDpHh6GhHARwDdybDIhqmdyHZllTFm++pQYsK1+ZzX+Mt87r54hAd3UIBrDCHCCxodqFjYFiRT/ZCmuNiG4a9/cMnbfyMMJ7l96fJtGhSSlySL91AR/+YEtXH7OL9Ms3fU119PwczGj74/v1Reqodla707hlvlPoM247k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVs1kieT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F038C4CEF7
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774260026;
	bh=2ZEySTGjzvEYD0+oL2rPnTK8VnmzmCs5n7mzP302FTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fVs1kieTp+H2uNPE3jgouhn5jFQgWlGCX26q7wIEgeiTaL9OHZaCoyHE+qpeOS9Of
	 9uYovcmiQYm3rJrq25vDW+iQCt6S33PUD9Qx7gpY9us7tD4HVe01ArhV4yhedyEIGM
	 +QIKpIIfjWItERM3onp/AMkvTBtw8/qDVzSNt5ZVS8TevgnZzys56gEwfs+NL4DrsO
	 Nt1ZdhFF4wQwgWxPMCpfTsAsdJbIZ3C8ZLn7kup7M2Gf7e5+CoKHAQRziFgaWzpaVf
	 OUMVS6u02vXMzMBDfedetqVcqimmb62leG5Iktic2XhcPpUOA6poY6uwIv0oo/65uf
	 LMENj03xX1Acg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a1443780c4so4103149e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 03:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcDMrpt3Fi5utXpqaS46L7MObMMIxTPKvkCNibxkIG/k0Gs8brQI0ZGKXWe4dD4LNdTT3ckLXhuxZk@vger.kernel.org
X-Gm-Message-State: AOJu0YxcDbsowHIC3gerRh4rpGvNhoDjmFRXF5uXb65X3LxY8Heazo6Q
	fwCL/hwvRazTkyTvATFkXFxF9QtIp+ORcntJgZavNpaMMxISsMxdgoMC/lmv2h627ArcVdWLXdk
	7eHJPGuuPnrMy+YlJtPMztyXuB0vwhYrDri2YFOq47w==
X-Received: by 2002:a05:6512:1388:b0:5a1:3273:37af with SMTP id
 2adb3069b0e04-5a27dde27a7mr4720127e87.5.1774260022227; Mon, 23 Mar 2026
 03:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319000558.22108-1-rosenp@gmail.com> <202603201104.8D7B8A1@keescook>
 <CAKxU2N8ZZp5fcCWfMaqZ9VKwNQ3a06fsQPXpBQa-d1N07zPGng@mail.gmail.com>
In-Reply-To: <CAKxU2N8ZZp5fcCWfMaqZ9VKwNQ3a06fsQPXpBQa-d1N07zPGng@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 11:00:10 +0100
X-Gmail-Original-Message-ID: <CAMRc=MctGTeqBHQ8zaQ7_2YAoWoTUxOK4_hs+-EHEQEPnz+A-g@mail.gmail.com>
X-Gm-Features: AaiRm52TiXiM-9nvry-2dIKOcPo7jhE_iD_zrDEUXC_8gLkLh4_1u8Idt1ki1O8
Message-ID: <CAMRc=MctGTeqBHQ8zaQ7_2YAoWoTUxOK4_hs+-EHEQEPnz+A-g@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: allocate lines with main struct
To: Rosen Penev <rosenp@gmail.com>
Cc: Kees Cook <kees@kernel.org>, linux-gpio@vger.kernel.org, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34007-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADA942EFAAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 12:00=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> >
> > static int gpio_mockup_probe(struct platform_device *pdev)
> > {
> >         ...
> >         u16 ngpio;
> >         ...
> >         rv =3D device_property_read_u16(dev, "nr-gpios", &ngpio);
> >         ...
> >         gc->ngpio =3D ngpio;
> >         ...
> >         chip->lines =3D devm_kcalloc(dev, gc->ngpio,
> >                                    sizeof(*chip->lines), GFP_KERNEL);
> >
> > But this begs the question: why add nr_lines when ngpio is already part
> > of the struct:
> Maintainers for some inexplicable reason want an extra variable for
> __counted_by works.

I believe what Kees means here is: you can use ngpio for __counted_by() lik=
e so:

  __counted_by(gc.ngpio)

I didn't think about it and I do prefer it of course over an extra field.

Bart

