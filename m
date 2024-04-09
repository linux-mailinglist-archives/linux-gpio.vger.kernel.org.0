Return-Path: <linux-gpio+bounces-5220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF589D5A1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 11:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65632282FE7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 09:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B017FBBB;
	Tue,  9 Apr 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QUnL+QeB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A557B3E5
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655224; cv=none; b=IAB9YBOemLAPD364XGsPVa0/3S5zBxr4153hGXDNFsGGfz8jiEgTXOjcAlHRHpDPObdj46cKhE6OW7LJFHQgX/Hq0q2PNhXRV6wdi+Gs6a7hViHB+r/z6C6excPk1cGt3mb9Q6jy0MIdXgHo1/6inRa0qcDZlmlhQv2g5Epq2ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655224; c=relaxed/simple;
	bh=aF1W+dnK3e7T4qqEsmP6AQG/PPuzcLs/E4HbrrVMJws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pXJlXYm/W4Yi01F8Lc9DQoizpUvcXlKtKopFEbWCXV1LdvTdeMeE7kNr+I3AQ7gZFDYJLlWZ0VdbpZGtdY41Nvu28ExEJwvraRoyVSCdTH5Y4DkU2/vbOCic5n0+7w+ot2TGX3Y4eJfaLoptCeSK1VY+qKk1DgZgq8FxR7qqCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QUnL+QeB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4169e385760so5150815e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712655220; x=1713260020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FnwvivTY+S1QjGwQUgLy/e9z5XmppsFwxzzQcMNqTDs=;
        b=QUnL+QeBn83e/HxS0giyxHgKFv+zfrbE8NKpO1pthx68BpA7Tof8cR9Alu736kKdd+
         7A8e3bR6UF6ClS94F4MWo70Fn9/5MAbP+ABFZagx/FL4frI6ytNlGVqdtWp9fxV6tDDW
         ddTVzeVmKsXrSlCZ0vLTe4DaTuU6akJuK8lo/KYVQcHDa9a9yyghnyAW1fvVsZwa5L54
         DGA22WMut9r/HywSCT5spMV/uraQdppcZs3QIy47OcfoqNlLj9foI+Z6dlgph2lfh3Ai
         RNnpYzrOMX8xkbtGZcauMBtJP/bz7TirEIMbZvHG7wrTvyOEcv+8JWzjh9xhPoNmRiGq
         D/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655220; x=1713260020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnwvivTY+S1QjGwQUgLy/e9z5XmppsFwxzzQcMNqTDs=;
        b=WuimiB+lohYKVgTkpHv85U+1AhmK6mGW7QbLNy5LetM6e8s+8tfsoOu7iywm1oNcck
         PByu+bVKBFbWPh+M7nHHjRXShKHUTtLTcujGLIVTV41rz+h/HTfleHWf4B9CpM3hOze4
         P9Wv2psI0Woqc133nQy1lZCwGxbgP5rZPqwUQVavDbbofDjh+8H2Cra7kVuM0sfpqZEp
         gkPptjFW3ht8QTpHDBuFShu1trRSr5XFfQoDMjojKNooZWNGpubTtimgijVTEv9EKehy
         A5/w7ZOTNC9IxMrmDg0D38NqACresJ0TdJYSzkz7x40AtiDvtDw0h3XhTL5Ynvb4OLu2
         uH/w==
X-Gm-Message-State: AOJu0YzDOgK9UTSQfZBkiYnNc6ttnDm7nzo1UVl8udt14zdPbVgMq5KQ
	YcfJ6Q26UpiFkDwS5X9Gi5QU4oUNS8I7PnAOlS3YIO5jJial1BHm1IsBPcSGLRqOLgUkYVdGIwK
	F
X-Google-Smtp-Source: AGHT+IFmqAqr0lBrxC1hZD55i/BJcybkhC4NAAVjoFBZ5LuSrJCoC35e/O5Bp13NStOVGE4hEaQLXg==
X-Received: by 2002:a05:600c:4ece:b0:416:3365:b9c7 with SMTP id g14-20020a05600c4ece00b004163365b9c7mr7070349wmq.13.1712655220340;
        Tue, 09 Apr 2024 02:33:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:bec9:44d9:5791:fb97])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b004162d0676cdsm16463072wmb.29.2024.04.09.02.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 02:33:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Gunnar=20Th=C3=B6rnqvist?= <gunnar@igl.se>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 0/2] gpio-tools: allow specifying longer time periods
Date: Tue,  9 Apr 2024 11:33:31 +0200
Message-Id: <20240409093333.138408-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Kent!

Gunnar Thörnqvist reported that he no longer can use a command like:

    $ gpioset -t 0 -p 3600s -c gpiochip0 17=0
    gpioset: invalid period: 3600s

Due to the above error. I realized we only allow ~35 minutes as we store
milliseconds in 32-bit signed integers. Here's a proposal to allow longer
time periods by using 64-bit variables.

Bartosz Golaszewski (2):
  build: fix configure error messages on missing functions
  tools: allow longer time periods

 configure.ac         |  8 +++++---
 tools/gpioget.c      |  4 ++--
 tools/gpiomon.c      | 19 ++++++++++++++-----
 tools/gpioset.c      | 16 ++++++++--------
 tools/tools-common.c | 22 ++++++++++++++++------
 tools/tools-common.h |  5 +++--
 6 files changed, 48 insertions(+), 26 deletions(-)

-- 
2.40.1


