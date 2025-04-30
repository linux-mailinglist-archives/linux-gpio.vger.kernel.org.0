Return-Path: <linux-gpio+bounces-19488-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B3AA4456
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 09:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 373E87AAA42
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Apr 2025 07:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D1F20C00B;
	Wed, 30 Apr 2025 07:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QnI9E6uD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10893184E
	for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 07:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999381; cv=none; b=L1jFP5DwqiG9AmmO6Scf71pZqz9RBPlc4Zx7Rdluv0UlcLzC9B9OonKDKjnX9mFZaOFNEa18JlMeb3QnEzSP07ZHv0Tx9WDvWWclCvGhl0DwSEG7IkIrLMUBHkano/hs+Xz4LwzJumRDCybVmn2AEEz0NqQ5Eq7SpSSQZN1ryS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999381; c=relaxed/simple;
	bh=gagF1+Z1gth1Gl0G1Urrz8XqqkbbSWEjhw+Zkns/Klo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYRQUvNpwLIdlQXqTYcPgloognSRqJp3iUoV3LiqUydBnWf2eS5kHbd7IpntaGxyUwII5urfalEYU4ZFxr5GidMl5CaZwUh/wCWKbBHNvL3dVcotmwD2zbRRtik1skMpFCr26jIG45SKXB+4c5HYXCsPdQwLizYCfv/8I2ZDKQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QnI9E6uD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so7889470e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Apr 2025 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745999378; x=1746604178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gagF1+Z1gth1Gl0G1Urrz8XqqkbbSWEjhw+Zkns/Klo=;
        b=QnI9E6uDkOC/qGzkyLrgvdJZYoPk2/B3lLMrJzCRjTjFhQ96OtGCJYPabeY0aDg74y
         vxsSkW7plPp50bKCZDKqLRg7+hDVFuM6oh0D1TKJnl1IYFy886As6D+sfMos1Kfxyld8
         16CaUXdM2s4WBpvsdxyJbjUV5u17RAPnbiGGh+aoFP4uvAJ+uW4EY9ev55abfrlmQTUQ
         7VSJ+QumrxAzI9SAy03dvByRHw7Xyh74Ml7Y1TWLD6kHn+HDqXO6c7WABvoMQ41W1zLc
         ZsUBckGLB7ozBGurfBp2UTZICcIkRd3FkKLQghE3Xi+ZNjIfAE/5/s4IXA5TxACqfyB3
         6SOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745999378; x=1746604178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gagF1+Z1gth1Gl0G1Urrz8XqqkbbSWEjhw+Zkns/Klo=;
        b=VPW95UX4ozAmD8hK+9WrWo/gzHmIhe47rtoiHCEXViLPQtOogicE2whIL7Y0Jzxwzl
         3557pctOLnbZRr26oFAsDWhcBRcYfbH5aBii/UmLT4mdH7r9Fv+7Nfmh+JnaH1Tk54HX
         cEUtyHKuxzZ0zFEYWFM4Wv1aLUsKNYm0+KbLyEpY2dR0YkKU/P3xsXzY5RuWQ5pOsTwg
         N0lIuh/ZTIqAvvkYwM33u/Gyn7pywMOcETzSjZ7NRdxRn3xCIg0GykssijduwD4E5cmF
         SjHP/ao47yF5IpCoJfAkR/XcN6Y1SHACeiiCueEVaKvQ5593uqQ7PXCZYTV15z/6GFpc
         fs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIH5ywT7Ra6/9AxEnksMFTrY8wW/WI0BJKOq0vvghqgEIS+o3r9A09xq13kdkJCOvaobtvpXBXs6CP@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6b1HRqCwSZVKvKkG9puUtvgyqATdAVxHDsAlxDbtCK6MrSB8
	T4UrITv6CQB5/GVPR9nS7TlfNG9OKpiXPuRjZTQ7o4Ki+YtI4hPMznmWtSoovQyFY6IXvTJDBHV
	Ib7ZJUk78pp2g+qFDkDdtUOAISPZl+OHdP8j+Gw==
X-Gm-Gg: ASbGncuo1hXqv+Itf69fSP2RRTJXlS8C4FS4Fsk6GPRNs8h/E9M5za3r/0RR26pqwXS
	qLf0x1G8Xa7f8qkDYqJENzqqDsoW0J6yeZ8XgCB4RUnWXlmX0D89KJ2het51St8tDAwpVWtyBCg
	EVUU3gm9p/+sLuEYJJf05CXC9u4asIoxy5QjCl/WWCL5Q0K48jhBt2VtU5262QC/6/
X-Google-Smtp-Source: AGHT+IEFFDno7HEPLhjBoV2o9bzH/IPZXO1S6zS44ofx30EX4LqTfYUZRthTkCT4/OrxXPozicJw0AVWJA64RH08fOU=
X-Received: by 2002:a05:6512:e93:b0:545:c7d:1796 with SMTP id
 2adb3069b0e04-54ea33aea24mr689451e87.43.1745999377970; Wed, 30 Apr 2025
 00:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <CAMRc=MfpE6M28P6jxFgs6K6Tf84LRhmaw5U4s8WgciF815M7Bg@mail.gmail.com> <CAHp75VfkJAG6EKf94NFKVKRgKiRKxB7WER_UXcY7sGMOqA=YNg@mail.gmail.com>
In-Reply-To: <CAHp75VfkJAG6EKf94NFKVKRgKiRKxB7WER_UXcY7sGMOqA=YNg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Apr 2025 09:49:26 +0200
X-Gm-Features: ATxdqUHrPhxGGHoiNszruLYa_2Dtad5uG_qc02QAby_LYfy0erDTwo0gD6qZhok
Message-ID: <CAMRc=Mf78f6yJPUEZbB6UWQmv22gLaP+6xca7S7bk54Le85TwA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:30=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 29, 2025 at 9:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > On Tue, Apr 29, 2025 at 4:08=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
>
> ...
>
> > This looks pretty good now. Who should take it - Linus or I?
>
> I agree, but it still has a few issues that need to be corrected.
> I believe the next version will be final.
>

No worries, I'm just thinking ahead.

Bart

