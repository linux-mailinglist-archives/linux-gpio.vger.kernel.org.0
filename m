Return-Path: <linux-gpio+bounces-17595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0788A60E08
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04CD43ACC6E
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 09:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF4E1F03D7;
	Fri, 14 Mar 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCz/9UVU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61F1DC9B3
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946325; cv=none; b=Wm98I6QrSLLEWa5xkbAhr236kuFDQLmi3+PsCHMIDsueNfwTDprE/3DSWNEZ/hYeIu0Wlszfxj5LgYYr4IOxXpW8XPusQCAiiGjlreawNiVibZXQl3R3YUVm4Vp/fO+LHX+Gy3J4V4qmNt2y5KgqQMRLLhHKbulHjCBFhC7NzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946325; c=relaxed/simple;
	bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6KbmmlZuWSk9Z7/x3Ppmlk7+SO14BTlnXX8Cn2w3su+/HxNAi+AMmdqEQQCgXPfV/kMvxnctoUO1EN0hTHEvzzWiBLg9zG8IMCJqztGP+rH6OXJ5zh6xU2sTn++8k1LM7t4s3Mr226Zs7Sp2zOMsdodP+TiYOM5GaL0IFpWaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCz/9UVU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54954fa61c8so1795902e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946321; x=1742551121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
        b=VCz/9UVU8euvRsY4USKad1OhraYKdrg7ZCH96O1CN8US0gsvQ5SFy75d5yyeM2JypN
         BvFl4yq3gAdgVCOrWPyd2YHBCkdGamHFl4+fq8l3MjQSjyQYjn7nmiBtJvpba4Kq3OHY
         DMCEG7Vm/cbYmlV31Cszs239PvK/cuk8d+hV0WbJX36YWQroAoL2k7GeJc7R3smHSD3B
         6mVR3TJBWMPB0F5tbciCwnxuhKggb8vY/Kp9nO4d57X5MmuQUblcJvevnSP88Ukj1BaA
         EKbBH7+GirkZYXIXHu7RYz3t0uW1fX1IuRpkaW1Dx3XZ8wt5Jl/dvSH9XYgrZPL7Lj3p
         fdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946321; x=1742551121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3R/xMW1KRHZ8whxH1MaliizhE8y6irqdOv62B/5CbE0=;
        b=oUFgS2+3AEtMVsy+PP43mm9hI5BizfVA9e/hjQzECuO4VHTgNDYrhGBwldU6VKBz53
         OfvVRtMt+dbYv02IIKUV+hlYZo1LmQnhcZHMWQFAxBlGpzMIJOI+KM54H726Gp3YaNi7
         WPWZZBkivTGkkOkU9GOmRAWrv+c30DdHlNud7rHrWJExQN6RKB+qomcsAP4DauE/IbUf
         aSxzjfBBgDZl5u+icX2yGs47ZhBPAeWPsxC4pMSV2H8n0+xipPlXhTCd2D9R5EpCQZ+/
         JrSexTok2KGYyUhAyG0MaeJN9OxFZYm/YIBSXHsNfSaDeI0D49GJsp912wo4jOxEm7eZ
         Oiqg==
X-Forwarded-Encrypted: i=1; AJvYcCW5I1fyQDSMzPFgm+4Nfw8ej9FT23/06qeU9CvwgyOvEl5AX9ofCVbq4QZ1oEpM73Qk1Kwkjbp+iV65@vger.kernel.org
X-Gm-Message-State: AOJu0YwHyVeaQ9NufjxYvQkejuCSoB9m/M2qz6XqXVUR2Vu4rMOk+yLm
	CZEv7FkRnYkr7ZkLr2EeBpEoP3EWLyzlgaFWwHT9/QIqqF2VCv9KEQjiCSMuLJBiDCIkOe0L2aC
	s+A98FiyuSnLxZsQX1pEcmTchQZcFvBW3+SVhdw==
X-Gm-Gg: ASbGncuAGeHWIdXw2yHoT8Z2lTyGf+Z/VooULno6g+ryvCiWTjLhVBd86KELPTY68lS
	nj3+WT9ZO9e7R44+JTEC3dxP4NxLNC2kbaRaSkEsZVRdmOgeWhf2n9JVpWE1sdY8z35lLKp6UXH
	NzqmIyHx61yjsrEK+kMF2wM9E=
X-Google-Smtp-Source: AGHT+IGc3omYZ/PigNb3EELyzJBtPU76XiDZ8/lpHySnqIua+3ffxwK9HjrgiuZD5ypFcw6v7zL4wYHXWwqXE5nGVqQ=
X-Received: by 2002:a05:6512:158a:b0:549:8f21:bc07 with SMTP id
 2adb3069b0e04-549c38f1fbemr588651e87.26.1741946321224; Fri, 14 Mar 2025
 02:58:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250225140732.21557-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 10:58:29 +0100
X-Gm-Features: AQ5f1JoobXwU1DJzGtfpxiI6KI8sg3dxeI7nlvijJlOYjKzE2Ra7o1u5ZIyffXY
Message-ID: <CACRpkdYSNMV2jymbHaxRp-PmzbbkEJ_eUcT20whYw3gdhEGOGg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add EINT support for multiple addresses
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hao,

thanks for your patches!

On Tue, Feb 25, 2025 at 3:07=E2=80=AFPM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> This patch depends on
> [v3,2/2] pinctrl: mediatek: add mt8196 driver
> [v3,1/2] dt-bindings: pinctrl: mediatek: add support for mt8196
>
> Please also accept this patch together with [1]
> to avoid build and dt binding check error.
> [1]https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D&su=
bmitter=3D215008&state=3D&q=3Dv3&archive=3D&delegate=3D

Since the dependence series is not finished I can't apply these
patches either, do you want to send an independent version of these
patches so we merge them *first* since they seem finished?

Then the mt8196 series can rebase on your patches in v6.15-rc1
instead.

Just send a version based on v6.14-rc1 and I will apply it.

Yours,
Linus Walleij

