Return-Path: <linux-gpio+bounces-34866-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O0BI1QF1mkbAwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34866-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:35:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E63933B85DD
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AECE5307F56E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 07:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B513822BD;
	Wed,  8 Apr 2026 07:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb/M7KbJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5833815EA
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633295; cv=none; b=QdvudLp3ml5Ke3v/yPnvbJ2HV1PN5MUsg2HeUdt8ILaR0d/FMYYpzBcDZ8tIWUPiYB/OHlfMJM7vElEJBnh/0IbcukOn9lc+XffteB7JYkLMNHmGLgKLw8fQK3JvtFg2TMC4AKER1NRJ3UPJQ+yRnyJScaKwJTqjs5MCF1iRit8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633295; c=relaxed/simple;
	bh=Nw2sk7Q/8E3OPh452L0/yYYa8JTilVd+ogYqqiYq0Jw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDhhi9k356WDWgNC8au9PpeggrABE4srKLpcxSgy8iH3nMa98ccy0tTaKUFu4NCEtDGGjL40TVBsqzSbHNjAxaVvFp5UnIUmUKACbRvA+ZSWHi54rvqFyGgKvJ9IQy/pRNG4uiOLK/l+KxeVbntynPQ0e7HxqmFfkFR8q+wOybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb/M7KbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1431C2BCB8
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633294;
	bh=Nw2sk7Q/8E3OPh452L0/yYYa8JTilVd+ogYqqiYq0Jw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jb/M7KbJrHNmO/tvpkrm33X6mgjuE8dRuYOuvR2qVgn3gjPyyw8huPqxoMpGld33/
	 fw3tbQ2nB5xmBn5aKwW0jjQdlwYNgOamZw7POVAubtIPxMEJwRpEVmi3jMaTEEdcWt
	 4K4RE0dAsYAltsP4Mxp+ncIAnR29+ePtmfN/bXmC9wA/eD4iAV6PzuJ8/IrxQqQ0fV
	 1XwSy0k3sgq5uxzmSEvRbzjMCT0UpBgZm/+1tHFjO/9x7sVX+XAQwwHQBqYCqWlHn0
	 jZMjSentcvn+Nj8NDLdK7SxQSjXbQE5JJSo7vHk9JzVLZrEJucevlD/I94qK3/uqaX
	 FaC+VConRml/Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ddd8d3b7fso32081671fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 00:28:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YxT/FCmEGW4hwytvfZXkWtrrTkIGHmZQ9V571WiL7xH8Om2v4nt
	NZTnLoODsxOMb1ePwOnPd4k96d70ya59osNinnExjMiyTmdwR8uhngbYXrSBlUwMu/NLRrqnX0K
	HmwzFzN3Fs+10G1Ta/qr0Pm0SYIY1PDejmjnATLr6vA==
X-Received: by 2002:a05:651c:3243:b0:38e:21bb:b2ad with SMTP id
 38308e7fff4ca-38e21bbb6d6mr9408481fa.2.1775633293381; Wed, 08 Apr 2026
 00:28:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:28:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:28:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260408025243.1155482-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com> <20260408025243.1155482-5-eleanor.lin@realtek.com>
Date: Wed, 8 Apr 2026 00:28:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+7aYyXFXjZBrenWnD8bgtyjHVWxK9GxA_U9tkrjih+Q@mail.gmail.com>
X-Gm-Features: AQROBzC0LREM6_b2VQH2egdCf2epMV8TXGX3wPxZfvA_VFti5llCq9nyDHkaPQM
Message-ID: <CAMRc=Me+7aYyXFXjZBrenWnD8bgtyjHVWxK9GxA_U9tkrjih+Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: realtek: Add GPIO support for RTD1625
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, linusw@kernel.org, 
	brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34866-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,realtek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E63933B85DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 04:52:43 +0200, Yu-Chun Lin <eleanor.lin@realtek.com> said:
> Add the GPIO node for the Realtek RTD1625 SoC.
>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

