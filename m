Return-Path: <linux-gpio+bounces-18825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D27A896B8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 10:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8423B980D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F811DE8B0;
	Tue, 15 Apr 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJr/fFy9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DED1DAC92
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705828; cv=none; b=S6bZKiRcLhnHrdL3Uq8Mq7l2B/u1KJPsikebGn+r3c1fVTNomqJvVaCrBncyXrHtbs9syxK+HfeRPFz1+1xZjOhD4yqzlDPRvEFf6PryldKt/XufYHNOq3HcQ8Fc0KKPS65wrB4r/LpNe9GREBlQvihUgVh/iDUfq4zyUboZAzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705828; c=relaxed/simple;
	bh=dA/4o6Pc5kzYT69miDJELdy/TW9cYoPGWvldFsoPOqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pN317EXLIwAcD7DITiWBH+1W/DIYWPr2WNaVcb5CoRfIcxtH5QOMiIai0vmRpG/Mo9TvWyPGJb7nTRgqPn6+36QIqUh7ULKy134nF7Q/qVKOpXhbi7e1b/IXsX8/igyPVd/7di6YmYjGLPyBjaoNWPtlSacseJHVnKR7W46Plu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJr/fFy9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54af20849bbso6576322e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705824; x=1745310624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA/4o6Pc5kzYT69miDJELdy/TW9cYoPGWvldFsoPOqA=;
        b=EJr/fFy9xKKf1odUcpDXeXaHHrIC+IzANZrzaXl/skQTpOSSzi1f6GRToQaBLqEmX9
         1c4K3iQNZKXX2ZzpahxyGRv7+sCTu6mmmDvT5sYcHRrDpQF572hqa4Oy7MMF/k1yu/ro
         VSQ/aawAGjWUOWOe9of9NW+EIaUjmf8BzVgGJHYxrDkYCiqEByKaQx9fhAYAvEeCIZ5W
         C62C8xRLIf/KSyoAVNt9DBq9Tynu5HRfiKkgPstyaRBa5Wzx/RlouiReM2U169iYl4L4
         uP5nrLQY4wOjnTm1/c8LvDbZ3w/BwAxBqfDqzkvymFYMc6tCy71FYuyd91KCP6a7GIKF
         v5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705824; x=1745310624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA/4o6Pc5kzYT69miDJELdy/TW9cYoPGWvldFsoPOqA=;
        b=ouS4dGw8KzHECBh2M/q59ok0Vmu0n/GWpXeMOzxCeLSYkEpWk4fvJ4tcfmKK4r8Exr
         OiTdihPaS/T34SJpGT6jc5Dk+1XdJVZMG5C2W2UrGm+OgdbTUDLfbxGts3Q9VxETGQSE
         vAmWoTBj1TO+bHaeuRI3nW6IocykBNnhw+YdkLy1Fq29RwL1M2HB9S++h835Nho4AelU
         LvZnDaXTKzbe8rGSaoKkDU7KgDWkeuXapMuaQFjBBeNtCQ+PndcEdA01CqDwu4fd0Lo5
         Wab9bud3TLgGxIE8XUQ9CyFR/zbMwqGn3zxECVFeDWE47XvNH/1Awaax1uEJOtmJJfU/
         Rcfw==
X-Forwarded-Encrypted: i=1; AJvYcCV4TIgX6cyoG+P4B2OBnGVfAPBOt7mYfK7Z2QX+XwYktyo5rjMnlvQnubNTI8gRhMfMVbUA71U/5l4k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hFeybDmcGd21l3CFnmKiz2/A7sfe3fe0Ol5VBIYpgoPPhm78
	yxYUjZTidkUxmdZrr6tJRV7cxJwxmISi/HIoGKsfBdPPWD8TP1v83MJe2MU+cPGpXnQ0slkJlSJ
	SwuZ6ceNCdVhajhiC/S8+j8GYydZhAMXMsLUwxg==
X-Gm-Gg: ASbGncusGMH2Qe06g4JT+Ps+Cqr2R1cGv6/RxpgfC+5bRGPmSy2XORHxyLea8Y82h6w
	LHbZVrQ9JyvjJVu4U+Om78zDsSnmpMHzvFSQq9mlTWewB8guqQnoh4nhWvoQMzlDCoxpcf7mKyz
	8KN979DIxXnP5cRyFibDJ7Cg==
X-Google-Smtp-Source: AGHT+IFnkHgPenci5JpbiQ78vp1k4USgnq/9BvxSzEHvpE09Vk7uQXHULEOnoM1NzoUs2NLhz2eCy9/1WL61vHKGtdU=
X-Received: by 2002:a2e:b8cc:0:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-310495188efmr46416771fa.0.1744705824468; Tue, 15 Apr 2025
 01:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:30:13 +0200
X-Gm-Features: ATxdqUEjzKkwmn3_RQShaPxJfoWorbzsnHaGfDvqxf3hWT_HovesOIO4Pl6zfjI
Message-ID: <CACRpkdbOACAtCr=DymS4GtauS9PuRqtbjWsmVTDmqGt97kkhSQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing the port-mapped drivers to be
> build with COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

That's really helpful!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

