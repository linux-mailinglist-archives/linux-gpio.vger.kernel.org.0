Return-Path: <linux-gpio+bounces-27036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC3BD325A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 15:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8AD8034C0C2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48F62F5A37;
	Mon, 13 Oct 2025 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymHa93Am"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B854C9D
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361155; cv=none; b=BR2a9ZVkcAqAVYmCXd2RLIt7hTZDRTJNlIdzWkPZKQj3Nr5DdlPfj5bVkwDxOu0V4ty0K8LPma19KLSqo8OjcpC1yiLT0drWQrSd7/NkdeXcRFUm+egN7RZWKNt+8NHZMbOIAoAglf11yDLxggb9mGj4y/V7DoEigALNDeoNDIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361155; c=relaxed/simple;
	bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHQt4Ai7sfKoVpi2ICBe/AxPOJHw4v5LhJoPW2BApWecNdGfw1VpvcmUY/nNc5D4XRvXPyJN3OYD4szNjfSsF72cuOcxGmlFb6KPa2DQicLBozT81eO4mM2K/XSmfRkjTuDSS+gxq4KbkQ3wMbtNx1BKmnLzBHwcAic34VaDsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymHa93Am; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57ea78e0618so4870686e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760361152; x=1760965952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=ymHa93AmOHyeoIONqnse0WzUIiaL5YmZCK/9aCdAoMvu94TZJBsUKdt0NIgfIFaFRi
         ZT2Lb5nA4r9lgLM4hea1nolQBO4mlbMqnELea+rszXep+RF5/G/lLhreR94Raxh9Osge
         6TCkbRieIDbrgA6J69IlwVFBGToALIZo5yx6CdpeSqqA46h1Nn86HUgJQIiWzVEuolUd
         K6FvR7OK6rnPlCGmQdvbhkA9ynaibN2eVTiNS98MNquhhH2lQV2fk7LiE9aY7o8hB1Sd
         MU3MsWtrgnPKCDkmYpGWSgbVNwZnNgjtCvV++qflS0q0pyGq5XLvv6FmMHN+5at7stfb
         6F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361152; x=1760965952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx8c00vvcYciQmbGZm3+AuToOvX/AiPHnZpUc62RD4E=;
        b=kLoDHQgzyZ/6p2vDJlJxcOAHT063wUxaOgZapyL6+0CfCK8MS8Le32+8NWN6nAL08b
         ElQ/GUlpZC9D7Yb22505itYxA5pNZ1ku5S3FAp1eKIdUP2gmq5I1nFQH7tZTUyYmaUBx
         h3Q17CT5TjzSJuR0RP9uUKrTsdRSbDMg+5wZrfVX8l1+VvfcFph0GSWH6whwl1aYgLFk
         Zuf3R7/ygMo6xn6VYpjRTwhM3CqbGVq6A0avf6uw05wzenItONvM6NldV23YpIOLNu2h
         A5jYmJWjtisg3TyzaSmy/oQcFgT/1CTItpB9zpeXo7N8GweV7ORXl3EjpGmSCA/qA+x0
         +mkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqDSwcQDVvrgpi5km/JZwt6ywzzfVelwi7VedlmIcSMVRCOxc4LNtxB0VnSoFINsaIjk+jEp10SE/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YydrRjKEcsJ9Tp1a4wwKsh5vDP+u3g0oRXspAGwfjURmm/5q4oO
	6K7rROtAH52D6/Zlu+yMbyztc/rJIIgAH8FS2nDZDAESyP4L4os5glxoUMrWX3rAl6LF+jf20lY
	eC9/DI5Q2LfON6Xdna/rovP+EL0BrIY1c/GRprTR22Q==
X-Gm-Gg: ASbGncuLVN1cftrgkhamWdL44As1HJqK81Ege3XB7ZaIBt4XaU41fW0N0wV9Q7mSmuR
	kj/Ljv0pjCs5qc+yDdVbR5edWvUOEpjRId++8AB6RpCt4vkYFaoyLHgWGWMcb88zvRHHJ2E6Yga
	53RcIt1T5jAGmLvSciRhmN9WlZBtQ/vKe9xRVJ0lSrn3UW7FwODSIH0PrHvZ9WutobaFzJ7aKhj
	7BQ95KNyqatW0qklOVqx1XXvg9KNSzz4kNoHVxA
X-Google-Smtp-Source: AGHT+IFy7QQZzDisxgLU7RQiHqmGLbp9GU/ko5TeFOP01cdLTHtzWG4syZZ8PgjrdKymxne7+Wg23WBWjWeGpiwOdDo=
X-Received: by 2002:a05:651c:4394:20b0:376:45a3:27c4 with SMTP id
 38308e7fff4ca-37645a32d2dmr19705401fa.5.1760361151675; Mon, 13 Oct 2025
 06:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008073046.23231-1-clamor95@gmail.com> <20251008073046.23231-2-clamor95@gmail.com>
In-Reply-To: <20251008073046.23231-2-clamor95@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 15:12:20 +0200
X-Gm-Features: AS18NWB0Tr61DfHtPSZqpJT6vjMUO75ud5f5_b3M4zNOdVsqYQjTLusmQxbBsw4
Message-ID: <CACRpkda3o55N2m=H+RA2p0r598KBLv6bbbin76Uu5Sy44qCLig@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
To: Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 9:31=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Add csus_mux for further use as the csus clock parent, similar to how the
> cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev paren=
t
> name lists to resolve checkpatch warnings.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

This patch looks like it can be applied independently from the rest,
can I get a review from Thierry or someone else at nVidia so I
can just apply it?

Yours,
Linus Walleij

