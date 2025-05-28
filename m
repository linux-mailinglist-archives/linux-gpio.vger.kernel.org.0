Return-Path: <linux-gpio+bounces-20683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96EAC6F79
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 19:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B5D21BA5DE2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 17:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE4D28DF29;
	Wed, 28 May 2025 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Arqb5ggn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084A199939;
	Wed, 28 May 2025 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453856; cv=none; b=DkmsjQ1CM8vXZinzI61P+AN188zxmsByXS7/rQaf8/ejJzWfpSaXZJ+O0IjzK/N6fC6Rt3xBDphuEgph+1F1vHGxPrz1MENnjScXBv82KuPIlK0JcCld29h3KXQFUjmuYv4wVgpDhD8Bx42xfuD0EIoKaalEBOSXrdFRr6B7FfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453856; c=relaxed/simple;
	bh=kNWthH0g4ApCrBfxHhlb8LxBWJC73FgpCl6D3ahFNBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dszjbgAOAwpmh35DUxesYVkPYlVF7uJaHeNKLX8yXkIOoRccK+tMSLBphUMkx9HOAZvSCfyXlQ9cp8FnoFCLRPs+4Vkazj4BeJ66QEMX0ttQ429OHli8MKr/QHKgy6EK85grR/C+h+Z82RuitfuNtKD5eCakIK6hfuFZP+JZgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Arqb5ggn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55220699ba8so4976076e87.2;
        Wed, 28 May 2025 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748453853; x=1749058653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPLbA0TtARsZRpgoy+SeG1Y86H0J4M4EKn9jgtbPam4=;
        b=Arqb5ggnyTfXX24/ViNwP4mEU8sQWvObydcLq3P3iEjReXkP9xQ/4Q+zExv98pFqgG
         tFuBmmN2WeBODGfmtSQNq447lZn2iKhNysLkeGxOa+ZFITRnguPZHhf6eZWCxgBAmDRp
         Ao/uKy4tXFBprJeo4EJ3nOfZxm1sRp8OB0bRh9BqExfFRc39pdmQRfzKtmTgekG/y7+j
         7OGzwl3t8aRD0dNZT1ySvREYuAXp1qGy9PdIzDXDjcWysNbr6NCx2FmBGNwKRn6IRur8
         cANh8zXND7OJY0IzoRLTUGvxK4ekclFU8eCe+olA0h2YixSxtLxgZ6oJX4KnfVUxk5++
         wV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453853; x=1749058653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPLbA0TtARsZRpgoy+SeG1Y86H0J4M4EKn9jgtbPam4=;
        b=D+mLpsDDwCXovdHVH0ssB95jPd99Lwr1M2fWigeklFCFnrSxbVmv1UH5uDBybFylck
         Elo4fXZj/uW8Vz1dqgSiw1P8YYPvvMaun0DIkHncjXtD4SB+xlcXrm6aLMZ4A8L/n+Cz
         EQ3npmCyYYbFlPwclls2kZ1AY4Kn0iurJcj5I5reXJWzY1jif1thPMKURiTQeIVrIX6q
         iNGnRkAfnrzG0Bg/pitbC/TFXLgPcshLNuEFKEqV+FNZgbtFKmCC2uKPBRn3gtqPSeqK
         dpiJbTPKFg5SvwLPcz5WTJ4BteCVhOnHWyxGuWPT8zSvGjHInpOuPon/M4oXImXDXZsM
         jcug==
X-Forwarded-Encrypted: i=1; AJvYcCUp3T2tiFf1SX7KpuaWqPanaXITiZN6NdiQGV7D0ZR/vbXZmiMzM9joQ19422JIg4PVNzyotMbe3gMnvaP2@vger.kernel.org, AJvYcCV56XwYB6J/JMclatXMXIM73J/+P4YpKj71U+rsYgU5gynTwcn9fJ5NKJ+X2ky/HZ/JH/oUI5yzksVPWWE=@vger.kernel.org, AJvYcCV9BvWHY+9gv16VyAigjdpi21Wm+qOWbh/yUb4W14PHVvFzTbmcvKzqOPOXUS1GCyKZR6PnoatDBiF28A==@vger.kernel.org, AJvYcCVPBjB3KxtbWrf0oUVNPoC8KaoyJQ0cAuq9dTkm45XoFhCojPkZcJDzfqqHWyzr0e7sGQAuXRJAhImF@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgiOTKGeIbYCGhvBXfapdUtAS+IsRi4yCoy/2YFtH+cMuigxv
	f+Sh4u9atMy1r7MZhZ1aspD0hpyrCFh95F690mMnggCsve2mqvdYKmGILrkReXQNDSJ3ncJm93i
	jsfEAbQf43C18c4GBjM/uDnLMGYpStvg=
X-Gm-Gg: ASbGnct4koJSng1EULLyOo7zPnmtFghdwfK5KwC2anoy4dI5JWaX/ll162G30ur83qK
	W5oIlSpolM1whOFrPJVg5p96RcJk8NAgHhV/eRD/RaP3WMxHZ2pJyE54i68EzUkr3lb10NUM9xA
	iy09ZA+TXQx4bzh6XIY6yzXqxQ0rEHl24V
X-Google-Smtp-Source: AGHT+IGgMHiMa2LFQv9Alp4wlZhdkgFdKybKBvuJASh3xQCuBHQ39R5N1rVWML27L94mjMzYkuQzp0Zp3A1W73oMYMI=
X-Received: by 2002:a05:6512:33c9:b0:553:2f47:ed21 with SMTP id
 2adb3069b0e04-5532f47ee2amr1220096e87.41.1748453852656; Wed, 28 May 2025
 10:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com> <CALHNRZ8ndcd3mvGP+W2DVFcm65t4Ai4epNeGigPv=Oo8Cf3LkQ@mail.gmail.com>
In-Reply-To: <CALHNRZ8ndcd3mvGP+W2DVFcm65t4Ai4epNeGigPv=Oo8Cf3LkQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:37:20 -0500
X-Gm-Features: AX0GCFtLvzBNOUpU0th8YfFcJvN5mluId11UW3CRjUP-3UhpfQ0aTL7BcczZ98Y
Message-ID: <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 4:38=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Tue, Apr 29, 2025 at 4:33=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > This series adds support for Tegra186 pin control, based on a downstrea=
m
> > driver, updated to match the existing Tegra194 driver.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Aaron Kling (4):
> >       dt-bindings: pinctrl: Document Tegra186 pin controllers
> >       dt-bindings: gpio: tegra186: Add gpio-ranges
> >       pinctrl: tegra: Add Tegra186 pinmux driver
> >       arm64: tegra: Add Tegra186 pin controllers
> >
> >  .../bindings/gpio/nvidia,tegra186-gpio.yaml        |    3 +
> >  .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   |  285 ++++
> >  arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   12 +
> >  drivers/pinctrl/tegra/Kconfig                      |    4 +
> >  drivers/pinctrl/tegra/Makefile                     |    1 +
> >  drivers/pinctrl/tegra/pinctrl-tegra186.c           | 1784 ++++++++++++=
++++++++
> >  drivers/soc/tegra/Kconfig                          |    1 +
> >  7 files changed, 2090 insertions(+)
> > ---
> > base-commit: 1110ce6a1e34fe1fdc1bfe4ad52405f327d5083b
> > change-id: 20250308-tegra186-pinctrl-651ffbbbe816
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
> Thierry and Jonathan, as the maintainers for the other tegra pinmux
> drivers, I listed you as the maintainers for this one in the dt
> bindings. And I think MAINTAINERS will do that by default for the
> driver itself. Are you okay with taking over ongoing maintenance for
> this one once it is approved for merge? I made it match the others as
> closely as possible, so it shouldn't need any additional changes over
> time that the others don't. But I don't want to sign anyone up for
> work without prior approval.
>
> Sincerely,
> Aaron

Friendly reminder about this series.

Sincerely,
Aaron

