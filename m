Return-Path: <linux-gpio+bounces-1702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A31819D82
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 12:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15B3A1C25C41
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Dec 2023 11:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B3C21343;
	Wed, 20 Dec 2023 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dc1lT+rN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B886210F3
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5d2d0661a8dso45321847b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703070148; x=1703674948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWZSCVRWyRcXn4WJEnxmsNNdBu46mpN/PeFPjmLZcSo=;
        b=dc1lT+rN4Jk1cfhR9kpv3m6Eokb0zL1DeRVZZFb8FpS+LSLEY8OMDzET4PmijmLtT2
         O7QKXk4qQ3Jy5nnA3nLM5mR9Jjvh/m9GWCQYPWm8HLpMxqTEcT35Si55MWb6/IoNGswR
         pTPVVvXcerCAqo0ODQ9iYkQVgwRgo2fJHz5xiHbQFeyvCyPIiJwGcP2TLQJ1EVqkzx6I
         uZ6mNHj+1s+/uddVt6CzJ7fJfXJxIiDSXJZbFtfFstXzsonly6GuGx05UnTczE/ZVBg+
         GT0h9puyl/ll1mn6Agb31cAHynel0HrCuVSsMRsfqeuGrTLkmWO/nFCL8bZQWpJ+Ut+7
         9qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070148; x=1703674948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWZSCVRWyRcXn4WJEnxmsNNdBu46mpN/PeFPjmLZcSo=;
        b=WMTzR6CkzXDwREFpD7WpL/gefKwxVIjH95gz2fzG6hPkwHDWHcWcWJno87cNA9g1HK
         39JD6JVjCx0uU0Ghg5DHjYIBolF6yzUPH6T7dWWoduBOxLLveFlkCo2BkCL3AVap0ElY
         lne2W3X7NXw8odqUtgRR+i78IwZJuLxcCyOs/NSoucI8XH/tIHy31ag4d8R0ICYuRMx9
         vJpgm1tTMBipg1CY2Z2mf7omXfJjkgg2nFwlol1d3fPVUV540SziKjiIyv/iS2PAHL7b
         k1uP3KdlQCKpVEEZxoDxoIJMVn4yxT7CtnmY8ipM/2ynXm+IhPmIZDSCIggtTI/vFdTf
         dcag==
X-Gm-Message-State: AOJu0YxmO269oRKXJ3O6vAGszpFgBlC6VW4ScA9IkzdzXyaeG2eRsKHP
	x9PhIky7tw5DJXjc6o9Ac+b90y2S82xpZ+xKjJ1itEx2P1uU5s1iNnk=
X-Google-Smtp-Source: AGHT+IGI18zKecLpoICynLSs1R9jI1aHtIpeMLm0ek2fpDCCeCyu36u+kC2bJq5eVNLOe5HR45rwOgyJR2ClP5LV5U0=
X-Received: by 2002:a0d:ea11:0:b0:5e7:ebc6:984 with SMTP id
 t17-20020a0dea11000000b005e7ebc60984mr2065348ywe.84.1703070148183; Wed, 20
 Dec 2023 03:02:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212090611.950-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231212090611.950-1-quic_aiquny@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:02:17 +0100
Message-ID: <CACRpkdb6dkw58GwkqYXTDAQtdLazOLyp1CEjnkxDX2v=TDvvMw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: Add lock to ensure the state atomization
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: andersson@kernel.org, kernel@quicinc.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maria,

On Tue, Dec 12, 2023 at 10:06=E2=80=AFAM Maria Yu <quic_aiquny@quicinc.com>=
 wrote:

> Currently pinctrl_select_state is an export symbol and don't have
> effective re-entrance protect design. During async probing of devices
> it's possible to end up in pinctrl_select_state() from multiple
> contexts simultaneously, so make it thread safe.
> More over, when the real racy happened, the system frequently have
> printk message like:
>   "not freeing pin xx (xxx) as part of deactivating group xxx - it is
> already used for some other setting".
> Finally the system crashed after the flood log.
> Add per pinctrl lock to ensure the old state and new state transition
> atomization.
> Also move dev error print message outside the region with interrupts
> disabled.
>
> Fixes: 4198a9b57106 ("pinctrl: avoid reload of p state in list iteration"=
)
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>

Overall this looks good!

> @@ -1262,9 +1263,12 @@ static void pinctrl_link_add(struct pinctrl_dev *p=
ctldev,
>  static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state =
*state)
>  {
>         struct pinctrl_setting *setting, *setting2;
> -       struct pinctrl_state *old_state =3D READ_ONCE(p->state);
> +       struct pinctrl_state *old_state;
>         int ret;
> +       unsigned long flags;
>
> +       spin_lock_irqsave(&p->lock, flags);
(...)
> +       spin_unlock_irqrestore(&p->lock, flags);
(...)
> +       spin_unlock_irqrestore(&p->lock, flags);

Is it possible to use a scoped guard for pinctrl_commit_state()?

#include <linux/cleanup.h>
guard(spinlock_irqsave)(&p->lock);

It saves some code (and no need for flags) and avoid possible
bugs when people add new errorpaths to the code.

Yours,
Linus Walleij

