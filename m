Return-Path: <linux-gpio+bounces-30053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333BCEE28A
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 11:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BE09300A1DB
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 10:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A850D2D7DE9;
	Fri,  2 Jan 2026 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H3KKYNCl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34622D2481
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767349210; cv=none; b=aXnLSyCCICVA/OGH/hJLYL7cncpWmQ1BdRmd0Ttg9H7vNspFt0pjOYYpoKF4RExBKmGhI0NT2h//UkRJYPrNp22spGCZ3/dIOuu8QHlUVpOOToP1eIF/AqXCrmnqcFzhmbw+qm0LAwfRlvMJ67jI+o6FlPW4RmiMBsiWa6QXzJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767349210; c=relaxed/simple;
	bh=WFRLXXrWG5laFAL8o5x1rIAE1Mvd39kt6b0GYzsOmMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CICN/8W+W/Z/Vnh3lTJkffqwO5KSXZAnSm720bQQc9C2tyDQ6aMya7VEet8WHCowcR5iHIaBgCbz/fsC5nha8C0nTko3rplj3quIShEirB4IPWU9jSQlUhiuqD1m5QYw3vgd5gSq+Jntf0PE2HbRKr+H/BylXOp3/WtYjFeKnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H3KKYNCl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37d13ddaa6aso81761011fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 02:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1767349206; x=1767954006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFRLXXrWG5laFAL8o5x1rIAE1Mvd39kt6b0GYzsOmMY=;
        b=H3KKYNCldhDnZvb9Qw/IYM7cuwKJrlsHZGb00vImbQ10vOEEfz84ROHwhICX8y5Gn3
         m+empeRMs/DCpGXaY/SXhMzDUstI9sbhm0CBCkKxcCnlt/51/qWGp0qoGor5Ui8KbHVU
         ykkU6r+KWPqh10sshiJNJ1ZYkeVJrsDdKjBLptDM1x6fwfpSZ/O0FAne28XN+399GPkb
         WIMbBrCf/FJwKwIEjONLCVT1YZCg2KvdWF/YyV2w8ied6aBa9zBZr83imFFB4Pi+bR33
         7ky9SVyKxfRVg9RBLYBV0QMjvb8ox5bgQUGu9GkKF2TAfbn2mutoGwHwghGH2RXjMhJy
         paEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767349206; x=1767954006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFRLXXrWG5laFAL8o5x1rIAE1Mvd39kt6b0GYzsOmMY=;
        b=qOoNpdSKVKwRvsvrs1movW+kCHLvTt0dgfNk4nlCz7tWrztyBL+G9/bRLYxIsCyjlx
         hcvWFgpa4ljleCZwabOcffG7Rk5LVbplwjOpnT5sNpWahU4ppiDnP3h106Q1G78CnlzB
         WoLOKWw9ksOCePnKwt6cMCkZBncdiCKDKuycpRwM//bHgfyKioPyIV/GspQ/Li+JvU1X
         qY10VNOIZ32c4CI0Ha7BZzlw5n225GPFgaEk2l9SMPVcHzCXr53PRRgWoLPbO9qUD2AJ
         EPTPsEgtJ2X6pT035nz5GrKrLs5sb3A9Ep2QkJjt06RsngFC55dEnS6Xsgn9iZnPO2Jz
         j19A==
X-Forwarded-Encrypted: i=1; AJvYcCUKbH5YfdO5tONI5pDM15JMoWO0kKUN1OoBPi5/d+Lz2Kt8GmSbpegb1JXKn3w0mv3TAxn43IkvySIL@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBpwXQMdhzKbElx8mOUhJhO4wX+iIXrI0pNLKCjs12siYx36C
	Ry4oqR99k631BYmOdHo8EH0HhPtO8uCtJOLc4SYrZpFy1aaxE30cKPcEzmOGm20yiicg9oKNoMK
	vdqL8/qbBgje6i9S3TkGsSYErjOe/c1F5FySVkQF53w==
X-Gm-Gg: AY/fxX5oEhy8HsbOh5S8NowPF4Nir3+iexVfdRdeE4tjeMB2nKleDPy/KDr98IYmDUS
	5naAzMLBweiXarLrQBmMjL3+fGRNBLL0E/iw+txqSZ5tMi5akb2YIZL3gy72EN+6lLMiDYwVVgi
	kjwKu8yt/Yuk/k6uzVyw7KFtSeN97Nt9s4mTQieCKATL315LEUSXTZLncpncFsCgaAWFQtCas7Y
	cX3dovQ0qQ9ISx3WWq7+2dh/e1tcRyVBntjneyeePTaIVbtgV5UOiskCS2aHz08eajGLEdcCEG7
	8xl23fqME9R7RMIIigcc3QWz7r7IGHaDmQUSWA==
X-Google-Smtp-Source: AGHT+IFTrNnAEzvneaNdkZRQ0grp032lEIuBA9cgcvyb1zEx7XlupkDM8pVGx6rm9ItHKSNq5q1wSSdpG4U4SEDh1SM=
X-Received: by 2002:a05:651c:1b96:b0:37b:90fb:9caf with SMTP id
 38308e7fff4ca-3812169eee6mr123154701fa.41.1767349205784; Fri, 02 Jan 2026
 02:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227-s2mpg1x-regulators-v5-0-0c04b360b4c9@linaro.org> <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
In-Reply-To: <20251227-s2mpg1x-regulators-v5-21-0c04b360b4c9@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Jan 2026 11:19:54 +0100
X-Gm-Features: AQt7F2oHMGc2bHvrlqFMv9ZOlJeQnJLO04A4hnwhyHf0_SEQbbpjY_L-KGXAL_o
Message-ID: <CAMRc=Meu6-5569rMcV0zf2V+Sz_QZgShoEhmhw41k6fczULcoA@mail.gmail.com>
Subject: Re: [PATCH v5 21/21] regulator: s2mps11: enable-gpios is optional on s2mpg1x
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 1:24=E2=80=AFPM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> For s2mpg1x, enable-gpios is optional, but when not given, the driver
> is complaining quite verbosely about the missing property.
>
> Refactor the code slightly to avoid printing those messages to the
> kernel log in that case.
>

I don't get the point of this - you added this function in the same
series, why can't it be done right the first time it's implemented?

Bart

