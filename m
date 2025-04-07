Return-Path: <linux-gpio+bounces-18311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3014DA7D60F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0801188C265
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808B5225791;
	Mon,  7 Apr 2025 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AOXZ+Vof"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC20225403
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010715; cv=none; b=TOTB0fKuy+/VDeHjOkzhQTFMTVDKhyZusof+eqziaKpA+QDFNV1/yvrmltWjqqbsZAtGWJk7WyHfBt2WoM2xITG4O+pNEAe6ejuFtg/HFlNTdkOCRKNlPwgRoPtqBGGNgMwZhYgAaQGHMn/Pnyttk13gjm7ebF6lyOq2aMGW49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010715; c=relaxed/simple;
	bh=ycFdXlFX2Ifhu/veSKJJ+51L35rshG5hTgbgwoD9cIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WJm6v9HaXbTil9j0ifyxNkGB0fkchgyIho2XmgxJ6QoFqOwkiJYekDyl+Qp1oFegwEulpWF5esGUFGUi57GlpF5isR9MxiDCx1OEqbrMQaxucg64CvtWXskLak0bsqbu2FfAUMl9kvtorDKh8KZNCePb1ViCoGlgsglrDNmWmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AOXZ+Vof; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so26749995e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010712; x=1744615512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AY0gaCvzsQoOmdT4FoXtHo5DdK8nDayf2ktX4ZMPAcQ=;
        b=AOXZ+VofCPOkORh4ett93lLhzaEZf2570DRJiUydW0x1myMECfanPXb5mOM2bX4Gvb
         zCIToFpAIujJ5vZNWjPqMyvwQI/3v/4ECYYI9z4lVMF+wn+WqqhSDA208tqzJIBGEyRp
         xHlMMTeCBEnc/UEGq9T5Hc24NpmKzLXhNGlifye+l7AuFoQi2yKu7v5DL9mJ0r26bwrJ
         E7anDvRiVgEgAhXeVNx6KR6BYcKg4zUER7jvoDN2cJx5h95yGUibr4GgPIp9Dr8j5n8t
         4moE3pc4Q0guB8LszyUML3R3aZD/xsaTf+N+zLjf+jY8/1CTUnuDoJDvTbL6d1V60wet
         7ZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010712; x=1744615512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AY0gaCvzsQoOmdT4FoXtHo5DdK8nDayf2ktX4ZMPAcQ=;
        b=Ju/od7ha1WZ08XxNl09qPEdYq0mfgFxj9X/Q3vAA6vD5NqQcjleVaBXIyZ4wvYILXW
         KuXyqsbb/sjHkyVtKXX3GMFDpmjV1eSTOugR0obub7pKDuwkECoiR1u8wD0a2mbHbsbR
         oMIml3eT8S9MK1Cmz2tQjfAF9PwqIvpjS8P4MCoHzEI+VVxpll0NPI4qTGzNau7IvGUL
         3O+qWUyEVocGRbv2AmRTMJhnE3Qe5YyxBTcjqGUODLM1sy07VfxUTETlK2oXNKIskbj3
         pgWoY9/5XwLce21wFYkB1R9rhX2FSVr/Yf0u9f9mqZo93UjKYAtKUVT2YzhQqTwftBRK
         Ml4A==
X-Forwarded-Encrypted: i=1; AJvYcCWLKPrEPlA/aoYjij7kOwtuVrL2HmhHr6Y7+6DdGCCoT9SSNWZKCOdTJe0LZ61w9Ntdsb4G5KUUOQkB@vger.kernel.org
X-Gm-Message-State: AOJu0YwqTZQRT/Jg0B8MjpCTcN7BR4OW9y8pOYicOuoh+7hvZPksOeXa
	WRrTvsx1wUUgpzmAWUAFysa2h9OtuUu8u+6SZwWo3wk00kVBa6ma3ilHPDDFcJA=
X-Gm-Gg: ASbGnctiey6ODlc/kNT/vK7qbl4UIe7+mFhG0AEQkJ2mgPLE2TSDvPh719IZiEt38Sp
	hJPsOGjVk9QwnepaHAGXGzEwHw3OpkQpr1qVdOK40QpwxINksnX9hED9/gBLSE5WIGcPQUjkXPo
	31KMftO17Ab+ny1Isrk0N8nFdg+2E/WlsheG63abeKlXPboZRWnHcAKjtYG/dHUUszlf0GehETw
	TZAxtF8TOwpe7WRDmdQ9L10U8VHz/8Hqn1jPsR1GYNJB1T322bMCKlfvRVzJbml5AN9UfLZmzCF
	H1NyC97jj5eRs74OUhj5k1oAmpSrmyJeFuBkHMStKgLBi3Cp
X-Google-Smtp-Source: AGHT+IGpCsUGS6+nJ21np3wH2QqJBep7GFz9qssmAbFQhdYX/s2jilKHiUnsdYGfH6+7gk+Mc2diaA==
X-Received: by 2002:a05:600c:8719:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-43ecf9c37e5mr85515745e9.23.1744010712064;
        Mon, 07 Apr 2025 00:25:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
Date: Mon, 07 Apr 2025 09:25:06 +0200
Message-Id: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJ982cC/x3MPQqAMAxA4atIZgO19Q+vIg5So2ZQQyNFkN7d4
 vgN772gFJgUhuKFQJGVrzOjKgvw+3xuhLxkgzW2Mc7WuAlffmdBpRtDxINFsXbedNR2zvYEOZV
 AKz//dpxS+gCnaP1MZgAAAA==
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ycFdXlFX2Ifhu/veSKJJ+51L35rshG5hTgbgwoD9cIc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833WXl6CD/CzHFH8MS0o55jkSM+01XZFFLLGu
 m9jD+pgbYGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91gAKCRARpy6gFHHX
 cgWYEAC8TUWM/Nmp6IXHwMPES4Da2ZVr/QhWx4kxVFLdxz7SOli+EvrfpyNl98t9lS1hMUSyabI
 dhv/ZM6Y+uF2IoHkOzfi4WQoQf3IB0Kv013NFj50PDb+h7PlG4LFLyO7Im2RROhAvZGuyj2i3O4
 Fn5hX60FRYxw4UhhnALT00AcaxH1rQCSxn5/VGnRtFpeVCweDRSrNebdnD3lSkYr1xctok0ZUr1
 vEKGuEZkbwKqkQNqB0WBlzWox++2pvbSPJFsKMR2eMHTsWlKm2Nx6/iQhuA/0itoxBcU4aLtsGt
 j4dZmurh5oGV57awGSTuGys69U2ry2X6gKT4Gy48NkhbqryetG+c+e5CH3KkyLfU0hF2xz/ieWr
 YJzZkkTqhOleSJW9d+RBAbQAtnPsPoFHCJXuxoA0kijlnucuJ2NyeGFnz98akkYH1e9/DCnKzk6
 p1uqu20cWJKE0e1o9VbXeQ4+kuQjNrL2lvngcbMhTFaxUgbmYodjjmrnxQAEaTDQwZS6FPTOkWF
 /0dU0TKwSfKtMfmovBWRiAm62+KI7l0lKTYx+rBTM9ki5QLrwEVNYsaEMhGzensTzRPfdyOsgdO
 mr6r/KBCgAq47uGrqOIBIPAK9jjG+3grZ/gDGyqm1OgaMQABwFvqta29pmWkWE15BXj3hYMFikH
 j4+FXZ0xrTgJYtw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of 
converting all GPIO drivers to using the new API. This series converts 
all MIPS board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      MIPS: rb532: gpio: use new line value setter callbacks
      MIPS: bcm63xx: gpio: use new line value setter callbacks
      MIPS: alchemy: gpio: use new line value setter callbacks
      MIPS: txx9: gpio: use new line value setter callbacks

 arch/mips/alchemy/common/gpiolib.c | 6 ++++--
 arch/mips/bcm63xx/gpio.c           | 7 ++++---
 arch/mips/kernel/gpio_txx9.c       | 8 +++++---
 arch/mips/rb532/gpio.c             | 8 +++++---
 arch/mips/txx9/generic/setup.c     | 8 +++++---
 5 files changed, 23 insertions(+), 14 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-gpiochip-set-rv-mips-43c07e67328e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


