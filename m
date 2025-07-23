Return-Path: <linux-gpio+bounces-23667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA34B0ECF2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E57181AA4160
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F99279DC2;
	Wed, 23 Jul 2025 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DkhLQUxT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CE279DA3
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753258616; cv=none; b=rbcDTPROfTVVbJhIb/UZOse6dEcLDoS2g/rr+knDmIVk7QUZIC+RNtdeErOQnaLm6sAYGK1zulOVWSRpETSqDrEuyWMbeJHnAIzHj1jTd18++26ggdjw4I9E1ECYWpC1l+4QpXRG3NLcPdWdw9FcWwC4HvBFShYqIE0NcdfAJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753258616; c=relaxed/simple;
	bh=LZEzwrsCsXYphxy7F77VLyn/1nAM5XQUKbsJurYf5qw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u91tvHw9dLPuvTfG/P2eCu7HFKSXUjMapP+OETjFm0DKhrAO//r2lVzck4F233k1HFvbLMFjWERowC4Jf2OK4G70Se5b/+CQplm3nkJeoowqpfLUqmeND1swtOrtoHjWn+QCiWNQ5hU41J9DS3fEDqQ8MRIPzoqkMZb+OM4yCIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DkhLQUxT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a54700a463so356566f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753258611; x=1753863411; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PzN7s1ENBeMTgzCjTarNqfmmYiL720eW5sco6wsboHs=;
        b=DkhLQUxTsbGOBKWkFKbYqO/9r2J+kDYFGE/BtdRaLQ/PWDvAUs/wQRzSZL5p1zQPq7
         B9ERqYxxEd8eCZw3wGzsLJK6CbzMn4hLmh2paqsqdwTyD7JihgG1DpHP2TQD1AG9zkkd
         kv0R1zR2uZtXhsqyAcMMxakRimdiOnjsfXPIP8kdT0v/xsjeVo9jbJwr6KTKUhNpIV/v
         zLXvh9Jve3o8wDMTf1BvHDXsYMarR8aZfXC4VGIRr7Ioop6LMBQb0LufUzQQifVUDrJK
         5UUifA2o2K55ZjwJ1/rqOxFIReh15/Ze+Yssk1DBHeQ7E/+HjKbKmsMsCSlrihkviKj+
         xMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753258611; x=1753863411;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzN7s1ENBeMTgzCjTarNqfmmYiL720eW5sco6wsboHs=;
        b=T0KuQTh6OkJmnrFFN0LBB0XvfuQoRWwdnZ8Lw2J1q/CVj+yeGwQyC7pPmngZfISowq
         8Oy8CszSbIsgZ7gTAljfgs2mzklo7E0+wB8oRi1psndOJio33RwTtmeRSPvvJn13HcFK
         kWKIcRcCoxjdmb24Drm6yrgRTFyJ6Z/POPwAFwXKseAKOZzUQUHsQhLh/3cDj6su0RJH
         qQhbP2a19JCfaf/lBMrF8+Q0kQn+Q/96KyWn9O+1HNHq5QoHcb6g+v3QMG6siq5z7TV8
         jwZK8wzYql0kv97RK8mvqnr2e/i/ExIJn3xLuITxJ3ROdQ5evnDCwfbOIOONXs33aUF9
         Aj3Q==
X-Gm-Message-State: AOJu0YwiW3mokNEp+D/G+ZOigg9uHRY3Bn3eNsQU/fvRBgEq1D/zE7eu
	FdSYNK08rO4MM3wTA6dyAChnf+DLk6r71Bnx6VBa0T0pD+XKMdt/g7+id1Z/4wYkxKo=
X-Gm-Gg: ASbGncsEmVjMNZN5SFcRzjOwTU2yDlqxGPAJbm8wXf/NTQN/cWS/dWp6MTCs8hgnhZJ
	eBWDCtblOjj+AuQsjTewV7HA2vyVWrv692VfhK4vADrWSPUD3A5yJS3TnGfSXHuNy3EdJPSI4az
	U746sodKXXQKT3F0HlGI6iqBPIf/ib6CGF7/g48HjXj9ALKD2CqG0BG3ZNj4CXFNMR0jfm1oZnZ
	psJ17jbOEAH5RKoRgYQa/MDFaPE6IF4ncNGFEjxZ0oPOs8ANhW60mMNgvQiRTOoXX6Xnk6+PXps
	C03CJJtOk5GOLfxEmRZX0b+F6UGaYs1zHRJdvbygwgYSdLuFCt6Mvtb4YTT+eriqMdm7lmQunCv
	z0GhQb1dkSmK+w7w=
X-Google-Smtp-Source: AGHT+IEG7WjFyjMlMTns2925xhKaLzKZAYwAnqpljrYFJC78Rgv4SWTDh27aoAc9VyRF5CBspy2Log==
X-Received: by 2002:a05:6000:24ca:b0:3b5:f6f9:e803 with SMTP id ffacd0b85a97d-3b7634e4db9mr5371232f8f.14.1753258611143;
        Wed, 23 Jul 2025 01:16:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34cd:b1d:d4f9:be03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586919708asm15096495e9.13.2025.07.23.01.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 01:16:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/2] bindings: rust: update examples
Date: Wed, 23 Jul 2025 10:16:46 +0200
Message-Id: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6agGgC/x3MwQqDMAyA4VeRnBdoA+rmq8gOnaYaUFsSHYL47
 is7fof/v8BYhQ266gLlr5ikrcA/KhjmsE2MMhYDOapdS4R62I58hjUvbChrTrobUuPZvZ7RU2y
 gtFk5yvn/9rDIZ8qSRnjf9w/cL/EgcQAAAA==
X-Change-ID: 20250722-rust-examples-imports-261e098f12f6
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LZEzwrsCsXYphxy7F77VLyn/1nAM5XQUKbsJurYf5qw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogJpxOTCU1w/Yqx09o19Z5usNPlUlnJvYuTndC
 tMb1Mg+BgqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaICacQAKCRARpy6gFHHX
 chcLD/0ddcIPvYGrPfGORbajHOtyG2kYRQl2icdYly9QAkgbi/4YC8qZzLNyUjdZNcFMO72HX4O
 qs6VWz+oWi848llTzeVIArK662BYGZujEQQxfiGeTGaPkZju8FrmvbDPhzVfOqBLSHZUD5YyFLw
 iNjCi1AHo9uMKcF9udIeXM2eCetqzDPQJING3U0Y58ZKborkRLCBlJ29DCGPGnzPUCvHbv02wQk
 6dRqjNuYQXEQDqd9EZMCtg5iAxlMvpYhO2QwIJBonsYfuvMxHM/C6SPGwyu2EGxQah0edk+wAO/
 aKHGLH/2wRHXf/hm7uFA6mWGgFBTd1oxshCuZFFgmfTadAsBJwETlKqR0mnrWTLKmyNdFaffCWW
 13J4FUnxTZTXGnJ56CI8+UYNHQhiUVtnqgksASoIXEfdkkhuIq1EClUddjplqxlX91CPvc6+PpI
 ZyGZ79okdvGJS1y8dU2x9OfgTtLDkCGb+2blvJHLpYNMH/OI07LRQejHp627BdvddCxO7d5sFwM
 prX7ViM65h7OfIuvMimc7utAiOaWpoBwtghZDQ3Vb1Djp+M1iJ6HF2p3MVUD0zpaqC2XnT8DxXQ
 o2d7bsqfoQSwN968Uhm7VRxOxc2xDsTlpxZrnxjKl0vjn7kaZSILQp6O1QD4vQhvwH0H9ENSSeV
 tX8ERv2nlUBshXQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here are two small updates to rust examples. Fix automatic formatting
with rustfmt and unify the way examples import modules.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      bindings: rust: fix formatting in examples
      bindings: rust: unify imports in examples

 .../libgpiod/examples/buffered_event_lifetimes.rs  | 23 ++++++++++++--------
 .../rust/libgpiod/examples/find_line_by_name.rs    | 13 +++++------
 bindings/rust/libgpiod/examples/get_chip_info.rs   |  4 ++--
 bindings/rust/libgpiod/examples/get_line_info.rs   | 10 ++++-----
 bindings/rust/libgpiod/examples/get_line_value.rs  | 19 ++++++++++------
 .../libgpiod/examples/get_multiple_line_values.rs  | 17 +++++++++------
 .../examples/reconfigure_input_to_output.rs        | 25 +++++++++++++---------
 .../rust/libgpiod/examples/toggle_line_value.rs    |  7 ++++--
 .../examples/toggle_multiple_line_values.rs        |  7 ++++--
 bindings/rust/libgpiod/examples/watch_line_info.rs |  6 +++---
 .../rust/libgpiod/examples/watch_line_rising.rs    |  4 ++--
 .../rust/libgpiod/examples/watch_line_value.rs     |  4 ++--
 .../examples/watch_multiple_line_values.rs         |  4 ++--
 13 files changed, 82 insertions(+), 61 deletions(-)
---
base-commit: 74ca5ca5b71d281801a3353a3d7f0ff04a171c8a
change-id: 20250722-rust-examples-imports-261e098f12f6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


