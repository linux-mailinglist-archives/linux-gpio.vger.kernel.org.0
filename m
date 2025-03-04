Return-Path: <linux-gpio+bounces-17014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D1A4DB0A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 11:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D5D23AF8EF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 10:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6768E204864;
	Tue,  4 Mar 2025 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0YTgtxRc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D4F204859
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084660; cv=none; b=u6Hr9MkBHAPtGszHGCvI5L88VTPer58ncFSyGRqp1WA4U+6PXGx9RnXtTQhUYQnMvLkeAfFkCF3fgxW9je8kd2n8wO+TVTeY7AnmKWFZxTKzkf+JfJdl5/nYrCX4Fk8uAd1N4LBfh63/lbsyHi68eNzBXaHQISWp2wv/2+4sF+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084660; c=relaxed/simple;
	bh=W7wu7x2CGHp+hodRLerhrOyuQsqw+FEk+o1KUxZ12pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXtOZrlvxDZt8omHnjsX6fZ8Fa1JqMJKQeiWphWQWhNfGLww8asPRxgsGcKtGa5T4LiR4BMqZe87LA9WQAqy4GlxUPnzOq/3dfDIgQE3z5RkIKyC+lVh0+UoLAt2eCQkhdsPhPmPIvsQ6lpOskEJl37+7NQJYjFDijtehilIwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0YTgtxRc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5494bc8a526so4789508e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741084656; x=1741689456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7wu7x2CGHp+hodRLerhrOyuQsqw+FEk+o1KUxZ12pk=;
        b=0YTgtxRc1G9z7rDwnABxcg/ByXXadjxAutXZ1ItVvJh0QPNu1I0EhtOvaOHp6SHWoe
         sKyjlFNH7v0qDv7HvwHME/z2mQA0EEaiL/Mb7me4XwOz+CWtyGjmcyJsk+2oH4eudi0U
         752W1pzlKTyEkRjC22eSIJI2FU5zQUzJDctJ8NjF+3eZR78QVeJT/HmkztbO62FqkENb
         4TvzAcwoWgTZjcOiwonK45m58k2tptJ5122aJfYzY2REZuizWBn0L1XDqHi7I2kGgtJW
         +RiHSigepggpyIqULqYZvochfIF9G5yeZxxf/zGH1ZgjdOF+N9bWxAzMuFle6vhHxDl+
         d4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084656; x=1741689456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7wu7x2CGHp+hodRLerhrOyuQsqw+FEk+o1KUxZ12pk=;
        b=eRXSvfa1v0CFYo/ByfTGB3mZHMmm9O9Kfwb0CNUvkP2Ri6CLZoNVG2gFApeIIm9gDF
         auGXff+hRSaOZN2+QNTIGIRwa6gr2VYiibSrfQvrJrxiLQa9YuxKLP9on8fari9QKdJA
         BItUiioRNftcTyM50ZoULDiGdJqNeD25O51Jo2CBbQVk0NvvlaZR2ovO0pMQnG8DFhdo
         a0h4hImjGTH28Y1kVYCCw24FCIFEzieMSeG/o3e8AY9mDY5vKRWOGe2whxMHE+HNA4sR
         baGlV0bynsspIPtyj5PUXA0WWElpHx2+axZfuBMr3KwZRCaibGazuk/FadE10SOYae/S
         JtEA==
X-Forwarded-Encrypted: i=1; AJvYcCUUYUtUnnKuya0+73pB/jwefCGfQ0xbzmU6npNRl/881C+TMmFl6PHtaxkVIH1/2rh+jQKz+GbrTdQX@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLi3JvWO3PenNHvbh5B66ZNRYojZdOdkSM7+Z9NzhPwMsgRlj
	LdGIKdg1IMO1H+mWrxswJCLjSLBc4QR6K57d4gFHQTRQXm4lWkA5eAagO/3hIeZpv13yuUC5yom
	5eUxuMfT2rZVwPcpCN53XscBVUcP07cCWmDGVRA==
X-Gm-Gg: ASbGnctgLno5FClAxQ80dO7EwDnBZsAkuF63BCAdEQ97/Upwa4fg3uzwiQEVh9hFtu3
	stPuad72X6VAB5fhhiCpVsN1quZWvm0Zpol3mWROMRjJCL0ekukT5yFE2T4Pq7HPdvIkb9oWgME
	aRQNlI73r40+CpCsFYp5K61YJoNHs8ImgkiFdkjkkUyaMm5Xa2hhT++Q4E3g==
X-Google-Smtp-Source: AGHT+IFB+Oj8/Xe4YEFmV/Rb3Rt3KPraZIDAVAusl2gbbTUJaqBBb2xF6ULfEj5cbkgmnDxxA+ahMM664a5woA/zI1I=
X-Received: by 2002:ac2:4a74:0:b0:549:4e80:6dc0 with SMTP id
 2adb3069b0e04-5494e806dc6mr5633715e87.0.1741084656455; Tue, 04 Mar 2025
 02:37:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org> <20250228-max77759-mfd-v3-5-0c3627d42526@linaro.org>
In-Reply-To: <20250228-max77759-mfd-v3-5-0c3627d42526@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 11:37:24 +0100
X-Gm-Features: AQ5f1JpxU_9Y_clBmQu6eNXqzblGFz3KZ1pj5Yu3Z5R1OCnwlBjw0Sc-D8_i8O4
Message-ID: <CAMRc=MeYXFonF8wcU_5RzSYpTUXEhnY+wpsFKJQ6-EJ1h=K3Wg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] gpio: max77759: add Maxim MAX77759 gpio driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 3:25=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
>
> This driver supports the GPIO functions using the platform device
> registered by the core MFD driver.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

