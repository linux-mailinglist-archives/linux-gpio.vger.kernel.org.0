Return-Path: <linux-gpio+bounces-27743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C195C11E2A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCF1A4F49BA
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4732334684;
	Mon, 27 Oct 2025 22:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IfksUcQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932E334681
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605140; cv=none; b=noq6SEYzMQBXaRsSrfUnK0VxjFh8wC2uxkJPGxt/cFhBFS6kNW0n3RMZqKV2/avDOfHUn/VOXIeD2M2z7J3D80z7RsSzvSvFGq2//5Y9DV2HxxvasH8egkciz4M97r71vUkZrXIclMrxpxHJmz0QuP7VFoz4m9oO7DHYaErkzRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605140; c=relaxed/simple;
	bh=RotLeLW5FAJfzQv7Gq4AgyigcI02XgPNhPI3twaoEDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8FkD2AyRqV3jkBdNepfXMbuLf7ivrlVbJx+EzphZtXHiLoiolD6s49pbi+fJ0F9ewPNS/DwZ1aviNk3DU3xlSOwGhb3EqHzHmCAl8rhualODTWM/djdAhqQY03lSL1Imhm9kRU3sZKfeLn7pA0GxU22SNdZSqzAHv5NRWhfW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IfksUcQh; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63e1c0fd7ddso5456767d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761605137; x=1762209937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RotLeLW5FAJfzQv7Gq4AgyigcI02XgPNhPI3twaoEDw=;
        b=IfksUcQhCwZkOkzycTMQ9LEXahrjMBnC3VHgaRlZPmlReF2TKBgolQ1fbWPa02dIOd
         eBYJfzFUw6lmAwQnpwtpKEhwqOmUJ0LNoUwczvn69sCd2YaEb3pmJLx8/T7EFdH4agpj
         UQRrT20m6TZ9r2x7LLFY+FfMLI/MrTY6nSVCGi1mPQcEJHzrkVnhpnTLp+PFE0KmrEW3
         2maQA4exW2yra1AFm+8JD342en1obdCxqo7xNa6Zo7OGtDbE+g6+8XUMIyf2qZUnh5Mk
         31Tgs76IoXOtzChIijOTNQDDDtqFdLvhZpTT7ex+6wMY/C/Xh05j4sEHxU1RKsl/6hR/
         nxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605137; x=1762209937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RotLeLW5FAJfzQv7Gq4AgyigcI02XgPNhPI3twaoEDw=;
        b=ZK8Hq+gG0MqVvzF+V7UugozO2NV0NqsOJjuMIKCDLr1wDBDrwzWBQHmxm+iNhB6dse
         mQq38NjjPnObEFfHuZLynwNf+C6eFM8i2AX42kWyqgnV7yEaUQLoE6rpJbOezUyMjCS+
         ThqIbwOOBBk4WYGvbHzio9iA7/QN5DIRz1o3c+bIdCkarsVy8M5zPQ4mTEEfdLR2D0a+
         s+v1JTrNqCSA+JSTso5SB8io6JCi2Ikhgw85Mncgvs2W9Xi9gs3NlXdASpeJgczC20ME
         4TVvEraBJF0zo4grezAD6rd4JZ79AqbqPypvaqVkREakwiRpbVtGzVTuauBhxBTd93XV
         4i7w==
X-Gm-Message-State: AOJu0YzmRmi86zP8Jm13XhHt2QDdCcObYMKiHz2jTPN7jgPcf7bPhF+c
	r3IrLpLK0W6zDC23eJMjq/lDeqnerh/hSPDANxJ6Akz8Rs2dTftmAuZGM6NndaK8hm+ruw96lWW
	I20fbImMAWR5l/qpubyE0ddYxxqLpqcntJaF/YdIOOQ==
X-Gm-Gg: ASbGncso4eCxP/w6BBepRSVeGEYEer8K90VkTf5EYr7/htlplsO1wL5f6dp81nCEYto
	VvwprSzkjP7cqXUDD1ipy57L1ATAh8I5h18h3w7L/LzCPhNfFjSujukizMdSInJheVu8lviYni1
	Oe3NXI3A/c2rhsQzOlo4SPt+BT/9jCuUb2VUmJjRiuj5aGEHAt3F4wUS4dKxM6tK1byCgkRscUe
	L1FgfGp+qCgbl5XF28w6x20wi3QuYqvlKynOLAE+hb8+EAC77G3BjVyTsmB
X-Google-Smtp-Source: AGHT+IHQUaQAuFKNvuH7uwmeyRiG08Rx2KLerYTfk5sUghQpE7Zwr7nVYIorRKJtFlyKPbrHglqgZde9hkHdiVRxyDI=
X-Received: by 2002:a53:a050:0:b0:636:a6de:9c50 with SMTP id
 956f58d0204a3-63f6baad20bmr1144271d50.43.1761605136059; Mon, 27 Oct 2025
 15:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-gpio-mmio-refactor-v1-0-b0de7cd5a4b9@linaro.org> <20251027-gpio-mmio-refactor-v1-1-b0de7cd5a4b9@linaro.org>
In-Reply-To: <20251027-gpio-mmio-refactor-v1-1-b0de7cd5a4b9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:45:21 +0100
X-Gm-Features: AWmQ_bnlxqghxAQT0wbNVPkUTEMmLs4eXEoT8OGjcq1Qix4Xz6UIbZAIY5cu1rY
Message-ID: <CACRpkdbGM=M+ZLZ9453PLvTHkaHn-q3ota5C2gRD5bzoiezUnA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mmio: use lock guards
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 2:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Shrink the code by a couple lines and improve lock management by using
> lock guards from cleanup.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

