Return-Path: <linux-gpio+bounces-16777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964EA493BD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 747DD16B15E
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445902528FA;
	Fri, 28 Feb 2025 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDiWInTE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9082505CA
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740731986; cv=none; b=TrustBNVWLx4eukq59qgLxxMbEj/aZQwbkc49RCt3cPfWizveZoaYe3hUoq9+oNIJp3ph+euYi9exj9uFF4pSr3oUiPto//Is03GAk1WYYJCjbbQ+GGTVGCcB3nCpvRvF5K6WPEHzB8NKrpaNu1EnqJd8k7ybR/2CTa/UVKn0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740731986; c=relaxed/simple;
	bh=vXjiyibKKxM77UcLdQZUdVPFpQkCll0rLi8rRYGxZ3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjhXFB3QYp0ePXlNFQLDS6sNR0xNcFiIUZssLsXz+1OLKvfsRYn8iprLwW400KCGw2Y1uzbD4CWAGQxocTEexiCLzO1j8y75em+YoGsHwW1n2cPQkAw/mhc/LkkjqlpDW/VlxOX8EWb6VfkEc0WGwOeb9bx6mSktBRjyqVUQwtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDiWInTE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549490e290dso843839e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740731982; x=1741336782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXjiyibKKxM77UcLdQZUdVPFpQkCll0rLi8rRYGxZ3U=;
        b=bDiWInTE2wLp8b29GnXJ1bKo9HpRSBfQ7dHgECNDrmHltAONJKsnNxAJU7CpwCd8hZ
         hJTP0+ZZ2KMkWHrns30xZ4LZxqTCy4zr1W/RyvJaj3m+ACIpiHGcJxyb/AZM3OILfgPW
         fDsoqMWXMNAj8osLKNKF3J1jXTcvFVSrMHIVrQzf9kbojD1MIJnL7RIWJ9GmnJJDhg1k
         3RCpgm03MNmr2lwwCQMY1wFKtgNd7D55SmlrtwhftBFvXJsGFDWoHr4WG3jTuynkp2c8
         KDbG5v4FXWuEW0o2VKfl/0a9V/gtw3w9JxOhz5lGF6tuikWKkEa8m/zLApsbvtRkgcGw
         QPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740731982; x=1741336782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXjiyibKKxM77UcLdQZUdVPFpQkCll0rLi8rRYGxZ3U=;
        b=nnrdbH2pLDaEl9a9aGYDcZqdvVdt2w/dwx8vmBufYIqRPuvpFjp0MBBjY+upaUDcTS
         /TAYclNPu7KlaARCJhsoPWFXL+k4oueX0kckjEHhF4+Cddb3XiYTmJEBF+iM+vZoOGrC
         YfDhiu9POrtFh7zWNEUeetVSF1nQ/MRV87RfdIJHLasjhCAivNRuTS6qNVhwbOOm5NGv
         XtcPQAGdj3kL8Fowr6sESxEUjIWlSjDuzGqvY6x8m79TUnDJ6pyk7F0LienGs1IoCpkv
         V6G7unGaZLA2mFNtPezK8K2gVBeTJ+CK+FxLti1qlKcxDDPlKhIGDtU3xT5aCSoMIlo4
         5eFw==
X-Forwarded-Encrypted: i=1; AJvYcCUdpJES8fG3MI0UdS6EADbkFjJ47KgLcEv0domzecmqnS/3n+t52rdqTpomdk0WXnxTGZFAJG+DveLX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+36xt2DOph/G/bYS+kNqLEWFF3WUjeOevirQVcnzGoIcPY8fX
	jUb/K/nf+cI1rTVsghGzPApHmt5dvgfS/evTNefR38240ySjcxo2DhU6OlZzc6Vq0m7JXwx0udr
	mQrsiNldf2gktqZSxPBP2aEbtg92+hp8FH2nl5Q==
X-Gm-Gg: ASbGncu07p7P1YXNCUfPORRCiYAGc4N/FIYGce0lOxRHU6VLTwIfod/Cz5/J8ekXrng
	0n0ySOkjG9tg+j6upZeFcpMYv51iqJ3wknHDcXq0is4EUTz60DIPq5E23z+Fqw6KyZkVh64PYV/
	IhwyTZCuc=
X-Google-Smtp-Source: AGHT+IGP05gd+tKAmHNLIYx59fJGUcXOpFn5E7WUbHiqgXJgfnuoO/oZlX/2XdBRPuKvDCHUORWy0P2hwCXTV/HE470=
X-Received: by 2002:a05:6512:3a90:b0:549:4416:df02 with SMTP id
 2adb3069b0e04-5494c332da2mr977914e87.41.1740731981662; Fri, 28 Feb 2025
 00:39:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227175132.3734524-1-robh@kernel.org>
In-Reply-To: <20250227175132.3734524-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:39:30 +0100
X-Gm-Features: AQ5f1JpcWRmXsix253vEwz0xl8LXX8T28Ut4ONXhb1Jer9IAi0xNCTvsBZEZyVY
Message-ID: <CACRpkdZ8twhOH1T3cStuLsD7a7HME-wA9YzotmrhgXmy-zvPoA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: mvebu: Add missing 'gpio-ranges'
 property and hog nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 6:52=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> The Marvell mvebu binding users already use 'gpio-ranges' and have hog
> nodes, so add them to the binding.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

