Return-Path: <linux-gpio+bounces-4985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C665894F03
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 11:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B076B23001
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 09:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7773359161;
	Tue,  2 Apr 2024 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OHa1spJy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53D5915A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051320; cv=none; b=ShEiA8tpeVTbP+GKsMliilU7Wq7X1HsfM6KjHrSyD5ZKQRmDD8qF6iehenrpb9KGYgcrNNivC+svrXt/Z8ufeI1nXDXkkYZDhvZ6h0gu26zfKBnkOyBebEFQ36k5o5ttn4Hx1OGDA2/1MF2cjqr05f9CHhsODNcpNocfHmZjLQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051320; c=relaxed/simple;
	bh=MfgLsLZHTAI2m35bZRl8ZqcgKZZdKPeTA0idRU0cIRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4ifxT3R9h1aWBalUA4uISc7CJH5xDTuInTaIIf5NzJdaqenb47pVUo5CcXwmpYg8NhHtf/H4mZ7Bearye3QHwFFf1DkmrOMgXSu8iOLvWrF66Oj8KbjqqDGu8+jS/VQwtH8bbqkANiR/qUTBjMrEfB4x4Edn9+/5mKNi/CDzeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OHa1spJy; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d094bc2244so53569341fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 02:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712051316; x=1712656116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlCSs1dvO7phEwEbHxz8y4nuHMbuMtpriFYCSddRRjg=;
        b=OHa1spJyV6ICuFmleOMMx1jSpEealf+t4idiAguuc5IMf3A4HcctK7rbxZqX8Vx819
         sGw4V1XCs0MFj1p+oBCwZf5ArW12nyOUWRBPqTbcG1Klp5kPA3IDC4eMcj0Whp6vHpW8
         43/NR3J/J0jSBAgYoLa6pV7hjbuuammM4ezOfdXy9ChprbXYI4gZhQYepMvog5CKpEz6
         sfw+bQ9l0TmBIQmVQFUNvERhXflJbyaP8rkFxx9jQA9uwiH+YOMDC0u8K2M6VbcjdLEm
         ETzT2/WQoQAvNMOccGNgV8ixK3k2xcr2JyWk23phbRwYiwYnqlBaKEBs8ge/0SAfwfd/
         NZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051316; x=1712656116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlCSs1dvO7phEwEbHxz8y4nuHMbuMtpriFYCSddRRjg=;
        b=D9EZoQOEVw68VulQbdiMCX02SdkKgX86lP2mZ2yxjREF74ngA+CYTRFt1H71059cE/
         tQmtWNv4hn1tSh1n4rKumosyLILGbbvZX1p1S4YMRNlW+sSeXwMqzNspJZppr3fINWNR
         ufOVYbhqEr8vMeTnFYjIUywxv5wbB3UAkl/KwJJbSBtxL3REfLKSyH0xuaHGsLmiGamH
         xqfMHZyHnFquDNYHo3IDRb8Agw93rMRSt0KerIVJkLG9Z0RIvgRC1q7hgzen3X0/CnaK
         phgbtLFotwmDloNipIBbwDxL1I4RCTBfm2x65Z9eX0T1dzghKE2StJ3GX2KD3UFXTAsJ
         xp8g==
X-Forwarded-Encrypted: i=1; AJvYcCVAGiWap4ghl2vj+Yf5WiSMnPGvb8RmNF2gxJHvohaRzHEZJaPbaBis5HPeQtOcx3J71EOeTRkZyAbUCinGFziSEfIyC1utaMKxtw==
X-Gm-Message-State: AOJu0YxJ9kYfJF4jMsaLWCZG7qK/KuJ4prLQlxLcehEvQ7qvtg2GIAti
	HlGc4MdfmIdQaVLWsZI9YzHvUUAqkuitVQVlbag3vYjaZomXjRJRud7hjgIvZ/i2Rb5XVhr1PYn
	69jZ/xPh3E9VBECarUe81SLwnECaZOgRmwDi73w==
X-Google-Smtp-Source: AGHT+IH3dQRr3+F3qt/N/bQHIgBkoP/sOmCHm2gldMwm2b6jEsbGiB5d1FsOfsxCog7KbAXbHnI8QE+RZ6NxXoeV24Y=
X-Received: by 2002:a2e:3812:0:b0:2d5:9703:263c with SMTP id
 f18-20020a2e3812000000b002d59703263cmr6564315lja.4.1712051316345; Tue, 02 Apr
 2024 02:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACRpkdZf5-QR0aU+jhqpsCbNbD+57TN6Yq_Naq8JoLSWSsM8kw@mail.gmail.com>
 <20240402093534.212283-1-naresh.kamboju@linaro.org>
In-Reply-To: <20240402093534.212283-1-naresh.kamboju@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 11:48:25 +0200
Message-ID: <CAMRc=MdruyeZtvj_L6ZbwO36o8hxGPyLjMzNVu27rc7o0ZenPQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: cdev: sanitize the label before requesting the interrupt
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linus.walleij@linaro.org, adobriyan@gmail.com, 
	bartosz.golaszewski@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, wahrenst@gmx.net, 
	warthog618@gmail.com, lkft-triage@lists.linaro.org, anders.roxell@linaro.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 11:35=E2=80=AFAM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Results from Linaro=E2=80=99s test farm.
> Regressions on arm64, arm, x86_64, and i386 with libgpiod tests.
>
> libgpiod test regressions noticed on Linux stable-rc 6.8, 6.7 and 6.6
> and Linux next and mainline master v6.9-rc2.
>
> Anders bisected and found this first bad commit,
>   gpio: cdev: sanitize the label before requesting the interrupt
>   commit b34490879baa847d16fc529c8ea6e6d34f004b38 upstream.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> LKFT is running libgpiod test suite version
>   v2.0.1-0-gae275c3 (and also tested v2.1)
>
> libgpiod
>   - _gpiod_edge-event_edge_event_wait_timeout
>   - _gpiod_edge-event_event_copy
>   - _gpiod_edge-event_null_buffer
>   - _gpiod_edge-event_read_both_events
>   - _gpiod_edge-event_read_both_events_blocking
>   - _gpiod_edge-event_read_falling_edge_event
>   - _gpiod_edge-event_read_rising_edge_event
>   - _gpiod_edge-event_read_rising_edge_event_polled
>   - _gpiod_edge-event_reading_more_events_than_the_queue_contains_doesnt_=
block
>   - _gpiod_edge-event_seqno
>   - _gpiod_line-info_edge_detection_settings
>
> Test log:
> -------
> ok 16 /gpiod/edge-event/edge_event_buffer_max_capacity
> **
> gpiod-test:ERROR:tests-edge-event.c:52:_gpiod_test_func_edge_event_wait_t=
imeout: '_request' should not be NULL
> # gpiod-test:ERROR:tests-edge-event.c:52:_gpiod_test_func_edge_event_wait=
_timeout: '_request' should not be NULL
> not ok 17 /gpiod/edge-event/edge_event_wait_timeout
> ok 18 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_det=
ection
> **
> gpiod-test:ERROR:tests-edge-event.c:125:_gpiod_test_func_read_both_events=
: '_request' should not be NULL
> # gpiod-test:ERROR:tests-edge-event.c:125:_gpiod_test_func_read_both_even=
ts: '_request' should not be NULL
> not ok 19 /gpiod/edge-event/read_both_events
>
> Steps to reproduce:
> -----
> https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2eUlyN8H=
N4R1u0RyLwN6hx7IV0I/reproducer
>
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-202404=
02/testrun/23265184/suite/libgpiod/tests/
>  - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.9-rc=
2/testrun/23244617/suite/libgpiod/tests/
>  - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2eUly=
N8HN4R1u0RyLwN6hx7IV0I
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.8.y/build/v=
6.8.2-400-gbffeaccf18b5/testrun/23252337/suite/libgpiod/tests/
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.7.y/build/v=
6.7.11-433-gb15156435f06/testrun/23252698/suite/libgpiod/tests/
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v=
6.6.23-397-g75a2533b74d0/testrun/23254910/suite/libgpiod/tests/
>
> --
> Linaro LKFT
> https://lkft.linaro.org

Hi!

Yes, I confirm the issue, I will have a fix ready soon.

Thanks!
Bart

