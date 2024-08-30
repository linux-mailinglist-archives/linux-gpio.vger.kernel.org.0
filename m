Return-Path: <linux-gpio+bounces-9481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B927966C8C
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Aug 2024 00:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17D292810E1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 22:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8CC1C1AA8;
	Fri, 30 Aug 2024 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIRXkQJK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D3714EC52
	for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725057330; cv=none; b=aiZBIoY9v7hPyDbKzIuA3gD7Zj2tAl+7E8Sl6S5PDxnTtz/oELfRR5Bb+6WaNGW40Pv/UvFDFDV4NDExJmCysBfYxrX2RtXp/E3oaYpJKnOpEccJ4ORM+5SfE6VLtSXdZnA/LzKO+Jg7ofSt2ChxlWux5t+DVCMYiA9cuAts7Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725057330; c=relaxed/simple;
	bh=v4iBb4s46qTC+OnNjFfAVZeMlvAyxTlCo/S0K1EAh0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=haYj78e2BRErI1ViD0DJReVeoIoUcTx/wMtBorcmkMB3K5kod4C+AydrIMBDNNfo65CMfsWAtFiITOWsNZLWZ6f+57aiNEul1e38/xK/oXBMvZLLmSRv3zFK4tbz2niJgu9xQUKcJ78g7FlMGzXhweAy/PbhSBfQkK8zCOdAu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIRXkQJK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so30948261fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Aug 2024 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725057327; x=1725662127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4iBb4s46qTC+OnNjFfAVZeMlvAyxTlCo/S0K1EAh0E=;
        b=FIRXkQJK60oX0HSKcsAyjeAb9Vrf84275dDoWiZ7DEvvDkGTn2hYJHAoKO4VGcMSWR
         OaTZ7dUy7o0/bmK9FkSGhi2jTn66XEUZkcMsHvqn7IKyV8CORW5TJe5QISGT+M8msVAN
         xbGFU4tqCyl2ljx6Ud/zAsC5jID0/rYMqIkmIjxoHUr5V1AAdoqL4njehBM3tazrHLhA
         pFqUwozDdwQ6JcADJe3VgiNYBXJHONrxDGQUAle+Z2TXimeFS/erAQuUYYUtOugpEysv
         pWdh2G5Wzx9dSeciigU/EPphpCad329evx06S3MzmbQoTy8D7PKF7dCTgf6pslvw849Z
         U7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725057327; x=1725662127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4iBb4s46qTC+OnNjFfAVZeMlvAyxTlCo/S0K1EAh0E=;
        b=dqdKpc56Y3lV7ImitOtEvp1ysJvVuYdbf/xO/J9zTiMSLC0Os2/Gbrl5Xj0t1aed2b
         +KsMA0zwSHZrJq3UVCe3fnl/goyJHb8Eeck6+NbgxtH4suJvdLTnb3v+Ctb933TDrd17
         Iq9CO1d3G8KUv3VR0m56XHllg0R+a76cHq5iZUOe12Q6fuO08/UuTYSc/NzHuhRV1uOA
         auSvXvhkUFSvETpHM4rTAR3IzMIz51QAv8ipUC6Lb9eD8AniPKt9Hv4EzNgBGqRsegzS
         meGCA0NR7bO82mbqi3P/agogHvoau8nDAq5FXDFWGeIoSVC0Mcm1Pat3ECwe58+/fVnB
         TgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjIbpERjewAv5QVdqJlQr9+sOTpGTo6Gr2yncqaE4LflRhQpB8sXzFVoxHuQ8FziN2XmBJAkMAHnE3@vger.kernel.org
X-Gm-Message-State: AOJu0YzPpH54JgXnb3VwqrjIjgjpZm2vpE36E7b0M4KihJk4l4Io7WoB
	QtEjgDrchtV5ShG5zNTT+gOI/bMJianDpoEc14D7xgu2XX8ZQPxF0j5W03u1sRS0WQGGrqMDxNe
	6Pd+HIi1k9qJIgj7TcuaSUni4kKmkw+DBMgbPNSjfVBBfeUr7yXE=
X-Google-Smtp-Source: AGHT+IEtFXEb5SKkS9Dwum0owW9p7oKua/V4jc1o1ChojvOLPjtG+8DqWfpQtMEozfboOaOre8Jhvg92ZV6kMcJdkjA=
X-Received: by 2002:a05:6512:b9f:b0:533:4591:fc03 with SMTP id
 2adb3069b0e04-53546bde01dmr3131559e87.46.1725057326166; Fri, 30 Aug 2024
 15:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com> <20240828142554.2424189-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240828142554.2424189-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:35:14 +0200
Message-ID: <CACRpkdZ3L0DGdrFEzRUF54c=yC+aDjO1TNd0dVuSmKninpR6TQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: legacy: Kill GPIOF_INIT_* definitions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 4:26=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Besides the fact that (old) drivers use wrong definitions, e.g.,
> GPIOF_INIT_HIGH instead of GPIOF_OUT_INIT_HIGH, shrink the legacy
> definitions by killing those GPIOF_INIT_* completely.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Excellent, thanks Andy.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

