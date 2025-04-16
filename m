Return-Path: <linux-gpio+bounces-18969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30E8A90805
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 17:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7683F7AE31E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 15:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0092080FF;
	Wed, 16 Apr 2025 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wRY5L8Iz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428871F55FA
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818698; cv=none; b=MkaWlbM42nncOyc/IyaXabI5mEwVr34GZq5DqYLTcnikNsw3fUEr34pFYQPQq2yMWX/uaBZpRhAzi+9U3Qn+mSrG28HgTQmxiDEJiKfefbrFR9txlsm4JtHK60UgNXDqyncQIIMDEsmWuVzVulB0ywcjp6DWzVv5y1JrOe4SZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818698; c=relaxed/simple;
	bh=SXcGhAs+b3v9Y233MrSAopuLgFSZM3Rj8bpgVplYCiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsSzeh8NG1S5zkxP1jMHdOJyvbyaQ3Xazoukkg4BccmVIFo+s6R/w2fqUFLpT2k6ask37I5mVouNJcn3PwufEpVWM4VT8+kjtYpfwSTN6VChmNhiKK1NBgz4yPX3dZTZWEi/Non5SDGkJd/0hNmiTIwPXrMq/CDrtva2f3XNRrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wRY5L8Iz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-549b159c84cso8101322e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818694; x=1745423494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=;
        b=wRY5L8IzP5EeCq8SvKBALDHi7fk6iL6+meK6UWbzP34WY8cphCLk6hSSkbGEifhIR6
         cadAFZTT/Tal2vIC3ZQHVe3xdUjGMLV1jl7IWKio4rygFk4bc901UZUaVqEOiVhmnQbq
         swOA8u63LouhCAaXW99KZUuy/88SstIFZrvm3OiJPnHcW4ZCdjtbYFNs1pc57cDtcjf/
         f6fCj6IrCMTEz4Tb/oqINYxDZoFl6ID1+JbE+P2VDGgCKBDFHvTUHvXapEhAlHs+/5ul
         FpgvXO4rOH3lE1DjGKjF8K7uMi+89bGysfUeY01zwJa/MTgrDbQB32gT/751KI/cZyb/
         IRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818694; x=1745423494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZQFkTG+TE9XyLSvBWPzBX545sfzGUulEWKqLFKYrkU=;
        b=acR38/aqbIhzXyaA4UubGTns2PpLSxOy6mcM9CJl8Vk+hoyw3du7jUQtlWbj+tEgYR
         j1oQc7Tq3mDDWrOJhEZLgbur588xgvEBRjpercaDhm+UaZ2Z5Lpq71XWerp3E2kcx/3H
         gKPIhGXcKEUD3MpT6q7XnF5XgsJRP+zAz8082TZQeDbn3YHau65rZ3MAyLJ81B6ZgCWa
         hLGzCrB4dKCGtRcDgmZpwriEEh+VhDnFL1TRAkhlQuabyTuoIbSF2WJv5/aADQx/0DD2
         iEWXN3k0Zkniv9Gke9HrMBe6zhC/fl30dyW2rrj0iumUHovAlaaUyhpSXkvNdXNLY/S7
         Fmtg==
X-Forwarded-Encrypted: i=1; AJvYcCVIQQgUb+yfJ3PVtxnicop5QlCdPR47e8EFRW7SVjnymuHElIvmasZw5Shur52H+iQgmwJLh/tsBQKA@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkfgmJS8ejK3zcmckF5qGfS52a08DnyX99WlurqOIefQp0Cfx
	5SZ3izlNW0+brUv+gIqnjo87eH8z59AgRxnnrZeXe8lYLfl8A2cqoNfMhuna5uV3psokmJfJyP/
	cPkqIGRDGhylX25UVQjJK5GrTxPT8C7FepT+t/Q==
X-Gm-Gg: ASbGncsn9G1YHLhrBu7zIW2Iu4MphaUQqZOKLJw5o8f6GsPfeWv1Er8HGGBKGGte30R
	cVIiObBgKopKC/UQ4woh2oBYUxRAz26H4q5EOFNLkvmVQmmE+Y/87kteOfD5LGPvaM8USqS8SLn
	i2DjsOSOIMFTTsXLcCDQX1BhQ/Za7LdRuyZZnAeQv3NOg+n5oEujxhTVU=
X-Google-Smtp-Source: AGHT+IEOA9pETzEiwUlfAn6Sgi+fzg/ihyH1PJsUp8cWH2CmtJSYAu8VpLrjwtghIihEu2y05c8/xl7tyUGx2qaGSuU=
X-Received: by 2002:a05:6512:304f:b0:546:2fde:d2d9 with SMTP id
 2adb3069b0e04-54d64aa9f74mr849955e87.28.1744818694067; Wed, 16 Apr 2025
 08:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
 <20250407-gpiochip-set-rv-arm-v1-4-9e4a914c7fd4@linaro.org> <075b347d-dac4-4b75-9c97-f2578bbfd279@kernel.org>
In-Reply-To: <075b347d-dac4-4b75-9c97-f2578bbfd279@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Apr 2025 17:51:21 +0200
X-Gm-Features: ATxdqUFAaEqfpWy-Gz1MlrWfTBrFjpknqD-4vV0rj7YLmXL5PjV9ze05bHY7Jgw
Message-ID: <CAMRc=McFDhTRV9Zgdu80u+O30pADNRTQEsM79XOPndyGEk6GOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: s3c/gpio: use new line value setter callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Linus Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 8:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 07/04/2025 09:09, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> This was applied a week ago, but it is not in the next (next-20250414).
> Are you sure you feed linux-next with all your patches?
>
> Best regards,
> Krzysztof

Hi!

This is a bit of an exception for me. As discussed with Arnd[1] I
picked the patches up into a new branch and sent out a PR to
arm-soc[2]. Once Arnd merges the PR, the patches will appear in next,
I don't have any ARM branch to feed into linux-next.

Bartosz

[1] https://lore.kernel.org/all/18d59ff1-a357-413c-bde2-961ae0c9b5f2@app.fa=
stmail.com/
[2] https://lore.kernel.org/all/20250409083513.21115-1-brgl@bgdev.pl/

