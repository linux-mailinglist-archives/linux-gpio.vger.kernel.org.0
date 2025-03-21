Return-Path: <linux-gpio+bounces-17846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E741A6B981
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486F2188FF37
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0BF221D86;
	Fri, 21 Mar 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lfdENlgl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEF31F12ED
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555139; cv=none; b=Pt18mSL0oWwuQwE9Xxfmp7C2K0fcHZYHHJb7MInbCdc2AG27SYI90embI3DIse0HC315i1I+kBrBGcejbxojn6//icMMJ97xqhHor3/5yFFV4r/VMN+wsGE00SeRXVjQZ0e655Ol1m7rIbwdV5+LtZuKoNpOFoRLFat8ZTAkzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555139; c=relaxed/simple;
	bh=zWDoNvZEfK56PKiG49Tb6fj07vQwFieb7rj4qvoAjh0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OEVzt8Kqmm1++PWVMEZgzAb8PHkGT8q3tb1//OJ7y1xCcDm7Ut+fHt6tFERymtO9O5vBqpUsCmDAUDNqWqo8yQnZqEsrau8srFl4+599pAioY50geEFS+l360X4kZVTdHmRjYc4AvN1Wcmd8ZGHXW/eyrqpHrx0MedwX/nJFasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lfdENlgl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913cf69784so1476906f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 04:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742555135; x=1743159935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1giRpiP8lb49wR/QP8FKJkcmqKOVe4zitAC2x8UJB8=;
        b=lfdENlglD4SP7x0lPzaKzW27gW9YzYHCXpb5WlOKjEj1ynK9jb6Jr+P4xdhnTxKaBl
         6c0xgFsJyFHPgNblStOKWtW41XHLCk+Nt8dD2OhhvvyHHPwBXbfQmSLaJGmd8QVUJmwD
         XTEUiBmZvLNN5NYe0IcK7vEZjzUUdb0BJGzbJaJLHgDQBTFYelQeNr69n0n2HQIDolSO
         gQI/xZQ4uItKFy46I/6FyMDpMjClIlxQwJe1riwdutDLKaVVJVfbmhTnzEMT9KP8b+XR
         L9xmjZN29dYo2WYBhmEarHWH0GK5m/CfAERu5Yiim9V3qGezMF63vmmuoSrSoDcHRoTF
         Yo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555135; x=1743159935;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1giRpiP8lb49wR/QP8FKJkcmqKOVe4zitAC2x8UJB8=;
        b=EKp5kH4oLrqCQFevfHI+ytp4z85y2gB90kLY8Zqxk20RdZ+btkpBu7S0yjNOYuUWdA
         JQyQ+bfUL83rMLBAEJjOt0B3qr6CkPqHKc1c8G+K4IAEKEVAudt+6C+VHo1QnmchDEbC
         87cLzPILByI7d5D9oHIqKX+YQPl3wz/3lblc87Py9cw3cpoeHNj/+cdjg/2TbJE2rtEo
         NJ6x5Ige83TFLwL+cDJXV34HpoowQlPK0eCKbfZb70T8E+EWnGuaHgu+v/KZrqSC60AF
         Gl7Cnfd5WVBEVRZiEtn3cOpLKvvST789YIqCQsupX4YsYQem+wdzxrrzD/Fssh4reRIJ
         LYLA==
X-Forwarded-Encrypted: i=1; AJvYcCUbh/zF+H0tNtXr4ce96koNr5npXuci2h4hmi+WbPQSqGs78Y41uJs3G+CJlt46TNiSmHdau3UdkNH5@vger.kernel.org
X-Gm-Message-State: AOJu0YxUHOuORBm4LA5DX8pKwsEk2HOHeKOc1ELF/H31jZTuNnAgX0wA
	yqevSXShVc6WH6Qkg6rUDnfQVkf5RPPAzUax8kYzDXK1XZbnFzXwRg1NIiBdcL8h0Ws7oIGjfru
	y
X-Gm-Gg: ASbGncs2BUJz7Pv4aayjRRAREDhnjLWvtBHYJOgU/D5qp4C7gRbiWTJ9EJIBNaDAGX0
	IEmRkmdxtHYvRjeJTgWe9BzzFdyP9sdnpS0dEIaupNI+1L/KfX2+mp4HCOwSoDf2nr2Zu1SafKL
	aQ0CmKfHQ6wHCDLxwYfQL8lNrDBa8Zd5v25s7WsCigxAU2H7jb/fm0JK9lZyJljbSkNrTQp9d39
	qPMzc+UnyK3v9wkVqPIy0nM/mcWx0r3iCYxDb0Mrx/ri+w6VqRqP65ZKDbIQ0vrSgHf/+wjU0Gt
	Kw3qF+YjJ836nHXT7NphyrlKW9DSeWsajKGNpA==
X-Google-Smtp-Source: AGHT+IFLdiRK8J+23ZS3Pe5Z2LeEUKY/oz97C+EmFiHaqXcsrq29Ja6lw3PUjuTOB2Ff6UxinklVNw==
X-Received: by 2002:a5d:588e:0:b0:38d:dfb8:3679 with SMTP id ffacd0b85a97d-3997f901202mr2276643f8f.17.1742555134516;
        Fri, 21 Mar 2025 04:05:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm2037797f8f.81.2025.03.21.04.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:05:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH libgpiod 0/2] tools: don't implicity unquote unnamed lines
 in gpioinfo
Date: Fri, 21 Mar 2025 12:05:23 +0100
Message-Id: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPNH3WcC/x3MQQqDMBBA0avIrB1I02hLryIu1BntgE5sUkUQ7
 250+Rfv7xA5CEf4ZDsEXiWK1xSPPIPu2+jAKJQarLGFeVqDwyxetPe4qDYTE/4W/+eIjl6O2pL
 dmwiSngP3st3nCkZpL0dQH8cJvKkrNnMAAAA=
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zWDoNvZEfK56PKiG49Tb6fj07vQwFieb7rj4qvoAjh0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3Uf5831KU8XPmqxPphNLwVMU2HVtRoyBy93cf
 NvHfhFd8eOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ91H+QAKCRARpy6gFHHX
 coaAD/wIztQQhBrRga2DMVBj3nW6PR5T/13cLnleiuuc0qrp7aqWO5elqfhLuocvlUiYqR6mAwo
 wGTrSqu0woie7UtvmtML4noBulAN3e0OevGh+JCWEcIKJc3xp35Fc8oFxhMywjGtN9IURn1xuR/
 P/Lna9keTRIK/mTZBwh9gun5oxZbEjm/wQp4CvUTyeOOjKWertIc0OAwiT4V2LQ8vvgEv3BPgWE
 D8Z/moeYghOH2WTd0xSYL1oGsJdXytiTdt5OV23bESUO49P3bPHIyuEk2smSUQwKyMw1Gi+3ytj
 2LrvrYyCfWAgbSMllJpZtpOymYRvC9DXcA30lE4kvZ4I51Svjfx/8bHbEO8X+NyuEAEQaT5Djbz
 icMIZqPFbKzEZq36HpNhf8pp5BpGgkx82LSkFJloUaMAPv6Wz0TNsf2p024YZSea17b/pD9VQNw
 VHB58ei2GuTgT0Sj8IteqdyDyV9M4XYiurkd864AvwPcBn6wgREyjx/nZv85PW00xlOXA1RfBcO
 HxnW+bPGbde6ct2DOhhMt4AFUJdzpUB7bm4L5yTJbIhqtzH8jDl7VSIoAQQk4Gtr6SgVFZeLrCY
 ZdyGP1J2J/WC+uGu5ufmBclXaf94cQ58opcnB28h3P9Xms2LeX732qVV6ElsrfIU1Yp4rDG/0NI
 RxPZPxJblk+a9zg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Fix inconsistent output of gpioinfo for named and unnamed lines and add
a relevant test-case.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      tools: gpioinfo: don't implicity unquote unnamed lines
      tools: tests: add a test case for gpioinfo output consistency

 tools/gpio-tools-test.bash | 18 ++++++++++++++++++
 tools/gpioinfo.c           |  5 +++--
 2 files changed, 21 insertions(+), 2 deletions(-)
---
base-commit: 2cd1efbc5783f5daa47598c76bede5ea7e47993f
change-id: 20250320-gpioinfo-unnamed-quotes-4d74db6e48dd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


