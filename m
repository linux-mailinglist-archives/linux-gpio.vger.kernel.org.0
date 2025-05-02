Return-Path: <linux-gpio+bounces-19534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C789AA6D6A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 11:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771B33BFD0D
	for <lists+linux-gpio@lfdr.de>; Fri,  2 May 2025 09:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0B5244687;
	Fri,  2 May 2025 08:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FSFQali2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD2243964
	for <linux-gpio@vger.kernel.org>; Fri,  2 May 2025 08:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176395; cv=none; b=uGwVAJSTKyDFQ9Ndj8gF/8x8XgulbEASIn0UzD3v+crLled06Bvjo80OHYV7zMIrXTOL8+KCS5yGsi8gm7aCX6lJklEFRwA36/P0a/S/iW7XxF2esmbT0TNsdhzmAhL4pR2wNjtgSHUnv15oPgFHh7J4+60u1cx/dMM58eBo2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176395; c=relaxed/simple;
	bh=5mkPquEYhHhuaHDlP2FWJwcbCha2j8346u44CjTk/b8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CfkLGQudtAWr7c2CSSAhHoimg9AE+CaC6F2PSRhdWCBOX5BPs1Nl4AHpI7l4yrLM/+4xe/IW32NJqEzl0c6TjTf3JgFZRzJMeLh7441eakV2VAoJ7mJ9fw7qbjt9rnKhDacqMAKbb60HboYcr9keQjJRsdhDj3vyyhCV28LjivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FSFQali2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1236425f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 May 2025 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176391; x=1746781191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
        b=FSFQali2X9HuW2FDwiWRnoBRNGLYWf7QhdA5eBmedJJGniwpOYrpSMwuHuNJ8Mi+W/
         hMKb314gC8NDzwp1Pql2yfxMnT/EZXGkJbqmamsAV09hJNQe3cp/z1mrBxlz7kptO8Uu
         +7lvYb1n7Yu27XRV6I6KavAHQltgAnNF3jj9TH9MrHtLcu0gReLtjWzqZPPOJuNYRPt1
         j5Ind3h8XKMDChEh0OTWfceu9DNDnVqKdukbr7xrEKC4DoyuBzAgLBcqhvwb+LhIRDdZ
         EDgPmx1EYQ2K9czk+rwS2YZbQkZjghwAcFqDJR2mglyOeB4OphZ+rGgM+WANmIOu78uK
         XdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176391; x=1746781191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rOqsO31HLSQBn8sCWbcbFta882rLl4DDI6mWD+gWFc=;
        b=Vtwl/9v+IKRvgkMwv1H3osFAGW65u/DAdxETwv884UaUDfjmCeEalyUNesZVQfqPsG
         vK2lhdcaQG63T4Igys4SxNRHV5dGMHw05ETHov4Cc+iyjXZszjIufIz0koafvw39kFpU
         NEBLOaD8zZeCPKhwJzB5pe18ICI/Q6zeFM6Owpc0L/JzWmliOdftBKh1H0PZgWmGR0kO
         pv4K201izvIoSrSncO11bRBXjiCCdKIgk6kKGlo1UcG1LygAjPCjnK36n5L5WS4u1px2
         U8q9hu/uzv0enbUbg9/4tXza5a3W9WA16DereTjBhhcVPw1iYw/WVGVksifEOhYSkT86
         /lHg==
X-Forwarded-Encrypted: i=1; AJvYcCVuuens2IM/g2LnxcgIL6/KUrvi8ec3YpZJ6Qhz3mFQ+HXST9SCFh5IJ7YQaSF42rQ4v5rkcKG9at9A@vger.kernel.org
X-Gm-Message-State: AOJu0YzASEfSenRlsCgsM7vUX9LOyAGvf6fQBg1t1PZ5iny9UrJoZcln
	Kr2bvjYqd8TGZq2tU82Szt94G5KfbTCc2IwgyQiWeGWgRPpn2zn2SwLIMfVVLmZWz48SZas9+Th
	24mc=
X-Gm-Gg: ASbGncsQ4nkaPXj2igaE2r8AASYMKZnX1+HliOl6M4IYMRkWCqYAms+ouufnGwWktTz
	83IaVBLFimHKGvtTt/l0Z0yqy4ltnk85zy2j4TuuRZTfcAKdmhVQksg/bGjdxKMQ1mQbB3nSDsG
	XRuXOUzAALbBLuKtJoZ7FUMagM3rB6II7XkyA1QcLbqYI1ZYQRH9eDtEu7SKlxvj+tnw66chhYu
	K+XQj7+MPzNTcx5osacZMJz3WU3BtQL+Ew1i/ecF0Kz7JtG0RvQKimPRUjnQR3TuITJ7D+M/H2N
	kz9qrmoeOHV28v+W5zymR+1i3eqpTwvQzUo=
X-Google-Smtp-Source: AGHT+IGkAmj0QTn7U0/RzbLyZFE3GXCS35eKh83HE+zzPG33Ol9TAe6eJSEee/o7TqoMVcjZZmYXFw==
X-Received: by 2002:a05:6000:2501:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a099af0f94mr1403321f8f.54.1746176390895;
        Fri, 02 May 2025 01:59:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
Date: Fri, 02 May 2025 10:59:46 +0200
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKJFGgC/3WNQQ6CMBBFr0K6dkw7KKIr72FY1DLAJIY2U1I1p
 He34trle8l/f1WRhCmqS7UqocSR/VwAd5Vyk51HAu4LK9R41DU2MAb2buIAkRaQBME/SYIDQ+e
 2xxYRrVVlHYQGfm3lW1d44rh4eW9HyXztr3nQ7d9mMqDhVPfO0N01NJjrg2crfu9lVF3O+QNbQ
 tBBvwAAAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5mkPquEYhHhuaHDlP2FWJwcbCha2j8346u44CjTk/b8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImEk8IL2kl18zA8xLaZV5UpuGvSQ0944hzDl
 +MCaHC/g5qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhAAKCRARpy6gFHHX
 ctyvD/0QuzQl8wwUQP5TkXhU0j7o76hnUPg9igcQd/mlb+GN+T5YJ7enSR4IgmeJkZVbUmRH+BV
 Hve2ufGgwDdIv07zwz2sc4sI2TWM3P3McMJIqlcBt2hfBtRvoJkic85ly65NV0rqScnJkrTQCOa
 Kt9pci1vAm3TX2K9j6b9Y6YUsMXkPpnBxJ7Bgfub+lBlDr128sdvgGUhkdFsd4+AP0EshgJ/R/J
 k/8Ga/IVA6Ze2en6raVViv1FiW+hN/4Ddg5hGdq4yzD3rqBJ93+1Wtg0VKthkwew43D1ucROH6a
 7wKorwf4SPc7ByLaJ3lrYuH1036ZpeJqPm97EEMD0DRHYa6sJxey4YyVx6o5rrgoTtGO8dn/nU8
 VE8hCMvzhdVGXaOpoFQ1312JoE+Z/Cn8/xxa9Vd0bSLIPDh/rlzmRO7PBKAKvoGH2rnC6eJl8rT
 653e8AqEn3aqaDBJJWhR+GHXSw942if2lOPnPyBzfU8MbB3VxBWlrmuzZAvsdtqQ6sKk4I82LS2
 WzBX3jKtN0qxJmwErJz/ZRA692Sf5gSIJh7sqCt0+A0m0XyuwpTEeDRhThbk6462Ct7+ht4syCU
 JN1r4TU0Yqi/FyFaI5d/eg01SodTxDrEsSOZVWKdEIOWomBY5DSmt5wqXgGIki8mmiyRnbGahnt
 Lyx4jfzgnRhTnIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of 
converting all GPIO drivers to using the new API. This series converts 
all powerpc board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- propagate the return value of i2c_smbus_write_byte_data() in
  mcu_gpio_set() (Christophe Leroy)
- Link to v1: https://lore.kernel.org/r/20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org

---
Bartosz Golaszewski (5):
      powerpc: sysdev/gpio: use new line value setter callbacks
      powerpc: 83xx/gpio: use new line value setter callbacks
      powerpc: 44x/gpio: use new line value setter callbacks
      powerpc: 52xx/gpio: use new line value setter callbacks
      powerpc: 8xx/gpio: use new line value setter callbacks

 arch/powerpc/platforms/44x/gpio.c              |  7 ++++---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c      |  6 ++++--
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 13 ++++++++-----
 arch/powerpc/platforms/8xx/cpm1.c              | 12 ++++++++----
 arch/powerpc/sysdev/cpm_common.c               |  6 ++++--
 5 files changed, 28 insertions(+), 16 deletions(-)
---
base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
change-id: 20250326-gpiochip-set-rv-powerpc-1e98d28222aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


