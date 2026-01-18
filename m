Return-Path: <linux-gpio+bounces-30715-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2DD39B7B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 00:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C6163006A55
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 23:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880AA323416;
	Sun, 18 Jan 2026 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0QESCk8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF831328B
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768779988; cv=none; b=E67cIx2fB1ShwjYSDTMLDmRDgOuw9xq3Y8IZTmJMzFTGlzeoqNiMQRYfSSKa2ImEwfC/CmQJYa2UwzCtZBxzO/it0rmJ45OWuQpNms7uvKPDOOAGLIJCMpbdk9RcioHetbNkwvSK+CQ9fLHgElURENjJXQoSNKyOdp1PQEeBlYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768779988; c=relaxed/simple;
	bh=fmJuw03++MrtIEVUfe9zccVFflBW/PgCC0Emo6+ulTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+YSM3QNRvDdulB90u0G88EsXdZQLpHMzkpKUoamAQhVUv2bhc7Wc7Ns15fZ4f25cKCzcn5Q3Gm0GlfIR02dMHj0amqm8ZGCxEcViqmT/IChcJ4narYKvic0zSVYnK/53yJKYmWt1+LzzyLJ9cow92A3erxCQP8DzcnNcUW+gaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0QESCk8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF227C2BC86
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 23:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768779987;
	bh=fmJuw03++MrtIEVUfe9zccVFflBW/PgCC0Emo6+ulTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F0QESCk8sIvqMm8FSVt1pds8W23KZcVncdTdZ6I2xZxBHSAq0b1EU4PG4p5/YzIks
	 PuJVeeED/TRSWAKYsuhXjROsUZp3Hn0MN3pHIOXlwQ3VCBHmIUThCG42T98hb9sdEN
	 bKOdcdfpiMCw2BfWd5FYaqPvu8bcq/Tig3zALy1GiqKOV6OlabXThaMS9tnGrj2M/p
	 2+6jXcMCuFCJQTo4BysNCgKx1CalkcQIH1w1RD0S1KUI78abVDfcy7d2ClbqpYHupv
	 1353m4+Ipt7TPFxscSja8aLDAWK/3IVYPwUA0aHJhVfsG13W+rm+Ke4QgtDs+yiZPu
	 af+VGrySImrbA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78d6a3c3b77so49377697b3.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 15:46:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwChaEXvRObmMNtffViYyPYMX5T7GKH/vjhr0AzCjlQKLZawdN8Tr6TfxwAxBd9SuQwkYSSYuGGrpt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/90sYuwsbe/2ok3tN4G0j/9zJukNFWEfNO0w2zaSuImIl5zG
	bDap6K939p/jASViVTg0qYrwNGzwyVpkkj7/XVVzvLIhqc3qsZAqfLji/2PIARH8u/SqKulFh1j
	EJJhJX7U4wKJG81V9rbruqiuRVwAxx4U=
X-Received: by 2002:a05:690e:1883:b0:644:5166:3065 with SMTP id
 956f58d0204a3-6491692f165mr7106290d50.21.1768779987241; Sun, 18 Jan 2026
 15:46:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117180615.10368-2-krzk@kernel.org>
In-Reply-To: <20260117180615.10368-2-krzk@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 00:46:16 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5q6gvy0OEG5H4VY6=NJwpdrFk6hyPbhc4vBRAD3hvEg@mail.gmail.com>
X-Gm-Features: AZwV_QjiBOvy-Nk8tBAVu1rug7zhMUrm03mPDCdZcDEnZnlbNgNLxRql5ih_ybg
Message-ID: <CAD++jL=5q6gvy0OEG5H4VY6=NJwpdrFk6hyPbhc4vBRAD3hvEg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.20/v7.0
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sylwester Nawrocki <snawrocki@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.20
>
> for you to fetch changes up to 8c483209a6fc71a555fec4a0c99b05e46a5bd38c:
>
>   pinctrl: samsung: Add Exynos9610 pinctrl configuration (2026-01-11 12:1=
0:29 +0100)

Pulled in!

Yours,
Linus Walleij

