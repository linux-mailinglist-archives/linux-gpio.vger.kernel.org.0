Return-Path: <linux-gpio+bounces-3921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5786C507
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E95E1C21740
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7FEC5D728;
	Thu, 29 Feb 2024 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DfImtXbe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC675B692
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198768; cv=none; b=RQDldqUX6ROxa2bA/QEaiRagwC5aB9zbrMYMFdjDDgdeR9ivrmMn+2jItWGz+sfqiRf8KDkIoT5BlTVOrUCVkjoVF9ssiAU8mvx23F9z7cIajGWcqIzR848QyhXd7nt5+3DWYUzSJmvUniHiV01WVPdaunIsA0VB+ImRzfbC9XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198768; c=relaxed/simple;
	bh=8MZbBs4jE+57EMr4y95A6bSc30KOWei1Khdgx+Acw3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oczRa/resnGt5yLn7KA/BAZB+x4dkQBRYUt+k9QAy6odIqupOpnDYrsWy397/KlzlaiSBGNaQECBpOeKdO8tdZoKmdBTyZpnhXW5hgSbRxzQ5jW69jJMJTgTT5Pk3JOJDsj7oTdMFtak8n7WqHjGESR8vU4rRxD3X47McTn0t08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DfImtXbe; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so512707276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198766; x=1709803566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MZbBs4jE+57EMr4y95A6bSc30KOWei1Khdgx+Acw3I=;
        b=DfImtXbeG8aLSKhsnf6zIAZsbz9kcjqF78jB3Dq5rHAN7BxyQEOY2I7ebENgIp4jxW
         NznoOorsIxo1U4mtfLLauNZkTlOlcbBVTejJ1uGpHKFLqfc0f5gSkWvfmU6U9Q/MQw5E
         GHA6TJu2mzzaAhT0kE9DvMMS4eprIjZsw9NZ2DvYqfyRG913tgVjW7JWbY2h7/FtMqaq
         TpxbgKLn2tRWeC+cKpe+lpfJQ9bFpxo98Z5gG432aXbjAMxEY6vTBjY5K31dqvsuoQT/
         LLflNJmInbBWyyA1PobVEpFBku6Tv0A5ic2Z6hLiviRqjx2iTV/wDJ5/e6TwXWdelgiY
         tafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198766; x=1709803566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MZbBs4jE+57EMr4y95A6bSc30KOWei1Khdgx+Acw3I=;
        b=dagzpdIn0IGRsNo66EF9zzwUK9qRC5Kmq3E3hg1tHXiF4TcXfbWpjKIWaW7xCf+7WS
         dQWOsC8w+JnAGhHgsbIr5zL76J6E+bF5LP4TJjH/ZvSNXI1qjnlJQqxebTlkIilJOJ/r
         nkofVjub5SyxYwP0S+VykqG/F0nFvTPTc+ryFtJ3EC5QgqGI8pAUs/yO8I7gnAYIs/Mb
         v4LMtSnLogSF4syZHG7JJdUnWa2bSFvAuGRil+JsSkKK9VOSDhTDkceVm1IM73+VCcjX
         0Sg5snBoqbH1D+myubj5sdG8bhI26ssNSBMKJoNE2eatBolWQrHSvm4VK2Pio3OvPPEz
         Otng==
X-Forwarded-Encrypted: i=1; AJvYcCXlBqXIEWDWFBMz9gxdEHSgkHzrMnGAnQax6Epmkqdg/gpXXQNmf9Uxw+xFS7r0A/sWnwkLCBGaLc55gAPMALe8ZHO5g0Nodvo3aw==
X-Gm-Message-State: AOJu0YwvvBjk1EDJ9eWt7DGmaJFjoMW26x6BTI7dqaq+kkgZpKjGT5f/
	16foRROdj0uYtYAHcKDu5Vwgc0Hhvz6jRuvqg+RynbILf/B7HZ3e/SECvfpPqrNTXGJFeaGf8rv
	jvTeBVn8kPImM3HMPyUwb1hXbx7fxrjcFYG0HpQ==
X-Google-Smtp-Source: AGHT+IHTx/xUl5oT0k5/xaDHbETWnmicOkEUMu8vmJjZGcXFC7Lcsxgp+fiN/ORKwxrzMGSAjerenpWqUuDCx2Q9mtk=
X-Received: by 2002:a25:8308:0:b0:dc2:2d55:4179 with SMTP id
 s8-20020a258308000000b00dc22d554179mr846839ybk.17.1709198766119; Thu, 29 Feb
 2024 01:26:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-9-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-9-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:25:55 +0100
Message-ID: <CACRpkdbpQ83L4VM3FaT+kMXn60bQ+74B5oZ2PkDb-tk9xrPHkQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/30] pinctrl: nomadik: fix build warning (-Wpointer-to-int-cast)
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Fix compiler warning found in the pinctrl-nomadik platform driver. GCC
> message is as such:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik.c:1169:12: warning: cast from
> pointer to integer of different size [-Wpointer-to-int-cast]
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

