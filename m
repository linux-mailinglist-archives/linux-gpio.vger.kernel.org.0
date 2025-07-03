Return-Path: <linux-gpio+bounces-22693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0EAF6D0D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 10:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73561C46A93
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 08:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9212D1936;
	Thu,  3 Jul 2025 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qBUXl54i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AA2D0C8D
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531769; cv=none; b=dY/ZWTRjzhklOXeFACzKh3qsuO+kTXar3NcrNyg8YtSWgklM2wgl/LPfs1Jft3hzlw/ZPSOhSbi4TYjkCUQIGriSrJd/KZx+1NtNkVTt/6ViKx8fuO7t8e1WYF1WwSg2g9nmtRfYD9m9BdfizaGCxsLhQjPZEFKs/5UbA+p67Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531769; c=relaxed/simple;
	bh=yCgvEF3BXwg254BL3VuI6mSXhUcwMOdng9eK89uzkVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYLoRb60ONWLEdFesDvitG2Y9i6+Y+G4nat9lc0RgHbS3tGeN57A0r22kzMJ8+aXOF93Rnrwl+6Q+toaIl+4AHlqnHB4HKLt7qAVrTZEK90fzRf30Tcl8gmDpOansZIUEMbM/Z28wJokjc29gHmryTV9O5CpQz4+fhLj9jtfAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qBUXl54i; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b6a349ccso6082769e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751531765; x=1752136565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNAqI6qp9DPwgHXIMziYUYhWIJDnhFlRLmGxn/xudMY=;
        b=qBUXl54ibB/dGWkpR/I2WyS/E15jfFW79yGc6qa1VmQ3AXeaYC0ro6eYqlzjVFCN68
         3czFxQqGStMCmtbWwNrtAE6XiG4jWfN/uyCoVKVJGJlknAkVyvwkKGTn0+x5XZK0uD0N
         HsBDaEDl6UT0iiSS7ZP6AVpcuVbXb29uS7qYanZ0oLG/K1D0hLIgQzzUcdCq/8i3Prmz
         sb7MECuu63Hn+KGEV2vC+paqfoPr+Dpl4IIwEY7NjKnyX3/04cfE6SvqY/+ER4Fe0DEZ
         7dzH5Wz6MhsuVv/I4hhjcSigYCrccvwagc6rJe08KB0LuHqmVRyJlB5WbZpXdbv6W7Tc
         2Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531765; x=1752136565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNAqI6qp9DPwgHXIMziYUYhWIJDnhFlRLmGxn/xudMY=;
        b=WuZNfboxexipOXy++S4qM8gMCvmQmAe5qhQ+fDsBJg06Y4FcA7RG0a50ycJ66Ya5js
         M3MVmpn9fkDBzs57r0rBwz3/K04oVxslc2WNEIPEUMU2G3j3Com/HYPVYNbDMkzaQk6P
         zPs+TOpOpDINk+lopVqrp0R/CjvJSEybyrFRQ/56Rn9K6ryxaBS/k2OlI5RRRG88Aqns
         DWF/c//DXc0MDxwsVfqlfsOc4iwTs7D3fq/O2JM6CzAmIFGV/U9/A+AKgnX+bdPb8DLi
         EwuLi3Xhy7K+BSUzqOVX6DXD0ZZKh5NEayZnwLp8HL717N+ZsBaLMOqA2W/54v4kjN3b
         8Wcw==
X-Forwarded-Encrypted: i=1; AJvYcCWv63rljalT9eipTocxNpNAlSwR2JlGYNXcSI/On0gSuKmBdkrq05xCU+qpUc2nqSNda+QpoJTyAKXf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4V9yDu/t/nr/hjPwM7sduo+TUC1m2isW0zDWvTJ9GPjjfafJs
	xhZzVw1yiZiI00bjhSbbc49KF0hOAu5aj/QBv/a5Ot9y8z8LwE9tWpTiJgnEbCYll3UGPY4mv3l
	VjmS2WLPYo+9lNb0vO1Rtdi9IQUq4EiTCgdrjvqU0lw==
X-Gm-Gg: ASbGnctk8EyCM77C6DOL2xhhA7DFH7++8aR4pJ8kQAV48ZNsBTfiyzab2r1dhdASeyj
	UKtwQ5eF4Rwzvt8vz0+JLxQXlFZ523+3zdDS5z8YgGOy4i06M8D2KUXuK74hz3/aA8f9Xsb2k4C
	9/MCh5BopUuTLeyrDksjKi/bSXdmjU4onn6beVIQsbxkA+mNThJnjoqRoZ4Ho32FBeQYnhkVRNG
	w==
X-Google-Smtp-Source: AGHT+IEuPyZAYFCdmQ89V9IkFw3Ed/mlCz+VFY/HSyYfKRFKouDT5YAQiOyUj8RrcRrwDGza8mWYWDjfTyIwVp4+DXE=
X-Received: by 2002:a05:6512:3994:b0:553:341f:12a3 with SMTP id
 2adb3069b0e04-5562ef9a6c8mr676826e87.39.1751531764763; Thu, 03 Jul 2025
 01:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-dev-adp5589-fw-v7-0-b1fcfe9e9826@analog.com> <20250702133609.GQ10134@google.com>
In-Reply-To: <20250702133609.GQ10134@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Jul 2025 10:35:53 +0200
X-Gm-Features: Ac12FXxFfJbvdzw57rmctFgHkWKx-gv4baKpEMbXxjF0v8UThJiEjLVfc7FisWs
Message-ID: <CAMRc=MfSeJrAatC-42upkH5iWYxuNvR26ZfHS=1v+XewspGnJg@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between MFD, GPIO, Input and PWM due
 for the v6.17 merge window
To: Lee Jones <lee@kernel.org>
Cc: nuno.sa@analog.com, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:36=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> Enjoy!
>
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-gpio-i=
nput-pwm-v6.17
>
> for you to fetch changes up to 45ee66c37f9bd8cff7718c70d84e0291d385a093:
>
>   mfd: adp5585: Add support for a reset pin (2025-07-01 21:50:51 +0100)
>
> ----------------------------------------------------------------

Thanks, pulled.

Bartosz

