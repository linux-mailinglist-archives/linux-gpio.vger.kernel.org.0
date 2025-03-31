Return-Path: <linux-gpio+bounces-18127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4034AA770C5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 00:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859AC188AA77
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 22:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D3F21B9CF;
	Mon, 31 Mar 2025 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quh5fnUY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3B6215073
	for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 22:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459372; cv=none; b=jmY5zzumlMgmUpZiS3pdPueEnshk0gzpKnYxdKh19LovVOmeF6IR/uwIVexTiiDDyPAh6UGR8scw+aDHuVcbjYAT4Mg6PWyxyybkbBkPciFNUJYK+wJoWx74+kevWFsXNFOX2OIXvWrNUqKyfvDwlhbomjxkOZRizhB84YiWqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459372; c=relaxed/simple;
	bh=IXOviXBMgfCnz/aye9nkC1ZBLrrMa+zzGim+4gLGiMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqYQzgda2yVe4hBPts6hfLLuuYWjTnKyqfZGWJjPxwrDo0LQxDjMplkPDhV6H7sFD5XNaGtsNV3YLBl0BPsgjgT9nEdX3ODsgze4Sqw8ZaiTJ+A4W5bbCzKYMPDiVHiTYqMyThlJmln4kNepMx8el1paUb5bFpHD/xMGpxEfyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quh5fnUY; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30db2c2c609so53758621fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 Mar 2025 15:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743459369; x=1744064169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXOviXBMgfCnz/aye9nkC1ZBLrrMa+zzGim+4gLGiMk=;
        b=quh5fnUY7K58VvrQEGZ+1fJuOcXISccnvbOHk/mSeeCHvtTX28SFQjkKh8WLbNkB0Q
         KsrKuQrmXuDGJXozq7Lms8XeUKK1Wl13ys3Jdl0sgChoApdHzKS7WJpnNUK1IJrjJqBi
         XnDVvO7HhE7npfWs3GrL/dgDwyzG6gh75HSYeo/mPyxh9FGtnYqttxlvGmDtziR5+I2F
         mOvt5IJi9lc/DwlBUX9J8veI1esGU/duhrS+gNNrxqDuJf4dBuoorN4t/g9+IbBWeWd3
         9XNQjQyrn1bdEsGld2bJiLup9sTG2sAD58H7yT8aZ/0NCAzmxLHBUbdbpijnHfPeEwnc
         u8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743459369; x=1744064169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXOviXBMgfCnz/aye9nkC1ZBLrrMa+zzGim+4gLGiMk=;
        b=H6jGuTJE8s9Reo9hMm2S0dWhiJI2fVaiO0xH7LmmCVTKZ7DjjHr/XDmyaYa0vdS/rq
         9URHjCg2qRCGodovK4J993evO8gpH4pvNYC3ADxPT+rxMrl+CaCbnjUIztRnIXTWPGeK
         adzi3rpWG4kWi90GHHO6zzf8ptX06fuDwqwAxkYLmYpNulDQvbM3uXewfq6c4x7ngKjj
         PTrOehCZWnNbmYcMBVtd3C4yCgQwW5RMSz/c3BBJAtYqkftWGqPyu2PXyzS/RkozU1qe
         JdDk5yWxVFS14/VnXPjqJfwxdEixB3DI2X2MjxmJkmKoSkPp/ZZFlp94Qyv+hfbpGL4I
         71IQ==
X-Gm-Message-State: AOJu0YyWZl6f/+w7eEm0tRIc7xUwd+CbEryom+34fzTDE9/CLqxk/Y+N
	aCmSnHQzZAkUHnfzqbH99oS6+WDylIerWyDDpnRPe+1wBjJc1hA3Q+UQG7YnfKE/lHQXOdw4ZSd
	Dyi6adoWKR4hNpQkwd2iANVcLYhrK08NHEXXU9g==
X-Gm-Gg: ASbGnctxmLbvdfNTzspkC4wL2vv2B6nWGNdpo23TCnhOjtp/2o7jSfiYOEOG30J99vK
	NJjTWnZjVDyDirOFEMSH8Heja6w8OAikhY9nND5bK3QiDsF5st9IHSqBOHokQQo2GIPAYAhZyJR
	Rpfr3vTD+9vfUAeX6L262ZXJnvsAIfRrX/uw==
X-Google-Smtp-Source: AGHT+IHyXth5e+Qfkt/5ZqIw5FJ0bWF1qR6LbG7RnZGpx3CV0a1HbyPHTkxsZdwzBXEwPPKnms9hPHWQLIJqZfjg1/A=
X-Received: by 2002:a05:651c:322a:b0:30b:8f60:cdb7 with SMTP id
 38308e7fff4ca-30eecd3b729mr2004601fa.24.1743459368672; Mon, 31 Mar 2025
 15:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
In-Reply-To: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Apr 2025 00:15:56 +0200
X-Gm-Features: AQ5f1JqTfOSTF0vASqrPoxMPNXGLOOq74lUIcy8hrQrkhq7k7K6WPyQALUf3upY
Message-ID: <CACRpkdbgCf_1Bj95-GhC_GF54fq_UbJ5m0xcGC0gv3849kfwPg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: deprecate and track the removal of the
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> This feature is another pet-peeve of mine. It's a hack that people
> started using and now it's in all kinds of drivers. It doesn't really
> explain what it actually does, and it implements it badly.
>
> Let's deprecate it officially, add it to MAINTAINERS keywords so that it
> pops up on our radars when used again, add a task to track it and I plan
> to use the power sequencing subsystem to handle the cases where
> non-exclusive access to GPIOs is required.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some like drivers/fsi/fsi-master-aspeed.c seem to be just a bug,
are all non-regulator users bugs?

In general though:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

