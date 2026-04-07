Return-Path: <linux-gpio+bounces-34756-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAO3ADDP1GksxwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34756-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 11:32:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF7E3AC0A2
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 11:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444543006947
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 09:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821483A3E63;
	Tue,  7 Apr 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDiVy3Xh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D839B49C
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554113; cv=none; b=nhl/yey72U65CUIp2v+tTXrWpL0M3MIVX7eOsi0zDHzmpdiYBVuurFY9rjJobMF3ICjeYB2nkoA5ey4tTT9kH77I/XvEaxoDlwnDk1mDHYBdMz+LtwX3x5LyDt3IjBUftuXU/C2ha+f06L9LNm5Hm4Hiz0wk1m78W8zblyhCy/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554113; c=relaxed/simple;
	bh=KHMnmQbt0lZxtHZIgo76pMcCGA1YYdllDCarycWPQYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmUviWhLk3gn8B0GigGyPecijl4X3D9t6zX9A20wNhEvh7ND8YgLFu+SUV7NLAxxx0GYAR/AJfoutnmC46/a+dhrJFSefKFgsK/3JxojsYVnZ/4lfwmYapg6zRAWobIXRGIkB0gLolpI3xaiW2OTuZyZN4YuC0Fqv1k/YWAYRcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDiVy3Xh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5974C2BCB2
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775554112;
	bh=KHMnmQbt0lZxtHZIgo76pMcCGA1YYdllDCarycWPQYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UDiVy3Xh5C0WSHybz0A2cGnbWGsJZUOXA4o22XsCCT/JjCs4sL+l1YO7u72nwopGs
	 G59xt9qa2mVWa0P3RNNLVQloW7pWr6kSPtetDExRhNGMKXO0rXiw25ud0va9+X4HnR
	 kbGjdudFqzSsAdJ/8vqKMnlPqoqhXY9ELOXTUshLvBDFxXQycAsN1E6tyLiQ/bJghk
	 YEfB9hyMUtHKI7gQtL5Vakh8YatgLwMvrcvofh45oIimtAVe687PhOQpS4Tpze2+ti
	 OUrOWUOPf42rgvDi5MQJGCnKlHxnwzw1keouFieydWg0cLM/GBZyXzHIMYmR/OWqvF
	 Rh7oVBTzBRLHw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a74765703so37507897b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 02:28:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtfwNqWpKDeIpXGYLnaaYsrwBKGZlt/pN9shH1TxRrBlzl04kX18M2jLYO3p3ZDqyZwUMb4k34LMMP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4qQpjZMTDXi1BnHegSXlLlZrmoXERn2FEzUWmZRUdfgoAOGHh
	8cBVxTLJlG95kkop1qQBqtemFOs0xqGMuJAUqxA3s2rmZ06BXiCyvHPURwW7VJ8cmXEGIoK09EO
	pO623/pF7yYoRwiagaMbokcjbhvE0YZI=
X-Received: by 2002:a05:690c:e3ee:b0:79a:c7f8:d992 with SMTP id
 00721157ae682-7a4d547139cmr152458047b3.27.1775554112362; Tue, 07 Apr 2026
 02:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401003552.363205-1-inochiama@gmail.com>
In-Reply-To: <20260401003552.363205-1-inochiama@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:28:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-Zm_68oPXfQa8SLpHjshDVb42gGoO3gtdc7ffFa50FA@mail.gmail.com>
X-Gm-Features: AQROBzAF5HcTwzXIbBLiovkClRCUSF2YpBWcAp1u3m9JbTreP2LfdulA0gTQnhc
Message-ID: <CAD++jLm-Zm_68oPXfQa8SLpHjshDVb42gGoO3gtdc7ffFa50FA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: sophgo: Fix SoC module in the module
 description string
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-gpio@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,lists.linux.dev,gentoo.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34756-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6DF7E3AC0A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 2:36=E2=80=AFAM Inochi Amaoto <inochiama@gmail.com> =
wrote:

> The SoC module in module description string is not correct in
> pinctrl-sg2042.c and pinctrl-sg2044.c. Fix them
>
> Inochi Amaoto (2):
>   pinctrl: sophgo: pinctrl-sg2042: Fix wrong module description
>   pinctrl: sophgo: pinctrl-sg2044: Fix wrong module description

Patches applied!

Yours,
Linus Walleij

