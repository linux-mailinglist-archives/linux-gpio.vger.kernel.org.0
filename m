Return-Path: <linux-gpio+bounces-23873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EED79B149B4
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 10:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3165E542446
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Jul 2025 08:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1895027054B;
	Tue, 29 Jul 2025 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lHg4Wcyd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16248221FD0
	for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 08:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753776198; cv=none; b=e2qvw920QeA9WaObjXQc04TRPfhMYQGjdSPc/fm5r4Mc9aU6mwqubGOk8SVJHD5Bq3C11AGJ6addtzKoisWTSxBS/lPHlzNmL47CM442CFVA/SdHI9MEwqmJRe+d+P0Zt099I2EKsIx18sXmi+SOgLxD7JDh4GT08s1uSeEx1do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753776198; c=relaxed/simple;
	bh=UflJNvI/cneK2LX3m1PgDlZbFunqpRrS1ehCqCFEDw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBTr5Nmsm411tzprQ36OTT0e/+Gz3A6ZDmIOBD+Lmb3P9W6OpMwka5st3VQaCNbUQds0k4ZYJRC34J70mffFCDbMPrVfoF/KRnJAul2knnnrmEKbtmnS1oz6pmQK5lf91XN3BH80i63me/ZgNtnt0U7+Z66J2DdvISYZhKvbfdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lHg4Wcyd; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-555024588b1so5762770e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Jul 2025 01:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753776195; x=1754380995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UflJNvI/cneK2LX3m1PgDlZbFunqpRrS1ehCqCFEDw4=;
        b=lHg4WcyduMyjgVQ75Wwb2TKuNLuAjYgZ4+19osY9bKFZEzrmKY4uIMEN3fBC07R6go
         pskGLbA/N0ne2CkWctM4JDpWYRXHpfcukZqQEhqeEsS54LkKFTuuE8R2gHQZ7dHNDIzV
         xGLXBvdxtYSSjTyADL+bLKVpv3DsON/0tKEvOi6kSLDyDLULXRAG2ooTXmm8osUX1nPP
         eQlgc/4PzsjKTztid0tyehGU1MC7XLP8r+wa855O6Q9zN8PzYCUtiWd31uem/WT820in
         0XQ3IPjOetIlqAYz57oHyNvYGPqfDU25en2sUfikIhDhSjCjIlz/r5YYwbKOrg5MtohH
         0miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776195; x=1754380995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UflJNvI/cneK2LX3m1PgDlZbFunqpRrS1ehCqCFEDw4=;
        b=sdTX0GzktYfPqZrd28wuISM1s7MMc46Cg32NN0sr57cM53ARXoAuHtp+Uu97H0ZVX0
         XBsi1F1aEUqfMjLvgO6uqHG8DSehdiy5Z1Kk/BiULS2+UNsunUO0+K99YvOpgitypRMq
         F29sQwxB1fmStrNPxELPw/EG/j932klsbLscopH7UxxWyL6RxJsNfT6KIe+uvAy1KZQ0
         uZEZl46K4ouorCKUTTmoUWMCS7oTYQxK+t7u5XQWjoTRXlisNg3mLRjML1TMdfYYZILD
         iUTxanZ6IILvc8u+ZJLsa5DxYjNIKHIMco19Z7bW3WpP3SRqgjzcZEFTeQgChYPc/B5x
         eqlg==
X-Forwarded-Encrypted: i=1; AJvYcCW2nZsGIV7gO6CnpuiyUOJW+FWaz4QZZkXjmZbHlWCM2vvaa+MNejlNQAWvP8JGCMtVGea6f+D+sARR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9KuC/dAksDc/e+4VfVpnXsMcaYuUyDQMOf09P3ZbH03wOgby
	J70R/Y/2NLBwNxumQYAS+udMzxPd423Yzj3euydKltNXLhhn67Mt1JMBMlrIXNnqaGXdhAyOFzP
	106x7LpV5aVkAAHHuF+0JbtpCICM1bRwCtaCr4eGAFA==
X-Gm-Gg: ASbGncuspSnU6SMqz8ETjid28oKhMCX3hb+6gq+2vAIBDErXrvMkmt8843v23zOg03d
	Alw01xaH7NHX0HWW2PtLFbGyO3MSaxzzvdiTg3vBPjiOX5EbImBzCkiucYtziEkAIfYZ3VZBGr+
	DVKyNsh1JxkGIMUnaESszvlG+bMKNDEcHC1cqTQqV3bAgZkPt2OEChRlSOjWiu80zAp1MKs9QbG
	6zFRqHO9I6dSa+OXcTy7IDMUHvXs3ILaEu0WZeMpgoU90YCUg==
X-Google-Smtp-Source: AGHT+IHhGTfRcwlCoTMkBpGGIbg24X8fFN+ca6FGQ7O5Z0tgMTO9PPQ8O181X8MbzMzcz0jB3+Pt3eo0mb+Vi3jG5I0=
X-Received: by 2002:a05:6512:1082:b0:553:25f4:695c with SMTP id
 2adb3069b0e04-55b5f4b9c66mr3802415e87.50.1753776194943; Tue, 29 Jul 2025
 01:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-aaeon-up-board-pinctrl-support-v8-0-3693115599fe@bootlin.com>
 <CAMRc=MfS5Em65n0fwbu8JtJsc3rTgQO5cv+PymSonJtf6_zRKQ@mail.gmail.com>
 <824ec6d1-4272-44c7-b3bb-93d716ed3d43@bootlin.com> <CAMRc=McnU6TO5p7Jwy-DOg_8-=AS7rFRfaPD0yH1SERWXM8L+A@mail.gmail.com>
 <CAMRc=MeZ4HHJGkVBysLyusW5G-rM0iSQV1qqmFJUe1rsZrN2AA@mail.gmail.com> <CACRpkdbjQSns7a9EMx_5kdJ4Y2wsnocTLNsO2es7MQ=rKCBkQw@mail.gmail.com>
In-Reply-To: <CACRpkdbjQSns7a9EMx_5kdJ4Y2wsnocTLNsO2es7MQ=rKCBkQw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 29 Jul 2025 10:03:03 +0200
X-Gm-Features: Ac12FXz22uZHpwAEpH2A-edyCZbULy4WGvtG8B3M_WQs_F93ggeN_b2SiWiW7F4
Message-ID: <CAMRc=MdWkWvwVU66daz94NB-asxBBY-1EC3BSLtPO+6dcvyCMw@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 4:17=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jul 23, 2025 at 10:43=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> > On Tue, Jul 15, 2025 at 3:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev=
.pl> wrote:
>
> > > Well, nobody responded to my last email. This is a cross-tree series
> > > so at least Linus must confirm he's ok.
> > >
> > > Bart
> >
> > Linus, I'm willing to queue at least the GPIO part for v6.17, does the
> > pinctrl part look good to you?
>
> Yes go ahead, sorry for late reply!
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I was mainly waiting for Andy's review on this, so if Andy
> is OK, I'm OK with it.
>

Ah, I already sent my big PR for this cycle. :( Let's pick it up early
after rc1 and I'll prepare for you an immutable branch.

Bartosz

