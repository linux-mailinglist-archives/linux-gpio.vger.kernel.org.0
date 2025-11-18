Return-Path: <linux-gpio+bounces-28712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170CC6BEF6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 00:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A35D62C328
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 23:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9790E31326A;
	Tue, 18 Nov 2025 23:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y32dU1QF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A330E837
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507057; cv=none; b=TbQRTZQFH6/hr/NRt+aZ3IX1Cv9YFUKlEEaOfOOlAzCtfLbief1KbL70p93NCSOxbtFgdsR1eddYkg77YfpQ7DHf9gIr0N30y5VrIHxi0zqxPbKp11I678p6Kv9lFY+63+gTrb6kWYpqWOzHAAu4OybVAvhFkN62QuH5vetfo+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507057; c=relaxed/simple;
	bh=/ymX6MZbOGP8Rnnx2h10YmGwYTYivcCZihr8XRtlTxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVHlb4RG04aEDrDXhsqQC2WeMwBdh0GgLiPAXcMyl4ZTOjMjY8L3wKtv/3hHnXqdqGUeB+kmq6MKg8JFZmBebM0HNnax4ZamsBD0kOaVuAQe4tbcxTuym/mTHcmp9SmCOhSpin5v5y/7qwzigMdWEZRJ4C6HECHKJlz2tk99Pfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y32dU1QF; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-640e065991dso5685183d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763507054; x=1764111854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=;
        b=y32dU1QFSkSTteY3CJTFNeJkXo03eIrk6uytwOzInzB0HZY5k4f9kpTDH2rOK2JrlJ
         bsERqztf1x+IRmqt73BwfKjSHc3KvmeBMyh4/PqcUW0eGSz1oPZKYyoXB0lrsrUd0zgH
         V7xOI5spBL0JX9oQM4K3ztLwhH4EjtixSNQDm6iWT6zL6SKF1/vVXK+m4jzMq3alTglZ
         Bxk2+losQNjRB9YX9wG6lWsSrWwZLjZtsQl56XzM843/jFGyaRuB+bj6B23qFRdLSUyx
         nIxGVFj+WNwl2fE//AC76FRGKcegvA0ZSSAp5mzvBlvo2l59asKVreB8xZcq0afpitLd
         uo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507054; x=1764111854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DpyxSY5WvJi0HmvpcS1llhG6ee+xNYXsAMhYQ5ST4Es=;
        b=Rf0aHqBfMShkASRCfHVDrZUmG6hFMXH35mwAqXRBDUZWYYPNRGYskPLQjSoUHzMiPG
         vbHbwS+2q1P+RqYabpsvtn1fM0MiUTE5hFbY/LcLy4uyoyGf5nK3FQXfU7nP69+cWWBb
         ChcXctzmkKKMVXBqycT1CxnVoKKGcgq9KpMgq6XayPytfw3zsGH0njIf0xsuW1+Md6MY
         8k9g85zwMDmtMjJQmHt5kczFRkLtVIlDcKQqbXmFatA8QFNf04MjMZUsvamynH/DqXx9
         84WltkqWQDSnSoTK1gJbv37g7XIV3pl/rxWYdrKfx2b7GtD+Szk1YC+9rNauiC4d6heq
         aXxw==
X-Forwarded-Encrypted: i=1; AJvYcCWnfBo5qVJwXvwcXXH8HmHTQ/76O0Rb4oYe6kOjFXzusu97D1km0yv61+0FXyHZyjz4Fl8I79TP//iI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4e18ELvRiDC8C3RPLuZDR24q74GukVPM7b/hLVUEvHux76Cjv
	gq3fMpXCwq+N01tJfdqc01RZmgaYqeA0c9tlZ5y91Al4mgV38jWjhRfma/+VyRW1PPJcAV2639a
	MbP3bQZ4RJoH8DDJVUyyxP4AYfeHx0i9R7t23VGlIiTJmY3hMyWLodqw=
X-Gm-Gg: ASbGncuXY4ZcHB7CSclUm1rW+2IHcme8PJprhk1zF9XQG/1yygeUdIo/yoj/nwujI/T
	BEXH7DPR5Bb6ZsYBkQkbd1ee64U1lml2mMFG/Ht3+N4ErTcjf8+zG/hwvPpgKXOX0rp7uKZr1ym
	gD/YGRmcEwDkF1fLZBbo5dV+3QITkfxk7cvVDJwKWikZiqwIeFAzduiNjXBY/WDXJt2u8V4I138
	pEfzi4FIWx6Ns6nFyjwrv9YvkZmkRsyVGbco+8tZ43ZJA57XsYLOzxYwjzicEabi47a/9uOev5y
	3M3xKg==
X-Google-Smtp-Source: AGHT+IELB+09mf9khX/1UFEnPeAm1lrX0fgELMFuofsGX4R6IFFA6KPF6dwvDM7AxfFurD19MW+eZHnF90lveBd3oI4=
X-Received: by 2002:a05:690e:155c:20b0:641:f5bc:6984 with SMTP id
 956f58d0204a3-641f5bc71d8mr9451804d50.80.1763507053863; Tue, 18 Nov 2025
 15:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
In-Reply-To: <20251112-pinctrl-airoha-fix-an7583-drive-e2-confg-usage-v1-1-d2550d55e988@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:03:58 +0100
X-Gm-Features: AWmQ_bmTrpDRkDleDNb2XMlOjcgLl6u_OW5kVkCUfJvH2chNj2IWVVvyVcdyP9M
Message-ID: <CACRpkdaFq9PBxvxG2t6xDTN9M-7psvo=VDTCpu_qhvk30zFrMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Fix AIROHA_PINCTRL_CONFS_DRIVE_E2 in an7583_pinctrl_match_data
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 7:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> Clang warns (or errors with CONFIG_WERROR=3Dy / W=3De):
>
>   pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinc=
trl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneede=
d-internal-declaration]
>    2064 | static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2=
_conf[] =3D {
>         |                                         ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
>
> Due to a typo, an7583_pinctrl_drive_e2_conf is only used within
> ARRAY_SIZE() (hence no instance of -Wunused-variable), which is
> evaluated at compile time, so it will not be needed in the final object
> file.
>
> Fix the .confs assignment for AIROHA_PINCTRL_CONFS_DRIVE_E2 in
> an7583_pinctrl_match_data to clear up the warning.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2142
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs=
")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Patch applied!

Yours,
Linus Walleij

