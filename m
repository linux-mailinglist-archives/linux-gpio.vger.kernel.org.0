Return-Path: <linux-gpio+bounces-20377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD04ABE765
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 00:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A6A11BC1BE5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 22:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A800D25F7A5;
	Tue, 20 May 2025 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U0COWbjy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A25213E76
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 22:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780937; cv=none; b=U/PycbxAF76yflKL0IZ9F2505/3czfMQdHN8GtDqcRVxqBWvnUoMxMgaVlj3OjiCIWQ7b4WhXIYl0Oym5FY9p37t0+mcib7LLF+tE1985QAS+0YdXQAPr2J50CeF1UT7uTvi+9AcWBNe7jceeqTm4iT/dMSURnoj7TDt2ajBvhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780937; c=relaxed/simple;
	bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaPlQXzGTL6C0fXn6slZd45mu7HaPWQa/ho2mF+bcSrFdJIXeeDVSfzAERfoVtQzjDKE6osZKO7t3Fk6W1pGrYKdLmM0EWUrTQuXCA4aClC+rd90gJZIyuqtDxoqY681eYUs3HCEY4jS6Yesk1oglJfOTbke7dcfb+QgoQWSK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U0COWbjy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-329119a3a8eso32015251fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780933; x=1748385733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=U0COWbjyNECRHl1cur8aqhDSQ7FmsyklzbRM8AC8XYrjIjuUysuXjW1OaV4qRCYs1u
         tu9eCeBKf0FqnopXuNaGjEysh8jYZyv5KmKMkp9e0SYbWLz6Bj+n6nfSnw/msNesI4F+
         DCAc2NGfhNt1OTGfYqMZ58L9YazZ0uUJWMDjy8LV0eM9RSHeQyfvVH6iT7DmcZqLj/ha
         +N4pHwiIZYwkabUjsRslz0jr7H62D2gteo0RhNylDVwCxGIzghnv6E2d5PhKrQBTaAVa
         FvY4vjyH0gEMoDxnzMw7Tv2jsRimFjI01A7xxuFp+NlBAofmtlvOz1nC6dC79rZvskiU
         AvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780933; x=1748385733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=EHATqwAA2xd8mR4m5gEmuJ0lsTAqlF/d7sBhYuvCdBfTsz7cJap8C2vBPKftekGp0c
         6ooyb7gyy2f+UOubEeoFjFfvlNLo757imC/fu4B5g93odx3U2/FkWyhxHFjEaAvPS2iD
         O16fOC3pHNrH2XcxU+OqtCYpSlFhn4QyDpQSwpExY8Kg6dPBupwd4020tEBW5E2y8Lko
         Caca1y/y1NRxcsQPoKmKKm3d0VvJ3SeAGAKKJqJqMZQYS9N4yn3JJhWQezy5lEZ2F9u4
         2lxGdESS6ATRYAvmjlC7l0DaCLaPoOTLQxyETWwoqh2oNb0IdcFG3sisd/n7rfSQg70L
         +f4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjG/DG6m6k44f0vQygA4w84Q1gdUqhFktviZEtfYjRcT3MtOBOn42r+WkUiub5PHeaR55nowagKp1x@vger.kernel.org
X-Gm-Message-State: AOJu0YxaX1R91KMo5e7aAtNGEkcxwshB+OMVAIZQoP9jHIu9cz8qzMNc
	n+meGtmBf33y61n/1gBzuvI0O6/zADjLckqL5CsfVJyDglfnc6WHpGuFN6ezpNNBgMx/XQO6o13
	Q/iGSnMJLrwxWjdVopErU9+3s22b4lj9P8/6lIGaOxA==
X-Gm-Gg: ASbGncuCgsf4UeXSTehCXbveGM6snLBbbnnI/GhjNyL1t3DVpHvRXp5W1POUboQKVAM
	jQ58ypxBUN5+GHIactQHCFbrFkeFweo3wN8rouJmnAV/iQuYOQkJ/9Rm6fAQmtkODEVNZMp7MoH
	AjZ65xm+oNWc8Es1RKlpUMYZozquheXKXN
X-Google-Smtp-Source: AGHT+IHsUCF87aJBJgdi8mRkNqubc6I4D9fZMCMetg4kSiJqDTe01fpVuT5acGVm0IsXULfYXw603PwqUKvGmPST+r8=
X-Received: by 2002:a05:651c:20d5:b0:328:d50:d7cc with SMTP id
 38308e7fff4ca-3280d50d846mr35144561fa.20.1747780933368; Tue, 20 May 2025
 15:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
In-Reply-To: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:42:01 +0200
X-Gm-Features: AX0GCFsxq2qbIdoCh-TtdqObwj9pvVqees80rU3HdDEUCMiHs8dNAK0ZulTRIX8
Message-ID: <CACRpkdYor2+rCZGsZLw=_Wna=0KnyXBaVtx-VahmN6Ky-zZ-Dg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 11:16=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
>
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
>
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
>
> In order to fix this, since 'struct mtk_pinctrl' was only needed to get
> a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
> of mtk_eint_do_init() so that callers need to supply it, removing
> mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied for v6.16.

If it is needed for v6.15- then I think at this point it will need to
be backported to stable. It also does not apply cleanly on Torvald's
tree, just on my devel branch.

Yours,
Linus Walleij

