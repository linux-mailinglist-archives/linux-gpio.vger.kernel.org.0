Return-Path: <linux-gpio+bounces-10620-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC898BBA5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 13:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 063311F218ED
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 11:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DEA1BF801;
	Tue,  1 Oct 2024 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+p3vyia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92131BFE1A
	for <linux-gpio@vger.kernel.org>; Tue,  1 Oct 2024 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783769; cv=none; b=EEf6COprpu+PjjCgpxafpzp60g2EQB/+Ml2+zMRy3M2Sf/xqx/bPcw09+j71gW0QXGo9SN3tKwpeYQkdWR8XtEPl74Q9jFO//ZTcDZxfi6juu3itpVBt7W6VWOJH+C1qCyVCRnsqLimWJojBivsj64gN8yHZqq5FrMIOcy9U8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783769; c=relaxed/simple;
	bh=dCRCTpeBWVQaEGezuqoGfd4YJh6Ew8r8frfM+R+vKoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLJh8UHhhRst8HcsJpbP7eHaIlFgQVDxEqnK9kG8XU5dc8bDjBQIuJDg2UwFk7v6e5v/1zsbBh2cNCIuDCP2Upr6AL9ChmF/OGJvOvFQUXA8g+8O2UoBjwZ8QPjoHFVoBT3kXAqKE9LKeMZqsi1xlPT0BbOstpAjjJEoW8OmfAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+p3vyia; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5398fb1a871so2735226e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Oct 2024 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727783766; x=1728388566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCRCTpeBWVQaEGezuqoGfd4YJh6Ew8r8frfM+R+vKoM=;
        b=A+p3vyiaUcwV8qih0p8dTFOlKzyp5Ax/laufphx7Ku3mjZv67zBcY1qKGQeJy7LzdL
         Xq0l8GT9QCmOsjStnqS4klG1vQNLUrkyLaK65cjqxoXsE4Rhl6lF3NYGCtQDyicOjbiO
         LqNkpTrkQ+0t0YZhNQOvkBkKLDunJJ65zHc48WPyxV4ifkRJ3uF7pnd9sxmYcB8GmwKh
         jNUxY36/h3cME8T8MohnExoM/aAZiB3iYfvRh3xlJ+kxDBdzn7xz4EFTRtJNsNvjUgJv
         RpImdvzI6FscgKI4IfgpZjZQ/wvoHU2fVOXQ63XbN+Thv2Hsl9LNIJ0Ep1nWqfC+wTBS
         M4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783766; x=1728388566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCRCTpeBWVQaEGezuqoGfd4YJh6Ew8r8frfM+R+vKoM=;
        b=YeIUJz7EmxBMpbvYvZOPQT6c2+vB7JdYbzCG5a24/gctc9Xd4yVqyOowkXSwOjR+7Y
         ZTnlMMrDIzeuaGvsT4aRgtDV6URMWLDS941JQ6AHPj+os/B+J8k1+pX2yPJGV1Xf9mun
         SxEdN/qB2zmqV8Sq5+jSDO6SOMT5Oa7KUdHlNQdYpak4sKY8ioXUvpLW3vSQg+Q7ZH9d
         Eq7/jV8Q1W8huSDaD8o4//u2gX/Zw9WsIfasejCz2o/NZODB6YlSud2jwHhF1oye7E3a
         xhZl1o7pBBgiAombqWUZ4fNGrq+x2hP63meeej0QozkAEayrybBdKFk4DY/6dt4DTgKT
         T80g==
X-Forwarded-Encrypted: i=1; AJvYcCUnPYvS1ScsfEZQZxvElzpTtKHm+8PAXRTsu6DD9QnF5sAIMWcpy42yg407X6TXqu/hdy7ir7RXbBzS@vger.kernel.org
X-Gm-Message-State: AOJu0YxfN/mvh76bNgpPeYuCtaie41LdNa+PGvJzMCSXGdfLtJSEoDWQ
	EPvOKhUBdFLdbCnocWWRvFqeLhpqBMnKJm8F2ckgSJctdZAlgJEJ/ufxP+000M0QkpiSQQeGMWB
	nRlZoibWf3kGzSkfdvyo4ZBzSfcffN5wcLt0cVw==
X-Google-Smtp-Source: AGHT+IF671nYta5t199R7sRxpHHBTnmwujkmlr3MRg6tqyu/Ngc90gmiXkly9+05ccmQF2xTgC3WFKRZUK/UcnVIUxg=
X-Received: by 2002:a05:6512:1087:b0:530:aa3f:7889 with SMTP id
 2adb3069b0e04-5389fc7ff3amr8180609e87.56.1727783765958; Tue, 01 Oct 2024
 04:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com> <CACRpkdYbOTXmap-vJy4JNZSaZnE=yzC35EPD2F=bD8gWdD8-GQ@mail.gmail.com>
In-Reply-To: <CACRpkdYbOTXmap-vJy4JNZSaZnE=yzC35EPD2F=bD8gWdD8-GQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 13:55:54 +0200
Message-ID: <CACRpkdbOUSS95SJxsZHmYfZtZNhDe_dy7OWZnsxe0WcExC1Wyw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM: imx: only enable pinctrl as needed
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 1:05=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Mon, May 6, 2024 at 12:24=E2=80=AFPM Esben Haabendal <esben@geanix.com=
> wrote:
>
> > As not all mach-imx platforms has support for run-time changes of pin
> > configurations (such as LS1021A), a more selective approach to enabling
> > pinctrl infrastructure makes sense, so that an e.g. an LS1021A only ker=
nel
> > could be built without pinctrl support.
> >
> > This is a very late follow up v1 3 years ago [1]. The situation seems t=
o be
> > unchanged since then, and I have tried to incorporate the requested
> > changes.
>
> What is the verdict from the i.MX pin control maintainers on this?
>
> I can merge this into the pin control tree for v6.11 but it'd be nice
> to get an ACK from the maintainers first.

I ran out of patience and Shawn ACKed patch 1/3 so patches
applied.

Yours,
Linus Walleij

