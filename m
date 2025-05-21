Return-Path: <linux-gpio+bounces-20397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B73ABED9B
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697BF16EA03
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 08:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC62236429;
	Wed, 21 May 2025 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+Fgxv0d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F3B23536A
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747815087; cv=none; b=bLzsLttiP7yy8bgWmKU5Uh7ug3AC20Hex7890E3kWFnNBte7YKi6kL0kg3thCLLnnt9Y7yOnKib4taxEFDz7naVo3hgl00gO0cSRr39iCWBkF0upo6gu+QPSTnctXxumgWOO+mfMfuftnpmGlv3Bvpj5b8y3mTtHFsilGCqJeCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747815087; c=relaxed/simple;
	bh=b4Ig0XOyQfEMoUAAjNHDQhh7+S48zOrx5dD261ukggw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2ltKnD0P3Icqi/lSlVS4SbZnJdXO5t7MJLf4+SVfWTtcDwBU3P7EFKlaTkFBvWokXFkzUq861bppsMbbJ8n3l2w5USjpb+izOFIr0x1tcw5ICTbi1q+P6C6NTYYEvoIRdis+Hc4sW8o8YwbZEPmiV8T5f3XFuHG460/ZtJa/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+Fgxv0d; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so7669167e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747815083; x=1748419883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4Ig0XOyQfEMoUAAjNHDQhh7+S48zOrx5dD261ukggw=;
        b=M+Fgxv0d/2YG9yBWAIwiGJ3yUSceU3ihyYgjTqSSntnF0Xk+Mc9NXHb3vvPbdQ8t9t
         FimB5zEjkRpL4lpZ5yeYgp5xGwmQyYLNerQslNakuU1iJ72gpWmNMmmPLOSX+u8XvXet
         TIp/0IK+e5vf9+4+l+pdNwVIf7wl8kZY9TdoMckfIoO5Xj4AhxaLn3putFT3sS2IklwD
         Pdid5pZg/QbI54rO7xYJ7y2l0G0gPk5rgWiEWrLO+ZkvKQpvxndigkZOOIMh2NDARsO/
         JPZGEn9YjiBNlGc7eOfDyjs1Mi3vTJ69QRkp1jupRoSiB7MH4roQhLkoV5b9bAL14U2B
         zplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747815083; x=1748419883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4Ig0XOyQfEMoUAAjNHDQhh7+S48zOrx5dD261ukggw=;
        b=COqdKUH1q5/4D5ay82ymLOyFtQSRim6GdHmiFzgzGSGwzRhRUcdHUe8DLc+2C1r5OP
         b8bXM7/1tv5NO6r2ppuuENCM9cPnuJZpFWDi7REPjld2zkhR4pHpC6GYuEi19Z9aLM6c
         1kY4QdFoFNeK9v7BwwLyNYdVK7azH9P+AtBpzYjb9lcGu2P+ytYAk8fq+00QskqL9uz4
         /mw9HTb5kLkShtrnXZ1gLGwygRfAaNjsEZwSuMm6NGsOG6BsSP1CiMf+bmd2TVmXs2/V
         3lhZvnqWZNud5iIpy7cZ8yqphnyeOZwGZxc7SG1PRYxjtb3ERnuhp8eVaAwddHIZaE42
         OEGg==
X-Forwarded-Encrypted: i=1; AJvYcCW5BAzxnCaHaDr08zeIbCBpZGHaAnuHIJPDup7Zvv/iFa0kzbLeqvwHzAj16P2yWIs5iA8DwRofiZP5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+JyPTanYf8WQN3ye2/IzY6hhHsDikLKwHM4/AmCpeACYDXrg
	S8suoINTn/IyWkNPxegiJIm0Rpw7RpSGYzxBZeK4UzX+ZTzdAb6FvdkpFqIF6w5jPEACojTrXTU
	jH/rFAcvjofpL9Ly7JJtJQ+u3AgGV4rwaICjnv2p3yw==
X-Gm-Gg: ASbGncsAalIx2Ym9rYhMSL/VLoTHCXei/NgEzdLxVAFWTVyRdu1/CrlZDbaQxmMYG4p
	Jz9nVhafCmgzcQ4RG5BI9EHz/gGYhHO2qoSAiORqdI9SRdpLp8QdGRkIRcMhBS23ZyHu1OU8KBu
	h4KnzG5QlcbcHUABwNMlyUWcYILCaZi/0x
X-Google-Smtp-Source: AGHT+IHr3PWCQAtuLgEYwRwwW4iRxfUP3QxoUSfN1BXwa21y3iPHsi32IWoXuUCO745fcwdxDECQuaLmM/WWBqdXJzk=
X-Received: by 2002:a05:651c:421b:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-328075fafd4mr52461801fa.0.1747815083428; Wed, 21 May 2025
 01:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 10:11:12 +0200
X-Gm-Features: AX0GCFtgrsoYedOY9iI8wKVEZEWG9oGL9tXc9fGDI2DAkg_LOqFcWmofxbD1UNI
Message-ID: <CACRpkdbCUPQT60-bqLhgYHLLUYd3ZcihZ9PV-x__UGPArgbnkg@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:28=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the sixth version of this series. The main change is the rework o=
f
> the GPIO forwarder API as requested by Geert to have more consistent nami=
ng
> and parameters.

As Bartosz said it's too late for v6.16.

But I applied patches 2 & 3 to the pin control tree so we will get
down your patch stack a bit and less cross-subsystem noise in
the next kernel cycle.

Yours,
Linus Walleij

