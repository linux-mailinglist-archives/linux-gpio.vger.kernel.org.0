Return-Path: <linux-gpio+bounces-14775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F5A106C7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 13:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFC1A1660F1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 12:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C6C236A7D;
	Tue, 14 Jan 2025 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ky6frj1w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF92C236A71
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 12:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858204; cv=none; b=apETzEAW0E8zmfoXDPrsukmatugmMYsmOvAxcVzLRKKcPIGlCwDhtgButd9b1STzfR0lfyWXMKofqoBIjjPYzkVq0GbLyKR2hPATILUobVMfg+XoqUtO/yLVLPW6PBoppyVNXHSg9pFXLV7HSYafsMiyfSh4JKKOYUMd4nqard4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858204; c=relaxed/simple;
	bh=pG/NnU4P4mCQcf7S7K9+0gCUuW7X96wSQYDzbkn15NY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpRL8Eyf7ErzrvFHRe+I/rDfJ7fm+41hDFpXbBx+LEbck9PNnhHdDWcJclI9M3cWoFesfqQvK+9H0KS80GNxmHzy4QahJOUHlC0U4DVyPM4t7Yr8on2L15CYm9CbXcFqVMUi8TFvDWi9JKrfXnb6AYZNjVtrAO+DNvZR82sdWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ky6frj1w; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-305d840926fso40128141fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 04:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736858201; x=1737463001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG/NnU4P4mCQcf7S7K9+0gCUuW7X96wSQYDzbkn15NY=;
        b=Ky6frj1wRd2er7T+ywWsxL108escQ+hpCgVFoR4JWsH0rZH4hnzyQ1+994A5/OMQ3r
         rjeDu91nFQXjR9rA/ujgHhYSgPwsqicboxdFG+e+qp9Bo+r1S65MOS9KqE4J7j5Q9zHQ
         LipuJ5JsXKxWejznQSqG1KiYXsw2oKTuEkbobMqaDSgKCi3XMImLxdjYiHduj6fowtlJ
         y4HODIfCUbcfs+pO+2E5jk0KVsgYtFSVU55Z3yEeEt1tjxYoJ/rBPap2Aka15DYjcE9l
         ra9t+g6DWziT9IkHaJwcUBu52PCLumykpp3k9ULRfv9qQtIFamFbgHMQ6xaINQoEq9Q2
         53Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858201; x=1737463001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG/NnU4P4mCQcf7S7K9+0gCUuW7X96wSQYDzbkn15NY=;
        b=jqZSCZvGCKqmOdF+VECczpkJusIFxVLxTzFREk8y5PW73TXrL6N4HvZ/4qs7fSIRXm
         U4+P5AR1zaSq6Y1+ksZeVdrzGvZSCfoDGOOw7UItc5R2kfaSBDdHLLfL0g9rhmM+wiMK
         IHrCIWh1twQCjDOeGclgTiOn72TDrr8amGlejUT6yHh/RITK4+7ee9zcSA7Phhe45Pce
         jUBTWo49dvF8HCRuBwNHV7sjVV7HzykqtjvGD6ex9lZMPOmnkOYJnLn0q7j9imid9ZKq
         RVlyvKaZ6VeJwlMh+n7aDazyvcv2pUUpViYYPAZg9K2CjxMS6I212Rlmrk5snfCIk2gk
         8Bww==
X-Forwarded-Encrypted: i=1; AJvYcCUfrySVCMm+A9bo6l6c6L6f4gEMkQrBroYJhJOyx44IJgErWKYQ7bf6pmgulhs604YIeN0c13RpCHoy@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxwyJ2NLAoH8RFtSpE6WNQ37swzxuxp4jzTzn5VzCf2zRx84v
	zs72Lq14NvUxvHkc3azcgj1HZTRYEHn9CaBCBMJ6UBAVcBqxsu6OWEOIKBL+Y60WtMbirXsUSOy
	FuwjLtKrtkXSK/4SkbjRw5RKMwPfesMFLU7p5+A==
X-Gm-Gg: ASbGncsyueb3jgTxjAVdy72LBk6yEGa+GztYl7lHRGs0u75pNe9kX0GzU5fYb5Y9/JL
	AEJMBGUH9L272ILaHPnOyJ4uoRJTdSOrq8CvP
X-Google-Smtp-Source: AGHT+IEdkmx6M6y2EHZ/c/j9kaYVFvNtj7wIcJaeiNG/Rtxu211KyjFGuZ3XXiN9FG3otf4AX9t1XJEgiCtiV7T/Bgc=
X-Received: by 2002:a05:651c:210b:b0:306:10d6:28ab with SMTP id
 38308e7fff4ca-30610d62b3emr35756851fa.5.1736858201106; Tue, 14 Jan 2025
 04:36:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107102735.317446-1-noltari@gmail.com>
In-Reply-To: <20250107102735.317446-1-noltari@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:36:30 +0100
X-Gm-Features: AbW1kvb8_5m-zsmwywE1pBq_FHCmAiXfkYVrUoFl5TGcqIqGIE1yt37W-mVAKbw
Message-ID: <CACRpkdZztXV4tZ-exckD0+egCZ90yUSQ_KASzVaPjtGmvfgnoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: bcm63xx: properly request gpios
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: jonas.gorski@gmail.com, kylehendrydev@gmail.com, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 11:27=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> Add gpio_chip request/free functions to gpio-regmap and use them on bcm63=
xx in
> order to properly call gpio_request_enable when requesting a gpio.

It's a bit hacky, Sander found the silver bullet patch and Bartosz has
merged it! But thanks for looking after this issue.

Yours,
Linus Walleij

