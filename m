Return-Path: <linux-gpio+bounces-37436-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNrjJ/4MFGo7JQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37436-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:49:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5D5C8060
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 10:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9E693005D1F
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 08:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314EA3E317F;
	Mon, 25 May 2026 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJppW/yd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F325F3D667C
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698940; cv=none; b=IlMNR06ocIDj2ep1aQuaQay9BDWEL5AZ7FLQgr5XN/HKsb/NpF5P7iypv83lPUlCNbI5fi+dz3ipXvkmuv9nftW1v9CzSruH2OvXR906/YDuMUq7933QpOjthaYYucrazrw3cFRbrOxO6S6VLVr8ky8b+Y/bUckKzrxkACWjLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698940; c=relaxed/simple;
	bh=gtQuWTSxUSwTe1rnC1Bxe7ukjpoKqS4f+Z5r70b6Peg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVR1WL8ZJVaetaEWSZkCWPd/luMiDXqVQd3IHX5goIKxsOqNXWPcCDVj5QR6QiiIKioJQ78jkP6ONwdUN9aQi5DJgcLQLi+nrwXssl2tno+LY/OTZnIMBqrFlr/WI1nu6uurHfkHbfCdvmUmc3GK5CIDc9KMXu5UWH7qXekNIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJppW/yd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDB31F00ADB
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698938;
	bh=gtQuWTSxUSwTe1rnC1Bxe7ukjpoKqS4f+Z5r70b6Peg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MJppW/ydAq4+aqbVWJ3CYNAA1e8mfTFUs4rHAg+D6tuYfnBbo269TIKSLc78Znv8l
	 XkQ7JF33YPTSl7ljzMih/o8YDPcegQa2AEqrf8JMDeTfwUdWphgP5ksT5C0v2VTSuR
	 2sZYBAjGwanSXsAEZW7FGsJr5BE1nAC8fBpmxkjK+oiURk0jf7ZDIN4q5A/MKHMjmq
	 6EbUgDeH80ir6/+elbZDpIF66HysTHPc3Wd+V1pgE9Ml4t4Vj5NCpoSzIGsyeA3A+n
	 sl+v7do+xzv4lVucgQ7Ww6m0r0eEEdmLT0C6KSOs/r0htGp0U8mcT3J3YvLp5Lrd3m
	 WP+kmMmLyb1fA==
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-479ef2b78f3so8653700b6e.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:48:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Kzr+8h8Y08sRBZQgXdBIIklPydqlrkQsvRlZh1Lk66mYyIJwCzecDPbMhlsLMVbThPJ8xfKSRyZay@vger.kernel.org
X-Gm-Message-State: AOJu0YzM7wVbeI25jWdnl1UXe6Xb4/DR1zWD1ZdED+bt/Tpd2qB2kCTE
	OHATKTVNNh0qIOl8bifsUrfZXcHCzwTOi0Z95o8kMr2N7RRJbvWMPFrNKZg264cywh8Q9GoQ6xx
	Nb9Fgp1e3EfPI8z0MTHsZZEXjsg7RQG0=
X-Received: by 2002:a05:6808:4fe6:b0:462:aa0f:4375 with SMTP id
 5614622812f47-4854a3afb48mr8047575b6e.39.1779698938186; Mon, 25 May 2026
 01:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519164007.122574-1-gaohan@iscas.ac.cn> <20260519232154-GKA3708537@kernel.org>
In-Reply-To: <20260519232154-GKA3708537@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:48:40 +0200
X-Gmail-Original-Message-ID: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
X-Gm-Features: AVHnY4LjkE1u72Fg4ldi4cz_SRmret8T9tX1fPLbCSOaUNt9lHK5p1Z2W56miXY
Message-ID: <CAD++jL=gAXc0oRg3RJCuaH0_oDXJ39aShAXtQz0tpt339mFB5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
To: Yixun Lan <dlan@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>, 
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, Anand Moon <linux.amoon@gmail.com>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[iscas.ac.cn,hammernet.be,gmail.com,pigmoral.tech,linux.spacemit.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-37436-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1CD5D5C8060
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 1:21=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:

> Can you take this as a fix for v7.1 cycle?

Only if you can provide proof that it is a regression, i.e crashes
systems that were working with v7.0.

Yours,
Linus Walleij

