Return-Path: <linux-gpio+bounces-9079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531795D244
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 18:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EB641F25EB2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 16:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE318189B8A;
	Fri, 23 Aug 2024 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iiwad0iV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EE18BB8E
	for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428806; cv=none; b=P+52WMFvEIwJGTmcUxwCY02Yud79EnfBA/+wYEwwMC2ADqQY0HVurQukecmwP/pZAjW/y6cm0Jg+qXV8fjBiLW0lhNyHhMeT+6t5fC8Uah0xIAb17B5jrCLXxOrlamW93pUVL38+xDa61fNoZrbU2qoSeFYXddXH08qj/MSg07Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428806; c=relaxed/simple;
	bh=N9Q+HfstvZrc3Uyj8dpSq40+6yhOtXrkXeQ5BkBE9Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVwXpHShqYAMf9nnurg+MDQ+dTnb+Tyh+rGfJJGgPybI4sotZYlltHqq9vAmv/is7ZcupXIVOtbv4We+t5NJKNeLlYqsi+mmVi73fNWrdu/8HhTZDiDEkLZai0gLWy0qC+nLEZ5f9ZsTrTzjMTX5eSdRUi1Xz49rwSR5No/0dTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iiwad0iV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-533461323cdso2490481e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2024 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428803; x=1725033603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9Q+HfstvZrc3Uyj8dpSq40+6yhOtXrkXeQ5BkBE9Xc=;
        b=Iiwad0iVu258zc/Oqitvsvpcp77cYcfVRtrErPCrrzbY1n7eWb0M4IWsouWyn/FVMD
         QC0evnXVtfiTNNkndOJniMSABAjTrilzlrxkM2yF8w+/mlQDkmSJWvQZC6nW4UosyNpK
         y22ZhrScMOXJVw4rRjW3a5QFd7qcJtkfPXO1dx6ofEZl7FoQebvE6RTCNbRSz27IrtSx
         DSFsx2K/WWCfyYZ9pSPzNrbU7B2U8gXsUvhvNl8JqAyFT+kLqX/6cKjzf2xREr4w8/Um
         iQGSM/a1QFsJNIwkRD2DnJVMsXAgSCwMZcMP2Fu9jeT31owhD1hQExuSxljO42SJyKrj
         /jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428803; x=1725033603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9Q+HfstvZrc3Uyj8dpSq40+6yhOtXrkXeQ5BkBE9Xc=;
        b=E9dnD3zmahCVSooLTX4gOMynPGUiiOVrgcJfUjo9JI9eiHUNDX38tXQQ7Iyyr2cuD2
         m9gwKcBoFUA9vtvSQIOK7YkWhelEawewtH0rgV6QSvA4Uf6H2aQQeAyH/UNO/ibTh/+X
         nvu0cIUdryhmcQ5vGbf3vwISooPjgoqyWK6pJ5aFs8xa68HDXW+hYcyCy5a82BmpkL5/
         q5wnF+3czvn/l+wQotKSZ+PeZKmdLM7ivCP0A9P/na7LLpqvpMkO5T5iik0k0fMXjBKY
         qawG7y6/WR93rawHdEaNZ1rt4/KVhNX54FnOHX/dQvT/Hu1BEkPKCnPO5VVAmvFbN2wL
         QUfw==
X-Forwarded-Encrypted: i=1; AJvYcCW+ss2qKpMYVQ+eaTpEcxgiJntJRbe/xwz4xDIj+4muksRZ9zILS9ugo1KpQaLkFoZF5WZSPrhapv7y@vger.kernel.org
X-Gm-Message-State: AOJu0YyhF7cXMbmxQWv4iYtfZoQGn1BINcB+O3d652kM5mSPiZ8BojGV
	6xqEaFU+NSNGebKwkbiHSv0xnJhbQ+N0lfWLYht1eU54apJm0pD7vDKEoddd5DTi+ARUbmmHBSS
	9I9S8OFGaN3e4CeGECcL3b7NRXaxjFLVnq8s6CA==
X-Google-Smtp-Source: AGHT+IH08LPEDFU5VHx7AqFMaGHbX23x27JBvOmuBNgaED1KnPIFyOCr2R1LWU/ISWTOYE+H7pGSrEdTHvtQQQj5kqg=
X-Received: by 2002:a05:6512:3088:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5343882d1ccmr1899018e87.7.1724428802573; Fri, 23 Aug 2024
 09:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com> <20240807082843.352937-7-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240807082843.352937-7-ivo.ivanov.ivanov1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:59:51 +0200
Message-ID: <CACRpkdYdJn3jSmur6q3+NrURFTQJO5tcxV=aTGXk7JfPyN1=ng@mail.gmail.com>
Subject: Re: [PATCH v1 06/10] dt-bindings: pinctrl: samsung: add
 exynos8895-wakeup-eint compatible
To: ivo.ivanov.ivanov1@gmail.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 10:28=E2=80=AFAM <ivo.ivanov.ivanov1@gmail.com> wrot=
e:

> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> Add a dedicated compatible for exynos8895.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect that Krzysztof pick these up unless he has already.

Yours,
Linus Walleij

