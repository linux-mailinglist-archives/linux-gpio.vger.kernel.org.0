Return-Path: <linux-gpio+bounces-18329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36893A7DAD1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 058A97A52C1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 10:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AA322FE0F;
	Mon,  7 Apr 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b0Dl6lU5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D360822A4D6
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020830; cv=none; b=uYn29qpRhqQGVB0lS4TsTnCnNnqkWa4u8/obq7uvrZfm+9saqfQHUkROHAOdnewVqRQ+1kUNLfBIyQMsIBY1JXKaXcO6r628V9SqbLCTcWV/ZYwzlM2O/b0xpiaeFd0ws9IZHyq5PYp50zMw7VYuAFCu///a2f+pXT1sfs9ILEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020830; c=relaxed/simple;
	bh=dX1/+XSuAHobVpykCO+uGfUJlHL5PEjYe6qDhF5RZVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhhFYyt2S2CDilbzebeKRksCh6u7KDuSGY0TtHfs2L18MCNM/9fAu/lI7YN++zt+Wqw2qZSuoLk4T4t1wK2obQxb50ywbMObjmTq2h9J/qVz0QTDCNmI2gDo3UcyznB4oTg4EZUbB6eaJqcqk8pR8g+eoQad2AVkC9rrAfavzk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b0Dl6lU5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549946c5346so4940890e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 03:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744020827; x=1744625627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX1/+XSuAHobVpykCO+uGfUJlHL5PEjYe6qDhF5RZVk=;
        b=b0Dl6lU54u/af0fU5yv7FvrFVf+mpt7qie2NAEqmFV3xHSmQiyh8kykOP5vfZhwOW5
         niqiUtIMCOon3L3XZt3GDItz6ZwgMKwj4JtzMAT+oeT6jzUmvcllMgF9QX2E8AaASr/S
         2dT0HlN7MGYHbfGfWcPjrWcSWY1l5OvtQ5PdhhPTFeuBy1reSdstFioCwSy0oXTgyT+P
         lKjhzXyBPm/W8Iv+jl8UVnyk/OCDR9MBlJbvdox++yXxRj2Ov9FBKk9dMCar5JOPXBvX
         KmbE5KPcrwNpUjdbV5N87X15TeI1anLEkmPyQH4ooHtsl9co53JiGMvTexMC92fE5rJ1
         W5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020827; x=1744625627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dX1/+XSuAHobVpykCO+uGfUJlHL5PEjYe6qDhF5RZVk=;
        b=LH2xrPCI19YBdNx+vIH1Sj2IeQdr83uq4bQMNJDT1/yApAH+KslFz29u5uJNLmuaQr
         ccld8uqVKcvF6Unl4he1uilui7cGr0vo7R3uoVF58zKXU2FPW59/zps8Mb91vSptYiqR
         69FlTla3ABqLdyT83tFEsElX3Bxmdj7Bib8bvB3XBgHRCht/vzJ8Fs/fIo8FWXaocywa
         BFYoq+P2xi9vMRiKTiFq7yirLFuOgECxzZPU3rGgljxXz0hZLI950Oi1ZxyLLovCtf/W
         JEF6pn6a8P7LM/TGNafzxBh5noiGu0stCUK3/qSbNq0Pvc0UoXYVbtYS9AMnq8g9cQHH
         Nngw==
X-Forwarded-Encrypted: i=1; AJvYcCXNw9i4pKRW0bGgrMlhaAsuwEkqfGf2OtN99uthigDNM8ueus1R5dZ2BC0QRVXzMcoaSpDfr5spsxFl@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJL2eQp41V0huRKnm2k4osVwdbbD2MvHA5L4u/kr3CHCCd9Ui
	P/lXgK5AEhNI0b/FvanQbnZHuC/sfEP0VQ6JGQSL02f3frU3vGwXhXLTUKBdDL7IO1XEIXHRl/i
	tt+iCPbdlanvf+tKE38CjUFPkR7j8StnHdsrV5w==
X-Gm-Gg: ASbGncsH3bx8dUUHj5YhY779DZTBS03KhalEyC6fb2J2WFdy2JzJBMd3W1cEIZ6ZzFz
	m7FZkSgQ4IMZ83TNlr62GPxLl/4Q3pLWBHgkQymVAuh6s0b3nxWEgu5Rc/g2MHeeWanVI/US4Ep
	r/Y8ETKoHRL14SvgPiX97DpavYFCkgTPTyfuJTysV1MLhV+oaezSYbn4I3rjgOKAwdqqv6
X-Google-Smtp-Source: AGHT+IGUj+2Um57K9D9VVnZKJ2wBdrPDVBKaixvt+pbBuz5lHLoqoJaDr+EysI/Ojf9urHGLv3Fa+GklOvIXwv+POLc=
X-Received: by 2002:a05:651c:2115:b0:30c:5c6:91e0 with SMTP id
 38308e7fff4ca-30f0a0ec026mr37136501fa.2.1744020826799; Mon, 07 Apr 2025
 03:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318-gpio-pca953x-level-triggered-irq-v2-1-c8bae60e7e17@gmail.com>
In-Reply-To: <20250318-gpio-pca953x-level-triggered-irq-v2-1-c8bae60e7e17@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 12:13:35 +0200
X-Gm-Features: ATxdqUH857ddIG8vrZvXaER-ytMY-5I2Ye3xG7kjDWI0ccqry6HWIeId4Nrnd34
Message-ID: <CAMRc=Mep_p7RbfWRrBToCuf+SKnHQKNf_0kxc0inpuGD-t4vpQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Add support for level-triggered interrupts
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Patrick Williams <patrick@stwcx.xyz>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 4:46=E2=80=AFPM Potin Lai <potin.lai.pt@gmail.com> =
wrote:
>
> Adds support for level-triggered interrupts in the PCA953x GPIO
> expander driver. Previously, the driver only supported edge-triggered
> interrupts, which could lead to missed events in scenarios where an
> interrupt condition persists until it is explicitly cleared.
>
> By enabling level-triggered interrupts, the driver can now detect and
> respond to sustained interrupt conditions more reliably.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
> Adds support for level-triggered interrupts in the PCA953x GPIO
> expander driver.
> ---

This no longer applies to my gpio/for-next tree. Please rebase on top
of v6.15-rc1 and resend.

Bart

