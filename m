Return-Path: <linux-gpio+bounces-12256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD99B33AF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE231B215E7
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150E71DDC07;
	Mon, 28 Oct 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5q3c3mi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A451DD0F3
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730126212; cv=none; b=H7zihqNjDbuvrN2EzYESR8HW6ynL5TllaiBAvuU0UBJYL3nFEbDV9daUAoPSWHJugJmdJo4jXrwZnnEnnn5ZgSS6a041ikM4MdeyPj93lfQYPjrPT+Cijn3dAtk9no5K0M9K616E0xnXK8mSxleU3b0wkzr21KQ12Z3cn02idCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730126212; c=relaxed/simple;
	bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvfJK8DOhxr5WK2d9yzntXKn6L4MrwWCgkwD8DvLarIql7GWt2u7QNZd44o1A4CTmviXNwfksYBEqZH99oygtmSNIs4P12x5dcnrQsJWE2E2KlpO5fw3p/LSoi9S2IikmdK2oxvaOcG2N0qZG02uxm2Vg5P2XOy5WP/bK/lM/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5q3c3mi; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so4970107e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730126208; x=1730731008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=t5q3c3miHHsf2cHayjpY3BNsjRedncYDv+bWgPkRbvUN3MYpMQZETPwOdlZcbD+KxF
         j7EwZGarJJ4ZXh42PXWggkjNtZSigROn6ClvfHrGIuRKjKZVJnYnURqCzG3tjSnwDbDW
         1vOmX3JgyP05iCsajz3sx5ezPugtj1C5SwjzlpT7wXhLIRPsPHFqU+HQ99DTyB8Fg/At
         CePCn5zPkpVj0ADk0t4SAVnfJFOrInuz8Z6VBTuAgCpQUbZcNCK764Y2mmJ5Yn6wlkx+
         4xVejicw0Xdw0hiFEpLKsXoGGr5o3alINb6Es+yjGq02Fz2qZCEJoCLjDHN32QiIfrcj
         7Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730126208; x=1730731008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuCV83JNF5xt/o7+RdWbgGzw1E9aI+J1rqqbiHJI0pk=;
        b=mVLj1DWZMgvj+7vw0n/gddJEoXGo2cmY+BTLzYph5ijhMFcCqcyvdU4SJEZA9Lf/Jy
         sGOyzpTnp6D30Aw6+/Hva/ak5W997gJBItqMOnbO1GTciW+Nc3LjeYRV280+TfnGfMRM
         sYiraAtNedV4qCf4hCGtH0NXBmaDFQlqHm8ZUWH0KUe8WgtcegFtYCtukBmA7zZimXGY
         2vvfQLnb9ap3eZMMkTnBNcaX6w/HmeuWPuQGjlksc/v5ezIxJ6J30+9w2kgVS4dKfSjb
         ZHzJ/jC8a5KLMXD8ZHgCo6xK9recoZRQr4+VuRe8c5F5m1eXDkH6pDLLz59J+JA0Db2U
         YMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwQzbKuHSSHXkfLXRq7m/oKMajm8rndAr8I13gRIWgLHf8FqH4/tT9micTuKmX4g2O+88tDtNLGUTa@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQzW3ZDOjy/6ICx0UxWA0VdgddtnbeyxA0v1zmvqjCvsayKc6
	Wz1PtsY0k9nhzLPKwi/VgA4X5eujxJClKLXTHvnx+oTxwrc36h+2lJ1/VJdE2EaBOwJdUJ+Rk/I
	BLfCHaKaTg1Yp+VAwRMXoOKkwf+c+lsIZSBnzag==
X-Google-Smtp-Source: AGHT+IFMXRyPb+X0jTeOQPVKekZJqG3FwwMxDwb4pHs5ttD6aPRHRy5s8zoMSwymv42X/0WESdQov/Yws8ZdNY7ZJJI=
X-Received: by 2002:a05:6512:3c8f:b0:539:8fcd:524 with SMTP id
 2adb3069b0e04-53b348e576amr3463522e87.30.1730126208152; Mon, 28 Oct 2024
 07:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-kselftest-gpio-set-get-config-v2-0-040d748840bb@collabora.com>
 <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
In-Reply-To: <20241025-kselftest-gpio-set-get-config-v2-4-040d748840bb@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 15:36:37 +0100
Message-ID: <CACRpkdbBAa5piO8BJoxx04spOc22CBJ-zbi82BT9sG54c=csNw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/5] selftest: gpio: Add wait flag to gpio-mockup-cdev
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 9:46=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:


> Add a -w flag to the gpio-mockup-cdev utility that causes the program to
> wait until a signal is received before exiting, even when its behavior
> is to retrieve the GPIO value of the line. This allows using this
> utility to keep a GPIO line configured even when in input mode, which
> will be relied on in other tests.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Bartosz has to look at this patch!

But overall the idea looks sound to me.

Yours,
Linus Walleij

