Return-Path: <linux-gpio+bounces-38597-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QqEoG4d2MWrcjwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38597-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 18:15:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 06448691DA5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 18:15:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BVHda4QG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38597-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38597-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 623E2303208E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A12466B4C;
	Tue, 16 Jun 2026 16:14:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5644BCB8
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 16:14:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626460; cv=none; b=Idn822YtqFIYiJNtxGTuZIguu7VU25LenAjPoYGO7a6DkMCqDWKn/+QrO/QufP8Gp/3cmr4FXZriWsULx0XgaBXFStyOp+tXUmYRFlFBC74b1MUnsZZkqwY6mVpAGOOFikYTkXVyguWpAtmXENYbUOpN2bzwFMbCcxqDbkpeJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626460; c=relaxed/simple;
	bh=EAQw3UKn4KppMBnCMb2MlKJYL4Zr7xDqiYbKLp83X00=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mR6YxEVmTtNTtHmVStDE16j3FO3cDHFfb3YBY6MTu58/CQJQUvJVxMYYPU8CzAMDGP5/mUV87syuQa4S+EiAMfJC+EJc7EF62y1DqSx4ocqFsfQ93IhMP08LSxnnYm64nq6IK+fR4Cj4af5q9znkXnCOcTjtip6+W+MNOZTl+S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVHda4QG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373B81F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781626455;
	bh=EAQw3UKn4KppMBnCMb2MlKJYL4Zr7xDqiYbKLp83X00=;
	h=From:Date:Subject:To;
	b=BVHda4QGPFqRb+ga0c+EO8XFxJh/mcc8z64PFY1G0X29s4dCrr7EeFpKgHk75cuKT
	 DDB7VJg3BlY25e8LfLKdbpGWQ2KJn9jn/UhNikuSdFcbF50R+asu0eeHxo+hKvC7Wg
	 BImHmPxdH24+R56AnVkZGgHXTUXfunBAffUscDRM5LZyG1D/CR1hCNOW5LckMihnE0
	 +HWK6/N+yRMGQQ7c0If4wrmA4W2G95O46y7mt3tunJh4OGHb85HV7KiSf33E7encm8
	 kf3gTRZ9NRRvuyU7Q1/2fwoydYyIj/wlMYbejzDwscFnpgUI+pAxKPlTJTzqlGi4am
	 6aSwBBoDXwXnw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so4161176e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:14:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YzwFALgLJRFe0tl7cMBpr2pIG6Cv3eA89CjSSxeOHBOwysoi0gM
	KkbXwBdO3GgisPBDrMgtjMVM696fLRZDCwGoCv1J8FjQ5AKtBngJPJpyyq8dIPF3vK6xFj/rVLx
	Z3u2k3iofUe1LiIZmGO0erlorqiOiAgTuHL5aE0p0Dg==
X-Received: by 2002:ac2:51d1:0:b0:5aa:7363:820c with SMTP id
 2adb3069b0e04-5ad46fbfc61mr37614e87.10.1781626453939; Tue, 16 Jun 2026
 09:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 16 Jun 2026 18:14:02 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfgV0TbA-6cezd2_Hc2PLFchfZC_tJptrtAPwNHT_U2LA@mail.gmail.com>
X-Gm-Features: AVVi8CcIA2DpTvZLtJJQg1cNjKQAdY2tgtj-YpElYcBXnt6aXvGvFkolyJkyir4
Message-ID: <CAMRc=MfgV0TbA-6cezd2_Hc2PLFchfZC_tJptrtAPwNHT_U2LA@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.3
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-38597-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06448691DA5

I'm announcing the release of libgpiod v2.3.

The biggest new features are the change of the build system from
autotools to meson and the introduction of libgpiotools which exposes
functions previously accessible only internally to gpio-tools.

For the full changelog, please see NEWS in the top-level directory of
the source tree.

The release tarball and the git tree can be found over at kernel.org[1][2].

Thanks,
Bartosz

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

