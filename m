Return-Path: <linux-gpio+bounces-21756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860AADEB68
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA4B17399A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDA12C3247;
	Wed, 18 Jun 2025 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dOn8JfW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1245227F16C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248420; cv=none; b=p65FKju59fhbSotSJALvUvg+Lz9TyPtO18IbJTQGm6W2CxmwCe5/kFg7orcWLN2MIuWoDETGlN1Zng+ZFvaqcIXMFaGFdJpCjT41T1Z4Qwp6iG0U3yeBcjIhWpI1m5JgSS4EAy92nWh6gCBR11e3Fs86KcEijZxPVt4R3mS1k9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248420; c=relaxed/simple;
	bh=KFHZaeoSODTEpU7abDsNkopP6dfWOtne8XjI9QfcTGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WinXF9e2BsWDJHuvciLqMXkjlDRhS+hp01px/oIyqFoOg5fI8Oq9oI/m4etRkhnNIlhB5BJyMM74B/HbYvZ5nLjVZWS1dKmHI9KmPsoObiEGBd8DLx86xGtjmTB/8l/HRVyDUrNggjls4W/Nzm8x4O+P899r+52rF6EVMlRYDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dOn8JfW6; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5534edc6493so7341339e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248417; x=1750853217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFHZaeoSODTEpU7abDsNkopP6dfWOtne8XjI9QfcTGk=;
        b=dOn8JfW6rPU5o1OtrvPEfcCsS0f7A21HlTip0OVLHiYQnnfMT+SAdzNA1CDvUvdn1v
         RdMQSFVHjlaATusdFJ3/yMtxpAVtNPnDPCX9HV6j++1YP6UzjhkTghIme1I8RcnVJv5e
         JDQrQTCO2drc6ODHYfMeDlKsGE1z6a0uj+O3wSa05AJrGe8seX3ef3UNPplp9Ao7g0RQ
         qjso4SCxBOzRPNLv65egwY1HDZkU0E9KNMR0EFHrHiD9TmS28GgRM2+rB2m2okxL444g
         U1Rf5RhETgtxXuXW34h7Z9VzuPzhcs6xWZXcxAwZ3VfGpyaWqmfd1VCNajWEZDuNParb
         rF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248417; x=1750853217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFHZaeoSODTEpU7abDsNkopP6dfWOtne8XjI9QfcTGk=;
        b=LR7S3XqUJHl4a/rXr3KRYjGaVI8H+aqvul62L1JJ3BkzU6npxnnS/C8eq+8yDH5v3D
         e5Jr5M1wEbiZC6UWqoMKswTh89q0VhILvbqrUBouN6yV/xfJX7LRRgLmsZKmPPPN3RfR
         /vHQhbnQnYJtlqln3HD8Hpo9NsiokRAsEIRjB42UPv0mLY+4TF0S0oyfW7ox7YXo0Pce
         cRRXGAGBzFx+CO3lLeLV4gDw7V/iBkQmwj5fDHgXYg/YAYcGNi6dVrFbKyBFSmEuRgos
         8bBtLveGhPy2/+hA7lNXy/NAMJYMfn22EXv8lxoc4mmdTauvYdrKl3TZXDqJw39a0qWX
         Ylow==
X-Forwarded-Encrypted: i=1; AJvYcCUpa4a5vyOWNZFjNx3jZvdD6QtPPlBncZthTbimfKtETe5WeI+9YC0ifDATWg2tdWrU3Hr7WYaxLBST@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzizICWY8dbvmbKW67z+l9dPA9Dgp3AisdP1x/eEYn0PnLxN6
	WLo3whT1Xnu2ZegRkP97EuNyCVMz+Jbc+mwh4FFH0e1XbIBRSiolAq9ksj6TUPZVGDYgjMowclG
	LPUWyuTuDO42b7/yDoxyJHhP9Ai9HLS6VclRD4hh1QyynoY3TgcZ4
X-Gm-Gg: ASbGncuAABoGk9bEX5BRK4bNtQMu1/vv2NnPkGZ3WeGrHsYJzV0bFyrxVEG73bxmaNY
	gZicSGY3T5MmyrnmRV/xlIPCl8gdGtC/frQFcIDAb5zhe+Eiw9sW1/mBgkbL1mR7caM/rlhrrWl
	d2JG9iEILkGhh1sYJDt7DUV/gHZ5mAfBSvEoeEIN1TUc4=
X-Google-Smtp-Source: AGHT+IH0hkYwujstsVak53Kxlho+OGvd4fBBK2SWPVddaXjsmXuFYkeHqZ0gexkWXto83mQYdFPMw4Ypaa4doACgPm4=
X-Received: by 2002:a05:6512:33cc:b0:553:246f:d5bf with SMTP id
 2adb3069b0e04-553b6f25286mr4854168e87.33.1750248416981; Wed, 18 Jun 2025
 05:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:06:45 +0200
X-Gm-Features: AX0GCFuEEij903K8x578B-AsyVrv_BWswNCIUS18yLj9Vvd0FxlSIuai999Rgxw
Message-ID: <CACRpkdYoYFGNeATvJGh2bATGwrp0miLgYuMgUQcPJARk4M_QnA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: starfive: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in starfive pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

