Return-Path: <linux-gpio+bounces-1960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B2821F15
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 17:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379E81F22B4C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jan 2024 16:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F44A14F7A;
	Tue,  2 Jan 2024 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pdQKouu+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E914AAB
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jan 2024 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d5336986cso92451725e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jan 2024 07:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704211193; x=1704815993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WsyzcZQRV9ijz3j8+9hqogl73yu+I0VcAwk/LOq5VA=;
        b=pdQKouu+ItTuNIY77iqeCZ7JSbcVAtvV9+iQHktUdo1Olc1GaXBMp/aEdWqMUqQthQ
         6H50x3gXdOdLyk0irINKnKX77Z7BOnhrT6b4EIKqJiosWiZgf9wIxK0djrUcXFTl1/9+
         gJoVfL/hB71oRfbQ7D0qEgi3nCQoaRVKPXoZAqrSn7r48GRdrodPcooI4+botp2e4h7U
         WukOiCSF6MeBwiv4w/KXmVlpItgsdx+Sazgs9FuuR8INWviP/WecJYXW0YQSDxzJcsd7
         U4DBEvtYQh6UbDzrEQeyKlqBzstoqkBc8Pew00BImXVC+ZdA/41COdPpu5CuiI8FQRKG
         5qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211193; x=1704815993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WsyzcZQRV9ijz3j8+9hqogl73yu+I0VcAwk/LOq5VA=;
        b=u5DBhyYq1XqCdAKjvtIvaQMbBJwWf/r0M3lV/6xa34ZJq/W3qcsTQQvd5eHRnnoJLO
         0VaSinSAdPRvoTIpZqjrjhfsMj1vaA7yHrrqvBjc5ZKKVd2B9wuSiBbIT5mChxfrKCUF
         NmgihAWcju17eh5wwCW4vlDxQCm2j0z6dsSYAnE8V0GvZdoaPgfYbE5AJwHax87yci/P
         SH5RNK22qN85Udy6ZFEck2RbMRExHZ7OCELAXmRPj8clN3lQfmvozCm/TMMXE1CQ9ifZ
         rpDmESucCLVqcYTjYKwMYAGRfGm3lMminBMs9nRsN4x9Y/vRE8DUDQ1iJqj5UPmgTPKl
         4MrA==
X-Gm-Message-State: AOJu0Yy4cU9ubX4kKJc0wqJwSx2CbNf9URYm1VBuZRjZrkUCMjyu8ZtH
	uIgaQrYnVow9/SkQE5ONb+V49r3WJvuCyhvEW5LnK3VV1sw=
X-Google-Smtp-Source: AGHT+IEQ0ydWU51BdGD1VzVabgu66m6TLoDAtPd0hUHRuhEZl0AbRC4um4XG4Evsbxae2zC2OIoU2w==
X-Received: by 2002:a05:600c:c18:b0:40d:8cd1:16dd with SMTP id fm24-20020a05600c0c1800b0040d8cd116ddmr587983wmb.248.1704211193471;
        Tue, 02 Jan 2024 07:59:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f51:fa47:f00a:a53c])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c138e00b0040d62f97e3csm20556641wmf.10.2024.01.02.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:59:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/3] gpiolib: use a read-write semaphore to protect the GPIO device list
Date: Tue,  2 Jan 2024 16:59:46 +0100
Message-Id: <20240102155949.73434-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm still figuring out how to keep GPIO descriptors coherent while
(mostly) lockless. In the meantime, I found a potential race-condition
during GPIO descriptor lookup and also figured that the correct way to
protect the GPIO device list is actually a read-write semaphore as we're
not modifying the list very often and readers should be able to iterate
over it concurrently.

The first patch in this series is new in v2. I realized that we must not
wait until .release() to remove the GPIO device from the list as this is
why pinning down the GPIO device list during lookup would never work -
we always could end up re-taking a reference to an object that was being
released if it got looked up between when the last reference is dropped
and the object is finally removed from the device list.

v1 -> v2:
- add patch 1/3 to fix a release timing issue

Bartosz Golaszewski (3):
  gpiolib: remove the GPIO device from the list when it's unregistered
  gpiolib: replace the GPIO device mutex with a read-write semaphore
  gpiolib: pin GPIO devices in place during descriptor lookup

 drivers/gpio/gpiolib-sysfs.c |  2 +-
 drivers/gpio/gpiolib.c       | 62 ++++++++++++++++++++----------------
 drivers/gpio/gpiolib.h       |  2 +-
 3 files changed, 36 insertions(+), 30 deletions(-)

-- 
2.40.1


