Return-Path: <linux-gpio+bounces-13319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA4C9DA830
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 14:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B077282B26
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 13:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633151FA27E;
	Wed, 27 Nov 2024 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="su90t3hZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C51FBEAB
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712728; cv=none; b=JoWCOLx0sD5XP3PPxksM6ih9Ygbss96SGQ6EgPR83SguM5J2tJdaygzgv4YoYMuLBxUwzwuA8wJec3Fbmvdz2xmJXDmrAFbEZm8Rm2zr1UmfCLCmPQZ3q4jIeR2aHbeJCDTvry5e8tc0/TIvway41BWxfyXpwq7NSB90U9B0BMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712728; c=relaxed/simple;
	bh=JWguV4ToF2QcRnKcxBJIEOIGkDScq8Qbzo8ZD4VshFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dcxWm5NJSbCaCleEDVB8waLP/vAbXsUTwVmX3LLW8M9xx2Hqz9WiexQbvQWPrmH1s4B8heiZxd0PVifjW9lfONYFzMTW5Q3SJU8ZsCMCTB2w08K2HvgAPvPyrF4oG7Y0aoOB8MHliJ5xju28ZPTPUvhBCC5XsqRBLaBYzjWsBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=su90t3hZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53da353eb2eso10449948e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 05:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732712725; x=1733317525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWguV4ToF2QcRnKcxBJIEOIGkDScq8Qbzo8ZD4VshFU=;
        b=su90t3hZp+PF60egC4lTWbMtFi5vkGypzJg81TE4RwDC+yMR57kTmbBwNdGn78taF9
         zMqQdULmfPQU09zPb2exvBgTO2laPHS0vFcsMYpGo/owRtM1UNo7XMPG8r6l2phulBIL
         Obiws4LE028t8H68ZQIgH1a4UWvmP9Y12kSL72gpZoCCzYalTKn8JuBCsx+f3GH3HTfD
         3kt47e1Ne2gcEgSsrSP3bhZFy57mVigtr2V5O5a+s5MONFjwCDaVzM+3IPRfG0dQ/1UF
         KM0U39b9ppvEnwD0beYvLabGj2NIXpzeYAuSXABXfvYy9i3rBHyVLWITe7FJ2arKByj9
         znjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712725; x=1733317525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWguV4ToF2QcRnKcxBJIEOIGkDScq8Qbzo8ZD4VshFU=;
        b=siFBxfJkVB/mWoNKDNWEZNwax0jZ/LgCnzJ4/oYsk1i4By0Vy0VDRkeHURlZN9qN//
         d5hL9izq7BAKX8YsuWEJfpVxjJxUTfLH2T94Z01LFaHBFDka+4KVtEA2Tue+34hsy3iI
         E0cfyMvBLP6LDYxTGipBCzsjvWOYVhSW8M6PPAR7HM79oYph21WvLVfoz4KmiEieSKzN
         wjTwQ59RvjTvgtJa7x9GRM0DVdaRzPzi25wrHUlbHFhFVXccWiDlbUkY799X7ZLBY26Z
         t0KQJRJtu9ASwmpb+oa++nLUJGz3UryXUn956V9IjEhHNzNPC/s8KlaniLrhHjBvKjO9
         CVXw==
X-Forwarded-Encrypted: i=1; AJvYcCXsptXinf0SKe65P8q1wFE/7NJO8P5zUR9UykGi9Ak0gr8pnp3URu/vTqG8I5OIwgTm/iTfM3vEq0z8@vger.kernel.org
X-Gm-Message-State: AOJu0YxuG2TlnugwmtrvuSDQEqkYXUnU6ppGw0auC5OaHAwYaJ3RjH2j
	+F5WoYh1LLLPwHaILt0uAE0q4N1qPLoKAD7FH0J571l/EQ3rttj0R0eldbQaz7EY+Ngchu7VPMn
	wjXFAnfnBPbKZGHYrPPnIVuF4Gkx294mk1La6zQ==
X-Gm-Gg: ASbGncvD/0oM8sdnFjvB2j1Xb57uk60dO4Zp86fxJ3uDFOozJIwTQ6WeavMYYyD7qPU
	PiwNHNDTl9mGx2l1BcSdup/2D6VnuXTQO6yZ9oB7Rh98zz7DnilGsPdIUdSKe43w=
X-Google-Smtp-Source: AGHT+IEW70dmWc+Zu4iFDqoZyqt5wTasE9+nG9+piD8DreA9MLGeCWLPA46y+3oz3Ex0A0CWovi4P37z6xX0qSUicKo=
X-Received: by 2002:a05:6512:3988:b0:53d:c162:e0c3 with SMTP id
 2adb3069b0e04-53df00a9864mr2557883e87.4.1732712723628; Wed, 27 Nov 2024
 05:05:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127071450.3082761-1-haibo.chen@nxp.com>
In-Reply-To: <20241127071450.3082761-1-haibo.chen@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Nov 2024 14:05:12 +0100
Message-ID: <CAMRc=McQ8J_x40YEUQSN7prGovHoTqvoePq-HznUdpjYqO_cCw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-pca953x: do not enable regmap cache when there
 is no regulator
To: haibo.chen@nxp.com
Cc: linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	marek.vasut@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 8:15=E2=80=AFAM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Regmap cache mechanism is enabled in default. Thus, IO expander wouldn't
> handle GPIO set really before resuming back.
>
> But there are cases need to toggle gpio in NO_IRQ stage.
> e.g. To align with PCIe specification, PERST# signal connected on the IO
> expander must be toggled during PCIe RC's NO_IRQ_RESUME.
>
> Do not enable the regmap cache when IO expander doesn't have the regulato=
r
> during system PM. That means the power of IO expander would be kept on,
> and the GPIOs of the IO expander can be toggled really during system PM.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

The commit title should be: "gpio: pca953x: ..."

This description makes it sound like a fix, can you add a Fixes: tag?

Bart

