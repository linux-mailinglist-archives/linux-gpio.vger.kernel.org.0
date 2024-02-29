Return-Path: <linux-gpio+bounces-3939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD986C5AD
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01F001F270C7
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D379D60ED1;
	Thu, 29 Feb 2024 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOk+H5zi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037AD60DC7
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199671; cv=none; b=HAG1xX04O0uBjUvtLmARAUGIqEiqIOPb73bGjNS5l4VhA/JaMlpq8GVL874U0S54X0gbROB71ih682SUfSwYSpkhGt4K2b5m+a3ggsK/4QsWN/AT2itMzLxj2+ZRx8PJPfMhCinDNo7dPvsBZcBnCG/NqUIERAdMi23Gf8eQUKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199671; c=relaxed/simple;
	bh=1LAjz4Y7MgTjDbSVjJS1Nz5v3QtYCcLeY1fivGF7h+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lzw9tDlAfWmNVEOLc2km1g6YAei8m1z4Ehfhsns15Jd3N5E+GhuoWZzbHjKyFnohUnLtQmLXvA+iIpSelayAaQes3iXWUNgkOZeS6UXONHmTV/UtU7ox0FQKPzXZoRPcXHJFAeaL9xl9ZK/I1g9I6mKUZUG+mKVvnmzAy6r58Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOk+H5zi; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so741940276.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199668; x=1709804468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LAjz4Y7MgTjDbSVjJS1Nz5v3QtYCcLeY1fivGF7h+w=;
        b=bOk+H5ziLVv2qsDj+Y0/8M3K5xKkqqZkB/ft0u2fz7w3rDUUcY7qCHPzFdNm0y6YCQ
         gAyf3FJeaGrm9dl+3Rtbg+vDVCZNz07txVAEnP/Qg95gaBippBM8O828J3D97U2sx9G5
         IQICd0L/mgPtkhyZxvhb9gSpbnd7AFn/69uKd9tY+pn/bClI3CkcDUg/3pOotcPKQu7A
         +blM5RaHykl4XkyijHFfVe6i8qjKrB4SC6Q+RyRy7XgZgB5eRGJkybN6A6GdHjrkS19K
         9wkW6vYDDOWwh1QsTGB9o+3oiEqc6ywbUtImLxVBs3OGLAagxgYZekuElRx46w0CveyG
         YUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199668; x=1709804468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LAjz4Y7MgTjDbSVjJS1Nz5v3QtYCcLeY1fivGF7h+w=;
        b=CkbI2k/cn1KYRwP8e8qP99qGQ8Y5YvGAxe9hHyXCIgGCzh9SetyMk1AZj8kREzm5iW
         J6AC/lmDwNKTOt8F9G80eLJRPvmnd+KWTCSJ7SZMANpLeYiGNQ1dthrrS1kzKluZpnMX
         xE4DYsVD4XQpAvgBXuID3T0fwcZC+8D5nVI3Q5RY7Pk38CINYJ1upaLLVtmEs7GuCSid
         D4t3neNvtLuSpmSVMxXFaliuKxhofy/mLzYvkv/O0jWVp8V149d/tp/NIUhwQtAFpRl5
         6SqvSxiY3PSL1cJx4N3h82VJ1hahIiW2svBwOE06XbjFX12fafEEb3G64xZJi3v1FmJs
         dnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVl9uoYeRF3Qdykopk8f9ZWOY5jofe7SFQzrin0HejP/nSNdYamYlc8EdJj8I81Sp9zJcw/no+DZA+e63zr98RVzY17axJz7gzI/g==
X-Gm-Message-State: AOJu0Yy/RJMoVZh8SVTQAn+NY0FvM7S5219cHY8qBshjPopQl4x9iTOu
	k9hsjW9a3xAGNQcYEQgohbvRkdwfNIjNaQ/U5IpjWih16N6h28AT5JJSFUQcUGWTlx4+YYYvXrd
	/xPaKiSsjeU7WN7sa8wyG8R2vNwGMXtbrGZCRog==
X-Google-Smtp-Source: AGHT+IGrJ/cHOI2YcStaE9WyB7ggGo5jiMT7KH1xbTtumhV5wTi1F5y6GwDXF7TJS+ZMtxBW9IfMabVbA7T5C68C6Ok=
X-Received: by 2002:a25:2e02:0:b0:dcd:a9ad:7d64 with SMTP id
 u2-20020a252e02000000b00dcda9ad7d64mr1651564ybu.48.1709199668109; Thu, 29 Feb
 2024 01:41:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-27-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-27-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:40:57 +0100
Message-ID: <CACRpkdaZN_siGUDPBNoiRXej=X1ygMh9ce7MPWsi=GzS-UzTew@mail.gmail.com>
Subject: Re: [PATCH v2 27/30] MIPS: eyeq5_defconfig: enable GPIO by default
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

> Add both CONFIG_GPIOLIB=3Dy and CONFIG_GPIO_NOMADIK=3Dy to our platform
> defconfig. Default config is CONFIG_GPIOLIB=3Dn.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

