Return-Path: <linux-gpio+bounces-21211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E23A1AD3781
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00F2C3BE2AE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3F42D3217;
	Tue, 10 Jun 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdWLT90K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D618C2BE7D0
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559535; cv=none; b=dzK+fPSkM2XRQMLS2mM30NBMlBb7s/2xLvpOKuZYWpnJQJITC0pmnhD5B4gVfANxfZnjLGxHnb/+lfl7iLJW+WvK4MrUVX8b+U2Ve2H2JjNQcrUCGUX7TgiH4r0HNFGytnRbsf6gNC/TTtx3M2ThIAnxCal3NaBOlx5TJqZ+K0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559535; c=relaxed/simple;
	bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdZ9mOWeNwyFyx27JKVD5C0UeSIpwR2am36HSUTmZwFZeP0fs1a9UgCkXPNrh9IrYQDzOwiMp5YTb3p7BgrdnoRJWaUmLP+1dt7uM5CCFEw2Drm7yEG+QmJ4dI7gfDMbuEI+WowPk5PP7CFDnu35q8ahi1Ceoa+UyjS7iQOyW1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdWLT90K; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5532a30ac45so5011015e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559532; x=1750164332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
        b=cdWLT90KdVDdw1FeZRif/kXP3wq3j1yji3n831jAbXEWZI9FtBXYnUk6v0OwkDghpQ
         jeJjp9i/Ee1CdBTtS7sdRCEhRWsJWIcgg5naQlDPX5hzgiW/fB/6digZfrFcdnR7cdbW
         15h44GQZOW4hiUNmAaQBWJibbypGQ2wfj1PSao1pB7ZIYy66QhpRTmxxNk6JuQid/B+F
         dQDrwjib+jozs7g/T7Va1NE//MtpXrJj7Pn3xXMqKyNKsZXg6Qt9cAYkCFbIFYGYcuw4
         Q8wKyMOH08CNApCsvZINcw9tAVJw2CmABqzCt2WhwtaOm+hXoBhg11lLhL2tsBhhCaD8
         WNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559532; x=1750164332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF3FchzuHdlUwCW3Mdst6w7S6yA7e0tQPeXt1aAxPg0=;
        b=YyFPVN2UAfKjQsOKGp57jlwicA7uoz5FeHt0LlJgv9/YU/bhXVb7pL4LYFRAhkh95M
         YnCUzA6ILaJe6RgC+Sj35W+qkfoJ4hzNCWQn93SAMGnWkjmijv754nKdowyqKlZps18D
         /Rj9s+WYclMw20D2R/3GFs2WUW0Fhn3tK13t/o8AqvLvs/MJZu2QKYQBcquk91V2eOCq
         DKLRtGIg8W9V45Uost+KWjmwU0x+7vymXKtoHuE2M4+YGlJBF+A9UpnPkIP4Ms2TSwxG
         oOBdgMmXEZb8IHnBGLDemlD9KStvQR5wHLOfUmhkJcr3mzxyiXIRdMEWcpRGQFcKmkmU
         Xw8g==
X-Forwarded-Encrypted: i=1; AJvYcCWgEXWM7jsvM8nWHD/9m03p0FLh6/y99YCp/GICHnkLf4+EkWNdEPPfywj86IJImA0TtxT4dKtSc2Qd@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOA/lxsgmfgZ7dqfdd0BdCUKz5aclp8tGfEXdcNsSUF8MENCO
	AprG2p7sViAIIHBjW49LgpgaHUggqtvrwx42WsbHDBh6dTHzqA+6MQ12a1ine7p8p6J/YACUkzQ
	IgWSk60hnahhP4pcmvmUYDO+o6kvIE7g1HADwnzm1bw==
X-Gm-Gg: ASbGncuwzFBUT0qpw8uEY8UPk4skWCPfuvmKsoLak1z2yhD4OT/OBf9Cfk7jcTksi41
	tpAtvS1EgPLkE8XzRxhqUhNoqfJJu8pDaTyUe3Y+azXSQOFlghd8yzmGtwVJMUXEy3oYDYe+GaE
	+pdKrHJFN4SvdEYpVhSRsRinTc2J3m4v9QdVRwyAGIXJ/KbjtUxzuAsA==
X-Google-Smtp-Source: AGHT+IGeGbzOznS3BG0D0jszT5lHYaE7HjuqbP1wt0m4nT4Evnfz8bKcaQ8NdIRwiSEm4rryiTNmXeZgEAh41G1MX+I=
X-Received: by 2002:a05:6512:12d2:b0:551:f166:bbb with SMTP id
 2adb3069b0e04-553931fec79mr844508e87.13.1749559532010; Tue, 10 Jun 2025
 05:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
In-Reply-To: <20250609-pinctrl-madera-devm-pinctrl-register-mappings-v1-1-ba2c2822cf6c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:45:20 +0200
X-Gm-Features: AX0GCFv8wM1qzK88fvC3YYxO09_iv1tchDQeyw0PYmsnKvpSJ44gK7Ltfx9W9bk
Message-ID: <CACRpkdZZoO4QxgiBr06BkzByiCouMNiP8jhz+qzxg5fQAjWDfQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cirrus: madera-core: Use devm_pinctrl_register_mappings()
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:51=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Use devm_pinctrl_register_mappings(), so the mappings are automatically
> unregistered by the core. If pinctrl_enable() failed during the probe,
> pinctrl_mappings were not freed. Now it is done by the core.
>
> Fixes: 218d72a77b0b ("pinctrl: madera: Add driver for Cirrus Logic Madera=
 codecs")
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Patch applied as non-urgent for v6.17.

Yours,
Linus Walleij

