Return-Path: <linux-gpio+bounces-35664-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCnXBex78GkaUAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35664-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:20:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A74813E6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE93430ECCF5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30B53DB638;
	Tue, 28 Apr 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYgUsocT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488A3DA7F0
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367365; cv=none; b=ouoZa+pApW8Ris+1Z4ggu++UlbnnJsXca2is4NDsW/v4XYRQwapVpb3fnVrbU13utylNMYdsGgUUWcCl74zAPoK9jjO0Si8INhVVWFjsH/GgngSn+lZvVC5oYYQPqPkWvyzJ9WXo/GTiWFAK2Dn+6wJnuBVlVkqpE6J+kyFwMb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367365; c=relaxed/simple;
	bh=morZQpxNKguhyxd1FSXh8eEZSwikKE219rmXsMB8VeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZZgcpW6ytW+suHKsUGYu7nqnY5a+A7GsKixeN/lTkGimExk8aR7jBo8vHlC8fQXVMaEkohIPk8D8cAXtjyBURtCaXjeDCqlwcUdF7LUjxwGbG70WqmgSDKpcYA4gYE3OTrfpF0TkbMPxi+lxvbBYyKq+b2uhbsEXhmauk6WPV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYgUsocT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72922C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367365;
	bh=morZQpxNKguhyxd1FSXh8eEZSwikKE219rmXsMB8VeA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EYgUsocTqZ1+cVjTwj7CzZXNcCmZ9YUX1GX7ZksT0T1NfcY9qmYLPvUXHkDX2NSCG
	 iM3L6+4RCowcI6TvKCSo848qBBP5RURVsa/bMITjs4VRLwP0i8myZsLCOmW4cqajM5
	 QB/Nqgu+/9+joNvGtVTiMW4FtdJew/CJDwNLXhRE01RESlLrZJYFTgzPYRlsI6rzle
	 uVolUMB5b1+QSsLpXKm8ybAnhk4OZ1ISyviFYvWA6CsoCIIE717EOue6NRBvl+8XXX
	 eS9edeF1lMQdLoKrSBoJZc0cK2ZCqtdkaQz4xbITW75IWicIocgv/V/JzitkVx3y9R
	 0DdG7Rmcz9LVw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38a01c80c34so109099091fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9hBC9v/8JHGBbkc29opKQ3NCV73qAxW5U3Zsy6fsHNUxOZo8FYwOQwMCftuM7e0MaEZI+khu00X+sm@vger.kernel.org
X-Gm-Message-State: AOJu0YybwoCZJeibuJ15OHWqliSzEbho7YftcMeJE1JpJxpy1drrzJt2
	lDYoOTaKPs5xD0+cduVw3+SZn3kN50CMB3ry1EtsxAzOkwBKBXtmu46/oUDKCi3JDHnoXDTtedB
	EryUGQdwXdKP91xXt+r+IzGrEzlx3XgQ=
X-Received: by 2002:a2e:8a95:0:b0:38c:9503:ebfa with SMTP id
 38308e7fff4ca-39240d123e9mr7636281fa.14.1777367364182; Tue, 28 Apr 2026
 02:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:09:11 +0200
X-Gmail-Original-Message-ID: <CAD++jL=GFEiuSt0BZyu-A=up0A6t4CibbB5Kb1Z42LBnYy+jCg@mail.gmail.com>
X-Gm-Features: AVHnY4I-uiea7zO1yDCH5W274CSwhOMexNWBf8Y4CxI5F4ifEaHSc0Iv7gpGkpo
Message-ID: <CAD++jL=GFEiuSt0BZyu-A=up0A6t4CibbB5Kb1Z42LBnYy+jCg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Enable easier compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 848A74813E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35664-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Fri, Apr 10, 2026 at 12:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Currently NVIDIA Tegra pin controller drivers cannot be compile tested,
> unless ARCH_TEGRA is selected.  That partially defeats the purpose of
> compile testing, since ARCH_TEGRA is pulled when building platform
> kernels.  Solve it and allow compile testing independently of ARCH_TEGRA
> choice which requires few less usual changes:
>
> 1. Descent in Makefile in to drivers/pinctrl/tegra/ unconditionally,
>    because there is no menu option.
>
> 2. Depend on COMMON_CLK for PINCTRL_TEGRA20, because it uses
>    clk_register_mux().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij

