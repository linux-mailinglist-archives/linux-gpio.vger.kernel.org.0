Return-Path: <linux-gpio+bounces-24559-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E4B2C468
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01D423BAF69
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463E0338F29;
	Tue, 19 Aug 2025 12:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mngec7y8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985B1DF75C
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608176; cv=none; b=DGVwDg1uP/zlzxyIyzppa6qz9KWDIXhNUkEualGi11iHNYi0n92v/Gu9ckOS41rwQfDzw+jXhFjH613LbOK1JaYyE4Dzmj5wzAXPrdPOyLrz9JlxBprmoRJpl86RhlUs0ea7cXl1x44d+/cLqXBzEB1cVbD8mWYMIlZhM9CpAoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608176; c=relaxed/simple;
	bh=jz0QOg/akzSjE/H2JWtFn2TjUHHbmNYxDvqdiKH5wjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTlxAzS2Tb553kJ1OK0zVwxcxeUWA7hCzc7hsuiIX30CUAccnJw+IjqRBA6OJt9qEpF/O7j6Dg6zYev0wCPw5r93WySzcUsjhScC8jxo5WxvbyZiVczH28hoBjp7MT9XOwiAaSG7iy6Ar4zwgT6QbNJPWrbAfm5b1BwUMH+5UQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mngec7y8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f901b229so41241501fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608172; x=1756212972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz0QOg/akzSjE/H2JWtFn2TjUHHbmNYxDvqdiKH5wjY=;
        b=Mngec7y8BQP4xvfWALWD6RzLqBvh4Iyw6amqXKQYGZMT6S8DehFMRaxmgFHr3sEpOo
         Oaj3FO/6Cq3d310OXbGrVHVXKLk/ZoK3LJxVumQ7OPlLrvXV6clsfB2Xxh9M8JqwCkj5
         LMBuTi+h2oCslNZciU0Hd5pIG0iiCjUbfTrdPXLYKU2Alz3HN6mWgQopJQrwNpZS5icZ
         BiN+0AmmUf2QAMuYMD7otAFYl+JUOUJLfd/NHY17YAHcddMVLmgRWUm+ifZFBaC3HMNb
         g9Cy4bu3BjMjJXTqJWY7La/fCehusSFhFQVdjsh5v84+4EmTbY6TjKpxZ0NJgLIRmjar
         +4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608172; x=1756212972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz0QOg/akzSjE/H2JWtFn2TjUHHbmNYxDvqdiKH5wjY=;
        b=LmEwYDyY536MQ/GYbg4wx4sme4C3NoWc9JBLfAZTDv314BL0slnPccBfkw/zV1fJtD
         AC3o/U4GAQe7hqyPtN38MxEdvmgolqNRo9M11LhvwrILcX/wbRrrZ3LdUS+acyJNJX2r
         h3cOz/LPbJ5fLauNFUrlHnucT4gHhEWCNOJ3LAcMTVUBVylWCTbLIhFAyhd5iMgJZOHT
         7nuUo1Y2tAjBHVOITDnMIwou46ZaU0nyUBeOW7B62LSgMmu2qzq1fd3vXpjHoNBT2ut9
         5YphGA2R+j0dw86tZfIVpeOv5cUCeNoEls0p9glVWQoyS+ldlEJO8mPIf7T//j9iuMWE
         FHzw==
X-Forwarded-Encrypted: i=1; AJvYcCVKqnIpSzNq6lLpOo81Dclx3mlfdSpv5cSvGSKXSLV3caT509ZEmNwPyJdf+UF8hgoTKLDh/P33YTk6@vger.kernel.org
X-Gm-Message-State: AOJu0YzmgHjtGOlO0+homUrFOOF7CXMdH3vTddgRX3iOnyHwgy/aUw28
	web1+pkWtROQeC8pV4aJmG3GTsc0ofpVg9L+XoYYZGhAszf79rx90YqxFgJV0ybkYtAr/2/AR+D
	sQzHV0VTcpA0ckb/K5/9qxnQ0msS2v4+ywnXSS4gdn+kd5S7vYOU2J4dZAQ==
X-Gm-Gg: ASbGnctB3XLGNkeskrUKKC6vG6FiOUHrljRIaqMUqxSU4YYwsJJ8VgHgZw62h6dDJmN
	2AfrZCb1Lgv+fPxefPTfE38s/x31d6SZIV2+BvvyycbWTMk9IKTzvwGQL4jbTlft/XIt4Xylt5o
	PnJe5x8d/yEqFchc4GPjhux2j6Mmc5Hh8gVia++DDi/PmO7h7QOWX5L64IJfQMiHplTasUUECzY
	xnQPFzYaMrpaqSpcA==
X-Google-Smtp-Source: AGHT+IFUdE20zyrUEk40f2kUzg2iU7WpPNLkuJOKXQXp3DLrjB3ncJifjSzbF9DsaL3zu7uLvfHfbMV3X1spc0EVxok=
X-Received: by 2002:a2e:a594:0:b0:333:7e5b:15c0 with SMTP id
 38308e7fff4ca-3353050e1e0mr6448301fa.13.1755608172324; Tue, 19 Aug 2025
 05:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
In-Reply-To: <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:55:59 +0200
X-Gm-Features: Ac12FXxA0aTHF_AbE4XLBFhBLRwXcBfdoeDod62FVE4dAtkrcQvpYv97-QS9ik4
Message-ID: <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	xiangxu.yin@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 6:41=E2=80=AFAM Fange Zhang
<fange.zhang@oss.qualcomm.com> wrote:

> Set PINCTRL_SX150X config option as a tristate and add
> MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.
>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>

Fair enough!

This patch 1/2 applied to the pinctrl tree.

Please funnel patch 2/2 through the SoC tree.

> subsys_initcall(sx150x_init

I seriously wonder about this. It feels like this driver should
be a pure module_init() device. But other users may disagree.

Yours,
Linus Walleij

