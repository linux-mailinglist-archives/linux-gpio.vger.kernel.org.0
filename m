Return-Path: <linux-gpio+bounces-18894-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93672A8AA4F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 23:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC733BED0C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 21:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB9925744B;
	Tue, 15 Apr 2025 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZFWd991"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186925D1FF
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753577; cv=none; b=k7CojIqJqsz81WnwkqOBbf6JkBIi9y058p3B/bA0rE+aJLGn/WuUVeKV9pDM8EXSFkrdq7Epqj3Oi3/O5/BXmxsgIAJumBrR3EfuB6IYpZzQ4i9ioqcyW9PhGcqMHLTRokl5oTi1etz+p7gBDSoA5Y3ZzoiPLmRIuGWmOLb1vuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753577; c=relaxed/simple;
	bh=DLzlBcqABqsPZB+zUP2AamaMZtdvqxrfoQXTUdcnZBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrRjOvYLpTp6z4ZPddEemswneEXGGRVRFRAit3RZCxblzvbg9tgdSF6cWvStlXAy8kN+5HFyJh7fDVZMXXvVMe2+9yoCPEl+1v0jCkAjM0TU9Hq+HMVWQRyVT7aDtc6JjuLxkyHyjdsB7gXvHtX9Ayav2rRV6Gc730HjylFAAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZFWd991; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30effbfaf61so1236121fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753573; x=1745358373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YQuMjX6RqY5591f94awvowShjmHkqhT1A52M9H1948=;
        b=uZFWd991r3pMZSezTdEjk8iavsdLW+lLdSUbSSpng7EZfOGo0vmZXDA0bsgeY+uBdg
         tWvI+9ma2hiN+CFukhsd4QEkCTI633ypKFrjOFTN74hUY5DRhgaPowxoNm/T1+fvYLDy
         adZ840lhI6jmRrRFxsA23VDnJnrHf4o9T7ffVoF04jYfXDsZY5eJNQivshuJPo2/us1y
         Yg4Eoj88VFu4L2JETgbSTmlj4VUqgJptmQ4bcn3FLdTS2ppuVA8+iLrhM1nqES6KMgPa
         mnYOtyyGkca+a59Azfevo+t9p/3Ctuw2Se7eHy3caSAOaabtloRyt7bRu/27qHwrf0MN
         eLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753573; x=1745358373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YQuMjX6RqY5591f94awvowShjmHkqhT1A52M9H1948=;
        b=UNaxYaTVrnzleASDkRVeExAZmHlXFZnA8U1jlr7NzWEW9UUl22izOtYvy/nOMURF8C
         m1R9A8EKSc71ZUDBcSpcrLnsUjd1idToWUccmrMi4dJKCAoVRd6swkaRQnfIh28Ujygl
         mRYh9VfgVGxaiX3W6gn8W/JCk0cy7xwln1Nb6xWw4C9uNOZKjZs7zQ85kKMJJsRp7bwB
         NR03UQp4lk85kpOSd7CxCxPgA6KzuuPsGWmwqBuomOOMeRcy/Cg5y3JNxjZjd/mjWp7p
         PFAAOgJi0Nb+QLIbg6KrE1vJKA/TmILaOqNquZMtRNaZERv5W7j52UdQHxJ1ahJFHs4r
         m2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/I5sqvgqbzePCnyDTlAzcXSq6u6gMrMFju8L7IHCeM37ZbdJ3AV+AEgQi+8sA/IQFrugx3QCVH3vG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLe4khgimfqD1pWRYo0DeHrSwdpdBomiuDur3dkktpP81+oDxz
	pFw27yaEUe/ZMEuC6uxUOQsSfeSup8u2tg6K9KeAK5TfbEdcDte2XJwCqvx4Rx61qApdNYk0iSW
	UvDOx0K9tUkdmgrG6iyc9Aww1kzQWOcCJEJz/lA==
X-Gm-Gg: ASbGncuOBPFYqVksGlISPk3G4X7iKf3ejvTx7s1cNFlChP+W97J2kSJuwhwqvVflQMs
	Xr/ErSh15hTZ/x1Tta45DySjywwLiZkOf0ckVkxhlLDTQtEjyauW2kL1dOALhkGSw+lmu7GXqon
	B3ABNBTyabpA6oiPF3madwqQ==
X-Google-Smtp-Source: AGHT+IFNMqXpj7Skwd2DnAC2CngVyisYolOpN1Zfv/fBoXfoE3OuGLadY8gJ576iwJlbr0gRiavf8/GMEeRzJsYqgX4=
X-Received: by 2002:a05:651c:88c:b0:30c:12b8:fb97 with SMTP id
 38308e7fff4ca-3107b5a7bc5mr3161681fa.11.1744753573365; Tue, 15 Apr 2025
 14:46:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408151521.552749-1-jindong.yue@nxp.com>
In-Reply-To: <20250408151521.552749-1-jindong.yue@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:46:00 +0200
X-Gm-Features: ATxdqUF0UARrwrF48AvkX9oUyEjV3CvjGrjRi8eYX0jsGcj8uRBqZxY9bkXxOgY
Message-ID: <CACRpkda23XbwhWTXzEF54D6yupc8+xAQpSPPb2vAy9aQsXxe+A@mail.gmail.com>
Subject: Re: [RESEND PATCH] gpio: vf610: Allow building as a module
To: Jindong Yue <jindong.yue@nxp.com>
Cc: brgl@bgdev.pl, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 5:15=E2=80=AFPM Jindong Yue <jindong.yue@nxp.com> wr=
ote:

> Support for building it as a module for use on the Android
> platform, because the Android kernel(GKI) doesn't contain
> board-specific drivers, it requires that these drivers
> be built as a module and loaded into the system.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
(...)

>  builtin_platform_driver(vf610_gpio_driver);
> +MODULE_DESCRIPTION("VF610 GPIO driver");
> +MODULE_LICENSE("GPL");

You compile a builtin_platform_driver() and then claim this is
a module?

Switch the builtin_platform_driver() to module_platform_driver().

(Also make sure that removing the module actually works, please.)

Yours,
Linus Walleij

