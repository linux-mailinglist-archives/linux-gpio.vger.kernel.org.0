Return-Path: <linux-gpio+bounces-26050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFDB54D87
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E775C0B16
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 12:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97E9301011;
	Fri, 12 Sep 2025 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXzvEr3p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E00238C08
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679698; cv=none; b=j9jHP6P8Mu49WGvdp1jKkGCGy2IAIJakZTP51ecKALIktzbipowxIfTS4AMI3QWD7F6sJpRVtWy8BKM6VyIhOKXY73IRdmrpIxoYL7x+GhJi2b2jl5+oXcRlydvYkAddgtmwJK2Tjbq51D3rMOmwGsvA18bk21sg50IJZepL/s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679698; c=relaxed/simple;
	bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iK1fTStdjEchB66n0FR0knz9un7nIGbBAepHOed+vMehvYYJcWWAh2/UgEYMBjT4QFZEkG1fvWGGRtS3iCdVVuF4EO0yeCUOOn+SUdfJU5jaPNwlKjwHf2dAR5y7I430/LQZsYJ1m6uHSsu/ebuJMQk8mJFNY5h4MXE7qJ5dk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXzvEr3p; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336af6356a5so15745011fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 05:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757679695; x=1758284495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
        b=wXzvEr3pmT4Sl4/LCAiyiwjpJqkBr85EdnP+liQFUnK/A0L8tYY+RGAQmasqtUsFMl
         eIEk/4tVwUxGX7JpNfl3JHVivDlbzh/simb9gu64Xn7ztuzuu9cr9LRLNf2wVzXOC9VO
         c84baqU6+a9RUIT2i0hA49E+qEHy+3/JEZBm61IoB6qF5c+S4qp4rkcNZKG0AtJO3jqI
         GI/DXTXrglEbki2f0n9RNlCU/oCu62PU2qFONhhSOF+lExrISRRT3Enwv+CXkFIEMbg1
         qINqs5l56sp7LMoi5B4ElF9+bO9d1OMtzcgRZVAJFaPMnaM182oWecQeTZdVJ6niftCX
         Zhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679695; x=1758284495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yht0MzjKwXPqfzMkTMQkKpkg4jWPJryjUJrJkqlBlvA=;
        b=KvlOqWpW0X2lfdtv1TFpfmIoVinow7nvUiXizn9QfGw624TLgFpZgyXSKJWSCWDOlQ
         Gw5wulvsHngJ4gipLi652stuxFWY24uEVWOZrl83AQF9KYLZ7kicIq2Dj8qg2feihCtg
         rzboXFmKA4ZZQfC5oQSlBMtQcoFGaylluvwhDIg1ordB81qSj8ii6lC7FHMYb2fAAC8k
         bo1fMFBoYp5g4vyz95V12lvw9gGk9xpNtcYHbL6u5D1ycjKZ1JeShkJn/+iCRd4N6S17
         1eAfr0ElQFs5UJ9kpQt6ex/K3/LYmREMsi0hF62Nmom2ezdmQ9FXFNUVj4avUcTFJ1rJ
         XVag==
X-Forwarded-Encrypted: i=1; AJvYcCUnfi905lxwH5Kmha6znjWUWsT7ifydmjRC4QJtrHgxT8wC/OWDEN1QLBYdd7JRwupfC6yuvsDZ6uQU@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5webJlg44xzubtZV/LBCeDHu6rYL3mdDV8apslGDFKkHHH1s
	P9NQLmPbClfxBsddh+q4g3iwJdpybikuff+4iOl7q6dHW3Fl/+Gyl/nK7C8m+WsYcn5Husv6U0d
	G8EZ6tT6ATmLE1VZ1mxBRwdPNkxR8VMm4/jBulz72Aw==
X-Gm-Gg: ASbGncvdKtA2WMsjDh4p30XfMa321JAbg8mxBaYCUpNcEChi6Jb60efVfjDFJ2wDKK1
	rsKRgNGk7KiMY2C7aiIarPghaFD1d/ZNS9RXQ20FoQmjKurYXB9KPgJNY1LL8R5Ief4t2JzPbhQ
	V1hc6dhyC7tu536jBj8vF4lz6XdPSnDsNNnUXjtwSCTFf629FLoh2qMFZeRubrgFXcev4DRiJe1
	i70pEk=
X-Google-Smtp-Source: AGHT+IGIryVwwWle5BuCNtAg9SWHOa9Fynk/RUJtYWpT4Bd8pqtmMPa6Br277pH3nUbppV/EZnHRiOtwLb2ws10wbU8=
X-Received: by 2002:a2e:a9a4:0:b0:336:cce2:fa5d with SMTP id
 38308e7fff4ca-3513a8ee15dmr9949001fa.11.1757679694596; Fri, 12 Sep 2025
 05:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:21:23 +0200
X-Gm-Features: Ac12FXyVfQQZrEJmw9O1A4dKUe7GIFb_xvJhZW4e_4RrQjwp91fxqMFdqNnM--Q
Message-ID: <CACRpkdY8-j0aCoz+akWHOX6WQ7nNLMbN50A=_7cgNPSUBuQb-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Simplify printks with pOF format
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 11:24=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Print full device node name with %pOF format, so the code will be a bit
> simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied.

For the follow-up remark, I think it's an improvement with the
full path, this is better.

Yours,
Linus Walleij

