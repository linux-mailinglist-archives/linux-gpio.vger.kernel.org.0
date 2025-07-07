Return-Path: <linux-gpio+bounces-22839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2CAFAD0A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 718907A856B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 07:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF5D286D42;
	Mon,  7 Jul 2025 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xk/26VLz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3854286893
	for <linux-gpio@vger.kernel.org>; Mon,  7 Jul 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873130; cv=none; b=R/I5kngePp25R8yXlUI5JKSh+uaXJUha916XTNM8G+2twO2WXpgfj2pSC9h5S07uczpe/8iDFcs3ybJA7WjPycFB7OmAcEHT+0rPYB1zkKkwhrZVKrV0fjyYCo5TsB8sN3EtNYvpNncHsSsQeK7d+ksgmS0M/ONocWvEEmFaLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873130; c=relaxed/simple;
	bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keEyv5QIx/JXsZaoHvhWmb1jD5Cd/2zKbU0qkXE1Ey+2vXAlAnM8kasDT8am1b9fys5ugS0Fv6om6JrTq82hJbI0Jy7Hhi8xV1iX292iHhB7lLks7U3ypMQgMODFSq/Dy7Ae3QyKPgcgLaxsJ06CbrEFgZqxZgKNe06DlmLdzHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xk/26VLz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b3316160so3379349e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jul 2025 00:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751873127; x=1752477927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
        b=Xk/26VLzKDepa7V5slyh0vM9NikcSij8aUq3BscvsdGSQfTL1lX82OYH+ULDFWV/kM
         +Wui+Z6RcPZa9Du9/U2PG7qSfxUy4Tq4DnY8VwlQn0TpKL1d3fGeyzFAQGDJSzVA2MtY
         CyEfUobQzeQyLnRz2WX6JtUkYSpB3v3yNdbB/QTJTiiqtNmypuWuHRFVgajLeJqd09el
         YMN1V8lr4K/ggGEw8bUfRM8MMIhn+iuCr7TnZWivg6EAH32cIkm+GrxSfinlVoZd3e6i
         gP19nfMjJMLxbdT0SnpW+HN7w/t1y1zkgUMrPpTbTdkR7oDpOIgSkCVsQZISD62Xj6HJ
         lPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873127; x=1752477927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Bu7iprcuJdtoQaWcgFgAUyLqTmMraA0+hnWwiXhNaE=;
        b=wpjjmtWPFuV/wYRmpA2HyNGUIUurOA5YFCakZa3R/rMZaL15zsdkqNP8nd5tDD8+Xa
         gdF64Hpzwoz99MsHq+rSgAu4lnf00kF/3hKqbs5BfwTMqJzl/VIouR2WlHVDMoVylsIO
         /lbg0YIZ1IV+omKaW/IrK4ZH87b8asmCkWV/kJMBK3WKrdMHSEGC6/kB7AItlfmkaqGR
         8dhOHupxjQb9BdycTQ1IT222WnJKVOTfyc686kZS16EMk6yyZ4bjz9pIszXZQHyIr0qp
         lPwORG4Zr7QWz7nYouvwHhZNVq4Sz+oD0UeeoYszEbFaYSS16TI12UMT0ChCSj45KCWq
         DMiw==
X-Gm-Message-State: AOJu0YxRvSlBIpm4zGHIET3Q+ZSazbbi0ry98Fw1kcmjmXbp8gVmjJaT
	+LswZMtexwDJ0gHbp0cZmSEh5rMv9hTRpVA9Kmo3TgQH7qfUl8v11jyQ38EHKwmOP7cPVIKDk5Z
	YJeChS4Qv4qIhcPj13PuGe/Y50ZzRV8RUcxcbOAuufg==
X-Gm-Gg: ASbGnctsxxZ09l+AUCj/+PD4iicqbIYeiQn5OkfBOQNewOW5w4gjw/OkXwF7f6joOH4
	C/8/0UjcDeligoMlpVBEZZHQ/xz646WzzAdOR9tzJg6BOuNYsRx2cHdvOFCK9x5Sy223/oMmOVO
	7h/dfwdTxAVvFWkvq7P/hzSuyNGNj6Bsd/SyfMFdHtE0IwkWmfYXtn0DRE10ww+UGfSszYOhE6f
	4U=
X-Google-Smtp-Source: AGHT+IG328qUNrN5U/Zp0A0VnQQsBfGC8lPGfFuSftcauCLQweyDW09LAJcmHXaDhqB6NtCosFbIHR2f30xy+SxqK5o=
X-Received: by 2002:a05:6512:138a:b0:553:35ad:2f2d with SMTP id
 2adb3069b0e04-557a19df4a3mr2772272e87.18.1751873126739; Mon, 07 Jul 2025
 00:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630130358.40352-1-brgl@bgdev.pl>
In-Reply-To: <20250630130358.40352-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Jul 2025 09:25:15 +0200
X-Gm-Features: Ac12FXxg7IsQMRpqGn1bjOp8mqIE5ekA-5MUmfkQKNbozl-9XBliHzx4lWvRABA
Message-ID: <CAMRc=MeDAAC-vLfriDtbMn9tnikyXjAm9rZGOTAc2j9mauD4jQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: allow to mark simulated lines as invalid
To: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:04=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a new line-level, boolean property to the gpio-sim configfs
> interface called 'valid'. It's set by default and the user can unset it
> to make the line be included in the standard `gpio-reserved-ranges`
> property when the chip is registered with GPIO core. This allows users
> to specify which lines should not be available for requesting as GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

If there are no objections, I'll pick it up by the end of this week,
I'd like to add some tests to libgpiod that verify the valid_mask
functionality but need this first in the kernel.

Bart

