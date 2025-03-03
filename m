Return-Path: <linux-gpio+bounces-16910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E2A4BCE4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 11:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7503A3B93
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 10:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F611F1524;
	Mon,  3 Mar 2025 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3BeQndjN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1CE1D86DC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999142; cv=none; b=KtWZK5MMb8WX30ArgWkz4q3ewrFi6C2RRBxLinVaPzfivGgrC3/EHAd/eTlrG943UWzXZuEgsfYITN9e7FwdeEv1i61soqog9Ttoy1lHeTe8fB7z4c0y1ATtws/ZMUhO7XK4JVi8kTp8LJdLUKC7S7Nw/xxOwlAFzJc9KeFMOj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999142; c=relaxed/simple;
	bh=jiHdE51xfDe7UWHKDk7UeUSBh/D7H7YwrHUywcZ5yvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5Q/S8Yyv577k8wcpUl8FVSs1ygxYe9YUyGGssJZsdzqfTgXtobuj4jPftzAkDU6K4/3u8EuqbnbRcB5FUm4TNslDcAc518Bf2alACcRnieXE7FlVjJJY+JBpIrJsKxTV/FbmYsjYZb9Gwf9pEjOsj4bpItnuX4ITN32GWyNvWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3BeQndjN; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3061513d353so44352891fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 02:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740999139; x=1741603939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiHdE51xfDe7UWHKDk7UeUSBh/D7H7YwrHUywcZ5yvQ=;
        b=3BeQndjN95Jh+A37g9kvmDPRt9+WvvvsF8cDPIMAG1EC/9WsOD8nfC0bgeKYQmfp5s
         oAI57o6UlWM28J4wVyPs93TmILFbBMs4arPdGsL84bwqF6OTmzxtdeADbI7d8fb8Vm5G
         x3IwPyDaLfeTLGr8lhqVWw9XhpallVg84txf5cTrcLlp/DhTOYsHdnXlH8T6+6D6jAPp
         VUWeHcP0quKcpU55IG1WkaYGySicWVS/3+4Z5rAmD34evYusaKhWchLfg4lIOj8wzky7
         rNn4yJe8hvLQx5OS3wiaDuKUfNsE/LTKGTPIFBnhz6KNtZ+XUZ5C3opNB0brO4EcLcPy
         VSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740999139; x=1741603939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiHdE51xfDe7UWHKDk7UeUSBh/D7H7YwrHUywcZ5yvQ=;
        b=sssowQDXabWIK1jVhXyoKWdAd58KeVYn/uB4grP34A2d93AsTJmXrh09QSa+nlRr8g
         W9Ubq27hEbIC0JhU5IPpq0Y6OkYShBIsXtz7zC+81H1HIHIuSRHiiX2QZFgH49rGawZp
         Db9igVKtw2x0+nmQB6LpAY3LuJnaldeoCqK3Lv1fefD710hS5OyMU5f7jE2Nafh93gcR
         PDwpfI7LdNu8GP5jCYTkoeWi/oOYy4Fdhz3N2YiaAUhBDw2wVVGzZfTNyjhjOIhcKaQ8
         a8imcnmZiWRbbDt/Ve2X5j8Fz/Qf2Wz3KB8VuFSfA/mRteryVSpSP2pmvxLq/R3CsVv1
         d9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUBQDK+qV2Honh527iCkyCAH59dlmW6wMcLjTfKc8VIougaPFVX/WRNqyvCPNs1zMVXXQH0CEky0AeH@vger.kernel.org
X-Gm-Message-State: AOJu0Yymb34a3PcZyNOG95GZBPmiukqfiQ0iZz+eQKNiNuYNJBKXeSaC
	Db5JIlMz8h3p7kQRfuzgjrEMHDtqsCvsfcYbMPk3mR18CSJ1OR1v20pnJIn2WKJ+2mNK1fs7eXC
	CP6LMpkoSOSbt8kMeT9lzNjzCSfWps/M3O4Si4Q==
X-Gm-Gg: ASbGncv6wF3TuNQfu7mC4h3J0Cd17YFVzPyvBOhBySY0gqVpRMvoph6kRILB90gHaqD
	YeEVF5tN0ftT4My2MTJV4kXWEmXJ7hmvMH/H1MXDXSRb6XXUaCCmHXOKrz2gMk+2tsZkKRDG/Uj
	RCux9spUQUMlKVb4VFwXms8Zq86ThidBH7Qx0bmMED208oWX30gh2L0YXrwg==
X-Google-Smtp-Source: AGHT+IF8fkfV29Z/HA928OoGgTZHXhKuyAxLwcUqLae5A9q1bV5bQjlkE0VaGo4fkbUTL9tFTMn51z6IlDksQu53oso=
X-Received: by 2002:a05:651c:b06:b0:309:231c:c676 with SMTP id
 38308e7fff4ca-30b93259b13mr54096241fa.17.1740999138576; Mon, 03 Mar 2025
 02:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220162238.2738038-1-andriy.shevchenko@linux.intel.com> <Z8WJNPrD6033anWw@smile.fi.intel.com>
In-Reply-To: <Z8WJNPrD6033anWw@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Mar 2025 11:52:07 +0100
X-Gm-Features: AQ5f1JoQMnxj-WCNLM1m-bQQM8090ZXf675BYUgTuNzV5rfdvFkUP1ykES3KC3Q
Message-ID: <CAMRc=McQMvbLc0OGa7JU_F7Y6Qw6-pUGK9EC25jfVAZNcTkzfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: finish conversion to devm_*_action*() APIs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Raag Jadav <raag.jadav@intel.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 11:49=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 20, 2025 at 06:20:25PM +0200, Andy Shevchenko wrote:
> > GPIOLIB has some open coded stuff that can be folded to the devm_*_acti=
on*()
> > calls. This mini-series is for that. The necessary prerequisites are he=
re
> > as well, namely:
> > 1) moving the respective APIs to the devres.h;
> > 2) adding a simple helper that GPIOLIB will rely on;
> > 3) finishing the GPIOLIB conversion to the device managed action APIs.
> >
> > The series is based on another series that's available via immutable ta=
g
> > devres-iio-input-pinctrl-v6.15 [1]. The idea is to route this via GPIOL=
IB
> > tree (or Intel GPIO for the starter) with an immutable tag for the devi=
ce
> > core and others if needed. Please, review and acknowledge.
>
> Bart, I know it's still 2 days left till the two-week ping time, but sinc=
e we
> are at rc-5 and this may affect other subsystems I gently ask for your
> Ack/Review and I push it to my branch for GPIO (as it has dependencies wh=
ich
> are already in my and a few other trees).
>

I thought this needs an Ack from Greg or Rafael?

Bart

