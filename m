Return-Path: <linux-gpio+bounces-3935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7573A86C578
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18BDB1F21B42
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6AC5F869;
	Thu, 29 Feb 2024 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+NkVQ4y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19D5CDF6
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199412; cv=none; b=KLaRVuD/2etds7m5+Ya3xeGGdhoE0hryXPN1K9RYHcQld/VfI2TLRAbX0DgWOtHgoQJ7f7Zsq6l+p/v2G+ArixdonQF4RLrOfbU9sU5kewKlVnMaHs0x6v/a12dnXbBk/sXY91ERoR3wy+x0nVJVZju0QUGXWPiAFpth374MKsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199412; c=relaxed/simple;
	bh=HRVE6hg2C8i2UwVPXbLbNe+/2xcMJm0w38qFCouRcX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nO/pV3vWmNdTb5scl44CAbR5t51zA5LfvEWq9sUAl2Hlex2lN+8aG7mnJWjTew+aewtXnjuVe6skdMuNj/z2/m5SMBhfZNW4B6HafUYCoP2LGUeb3SIIBKrYrPYrp2C5lsNOfJPPEG+XfoUpNGS54/vBrf/06kJjC04fuvOgnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+NkVQ4y; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so738942276.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199410; x=1709804210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRVE6hg2C8i2UwVPXbLbNe+/2xcMJm0w38qFCouRcX8=;
        b=N+NkVQ4ym+hJ++FuHGWxjCQntnhgkVRmzxwVeleBIaOaEfaso+MqdJ7pXEeiqu2l1c
         iTjOgvUsCG4LvuyDV51EmtTIy3iBs4qxbI+QiOhegFj1/+JVpLt01/xc+3/exjI4T7kv
         qBqacYCybOydjJT8n+JR0+bi1qja12bQOGApRr0i9D9yoy+ughHFyH1GOoneyZOBzsro
         /YqneMt7yNFDRMPiziP5ET0Y+zgicspC/OM1Pbeua4idX2n9O4BhzWSZPhI2UoBcen9h
         G/0UMurtPgSZbJizdEbmXq+Bq99wcqUhREtlnXiwul9CZzz7yYn9EiLXJtIIM0OMHKdK
         fTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199410; x=1709804210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRVE6hg2C8i2UwVPXbLbNe+/2xcMJm0w38qFCouRcX8=;
        b=lXKjYTjJeMgQnwzjpy9A947UVZQMhbDjrqAfR3lVAFugOaPVcu6OQrKHH39hJ/2YRY
         H5icrnc3ckBGXxkZgDcCPpXGzkLu0EH7EAC1X++1/OcTKvjMlggHfIIeJA6nGPGerBPt
         Ye2r4D7N5a8R9ss53wJA/o3b8o3M3FEWjegD5M7NtkxuXs8oaEZIgTzu0+hiBlWXqQ73
         a8WYwAuNm7Qu04ZgZl7FqjBShNU2G8AG9LRsmr7lOeBy8m484MMA8ySgTVDHdPMKuGzN
         kcgbQZt9yboQ1p784sD+fTjuTCda4Us1XWXJJt7sXbcltwUZF+CLZhjJ68KAGTXtFfGm
         q82Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXyMs5oi+UnmExoFG/sEOih2Z2Oq2fKRbSNyP+mIjx7dRQX9VDSaS+44GQ08NGSrIpieYm53TZekNuJ+0LY913h/bwyRQGyh5Tww==
X-Gm-Message-State: AOJu0Yyyk9eoIfZ3IEkNCfy9XFyN0ikW2Rd8pjXRAFlwFIjJ6DY2EK5W
	+l5kKvWgZHtTOnP6sP6E5rngscYEX00wsJmb+9rIBObQMNwvOucNzkWxFaujlggyxbsc6n6StKw
	4xMN/yrUTIqYLf46OhRwhqCaasz2xnankQYL8YQ==
X-Google-Smtp-Source: AGHT+IHhsAuM9klDDxUX49OMI/K+reZg5M4GVu3UBpyFzS8Yyn8s2dq8RMcE87J3B6/nRu2TcRiTs79BHRiZCfGsL/g=
X-Received: by 2002:a25:c285:0:b0:dc7:4800:c758 with SMTP id
 s127-20020a25c285000000b00dc74800c758mr1523503ybf.10.1709199409964; Thu, 29
 Feb 2024 01:36:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-23-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-23-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:36:38 +0100
Message-ID: <CACRpkdYniG8Mf-Bybtq5t8VGZvMvBcugise7g78H19fPDn24aw@mail.gmail.com>
Subject: Re: [PATCH v2 23/30] gpio: nomadik: handle variadic GPIO count
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

> Read the "ngpios" property to determine the number of GPIOs for a bank.
> If not available, fallback to NMK_GPIO_PER_CHIP ie 32 ie the current
> behavior.
>
> The IP block always supports 32 GPIOs, but platforms can expose a lesser
> amount. The Mobileye EyeQ5 is in this case; one bank is 29 GPIOs and
> the other is 23.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

