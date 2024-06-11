Return-Path: <linux-gpio+bounces-7374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFAB90457A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 22:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8E51F22F90
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 20:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24DD13DDA7;
	Tue, 11 Jun 2024 20:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OhCWsTCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0386FE16
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718136244; cv=none; b=LjHrNHtel3EMwhvjMCzmW2gvZYkTPgBoBtLrcfrCFm/LWMbCR0tizeljTJKfdFdzhbno3rZdDv3C65qEk01GMxoXCZ/Obn6um4WlvcDvm6qm5fFrAxrHv2JiZ2pQfS1UsPIXn+yg1aQzxCSs6sL+dVAPAGL9u7FnUrI/T1csxok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718136244; c=relaxed/simple;
	bh=qRN2EUOQ2JcU8HCwMJeszwscoPyFg4yGd3WyI3IuH9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuPYNFaLnVApPGjEwJgKnlizUmNo1xiNGrzodng7NrKuzwKDFRH8GGMBir+Z6KYHeSKoCgbcAqQ+uFT9aN1WNAglicFYc2bfcvEO9njmw11qdT6Bwg7sQJknqCexJtfOp8xEHdXrMm5ZrfXns+c6yKBYK4mXJ/7XG7waiFbMbk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OhCWsTCx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5295e488248so6777014e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718136240; x=1718741040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n98poQy5aGF7ac0QxK3qC5mrpVCVT/V+RCk+zSOR6o=;
        b=OhCWsTCxWTItqda0wsiH/epnV/xNs5zexgivvDBv9Qs/WidM0zcgFojvNru0T0DHvz
         qumuvPpnStLBAnhpM6ANVNTj9Jvzxpa/axpj8RLnwF+Te5mC8/u6V29RyeYBWyKCShKN
         2HkOaF6uG9/0MKuhN4cYSdvOI/UL4rBoZgSQ0ahS2FCc7zhM/I5T4mHDryOIr8f9PM8K
         Bg/ILyGfUYyE+B6N1ju135d1zTFC6X569XfF2CqHWD1WDY7DC8erviRxQIJW5XCeZg9S
         mRlCOv3UYGocT2FrCUHELBOV4h5ejacwrow8rilo4Kne/qjsdZ0vwCrTuP+2Gc3ufcsG
         ylPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718136240; x=1718741040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9n98poQy5aGF7ac0QxK3qC5mrpVCVT/V+RCk+zSOR6o=;
        b=N3mC/sPpxMG017WJpB+TyKsqmdp73A9wXUogwd8pwCzhXlEtysb7J57PfbiUW4Jl7V
         XlR4+3AggySSU2ABtCAjgLyPbAq95hMycJKfCDeqq+YjtvCQLlt34fI6tQ+O8uxmzClu
         3wQN0N8LdXuiUiXOJXE2sFt/L+O7+BmP9z/YTSWGUcXCzaD1bVuwCkWBh6wrZSgVb3pH
         BiEC/mDCvqgCGvvJsml6aPZWDD6QUJ4ze2HQUtMlA9E8ujVcjEDuB3c89eGt71C5KSaw
         8n9GQs6s7J1guiZKxQ6wpEwqM82H7tCF99eSVQSlXCXoSUUWUXrgeKg0JkF4XqrqYXnf
         PZag==
X-Forwarded-Encrypted: i=1; AJvYcCXGcfSXWA/mNjCgLV/S8k4fD7jWrIHla83+9r+M+uERCQxNX8z3YDL3EGTwNGQBk/f9US7xW1FSzO23Ma7bH7x40sQpK6P/zh8Vlw==
X-Gm-Message-State: AOJu0YzK9fL9rgGbLY+rawYTayvO+YzOE5Gxqf/nc5UosIuBzMhNt+vf
	WCB0zmf3usAys4M57ER/qmVzuPddVFIPLm4y14kNHSRWKu/kr38QRbm7uMVjYK+CmWy/IgzdOLs
	dKzlmxIjw2FSDDnWfzk+ss0Lqy08/DIxSC/xJTw==
X-Google-Smtp-Source: AGHT+IH/676DYtzrAxdlEhyttoUICnDM9pTxaR4uZAEP9AfETJc0j6gT8wiY7wLbTSTMXHgLlsaivegqk9f0xTZQfTY=
X-Received: by 2002:ac2:5b50:0:b0:52b:c29e:4c50 with SMTP id
 2adb3069b0e04-52bc29e4cadmr6508395e87.43.1718136240422; Tue, 11 Jun 2024
 13:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com> <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Jun 2024 22:03:49 +0200
Message-ID: <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 1:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definitely not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

I really dislike drivers being called in an ambiguous way like
"simple" or - in this case "sloppy". I understand why it is - in fact
- sloppy but can we call it anything else? Like
"gpio-logic-analyzer.c"?

> +Setup
> +=3D=3D=3D=3D=3D
> +
> +Your kernel must have CONFIG_DEBUG_FS and CONFIG_CPUSETS enabled. Ideall=
y, your
> +runtime environment does not utilize cpusets otherwise, then isolation o=
f a CPU
> +core is easiest. If you do need cpusets, check that helper script for th=
e
> +sloppy logic analyzer does not interfere with your other settings.
> +
> +Tell the kernel which GPIOs are used as probes. For a Device Tree based =
system,
> +you need to use the following bindings. Because these bindings are only =
for
> +debugging, there is no official schema::
> +
> +    i2c-analyzer {
> +            compatible =3D "gpio-sloppy-logic-analyzer";
> +            probe-gpios =3D <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_=
OPEN_DRAIN>;
> +            probe-names =3D "SCL", "SDA";
> +    };
> +
> +Note that you must provide a name for every GPIO specified. Currently a
> +maximum of 8 probes are supported. 32 are likely possible but are not
> +implemented yet.
> +

What happens on non-DT systems? Can you still create an analyzer in a
different way? Can I maybe interest you in configfs for the purpose of
device configuration like what gpio-sim and the upcoming gpio-virtuser
does?

Bart

