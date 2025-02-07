Return-Path: <linux-gpio+bounces-15521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F9A2BE76
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E6E67A35A9
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510001B4224;
	Fri,  7 Feb 2025 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JxyHj+mR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5A1B0404
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918451; cv=none; b=rB7Jqzv+1KRC/gwMQdBFhsCGAO2oKKlx6FsVRKvnpv0w+ktIAbuR3beHaw9AQ+FmTtsQXUnWTroWW1edziXhGp1kd8iVAwgKRI5Wag8vCpJQaLi+3E04vndGXy2ZQDQY5arSgH18/oPJpZ4FFzvk/vK8Q31y6NwQnlvC3NUyEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918451; c=relaxed/simple;
	bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqPPw8PPGJT/3+veoOi+NuGudLuZQNoyHZlSxJS861vyShNuACWedsWiIPaKuaoR3yqzs1Mj3R07naQTwAqTGZQS4VfydLCR3j6dhgzAt+tMxkDBiYVwBtCBm2UM2NqYeHutIgiUYSvMuAC7TW0D1QySwzNBgpUe3U7E+zGQZWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JxyHj+mR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307e4e72ef3so7395651fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738918447; x=1739523247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
        b=JxyHj+mRgzITlPG8rh+s9KeYHq9Kqq43I7VRIYkhrAm27BkxHjM1HgR6SWP11tP/nx
         cjbu3Hz05x+FYTFMx5w6YUJ+W+rO1IP8FFil86UYwBQ+B00gAh1nYkNVItEzwtBG2FcA
         NYyb+g9srRfxRkjkmhPjLFDTnAe1fpcI602FT5EdUafcv6IKLd2PxUgodqgP6i9ziP7w
         jSUcilml/Zm4wTl368lti0134QsT6uOL53laFt3Mhim9UT3gxx1aN7ymc58mht7zqSCW
         vQqQX9HOLdIsuAblTAERx405xttawK6cXLPUaku+w/karePkV3uc+69iMFK6YuK+hPFu
         TOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738918447; x=1739523247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YpRgDpXU7I7owpZmRmyzaYa/6nDtjaGWuZ2d3DUa7Q=;
        b=hV9qjTEJ2nPcLYsQZXFPID9op6hPAuZuP+Id2zjPAUgGjPOWMGgjRmg5QYQNuQ057J
         EiTDfk29A6HJmGnP94oopgapoo37bUB4P3KGUCXHe3sQnuy4wDitL+oDfPmc1Uu1pfqO
         C32JblX5+zlV1P5q0ASN8vE5IsLRoL+qsFrZZz/V/gOg9jW5pwf7tKuss/IysuVXeHqy
         202JcZGA6s+J/k/xW6JzNEkt1EVVxlHyu0Iry8o015cNjJu9g/rOBAVFeMOB+imvu2Vx
         67dRba1y5C34Kelp1g6oNALVDsAjbbHipYGSN6uqYl5wWnDXmE5M+r41wZXUYg67IXjH
         V+ow==
X-Forwarded-Encrypted: i=1; AJvYcCU50Q3M5iAUVDofHg2ZeFLh4VvGP6Xhm+VqH8SpBp5WWnLFmoINs3aPQTri79jhXNYLHQKqPy23nAOd@vger.kernel.org
X-Gm-Message-State: AOJu0YwM7jfnIIWKktAcWqlx7Hz7yyPT6x+yyTQL+OnKhORVfNgkabN9
	svuD8SQReDAebUpmw5OtoQZIEzxnZ0ckH2TQ7tvMVbldcVuDEZWMiyFBu9CPOdbivm3RkK+mfuM
	OwaRNMuzjQfsl9b1XhwYs3zwc9/vRMfyt+3VyaQ==
X-Gm-Gg: ASbGncvu4013M09I5qXt4FAf7V3ejMIl+uOTluukg+j1EJ+ZVIYFtLwNei740MSi26c
	32MGM6kd6U+v+aOWUZgTXDqTMG5sBjZK5vh9jJMKJtcmEWYDersWZe0j5HcRTXUfvxbSrCg3lU7
	61E1q9QMiXu+jBNnPS760aMSgYoW4=
X-Google-Smtp-Source: AGHT+IFsHFJNNKLdEXxQ9RmJCfueArNgIRv8RA8F15dLwBa+jex6lO4HgAmkMuAZ7uzNIjHQrLjlpHUd8vXUHrS8TPM=
X-Received: by 2002:a2e:a58d:0:b0:300:33b1:f0cb with SMTP id
 38308e7fff4ca-307e57fd423mr7386291fa.13.1738918447302; Fri, 07 Feb 2025
 00:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113225530.124213-1-s-ramamoorthy@ti.com>
In-Reply-To: <20250113225530.124213-1-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:53:56 +0100
X-Gm-Features: AWEUYZmOl7wUQPy_ROOuSzKSygvKItMb-rBgZEqVwt35XGP1BYQLd0FbfBe00Ew
Message-ID: <CAMRc=Meqjy+cqfueM_dQE8uP32zS0ib41qE+OPPWFkhoVTGc2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add TI TPS65215 PMIC GPIO Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:55=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@t=
i.com> wrote:
>
> TPS65215 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65215 and restructures the existing driver to support multiple devices=
.
>
> This follow-up series is dependent on:
> Commit f84464ec8190 ("regulator: dt-bindings: Add TI TPS65215 PMIC bindin=
gs")
> Commit 8206c20f4c82 ("mfd: tps65215: Add support for TI TPS65215 PMIC")
> Commit 0e0b7f00c111 ("mfd: tps65215: Remove regmap_read check")
>

Did these go into v6.14?

Bart

