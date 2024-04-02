Return-Path: <linux-gpio+bounces-4984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F28894ED0
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 11:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 949C31F22E27
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Apr 2024 09:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431AF59160;
	Tue,  2 Apr 2024 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/RGbcsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D558ABB
	for <linux-gpio@vger.kernel.org>; Tue,  2 Apr 2024 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712050546; cv=none; b=TVKLkCzMGzSorAuW5DLIwoIekWTUZGuQueV4IL2Vvdfxg5lheGLKU0Wqn1TfQDXokHWrilw2dP9ZV3vuro7dRXl39qshNtzfANO6ps56D6jbhysMsQaeXF9kL+cBWqBn1mRTzywTRzSbwe25XZLe+VUTQwIC5/RiwUSogmbhi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712050546; c=relaxed/simple;
	bh=dO7oowceia5z6uD/euKMmYBfbNPXV2/gty88RnnYLZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvCCHUMA9FfaEKp1tri9/h13Cu+rqINQJCs68hKP2AznOcLWySMSIQySZ8B5rC3J7Gx/gBeagYtjKm6PrSnYuM3muiONuhttqRu1S3rCKG4bclJequB5RMpoHS4qPWn1j4akviW6H+H3L1kDYdw6qyx6JZ6HY+ROHzowFvNEQZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/RGbcsL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6b6f86975so3248966b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Apr 2024 02:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712050544; x=1712655344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0/xMG/vZR/3A0eW39V5o6jJuzfrUuTNZVL7doHpsBQ=;
        b=u/RGbcsLosf6/yapuzs5ej+JmyKGsLX7K/IHK4KCnf3HuzlWTd+EDuK7Z3ZN52jCuZ
         C+XZvEoy6zRIEa9ZKwwCgyjLi7csgDmtwMXv8plJpmJXV0MLbiQp3heAd0oigI23dXfI
         TvO0BnhlTpvtcXaGqBtejuy+rgoByKLKzNE7vB1dO1qA7FEF7+ujP0mKJWivT6691u5n
         NvBePC4qyiDXogU9Q5euQ8ULoVv4iXtZFmMMKTQfUReJDDk+pGfuKp788FSNozJN1YFE
         oFj7Qogfk6lmcxBIMuIKIivk8bw0epfXA4zqvwFF5zWYBMYRI5UoAGOGy3tXj6sqgv+K
         ChAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712050544; x=1712655344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0/xMG/vZR/3A0eW39V5o6jJuzfrUuTNZVL7doHpsBQ=;
        b=StoO0pfzGVd1ojmS0104qvo9cTzBNKhHhwGH4JHBHpWlGY6UtIsmyZGtrQgkTZjF7Q
         +O1e+RNSnxw/MPBuH6NJXdwQp/7QsDeEBeTSqClhNJsbVfUWNptwxheXADCkIJScTEW2
         n767KMQUg6/IYWCJ7KgLsJHNdCAaxR7/IepTDbg2ov00TmZRuq/eBsZMZhq/oyedbvC9
         K+qk3oEK00usEEpf+r+vIXURVyfBqnT5vR2ht2Q//Pl5B+t5r2isolH2T1LXAApRyNLy
         8r5cjp7MG0DEk87kXa6zm30vxww0s+asQxixf0N/CR3WL0hNKuxGLBhpMPsr6fnRAYzX
         jcNg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Dgcn32gwFjRAp9ddcPw8GO63LLCnSYDdtnvZcBG6H5IwrhgQGYRrhVyhMjHZ79yh93cQ4ZHQ080xkMjjL9stvf4vRQkxdkKr7g==
X-Gm-Message-State: AOJu0YxUVgFpM3vD8QVI3WnJQuQiOG+XSqyL8xbsyjGzJpw5x9TO4GSO
	wy15cfSMWxP/fn9HV4BOGdJt+KWOVLCcBOx8DI3eAgqfCz5CmBqhBdamUzUfL2A=
X-Google-Smtp-Source: AGHT+IGgct7/DUBiFX54SFcRd/msb4Prp84SUeQ3a4S0US+XydZct/QJBwDiHWNudvqF9uSLqugHMw==
X-Received: by 2002:a05:6a00:1703:b0:6ea:d17f:ae9e with SMTP id h3-20020a056a00170300b006ead17fae9emr15924261pfc.4.1712050543742;
        Tue, 02 Apr 2024 02:35:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00c:2308:970:8782:f539:c9c7])
        by smtp.gmail.com with ESMTPSA id h25-20020a62b419000000b006e5597994c8sm9389303pfn.5.2024.04.02.02.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:35:43 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: linus.walleij@linaro.org
Cc: adobriyan@gmail.com,
	bartosz.golaszewski@linaro.org,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	wahrenst@gmx.net,
	warthog618@gmail.com,
	lkft-triage@lists.linaro.org,
	anders.roxell@linaro.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v3] gpio: cdev: sanitize the label before requesting the interrupt
Date: Tue,  2 Apr 2024 15:05:34 +0530
Message-Id: <20240402093534.212283-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CACRpkdZf5-QR0aU+jhqpsCbNbD+57TN6Yq_Naq8JoLSWSsM8kw@mail.gmail.com>
References: <CACRpkdZf5-QR0aU+jhqpsCbNbD+57TN6Yq_Naq8JoLSWSsM8kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

Results from Linaro’s test farm.
Regressions on arm64, arm, x86_64, and i386 with libgpiod tests.

libgpiod test regressions noticed on Linux stable-rc 6.8, 6.7 and 6.6
and Linux next and mainline master v6.9-rc2.

Anders bisected and found this first bad commit,
  gpio: cdev: sanitize the label before requesting the interrupt
  commit b34490879baa847d16fc529c8ea6e6d34f004b38 upstream.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

LKFT is running libgpiod test suite version
  v2.0.1-0-gae275c3 (and also tested v2.1)

libgpiod
  - _gpiod_edge-event_edge_event_wait_timeout
  - _gpiod_edge-event_event_copy
  - _gpiod_edge-event_null_buffer
  - _gpiod_edge-event_read_both_events
  - _gpiod_edge-event_read_both_events_blocking
  - _gpiod_edge-event_read_falling_edge_event
  - _gpiod_edge-event_read_rising_edge_event
  - _gpiod_edge-event_read_rising_edge_event_polled
  - _gpiod_edge-event_reading_more_events_than_the_queue_contains_doesnt_block
  - _gpiod_edge-event_seqno
  - _gpiod_line-info_edge_detection_settings

Test log:
-------
ok 16 /gpiod/edge-event/edge_event_buffer_max_capacity
**
gpiod-test:ERROR:tests-edge-event.c:52:_gpiod_test_func_edge_event_wait_timeout: '_request' should not be NULL
# gpiod-test:ERROR:tests-edge-event.c:52:_gpiod_test_func_edge_event_wait_timeout: '_request' should not be NULL
not ok 17 /gpiod/edge-event/edge_event_wait_timeout
ok 18 /gpiod/edge-event/cannot_request_lines_in_output_mode_with_edge_detection
**
gpiod-test:ERROR:tests-edge-event.c:125:_gpiod_test_func_read_both_events: '_request' should not be NULL
# gpiod-test:ERROR:tests-edge-event.c:125:_gpiod_test_func_read_both_events: '_request' should not be NULL
not ok 19 /gpiod/edge-event/read_both_events

Steps to reproduce:
-----
https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2eUlyN8HN4R1u0RyLwN6hx7IV0I/reproducer

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23265184/suite/libgpiod/tests/
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.9-rc2/testrun/23244617/suite/libgpiod/tests/
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2eUlyN8HN4R1u0RyLwN6hx7IV0I
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.8.y/build/v6.8.2-400-gbffeaccf18b5/testrun/23252337/suite/libgpiod/tests/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.7.y/build/v6.7.11-433-gb15156435f06/testrun/23252698/suite/libgpiod/tests/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.6.y/build/v6.6.23-397-g75a2533b74d0/testrun/23254910/suite/libgpiod/tests/

--
Linaro LKFT
https://lkft.linaro.org

