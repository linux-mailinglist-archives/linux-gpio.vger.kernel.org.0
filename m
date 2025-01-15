Return-Path: <linux-gpio+bounces-14841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14589A1230C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 12:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0C13A5ED3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 11:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F3A22F17B;
	Wed, 15 Jan 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vi1jSAt5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F404C29A5
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736941927; cv=none; b=mFXaFJAHDNqjY0copzapTPcsn69NFOKXjTYT/pCSiobx/5JJlTHnQgFURHf9kq6uv9u+v5msVJPW9mUhAPQLnjHhj8SdTXSLU77js/ufRuxxOR90jjQPBF2R/Z8vyOgqJvg2+sg02tp6jWOjVNZ1KpVGzMWqfADNltzLqJNfa7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736941927; c=relaxed/simple;
	bh=SIBTno3A2IIooKmchqKWOBl+ofanw0FQdQBbJdFPrJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9VeGQvbQn6f531PhWOxD5kIG4nRtbkF4pawRkIY4P4TnuNcFhRyoiqzTvJ5WmxE5nbmlnE02CLoDRl62bgHfCwN/aJZKcWvDHr3MSQlDysMTGvtTjSH4lUpn6xk2grQd/PcfCA02psXMlMHRUw9zVKaZQKAvV15FmyQRSamrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vi1jSAt5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-304e4562516so7803081fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2025 03:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736941924; x=1737546724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=;
        b=vi1jSAt5+8db+mGkT617YyQY626lfOKJUU7lQOhpSB10ex3mEMg5TbHdvvgD049Tj7
         QAugh30Vq1bYwjaR/AfwEWsUP0Ylzztl8iTvcV5hwxx/8XUVc1DhWfEl722AKgkS/Y+Y
         35oWjygaJ46SU7ChLTp73ZFlcokl8U1xN4WBbOoo0DPPPgwlHAPMhJNwQZzkHZ3TIjWb
         oApTlMEK+2t8sy7v7N2fxg2wDk0JfarNI+sWpA5k3pK0obJcpDIlkuUaW2EzqOl5V/Ab
         TX+cjtRh3DU3HRdLbgPfC2HppEIjcifSWUxiU3w0Lyk8iWZU3UG9GjFY/LjCZPUfrq5Z
         t/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736941924; x=1737546724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=;
        b=a3/JqQglFvurIoXMGg88S8C8FZLMyE48Q6Eta4LtnD+XTIFkWZaf7uXSPx76S2DUea
         x1fPrNQZrO/PKQrG/1dLU3tNV9ljY2BY9J0CP5BAMBhwx7X6xoHe8wf68sb4ACnqVPPS
         K//b9jE6JVVR2uqsOzHQRlvEiEjZ7l7Oi7Injlaa5AZZVzTRcHHOROkXVZEYxaLze7hl
         tZuVVOZ5//Rfnvy0nBRoBXBzJ1dgAgT3tm5D1IsYCv1h+bDdfhx/BpJ6aQeMs5viT2pE
         I2qlMbBUjZwP2Z0W2WUL1pYMDgg1o7qDP+B6WrxbJKvAB25iJ7CbTySnkn1lw33N5XP8
         67xg==
X-Forwarded-Encrypted: i=1; AJvYcCWS9ZxAvtGJAPcW0stIFYfNK8k60T15KevLfzdhqEAnU84YE1odq/naXaXZRvmdckHrI0+5tVC6hRem@vger.kernel.org
X-Gm-Message-State: AOJu0YwbbgiIRS/9e8mFzvMokfx3hYqXOT7IfffPc/fjECw7CQR10W8U
	Sdk9dBw3sCmXuUfw+eMR0F10OVRFVTjEDlDLsPcjjF1w5uYLEqug+8sVFiBsiMQDjNjnacgnrRx
	iYYq5JeL4YlZ/PGk2a3S8sZ/EqkYIsxdByeBHow==
X-Gm-Gg: ASbGncsU5NzGcaU163v0Am9trFVJRCDX9ohaKvXpXg4YtrEqKMGi7j3zFrZpI+2O2Gr
	bwuAfS0huCsyizTmauE57VfVri9zjiSZLiU0ahQ==
X-Google-Smtp-Source: AGHT+IGKcxZyPOd7E7UVx7R0mhE5720LI7mD2xNitAn5d4klzms7tIsW6xzgbwpkS78QWTFRsjjqnZvLe4xu3sB+q9I=
X-Received: by 2002:a05:651c:2226:b0:2fa:d086:bca0 with SMTP id
 38308e7fff4ca-306305b3d9dmr9266981fa.10.1736941924002; Wed, 15 Jan 2025
 03:52:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:51:52 +0100
X-Gm-Features: AbW1kvZ75WbEH74lqZTgQ1yROwYhyIN7pTh9_hdZdknNaesgXbnLlLUetNHb884
Message-ID: <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Nandor Han <nandor.han@ge.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 8:14=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For a while I was critical about the string helpers but since both Andy
and Krzysztof like them, I will consider myself convinced and start to
like them instead.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

