Return-Path: <linux-gpio+bounces-17041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B523A4DF84
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D30DC3B23DF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096852045AB;
	Tue,  4 Mar 2025 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XsnQUsgS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480542040A8
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741095800; cv=none; b=u+LpjudQRg111Qxdxar1ZaQCm4JSc6HIeRKTAX72yX9k2cCHpWCOSoK3mgnrsZuB3Rgcm/lyhii47rh1QjX0Nz3H/MwCv3QKttW7fp3V9vIan0fY8JinXFvgWsj2dChIcA/rBfqjw0ZY0ufT7DEqxdYtm7lZRSMypNsyWK9F+1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741095800; c=relaxed/simple;
	bh=0pGZ555KSvs9RkZQ2TF9sAp3mz0s0plHDaitzlJaP9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlaZnE19DqTLq89nfLeLCOTzs1RUIW3llOULwZDTjmuOLndEq2bC2/S/tC8dt8pyNainLWDhugrDqy7jq/aOzkH2QrA/m11Hcn6KI/EhrYbD/MRABHxwDl+Y+SHTyPD0ZYGS9RJ+XJMTwVQBu2ZBTtliKk/NlJq0ez1hd7iaLUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XsnQUsgS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5495888f12eso3773911e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Mar 2025 05:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741095797; x=1741700597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pGZ555KSvs9RkZQ2TF9sAp3mz0s0plHDaitzlJaP9w=;
        b=XsnQUsgSWo4iPO/7DEA6P6yo1Vd8HfWDljiu7o+GWXt/lAC1/RanTa9riq6LJye4uu
         6XAntWQ0EUvhPkp7FPaJy9I4i7qGNksgjVqXIo0Ivs97pHsZxkUiqRR8J9e2JIPWDkEs
         ty+TehVPr1yoX2Bs4EAsZTMstv9cIi/gtqnLGZ3CWQpRFFXJN4UHWyViK9GgsGPmZ2ME
         LemNwzL5DBbeRqVM16UZVpzMAJbPLnmdXlaXFXaVeSMHjNKJjog2YuV+dPOVr4J9uEiA
         jO+r3Sptp+AgpfMM2+iRc/AyHcfIl+6m30SaAEWPIGU0JcxkRIRDUS8GmwiIibjDur6X
         0n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095797; x=1741700597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pGZ555KSvs9RkZQ2TF9sAp3mz0s0plHDaitzlJaP9w=;
        b=qJm6fgsxNWicbVLdzvoFL+52zuILhtJ4OtIVO7oMuf9osLAnWNnLfwqvlDQ7R/ip3v
         v3GS6S2akowGgeYKr2j3l+s7fq+av3urYoiKTnw1BCTL//w/mL1wtolWdWxDziePxaM6
         hoFwrZTzdqLGUaQY/Huh9xrRp6LlGtp3VYGXUQOH+oaXvb/SZ6HRVHjr9k9vEm0HGDxB
         K92/pdVCreRM711phP6g65wvm085QY/3Ha4iFA0pHkxt8hDv/KDzzEzyPZ6JtVFClUNh
         iH+AtFIt8PilFZJs6UiIVH8ZHZvkfuTPLPW47eQ6dbfa6Qu/SUkKKvxCaYdqmoCjYlIU
         amFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4bJfK89oRctv9KzvDA7ses1kaKKv7uRNzflT8SaalKzyL3iCWOSYz0IClFqmLckoRNRuuuTpq5uVI@vger.kernel.org
X-Gm-Message-State: AOJu0YxAnOn9b6mn4RBZvzPknYjKPDEevesqt71SJS0QwWY9FKd8HTfQ
	16W49YZKhGhEycCVmrr3J3n9MpDBH4q8X/frFvIGcLjW3ekuXCc1tVnleHTrxD1bQS2ZKbB63Ve
	nmZUMeko3v1rnUhIGkHhb2d7lJic2c1IZ6asv0+TFJRcfIvt1
X-Gm-Gg: ASbGncvqcTNyW84UAUDr6XPGTYw+ANmxcgbxA+RenHCOtwFCU7mJ5Jj8xB38Pza11GJ
	2YvyuZf+m+G9so2gXIkw2JGINSJB11IUnLa9HSMrHtR13id6BV0yp2YOt1c9LLUqZ64q7f17xZq
	rApsXFwGOSCld1zXbp1LTWT6VJ8IBgMIkU6+r6NJ4OYr8ba9sxVvwqQR4AyQ==
X-Google-Smtp-Source: AGHT+IFWh03wXh64Ao3HRMlhJCKQLtqt910EoDBcwZtN1H8wHZ6DUI6QiDtsoKY7O3tRh80hbzaOHl+pKFDQV/B60Os=
X-Received: by 2002:a05:6512:2398:b0:545:a5e:b4ef with SMTP id
 2adb3069b0e04-5494c31ca37mr7947524e87.16.1741095797400; Tue, 04 Mar 2025
 05:43:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303160341.1322640-1-andriy.shevchenko@linux.intel.com>
 <20250303160341.1322640-3-andriy.shevchenko@linux.intel.com>
 <20250304091804.GG3713119@black.fi.intel.com> <Z8bdDQGg_xcamZv2@smile.fi.intel.com>
 <20250304111157.GJ3713119@black.fi.intel.com> <Z8bhJq3kn_uw3iYE@smile.fi.intel.com>
 <20250304113135.GK3713119@black.fi.intel.com> <Z8brYjfL1yj_BvpN@smile.fi.intel.com>
 <CAMRc=MfsKc+r=uhDZVbd_BW=Gs1BpaidPC1tfF6TGqcq9bgP6Q@mail.gmail.com> <Z8cCQPWBmJXFgKAe@smile.fi.intel.com>
In-Reply-To: <Z8cCQPWBmJXFgKAe@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Mar 2025 14:43:05 +0100
X-Gm-Features: AQ5f1JpqX_GHUguz2RwObiRuAUFX8DZ0DsNPbeLxo7WFuOXHLfYuwvzPP9w3pks
Message-ID: <CAMRc=McQY1r-Ni4buuvhD8DP6LGz22PAxk_QC9ENYBEzYTc+7g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpiolib: Rename gpio_set_debounce_timeout() to gpiod_do_set_debounce()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mika Westerberg <westeri@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 2:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> >
> > I'm definitely in favor of consolidation instead of renaming to
> > gpiod_go_set_debounce(). If anything a better name would be:
> > gpiod_set_debounce_nocheck() to indicate the actual functionality.
> >
> > How about first extending gpio_set_config_with_argument() to take a
> > boolean "optional" argument and removing
> > gpio_set_config_with_argument_optional() altogether? Both are internal
> > to drivers/gpio/ so it would have no effect on consumers.
>
> Consider this series as a report then, I am not going to spend time on it=
.
> Thank you for the review.
>

No worries. I applied patch 1/3. 3/3 doesn't apply on its own so feel
free to resend it if you still want it.

Bartosz

