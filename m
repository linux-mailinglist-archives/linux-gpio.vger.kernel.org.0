Return-Path: <linux-gpio+bounces-39847-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aFmmM0c+UWrFBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39847-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:47:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75B73D6A6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 20:47:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YEyVAHOO;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39847-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39847-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E44AA30177A8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 18:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5465A380FC5;
	Fri, 10 Jul 2026 18:47:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560413803E1
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 18:47:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709248; cv=none; b=HQpAaST9RJ6tJW8A35k+e36WldkzUgl/RzJvvOMiSwLqdlcH97Yy1/N43BPPtby8A0bj6O9ENMXwAgUlfoOkSVj/NRcoXRQ9wh8qhcaL8e91/xGmXbD9QKbmECEEIcnL/JUfWUDpREGN9WRKlt6tEct7lEDzmu81xDC1mUAgQtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709248; c=relaxed/simple;
	bh=z1ZBNO2TRdCdhhRC0m7QwsBmJLmdXc0xL499wmNs2L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuOt2EaIR0dNjx6jPyafELg/lSCzYBP69KZk0uqs+pTgqx96CtPjsH9QpraWJQKHSkadIipfVRAlOMoptS2x54pC7XRkVroHsCih+KMXFuxbZSDVHdsLM+4UOG9uxhWD0f4U2K5pMP1Y+RFYxt+hTZk7yEtUjP6YL6npGlN9Lbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEyVAHOO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EB41F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783709245;
	bh=z1ZBNO2TRdCdhhRC0m7QwsBmJLmdXc0xL499wmNs2L4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YEyVAHOOpoTel3P3MvYCmaLfTW26fmHilpsGQAXPSnz9jCL+z394d7Vyx1CrBZxEB
	 BLch5YkdsVPJ3hR8A2uIImNf0wuTCuaiwRwfbOGwgti4fDiUh9NEs8OD76eRV3GhAc
	 IMTlwuIhCMrwnGOllunlZ6bc0slGbBErNInCZ5yKlBsrSznS5ObtFJXkQi3fFF1CBs
	 8XTTxHo9SkVsJcf4LOelT7B18VVHM2+cn6hz6fz3BP0aA813NnBAnD6Y9DdnYpjhuP
	 O8d26q5e6auSYbWa2g0TsmiKZb3NGjGqGq6TMn/SKmYHiw+o6eTeOB1OWjTmZ9jQ85
	 BRdvZxRp8tFJQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so1667183e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 11:47:25 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxx+ZgPsIdfLpdtaJVbs6UaWMRxSV7/jfcV7VzW0HbO2FZTSfjI
	/ltocUWcszzU2Pf5yK9jsy0JUmie2QmsfO+XO59l7z1tgc+6aU/FVcVCkbQh3lVoAeC2KZhHYzK
	EUnwup9pFOigJ1QRhK6wvixiSTFeixbo=
X-Received: by 2002:a05:6512:2522:b0:5b0:d2b:f1c1 with SMTP id
 2adb3069b0e04-5b0236bba87mr77057e87.61.1783709243992; Fri, 10 Jul 2026
 11:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702231838.1175485-1-rosenp@gmail.com> <CAD++jLkY8AiiKyKN8FbKFRGp4i1=k6LuxE3ifcoP_MV6Vf_39Q@mail.gmail.com>
 <CAKxU2N_cAK_tcucrTUyXNSmSVuvAnfCcbHKGuWhEnY9nf=eLQw@mail.gmail.com>
In-Reply-To: <CAKxU2N_cAK_tcucrTUyXNSmSVuvAnfCcbHKGuWhEnY9nf=eLQw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 20:47:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLmpHu5_yXFH2fmKvTwtbYKpZzd0DqpQVNTLJvF=We49BA@mail.gmail.com>
X-Gm-Features: AUfX_mx6_pkEQPPIkwnKIoxLAOAyyiDazGU-TOFJ3EM5y41oFKWj5Z2ZVN5MnoI
Message-ID: <CAD++jLmpHu5_yXFH2fmKvTwtbYKpZzd0DqpQVNTLJvF=We49BA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix devres LIFO ordering between GPIO chip
 and IRQ domain
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39847-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:rosenp@gmail.com,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F75B73D6A6

On Fri, Jul 3, 2026 at 11:51=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:

> I have 3 devices that use this. Tested on one. Works fine.

Excellent, thanks!

Yours,
Linus Walleij

