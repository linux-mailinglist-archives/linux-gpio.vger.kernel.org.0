Return-Path: <linux-gpio+bounces-1648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AED81846D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 10:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6629280CD5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 09:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F4D134DE;
	Tue, 19 Dec 2023 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PsmEEk4v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7913AC4
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7cbffb691cfso159874241.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 01:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702978260; x=1703583060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43MFGB5RuUymiXAB/bUEsYfRC+PGoTDFmWi6lTDtBws=;
        b=PsmEEk4v3qSt6h+eDkhyoaSQwNhc6po1FwCk/EIOlMBbcegHDVShvJ5ypVLubVl7cj
         XnBkspLILab5RZOrpTud+2agQkGcKSSO4rqkAVlcU9asVchzHUbDIwe2eZSJ8r4G2Rs0
         ASaj45yTGwNy5U/0JJeZWzyi384ax3rIT+XrZOhEwZHykGgNvdMmZJJPvh3GtQ2weLjT
         rBO/P7ayU7rTy0zaC9T+mPf+HHCh1nEBxmiWmN5/dBWVHhNmBdZqc5cy8f/r//fbNrl6
         dCXAmn6EA1TJajiUp2H2/9eocHhtgbJoksmkfRqfo52GR+JyGL7MT+jxPF73vVxPo+Pl
         r5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702978260; x=1703583060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43MFGB5RuUymiXAB/bUEsYfRC+PGoTDFmWi6lTDtBws=;
        b=ucr+/OcmJrtKroXjEdD7yp5S0mhdgUUaXy5GsAmVsLFYJS56kN6806X2gZ/x9Wh4Vc
         210NyLBOytFbVtL6nynR+IfLU4UocLo1jft+CfSuUWynOkc57oQAameb73M5+T67X7EG
         IIAb1ZGAuGZA5KHSCATugRL9kxFDJozMymRDD8b2nmcpwtv2syXYEvMJtHWB/4zDO2Jc
         gtjt6z0nD01eifXc2NDp7NmPLdKI3AcnlE1B+JXQLb9dIRfspuxKk+jnJe6B0GZPXs/Z
         WUW7rOnE7ms5Se7dcwTUmIXmfHxpJMxv6FPRJ5zN6U30CPQf1MwyLhKX2atobwmxpSFw
         4ZqA==
X-Gm-Message-State: AOJu0Yw3ZCoKX+3ajFdTg8ViadqlVQB9SK3fyeSCHaofotSe+Fn9YeI9
	3i+8cw6lP2QMS34Bq60gT+GPLkub/DUYD+SPT9qpWQ==
X-Google-Smtp-Source: AGHT+IGLPSdhHOK7TeFasU8Y19mVZPNNfXsxhyEjEvdfaY/3tjQ1id+5awZZcpiuASPwISZjDiwtmG3qRwfFd9sfB+0=
X-Received: by 2002:a05:6102:151f:b0:466:91b8:ba4 with SMTP id
 f31-20020a056102151f00b0046691b80ba4mr1741946vsv.23.1702978260244; Tue, 19
 Dec 2023 01:31:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219004158.12405-1-warthog618@gmail.com>
In-Reply-To: <20231219004158.12405-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Dec 2023 10:30:49 +0100
Message-ID: <CAMRc=McUAo6LGXwG-haWNbcCoSL9HkvO-85_5vsCGeEO=6BoKg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] gpiolib: cdev: relocate debounce_period_us
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 1:42=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> This series contains minor improvements to gpiolib-cdev.
>
> The banner change is relocating the debounce_period_us from gpiolib's
> struct gpio_desc to cdev's struct line.  Patch 1 stores the field
> locally in cdev.  Patch 2 removes the now unused field from gpiolib.
>
> Patch 3 is somewhat related and removes a FIXME from
> gpio_desc_to_lineinfo().  The FIXME relates to a race condition in
> the calculation of the used flag, but I would assert that from
> the userspace perspective the read operation itself is inherently racy.
> The line being reported as unused in the info provides no guarantee -
> it just an indicator that requesting the line is likely to succeed -
> assuming the line is not otherwise requested in the meantime.
> Given the overall operation is racy, trying to stamp out an unlikely
> race within the operation is pointless. Accept it as a possibility
> that has negligible side-effects and reduce the number of locks held
> simultaneously and the duration that the gpio_lock is held.
>
> Patches 1 and 3 introduce usage of guard() and scoped_guard() to cdev.
> Patch 4 replaces any remaining discrete lock/unlock calls around
> critical sections with guard() or scoped_guard().
>
> Patch 5 is unrelated to debounce or info, but addresses Andy's
> recent lamentation that the linereq get/set values functions are
> confusing and under documented.
> Figured I may as well add that while I was in there.
>

I applied patches 1,2, 4 and 5. I have one more suggestion for patch 3
so I held it off.

Bart

