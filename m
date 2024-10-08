Return-Path: <linux-gpio+bounces-11060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F599503F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAFFB282836
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADC5197A65;
	Tue,  8 Oct 2024 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oNR8dIa5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D61D9A43
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394525; cv=none; b=KNoqk5XeSI3R9oCDz5uZ9a3GWHuHgLDaSuf87zOOA/gdniyVMQl5EO5K285tKmqjDiyQQ7KK4BHG/pMiItLuDz/J172u9qMUtimQ2ybrw7CFRtL3SBAp6Ng/jNRuAgZcIAw0W3/Sz0kXpLXEMJwxTUKVDOvDkRbmRAr3zXKWOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394525; c=relaxed/simple;
	bh=P+9DRkHaaKUoFAHccbtc9OexEPTWEjENstmxyrT37d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjvlqE+wylCTz3sHXGkp2VE9Z+xgBhqUJx+ai42LJgcEsIaSB5SZ+yYbGIZ6cs/gUb8HMYivj3QroPgU5YYXd1xMc9oECfFC8VDKOdYqt/17+8Dz907x0wk77YS16fS25wQyIv5UdArO8x3EOzRjZ8DY47YGlNIH/lNZOc6u1Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oNR8dIa5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53991d05416so6913478e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728394522; x=1728999322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owC5evQvyO0K0lqxoc7sb9fA2BeZK+ebwords5pXjEc=;
        b=oNR8dIa5kaEoFQKKEeQaiYm8VL06MQokriKzklx+JnA7DCcWkMtTZxZ6F9gzJivUjs
         tzJzskjzqwO0ULo93pIo1F3WaoCnKyNOjBDBip8bXSLQiOISG5QlHDan9diBjQmxhnjB
         CbcEw3HBZpXJdrR8Np1lG57F3ZFI5YIxV8A+xeTJiBLEnbNEUSr2vcx+4SiUWgVMRQlv
         zJlez/s6ia0sOLZr5yqqsbzRlV2G1TZfCbDqzJt2sZiX/bD2eB9qKpbJsD9pkJDYgO3w
         RTa5seTQmLRc9C8oVeEt6jFEesinQJkU5PsiYxW4j3ZgVgUoISy3znJcKoS13nCdJUkn
         ZkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394522; x=1728999322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owC5evQvyO0K0lqxoc7sb9fA2BeZK+ebwords5pXjEc=;
        b=Fxrb414pkhjCk1D9kkkNK8xN2JJs0+LPWV2rcT5s4hooJyndyJ5Ewnp50Yp915yerd
         KuMQfmRlJpHvCMM1YDduQ9uiISc8lcNZjo9BGxBw8UrNZOYl5S6PspG59m28uwpAh+8O
         dG/uek3eoa9o/iF4cCQpkg/k7zPTMf09UdoQFYEr9odTLZEcGegFtgrMC7UY9TmGtEKk
         FoXsbFPIeKkyon0y0z9cC9PT0jQQKdo0lhm7sKSulSX1WjWg0itnOFlZG8F7Bv9DKPLl
         Qvi678i/spFOP89iQITkfFozTdE94Pkdf7lm7vv948Kh/1FyKh9Fvn2yyxTYH2/7MNpA
         +hNg==
X-Gm-Message-State: AOJu0YzV7jS8rs7QpKpHy+q3CTk3CW2jUOIKsdaNmobsKLUvv5L1uK8s
	bnkYqHZ6HNZIB0rH3QgImcwNzBozm0HQncWRPf6oo3iM+pIeLGzUKmrZSWMhO64PLRq4JVgI2UA
	3J8nVc0474hWdWxovBXR31OeLH8x/MedcDGqHk5C6VzddgZ89
X-Google-Smtp-Source: AGHT+IGCCqPdV1JsoYX2jV0U4G4H9hKam1ojcJmktnaWuFLuzzl/zl/cBGeB45DMHrfdTWX9E8oaL0+SP2K3xJPCkIk=
X-Received: by 2002:a05:6512:110a:b0:535:6951:9e1c with SMTP id
 2adb3069b0e04-539ab8663afmr9928109e87.15.1728394521575; Tue, 08 Oct 2024
 06:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-21-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-21-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:35:10 +0200
Message-ID: <CAMRc=Mcq5jH0kRLJGVw5kc+BtL0TiDpv6mpeFVQjQtcVJ4QYfw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 21/22] bindings: python: tests: use f-strings
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/tests/__init__.py           |  4 +---
>  bindings/python/tests/tests_chip.py         | 10 ++++------
>  bindings/python/tests/tests_chip_info.py    |  2 +-
>  bindings/python/tests/tests_line_request.py |  4 +---
>  bindings/python/tests/tests_module.py       |  4 ++--
>  5 files changed, 9 insertions(+), 15 deletions(-)
>

Looks good.

Bart

