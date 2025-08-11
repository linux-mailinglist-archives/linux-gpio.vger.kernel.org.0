Return-Path: <linux-gpio+bounces-24171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCA0B209CE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 15:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469433A4997
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15E22DA77A;
	Mon, 11 Aug 2025 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f5oQrLjE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F64A26ACC
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918051; cv=none; b=hyPCvla6o88tjdqG8FikbhkXnjuL0FSdV1FqFpfbuABHpV9OG23BdoXVDMXCLaOb1L5nbJC5Q+PXUWZNZPqMa2ubPLiF5rEeAA8qiPX4izuuHVU7OociMCR7rFUkghQweyrIKE3Lyqs4ZjYusgrd2O6iuThUJVq0e0KrlMmhScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918051; c=relaxed/simple;
	bh=gOnD7019wVvxnfkBWIX0WWOVJOpXgqATuZMihxMEtFw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s79DI0LCy8qXLpwtCsy55wxmA52uUrqf+CcztDuxUaRBU0XJLYRhahmQSL0JYfU/bhCTlhTt0iCUkx53nqA37kVa1orvcCDQ2Vh/BdI2kaULFL/5i4pjm6MDJG2Hb5YVvnjfqZWjw7iIv7v3VuvOKqskOk2uMZSwliXghx22hZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f5oQrLjE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b93104888so5543581e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754918048; x=1755522848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOnD7019wVvxnfkBWIX0WWOVJOpXgqATuZMihxMEtFw=;
        b=f5oQrLjE4aWrgSA0Jtv/SpOaCuNkrKhR2nX4k31U0mExkM/G1pvEriSiEyXNnn/EKi
         68++wRPh4kLXduAVsU7csQxfnaQw4Ts/I5x/V0gCeSxL6XmYRTOAlTfa9nwX6SKT/z+I
         6/NZ+23/45Wj8eey5/aomzzRVf/6Z4W8qb6N0ly2HAnsl/0lmwuNReDnfenIrocFlzzW
         IonGfKt1xisHyds9bnITOy/xPbYvSQOvouCNyR/xddlwm1y3EN1bZmW7czx7ASoDdX6+
         3JZlNemv6vpij0FkB0VkYJ7mMDV1lem9mUxYRX+lH2rPjtSOGe3nGvmTaz0bX4BT0p0J
         PKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754918048; x=1755522848;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOnD7019wVvxnfkBWIX0WWOVJOpXgqATuZMihxMEtFw=;
        b=i5ToY0SQM44wBBTrBpHGx6b/mOn5Gqgsp9T/YxCGR88p7OXG8ikKFMxnnnBaAZ5voo
         Po2Ni8JXq5NSMyAR+wqNyNeZiHnlkptLQFvjuQMwCDcopzM0T4W+1ZFQCQ5SOFluZQ21
         rP4tMMaGRHOdYmKj0YIjwDLCkirf1zaymZ7lpuWBjngeMH+yWawJHe1XPL42MP9HbSye
         ssBwrWR+p7IUmTqD5Wug6+wAg6yqa8AciMzwzMfy76TVqz+zgL/mTfcO0EUt6uMrWfdl
         Ffe0TrkHR1BUCG2OQ48u498Ih2kzsm3DRscS/LsrwEtF7oxOoqsJkIxvUX8//i4fXLZf
         pzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8A9dlYvfKNtBIpkNgtXnLCFjOdOWW56h+8EFE2r1S2Cir3EtLztF+j2nFc52WwTBYErIp+HoKkcYB@vger.kernel.org
X-Gm-Message-State: AOJu0YxkQrLf8ZHiYLoebVov+C9TPNO9yv/2ocrd9xnO6rGzPekuL3gS
	TTf4FGMMwi4okxEkRzPWJK94Fc/Qmd6d6QlM748ohbwrRaz2WUSC7VbxYnCLgVL/T7R21LMEsHc
	AaA1nB7bBiExHmfMA46n7FR3OgcW/UkgXA3c8Octv3g==
X-Gm-Gg: ASbGncs7qOeoA1QF/PQR8/3xez+qeRoGGcrdnDlCFXDHr3BHihnoLS+ci8K+nOVGFOr
	Jy3vOuuIs9aqcsZXEFxFrif+L6a+J4wNhbHDtdS3Zd6bygA6lm0JFhAhFPN7Omo1E6znDEA0Y+5
	sL9IRYFlMntPoONPtPDm7b+dJg0UtoaeWVLwD/zYChqlt46cAh1Nrya0wX3LsCg71mR6IVZNWOo
	1YRERO6CMPj9/G6MwEPG+0bIWBfI+U3fmLRT90=
X-Google-Smtp-Source: AGHT+IFGt5Nc5qscJVVYLtl2huw/aQCNMj0ucn+BAnsYObx2dNoeuixSI2C0/qNBtOnndla2Tjm079hTvc/NwKkkRbw=
X-Received: by 2002:a05:6512:3ca4:b0:55b:8698:6a1d with SMTP id
 2adb3069b0e04-55cc00ad9f0mr3805004e87.3.1754918048081; Mon, 11 Aug 2025
 06:14:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 09:14:06 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Aug 2025 09:14:06 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250808151822.536879-8-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808151822.536879-1-arnd@kernel.org> <20250808151822.536879-8-arnd@kernel.org>
Date: Mon, 11 Aug 2025 09:14:06 -0400
X-Gm-Features: Ac12FXxrP0SlfDebLOcuh07PmX_2s3-W5WKUuJmVyKDnXLV2k8bO61Zh8tXjxhI
Message-ID: <CAMRc=Mfm_w4R-63eNpzrYQfE9OAhSO2wY3iPVJVnbSqTzq7rjw@mail.gmail.com>
Subject: Re: [PATCH 07/21] mfd: wm8994: remove dead legacy-gpio code
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Aug 2025 17:17:51 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The old-style gpio handling in wm8994 came from a commit 7c8844481a1c
> ("mfd: wm8994: Emulate level triggered interrupts if required") in
> linux-3.11, but nothing in the kernel ever set the 'irq_gpio' member
> in the wm8994_pdata structure, so this was always dead code.
>
> Remove it now to reduce the dependency on the legacy gpio interfaces.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

