Return-Path: <linux-gpio+bounces-3442-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128985A69E
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 15:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D878F1F2204F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 14:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6316738FA6;
	Mon, 19 Feb 2024 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="inQcANvX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B4381B9
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354523; cv=none; b=jG9yJZMeUUJTUDeYpnPSAR0h9tpZy5xGhMrQUuoE122voWYTzUeAbluT+2+ky2GCxUk/pb6lyWvV3VO7b6iaaxFBhrA320laNXginmECaJh1HdvFCA7AmKyrEEMnmbcBh820AmqsThYRh9tsZVkjSEZDpVt+IBJIBFTCMo8sbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354523; c=relaxed/simple;
	bh=qH5wXiM3i78ypS1cE2GuObYzdJP6nTn9QLDwtM+E/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFRhkQ88hXxH989Try04puB9z1H0OzEtYF66suv+OAnnuOWDzKwfzfFZtGwNoKdCDgLQZXHsre1bgCuRH1HfvZjE1+gNETizNKp6imtuRBXCsQTeLsPiBPN/Pw5+X/lUGQSgUFhtblngYSwGRdt075KIacuES8vb+F8G/M84Ii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=inQcANvX; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6084165494eso6357287b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354519; x=1708959319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qH5wXiM3i78ypS1cE2GuObYzdJP6nTn9QLDwtM+E/gc=;
        b=inQcANvXPuCuqHnryjl/iYJk9U8YX74QKTNoRgcSh/w3cNzWxiLg/phOgd7Tfz8l+M
         VSOksR+Auug9hFDV0A0XSvsSlwoMB/9AftArn1ydHjsET4v8TKc90WV1CGo3lRbuO2CM
         8zPFN2Atu7tW6mPt7Pn0W4PK9UYx+j8hQG4N424F79htcSecCIoTnBle/mWx/TvWB68F
         KN6ilw43mTQ+X9kulN3QOdJwdMVKjcf2w8PbOhRiN1gjez0fcrku3gpTKuQUOKyAJJYL
         V12Wzw3rmoOuVbBwGpZRAdu7wRE9znCPzDM+JSFW6NaUqySFNJp51p+S0Rjr5Z7iVruP
         KLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354519; x=1708959319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qH5wXiM3i78ypS1cE2GuObYzdJP6nTn9QLDwtM+E/gc=;
        b=QGJ4EWl3oov2qxuhuyt1fZHAzwjOpiY9DoJhWElQRtHLCpyUR1lghSJsfcAte7Tp2v
         t6ZU1NTH4bedM2tBTh+PPsWPOEL3aZ2PAxuZUa/9LCvjJgm5UdaFHnYLBrDYDjqu6iDG
         ysurjl9JPbgBbFKXEC3Bsw+aSjuKHDx3t8KaRCE7l4x4BJ1IKFfKzVwG+PZxtkB33yiQ
         wcntKuCTWbzfp+7a8ay0y+Ncp/3S3b6pRJ98M2NppbgqrAiqcfuFxCIyidJxJobGPfGO
         aKO14rsblpR04Z93Ml7MX0rBK0L5zkfnZCe6glDRsMwOWKR9By1epk/TPa1E+oBxa1gw
         sBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZfec/2HyF1i8Qc2JNG6vP1xeAkLTk6l0wrhOEgE8ALgMZg/NgyctOWBgBg7V1gzFavhYLWDXM2sREXOQuTUd8x8vKPOE9nN3PfQ==
X-Gm-Message-State: AOJu0YxJjlG3OmzzbELn6bOEdIcWnNdk03og0vnwToT5QkR1xiQ7g7mG
	23rJTIQ80DWzaoqr1bbhMd3B7ldjVddNoFHdLknYF7w1UyKg+VNpNjRO2fUAx3vsVkMFfFEzwea
	9wieBuRPQgGqZ6b6tXbQ8CKulz8ZW0Tif1lwP0A==
X-Google-Smtp-Source: AGHT+IFltO6KkjBY25OUgoFC/Kmxadk8ahvUfaezI8PdV+xriL2Xe4U881DZubLOYqtDNDNARjLCAVm5NBCSj2rOXnE=
X-Received: by 2002:a05:690c:a8c:b0:607:a8d9:c29e with SMTP id
 ci12-20020a05690c0a8c00b00607a8d9c29emr13974595ywb.33.1708354519351; Mon, 19
 Feb 2024 06:55:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-4-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-4-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:55:08 +0100
Message-ID: <CACRpkdZ5v4GUJtrOV4U4bhvKC+RZFXk8LZdyN1cbxmm5mxcLuQ@mail.gmail.com>
Subject: Re: [PATCH 04/23] dt-bindings: gpio: nomadik: add optional reset property
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

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add optional reset device-tree property to the Nomadik GPIO controller.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

