Return-Path: <linux-gpio+bounces-33455-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGj3DSrGt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33455-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:58:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3C2968D4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8004300D609
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 08:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D335738237E;
	Mon, 16 Mar 2026 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK72yUXG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9713A3822BE
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651488; cv=none; b=svaOoqEKnx4m9wKv72PLKhWz2EgxvzItvqOvB6qqTrbVKqOgg48ttNyK8xtoo40vPs4/mo03vgYYC9QCITg+TVb4RbYSU7R7QNqwroXuUX5LC+DuIN3bYDPvyuByijN9gGnVMrmYvFHzsw9sMtRcCzF3IpIYvazkceWlJSmgWsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651488; c=relaxed/simple;
	bh=Xrqp7+ZTON7tToz6aNC24iOvKsh9GgFOE83zf6zrmR8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPyWSDcvx3N/+rLqyMdd9JW7JEpDEPi5+W/kMmfDs9H56mI1vX1d0r+x4YbrFT86ZWqbPMJAJUmGwpPrBzkK8kA+znUxSa/34eLKAF6bcOGWXolLRxp7FNP+GLFRoihwzA93GrEX4V95j4Y5+SVOQ5CtKJjXbD2Ce0Tqde82yWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK72yUXG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB56C2BCB0
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773651488;
	bh=Xrqp7+ZTON7tToz6aNC24iOvKsh9GgFOE83zf6zrmR8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CK72yUXGo/RKNxt8hNaVYvc/s6yk0NFp9jJXnYr/r8SmE0rScYifpE8iieLrgewid
	 227SbnerXpGQyaL8kHoaBV3MR00x9p3FoLu5SdVqSb1hKOFhdrG+/d/smMV/tBIRNR
	 DweQLBioP+WuDqdRUL370Qb4BS4Ko1EVCrHUSLRGSFHT3t8md0nWeFbcYBcnnNJtO0
	 DsAkMfR6n/oGWp7oVVTJo5nhgZXZgpvG48bHPweMJPC8RjCt4V6WJoleqGEfst2p9o
	 Zh7yFJcTkaZCSgBkNjfVzYzPyCqswH2PP85qZQf4ftZOC/hEjLdqysBEK8Rdrz/FJt
	 N4/KSpx6BK8ng==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a694a3cf9so35120331fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 01:58:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeoHMYfQE/FwYVWLfhxjl+kyt5dSuAxm6n85K2gp5eXNkzcHKkDrnBGdRObGMiTOtVoszjw1TvBb3p@vger.kernel.org
X-Gm-Message-State: AOJu0YwbQYaYiqDh5D+2eWe6E+t7gBlRMKji6+TtP1yU/8x3XMVFW15d
	i+xUgXDf+Uq8djKPi9IQ8BSntdiEFel6MTshynMJezM9QJ/xurhtz0lG66rwItn8x7uwCWdWotf
	2sbvCHtjaFMZXuT3idUFcZqZ2QrL+aO5lBOO0RzaPGQ==
X-Received: by 2002:a05:651c:3249:b0:38a:5584:cea2 with SMTP id
 38308e7fff4ca-38a8966bdecmr37316671fa.3.1773651487163; Mon, 16 Mar 2026
 01:58:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:58:05 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Mar 2026 04:58:05 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org>
Date: Mon, 16 Mar 2026 04:58:05 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc4rORyJa1LnrjPMVioCefXeNLCRNNSNV058UMz4rfqNw@mail.gmail.com>
X-Gm-Features: AaiRm51lW6Px0eBUx7EII8q3viL4R4oC0OcRtxpWJA3uAQi_CVx0hNylNFFye00
Message-ID: <CAMRc=Mc4rORyJa1LnrjPMVioCefXeNLCRNNSNV058UMz4rfqNw@mail.gmail.com>
Subject: Re: [PATCH] mfd: arizona: Drop legacy irq_gpio handling
To: Linus Walleij <linusw@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33455-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8F3C2968D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 23:53:27 +0100, Linus Walleij <linusw@kernel.org> said:
> It turns out nothing in the kernel defines this platform
> data entry so just delete it along with all code handling
> it.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

