Return-Path: <linux-gpio+bounces-26967-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 417ADBCC6FE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 11:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE1CA355154
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 09:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877DD2ED165;
	Fri, 10 Oct 2025 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P5QB2VXa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C5820A5EA
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760089882; cv=none; b=Bt2ray2hjCD5rm2j8aZlMWjls7KdELvzb4KKWWEGmyQKaFtSsGhpDFAC1thZXQv02zH0wGIq/xt3B6g9DoIvQmZcW7wxC/1A9rH00w6fvJL9aQqLE0Kir9u637TzrwIOauLzFc/CRKs80FfD0jjuJMptS3egkJYGTE/h3/ViJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760089882; c=relaxed/simple;
	bh=OmgslN6j215XFNiy0z2/LnV6M7r7p6MLhJ/p4mhhJZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imgYb4Y9G+1xqLzdpqbKo9dWuK7YlbCy8Xy5tYzud+Np+uoBJ4iWCwxaf0uyzKbucLCkC791Ywgecim9nscU2ITEG4VFqGh6lLgCtVhhbgm8nT7/y55OGhH11UPFowsAUSKKRk8QFx1B6iI2iDp8HkfoNJvYn1gG9I433s0v+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P5QB2VXa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-578ecc56235so1629156e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 02:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760089878; x=1760694678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmgslN6j215XFNiy0z2/LnV6M7r7p6MLhJ/p4mhhJZ0=;
        b=P5QB2VXa1uW30ckHKRzO81eF52HCbUy5CF6jc3NP5xV35rEDOhBYEBGAZCGJ5Z63t7
         74tcu5AW1e0Uq/pTUOcMP82q1PzDJn6saQtwKB7gEU2ReTApvy6xfkiJYUErLwIcpdFA
         4kUFgKvnuc7fS2f8qOyPU+E+vkQu7U3THWgPtPurEOhof3Z37hoFhrx5cYSzoczpJtBW
         yqhvRpAJs2eHUtfB+lliC6wLew+pQc5mFMbBsJZoShon6kupA8wIUZ045EP9ejDfeQia
         XdNcxnN3t64FklJYypa09Ojj/jxVkRIV6YbDVFxm+SRupmV7ickNTI7eo6SXSFjHnlMK
         E1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760089878; x=1760694678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmgslN6j215XFNiy0z2/LnV6M7r7p6MLhJ/p4mhhJZ0=;
        b=AuvUOzTs+RhBy7x7tWL+hV7aWEhw8vUZJMj/YJHtZwJ2TvMz/w93RFCjaQTiSryTsP
         IyPKV6C2bsNW2Bs19hWEmnVT2PU/umhUkPYuunZ37bvZst45vgBZzc0e5tgLGqNTj5IH
         RrQEcZoOmJarAjs7oWHauqtpP6RDvKtsUvTiwQL8LvPPgV/ZmfEGmJjQvTxZQtrvOwJc
         Mrd1xJDRroi1y2ksKWsaNxo7EncUFWOv+j5B84RoJnVrgrD911nvEvvUiswdZpFqwnsK
         OrD7qOOjccVl6KijvwuUmPt/1MlsJbi5ctlpAgr+AviQOAo9P9h0Rhd84TRAls3g1KZ0
         H/KA==
X-Gm-Message-State: AOJu0Yx7OXs9fCOb3cx13mgnhlQUX0ZzBqHU49i580cnS2H4TBUUJ07K
	Sn8QiKqODZe6Um26LNQi7wRNzKjBi1wO+RozPZjN2sCvgkEsNVxniEIAsK0d/4v+P9kJeiXxxYH
	CQahlLxs8Vj9G3+3pKUFZFeV4qJUMBZ/GpHHdjUma/Q==
X-Gm-Gg: ASbGncuEfy7eUxmdhaqMyZ/wW7p1wlZtAQyh77V1YXys7bngmtc3BBs6oRU+mYrXMAT
	0AkhJO9Lyu4s7rBoOaRuRmvbZ1Mj0Xm4j15Sx5zSreOzr4BaOVcM8VyBwr/cN4aKBWi1l2BPTmi
	luYKi5UfB61hy1gKVIk2HSPF75/Laicl3ZTuedowLOy09e2ci15Xo90z18e5U1/5UTd2OBV1IG+
	scTfrEUNcjpIGeMMRnyKQap9+FXKXOBZ42BGk3UiLgljT4tC0vA1V+XHwEY+jhjdwg=
X-Google-Smtp-Source: AGHT+IFO3/0swfa2H+se3Xpr7tKVfl1REWjyI43fxLIAYWM9hS2WlCrGftwL7AS4Clz4XMWnfnTaaFGfvopDQc9Fl3Y=
X-Received: by 2002:a05:6512:b82:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-5906dae5c0emr3434100e87.43.1760089878136; Fri, 10 Oct 2025
 02:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010094951.18927-1-brgl@bgdev.pl>
In-Reply-To: <20251010094951.18927-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Oct 2025 11:51:06 +0200
X-Gm-Features: AS18NWB98qycykRffchMGQL8oj6dBLc5kTHzHSmfyUp2cSZqzDFORcIxrmFxrbI
Message-ID: <CAMRc=MeVbj5oUG3U2JuSSjA6nS6+EkRZmSg2579NuPCjFiws4Q@mail.gmail.com>
Subject: Re: [PATCH] tests: gpiosim: revert minimum kernel version back to v5.17.4
To: Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 11:49=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Commit b4009e2e6715 ("tests: gpiosim: provide
> gpiosim_bank_set_line_valid()") added support for marking simulated GPIO
> lines as valid/invalid using a new attribute of the kernel configfs
> interface of the gpio-sim module. In the process it bumped the minimum
> kernel version required to use it to v6.17 where this feature first
> appeared. The test cases we added later only appear in gpiod-test which
> is the test suite for the core C library. However with the kernel
> version change in libgpiosim other test suites have also seen their
> minimum kernel versions implicitly increase.
>
> Since the libgpiosim library will simply return an error in the event
> that the attribute in question doesn't exist when the new function is
> called, we can revert the required kernel version to what it was before
> and allow just the individual test suites to bump their respective
> minimums separately.
>
> Reported-by: Vincent Fazio <vfazio@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Ah, I forgot the tag but this is for libgpiod.

Bart

