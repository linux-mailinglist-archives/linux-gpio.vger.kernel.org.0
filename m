Return-Path: <linux-gpio+bounces-1274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F2D80E3E7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 06:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B70401C21ABB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 05:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDF314F8F;
	Tue, 12 Dec 2023 05:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFOppSMZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B977CBD;
	Mon, 11 Dec 2023 21:43:17 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d098b87eeeso46391385ad.0;
        Mon, 11 Dec 2023 21:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702359797; x=1702964597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKaFlL9xl746TmzT27qUJD5WRcj1vFRppCdyKVFw/p4=;
        b=bFOppSMZ+J2WQt/dg37AMkUMnlyVHaNnQUr/zbnNwSYlbKRL4/O+o8AaphDrl080ap
         lZV35Fzb+8Hp3gWU7n5C/GM/LkRkfESCXw3P1q7B1QKxzpd2FQwepnilpQvQRTHQMOar
         8DEkifOquuuTy549uK67yu4Oa7YN5PHxprJ8G8uRgysJhsY8W8L1tXsxpv0kM1lRHxc4
         6jLFvtdb8Cof28F2SJRx+Yy9aHg0dXsWcXLVK33szxvLUL75SZInkxwkp/UHeVkh+Rsw
         UMMpkrOQYYLBJ570dYLVynWTWOjcvgtYt8CVCeqdZt4uOZs65oNiYCkDGeO2XtNUgafH
         Hv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702359797; x=1702964597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKaFlL9xl746TmzT27qUJD5WRcj1vFRppCdyKVFw/p4=;
        b=OhPhYOPYX7pwU9JyBCzp0wk+SCCZHNarbx3GQuk27+5yLEkD/5ADpi+s0NFHj+VfhT
         seONoemibWudBE1Ylywf29/gWQOPo0yTOnPsu1z1ZgcMwzz/zzalsn91qikGMjAUGyU4
         h4E7VVAK3QxR4inwC5ZLTW2FTQ7H8rnClbcyN/CZolNeUBIWpEXCLuJRu2Syz69Y/kUV
         4+GayvYFKnnquM+PlIdwC4LJlmJTN/8KC+c4wKqmacZrbfMTZZxJz2MM86EHKjLSW0+t
         OpPxq3fwh0g19aZLQPUAQCS5S/0C83ibO2txUfAWSjjzSIeJ7zbug4+elSrB+HFQ8luO
         4+6w==
X-Gm-Message-State: AOJu0YzRrW/MXn0DicamRube9OZgmsBWfLiaedcSXT7I19958FvdWH9X
	iioJJyWW+Sv/yMWBPt3D1gTVkQwN8AI=
X-Google-Smtp-Source: AGHT+IEwFZRH+OeexZrCzz9U3OL5uecmVKuuRLEaWdC7Ig2VZMPe+pmQ0QlwVW2Wrkvk/yg3qX9h+A==
X-Received: by 2002:a17:902:d203:b0:1d0:910e:5028 with SMTP id t3-20020a170902d20300b001d0910e5028mr5957423ply.47.1702359796931;
        Mon, 11 Dec 2023 21:43:16 -0800 (PST)
Received: from rigel.home.arpa (194-223-186-106.tpgi.com.au. [194.223.186.106])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e5cd00b001d0be32b0basm7591836plf.217.2023.12.11.21.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 21:43:16 -0800 (PST)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	andy@kernel.org
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 0/4] gpiolib: cdev: relocate debounce_period_us
Date: Tue, 12 Dec 2023 13:42:49 +0800
Message-Id: <20231212054253.50094-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains minor improvements to gpiolib-cdev.

The banner change is relocating the debounce_period_us from gpiolib's
struct gpio_desc to cdev's struct line.  The first patch stores the
field locally in cdev.  The second removes the now unused field from
gpiolib.

The third patch is somewhat related and removes a FIXME from
gpio_desc_to_lineinfo().  The FIXME relates to a race condition in
the calculation of the used  flag, but I would assert that from
the userspace perspective the read operation itself is inherently racy.
The line being reported as unused in the info provides no guarantee -
it just an indicator that requesting the line is likely to succeed -
assuming the line is not otherwise requested in the meantime.
Give the overall operation is racy, trying to stamp out an unlikely
race within the operation is pointless. Accept it as a possibility
that has negligible side-effects and reduce the number of locks held
simultaneously and the duration that the gpio_lock is held.

The fourth patch is unrelated to debounce or info, but addresses Andy's
recent assertion that the linereq get/set values functions are confusing
and under documented.  Figured I may as well add that while I was in
there.

Kent Gibson (4):
  gpiolib: cdev: relocate debounce_period_us from struct gpio_desc
  gpiolib: remove debounce_period_us from struct gpio_desc
  gpiolib: cdev: reduce locking in gpio_desc_to_lineinfo()
  gpiolib: cdev: improve documentation of get/set values

 drivers/gpio/gpiolib-cdev.c | 257 ++++++++++++++++++++++++++++--------
 drivers/gpio/gpiolib.c      |   3 -
 drivers/gpio/gpiolib.h      |   5 -
 3 files changed, 201 insertions(+), 64 deletions(-)

--
2.39.2


