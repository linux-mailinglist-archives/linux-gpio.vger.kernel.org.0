Return-Path: <linux-gpio+bounces-12993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B709C8422
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 08:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CD131F232E2
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 07:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517801F12FD;
	Thu, 14 Nov 2024 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6RVNI3e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5752A1DFD8C
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570372; cv=none; b=FN8eY8fBAQrs/Ng8yhG4EzMuvVnVsNblDIYmyrrbb86xEmznDqruO8hVK9uP+Mbo4xwZq8Fa1XeZTMXAUmUZ58nnmZz5IvrCsTsK66oCgJD4YTVPidkctRFcDr5gODlq/0W1sn9I+FnS2KptGOv8ffl7HfKWPfYG9XPq5gcXQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570372; c=relaxed/simple;
	bh=LSVHN6+4B3mrJyoE5/o8RTiqaMgmbaOrWRy9LrctY28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8rd9VrLY9FgFT/yQW44mLre6WPfg6pOAGuIgFv6atpz8wFVnlswoiMSoUOXcFKpk607iuOFzusE+HEatDPmaDMyCs8I4MLyyL6umakeALrcGVBLA0cl/y86K/cQE7lqzghC6w/7/FEvvsb2a/gHbgrzff8LDESfenATuxVhm+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6RVNI3e; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so2514041fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2024 23:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731570368; x=1732175168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcYuDRBfayb6mBBMDxqM7+ACEUaNjvDbSVP1//2NycY=;
        b=d6RVNI3eBIvIVluFIE1ZH4PKcSoxtglkw0PLDFryxvmbknexi24tmhHkH4Fs8jQIA0
         NZAQsyAOUIv/qJ8gsDC1yXBiw8ALQeVVluvmi2Scok7E7eYQ/jEZz/1oKRzlhiPVygH/
         3jY2d6oTwzlF/OD4YIMG+B5BzKrRtuPyqoDe5vEtZQf35hwRFU12X6xW1poD5+PjZozc
         P5pskuLTfbXmpomL/pwh6apMBmj1AU5ybeYCSMy926baRfQVDSYlH3wP9ZakaRdZ5d2A
         xfLdBHWy1xGAZLM6v34RpXtcl3sjvov8O0tH5cJtYw+JjuZfe38L8/oW69vdZlXdUd5f
         6fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570368; x=1732175168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcYuDRBfayb6mBBMDxqM7+ACEUaNjvDbSVP1//2NycY=;
        b=F+n7T3KoC7UzpfVSd3BQaT/y/4I5j5weffj/Sh8MnAhJJ8tv98+A9z5D1M068uMF+5
         qnaaJf0jvhW4qjDaPi7PvPllwrxzSq1yiXmk+LJFAsjZ1W1xwP9F49aqxuXQOV//eX3n
         XMk1bfpm1bTy6Fn9FJ7wLI/yL2sVWGZVgvHDBUQXbbjJtGnWAr2DAWr05bobPiRmpoDe
         573zPyv3gze0mPAOlV/+3IJHof1K+vugLtfw364tqhbU/VVlXgV72a3IL2RFRqg/pSJe
         GQMDszN9Mwsb9WD1ZYndYPXId8TMQJIKhjMOofSogg4sD4k7NOX1SC1z9J30dGSTPOw/
         /59A==
X-Forwarded-Encrypted: i=1; AJvYcCUIE+zx/ySdmb8iquHtyTStZTPDwRREsYkmdLWIHjKcFinfIwZQtQAeA4mfvCEVELxgQXVyhwD87g8M@vger.kernel.org
X-Gm-Message-State: AOJu0YybYTn9yEvFSns172Xv1FLetpLF69sltUntan5tnne4KXxRBtcr
	RpWsvKF202o7QXtgD1FwUi8HjEihqoY5dAWogspf5nIe4kV68dEfpjdJfu0jxI8Cj125XAcv2oP
	EdTMM8y+5EhGDq8asLgZrpUW9qoMpk6GujGtlEA==
X-Google-Smtp-Source: AGHT+IGCEDVqcslf/1H28BU87PXy+jbV6XN+UhRo7uz2l2rNis7Lr6kBiIrOnmhujdEdkkE6Myy7Rurh9bh+a8s+KnU=
X-Received: by 2002:a05:651c:211f:b0:2fb:3a78:190a with SMTP id
 38308e7fff4ca-2ff2025944emr126536061fa.29.1731570368516; Wed, 13 Nov 2024
 23:46:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241113171219.2949157-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Nov 2024 08:45:57 +0100
Message-ID: <CACRpkdaUUCXS7ifmM8fLF3Hgs4YKNLCxPripfSTmMEKvcLOuQQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Move and sort Kconfig entries as suggested
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 6:12=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The Kconfig under drivers/gpio has a specific comment
>
>   put drivers in the right section, in alphabetical order
>
> but in time some of the entries fell unordered there.
> Put an order again.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

