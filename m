Return-Path: <linux-gpio+bounces-36615-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nu8Lqs3AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36615-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:10:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920451589A
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 959723026C17
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EF537F8BC;
	Mon, 11 May 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtRLjEUc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B6937F74C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778530049; cv=none; b=Ntj5XpHGlbir2oKySkVbo0MAL6aFFVNjG2ff2xmNUvtLB45GX2Lqo0P75VSEC9o/ECiMjJVv/hlJXrAAS+053jZqxyTR+DQT3AFu8ZwLFT41fVqiBchte3sEwQiHVHsb1zx2ykb3B/HoDW4J49AXSyUQq6PrAqA/FCmjH/NTlSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778530049; c=relaxed/simple;
	bh=z3StXrf/Y8Fjgai3Xz4q4aY0xI4soTMVazgB2FR/ohE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efds4ytBhroQMJzHwfbvrE0FqyJP8BvQit/EYI0lWSD2ZjTZ9g0dFruy9QTLubTq5lLOqEEfy3x9mIZjAstubRi0bPLxqBecOXQ3hpHGqc2OilU0sn0wjnYvTnUVChLveGbBtAkHEFmiXmp/ZdLPtDWm26iI7/qQ3Cegkg/2IAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtRLjEUc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79072C4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530049;
	bh=z3StXrf/Y8Fjgai3Xz4q4aY0xI4soTMVazgB2FR/ohE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YtRLjEUczF4nFiXjOy7aM5keSiaCgSsffU+q6N9/aS7Mqa6nIXY++VUfhHIwLYFOs
	 2CoxW3wahxZsnyNmYCeGU5/ZXcr6KQy15MXhG1t5P677TUCzH2E1NgCRb64zuttric
	 /I5amM6bKXkkUe40w48ds8B641MmVRHk5KNTcB5PpQg+JgsBkn/NwBAepNkfUB/h92
	 FSBh4yMNGvebqWwk2uEYM3UPVya/X/rLS6S0b+h3f2nmXidQolJDAW8gzZQwrKmFCx
	 WmQMZ8G/fEU9R/LZtOjgXmyWTrZ0zKUNuvJqT1twkggcBWth2CsyMdGBQagpDv4ZPI
	 P/Zzzc0wQX+Zw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so1646547e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87ntBasOHHNqX4+UZV6pPRgDyDpuxmVPMB4uF8ZpzE91h8NnW1zAVG3mhIZT6M0wVMxSbZkbPWftEx@vger.kernel.org
X-Gm-Message-State: AOJu0YzajgyjJ4j1YTPlZ9aQqG2ilKRbnRnx7OnrmloVoJ/pbhe2qjVw
	RXLsfh5Dtgjg4uRzRaFl8MlsmvnDTui0Dt6S9lXT0ZJjRweZwe2oLbovD4mUECjW1RndFQJMFSS
	QMKhdsGtaAmCXG+hQcmtFYhCvYXUyhpU=
X-Received: by 2002:a05:6512:68e:b0:5a8:6e82:6845 with SMTP id
 2adb3069b0e04-5a8e0f353ebmr296090e87.22.1778530048209; Mon, 11 May 2026
 13:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505122412.59208-1-thomas.weber@corscience.com>
In-Reply-To: <20260505122412.59208-1-thomas.weber@corscience.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:07:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=mojqaZQ397trp99d7yezdJ53Xw8ZkOf+8J6Lk1drgOA@mail.gmail.com>
X-Gm-Features: AVHnY4Ji4XOBOsk56NtDncHVDGDjJsCHKjiwcwiAEiGFxBaBQzWTfdGjCs8FZ6A
Message-ID: <CAD++jL=mojqaZQ397trp99d7yezdJ53Xw8ZkOf+8J6Lk1drgOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: Fix typo
To: Thomas Weber <thomas.x.weber@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Thomas Weber <thomas.weber@corscience.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3920451589A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36615-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[corscience.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 5, 2026 at 2:24=E2=80=AFPM Thomas Weber <thomas.x.weber@gmail.c=
om> wrote:

> STRENGH -> STRENGTH
>
> Signed-off-by: Thomas Weber <thomas.weber@corscience.com>

Patch applied.

Yours,
Linus Walleij

