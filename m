Return-Path: <linux-gpio+bounces-17598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F2A60E2B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 11:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C53F3B22DD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Mar 2025 10:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACFD1F3BA3;
	Fri, 14 Mar 2025 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FCUjcV8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA011F2BB8
	for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946739; cv=none; b=SsGfSyS8pxWEwoMa+VdAAJ+zCEJRcFQjsQDNQw/0WmZnwPLKh7D52ZjuduE3mR4cmqu0izOW/W9Pv61Cs3CIlSdbKCGRMIeksXi3Xc6k21RQDKcZBqulliOzaKsqarSeRbcaUu7bRe0YdPbZCHDKicO015HCUCx+Zad77IM47vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946739; c=relaxed/simple;
	bh=eh7XBUEDnEVmfAyoNroU4thpP1DbmQyPdxpMEoCLtgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EpuKEdOhwwn3sEt0aQCbeArbdriqOgo/RU2B0Kw8epY8j9v/hrCQDlpDtSU8jgxlUDBYzYII6jUkCkc2t7BBm4/QGUODBnbuMv9Um+JHyz4d7JeYAFWQwnwj7qObRD/ptFMPX7SIPbIMr7IEjhpCRpUvzwZGrgQ+SmavJ0XVhXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FCUjcV8S; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b116321aso2176983e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Mar 2025 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946735; x=1742551535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh7XBUEDnEVmfAyoNroU4thpP1DbmQyPdxpMEoCLtgo=;
        b=FCUjcV8SX92CMT3X0ijaQMvHZ9pDAfqTcACj3xPrUrYRp695WKeNmLJh52zXlt3HoI
         EEykGgzvpRTyX2vQGP1VNlYi19LgXJQKuXL2Lh9jMzyvtLy3hthwyVeKeWiUfpHbtbCz
         o4wptzBJGCQKO+urNfBPCml94JNk4V6E6t+hh6Wk/yCfGgLFqUK0z0nZw0Wj6ZTs4nJQ
         9Uw83meDvpUaxb2JUIrj8XQbN9v/l385hQtumdjjNAk2ZszYWXyhjgilEhnHQ2jEthpz
         knZKaSjmh4M15KrOiLE46tU4X1dLn1Y0AMsuq+tRCYW85NeVW1ULUfHaHxN2f1hUB3Va
         CekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946735; x=1742551535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh7XBUEDnEVmfAyoNroU4thpP1DbmQyPdxpMEoCLtgo=;
        b=nbBGrSl+8O8oxsiNcUiQSHwZTowMnFeT5M+k6j6bZoPtlviiZrBR/pn2soMRYjOFup
         byWguqu00jmcfI4o0xd9sbdkxWso30Xm1f+J5BGYHlcnmN+yYD1AZ72e1ddlRO90LRtJ
         TFdL4McYOd3lQOZjN5gEGXDeJZAZiZyMXdWqfLtqQu35I7BNMUd4wH4f56XYRR8nbN4i
         wzv6ylMDRfIuGaiQnAHR+be3QolM5m4FZ0kRPadXOT7ufXryOGHrNQDJIZRVvU4S3EQG
         h5fGdBnsV1epp6OlgPMBaPOPGxt+h5fSq4HTrWQ0RTv5vpHvc/9OOnmpHoItQvG4Ltfe
         tjZg==
X-Forwarded-Encrypted: i=1; AJvYcCVMkepX+grhVdaWqDajjfgR2czyxHHFQVNA6L8gYQYgYhTpy+bPyn1nbia2XqxIxqgjQtFvX5DsKv8B@vger.kernel.org
X-Gm-Message-State: AOJu0YwryPVgug+CGYj1arKIFQkETcSUAUqLIcd5BpMFnxnTi8FdySCv
	Hpg3DJG+UaUPt4YjlMqRnkvAbJgKwYl9/2q2nJpMkhPytAnsKeibUn8s0itFsGvj+CtEKSDJjS0
	9W7XpS7I3jccfSCicuFM5vqAk5dQlxSujKT9p5A==
X-Gm-Gg: ASbGncso13zEIwEbrEoC1ipsM7JTgS3CfGfeM9eXlRcHwioY1we4yvNptdoX/FVuZHR
	x8XV/uOuDEaafQ1sH4tMIJ66YMo5JH1TbpL6lKwSOpMkun8AKIsRDpRWQQcBXbY47a4ZwazoaIk
	Q7ojpec4HYRwD0Tasj3TysIA8=
X-Google-Smtp-Source: AGHT+IGq7cAxgMP4haGgqamo8wwHKjXDUhcyOZqf0mmG9W3VrgKR64kadUBSXZx7M7CIcN7MhQwmpihvt4wmbXLx15o=
X-Received: by 2002:a05:6512:234f:b0:549:8809:ee32 with SMTP id
 2adb3069b0e04-549c38e3902mr515413e87.22.1741946735490; Fri, 14 Mar 2025
 03:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306050542.16335-1-pshete@nvidia.com>
In-Reply-To: <20250306050542.16335-1-pshete@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:05:24 +0100
X-Gm-Features: AQ5f1Jo6_TwKRRb74yZji8D81Rnz7yhFrbdO-8qqdDKIhG5TYe9RyB3pUy492vY
Message-ID: <CACRpkda-VjHnd9q1gijWZZ0zygUogPtN6VY-G+GEqdj-EbOv9w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: tegra: Set SFIO mode to Mux Register
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 6:06=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com>=
 wrote:

> Tegra devices have an 'sfsel' bit field that determines whether a pin
> operates in SFIO (Special Function I/O) or GPIO mode. Currently,
> tegra_pinctrl_gpio_disable_free() sets this bit when releasing a GPIO.
>
> However, tegra_pinctrl_set_mux() can be called independently in certain
> code paths where gpio_disable_free() is not invoked. In such cases, faili=
ng
> to set the SFIO mode could lead to incorrect pin configurations, resultin=
g
> in functional issues for peripherals relying on SFIO.
>
> This patch ensures that whenever set_mux() is called, the SFIO mode is
> correctly set in the Mux Register if the 'sfsel' bit is present. This
> prevents situations where the pin remains in GPIO mode despite being
> configured for SFIO use.
>
> Fixes: 59b67585e242 ("pinctrl: add a driver for NVIDIA Tegra")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied.

I can't tell how urgent this patch is so I have applied it for next
for the moment.

Yours,
Linus Walleij

