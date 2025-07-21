Return-Path: <linux-gpio+bounces-23596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEABB0C855
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 17:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E67C7ACEB7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 15:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8942E03E6;
	Mon, 21 Jul 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSW53VTu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EFD2D63FA;
	Mon, 21 Jul 2025 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113475; cv=none; b=M3cTFrR5m3fYuezRQ+o3jCIOD2FbcaeJKXW6YT86bzRLADah7jspLoI15BiHhxvVr8NO7JlpvHZqblRPSt3uQH8ZvwcRo3VqPDT2nx8p38cB47EIs+Cs4evqw8eWQkW9Oy7ovCrsx1NiDoX2gRtvRFyo2oab7nlRYoRz8T+27QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113475; c=relaxed/simple;
	bh=I8b2eOaOgLC/idO3hUIn5qKaPk1B0uvZ/XFYdbKmaK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HOHJRj/sXFS1jvegtwwCMJOo8ES7tIE8ex6QY2qpYDV67CTQIdmmq+ftogHbYV1KIK3ibB/xZVf7g+FvE46jN6Aa4goNgk7LUn19PCNIcdQphSx/AGVsr+CtEAuzshw1ZCisooUblaVWn4mI57n7gxX7H5guOKTylY+PiFMCKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSW53VTu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2674890f8f.0;
        Mon, 21 Jul 2025 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753113472; x=1753718272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4CcgqDmHLx3E6iH/EO4qgMYCoUWMRDvxR4iGKpAf/g=;
        b=XSW53VTudNtZGYZMwExUGO+tk7X+WwcCr1AitmKkRu+eaEk+pPAF8YZl1urGU/9cB/
         N/chhKVwkX5AU7fjqmYtzbnP8oD8tUoWD4dRIkws2Of8oY+czNlFGjrmLnxz9+e9vWVM
         VCQpomppWKswh6zax5lOOwzSDjOQ1Ckx9nTVt0bzQQPRtg84QdjbRAnkxS2TBN1iv9Wy
         edboyQNVoufK60IeSNGrpwiCVlMSGYjNfzzymnOb6a+bKRRH7xZ2OECnc9ss698mdgTN
         o4N7H3CQkpM0ebZ3c7O+VsPbiuicE//2SEnevDZKV6nem2ZHCZzzf59hi4Nvq9h2D+QS
         X6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753113472; x=1753718272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4CcgqDmHLx3E6iH/EO4qgMYCoUWMRDvxR4iGKpAf/g=;
        b=cKbRleC/AxC2diZRlNWaZWfdna4m44JUavc1TLE/7ATdh41xqX9KFY6KuBoJHYnVVh
         u+2t8yxWAYb/ncGTFdU3J9hdGe/Vw3FOw7x5k9G61lWSm/OkPM5wgPYGrl0wLIZz++ie
         HYjgsmBLhQDo8KxL0bPzM1vbf81qVQFoi2SUVBIZ0uUZS6UDSlxrBUWtC39eNCjOnLLd
         V3mPIDs5QlerzMP8nGQzFI36DqRloaE35O2txeON3WaCU5KXC+7U5mEjzEsCmlJnu5ho
         DaDfseZ/nfoF9tykQmb7KIqzd7wSHDADLHx6+9oO//OKh6pYkvzfPRvtJSra8AUrBdqo
         JgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZPZLrQMuMdwfMFF57ICLPBxXnoBsdAZ4nH/10Bo0rREhkmR2mvDyv28xoR+iABblAyA8KMLZL3+O4AreW@vger.kernel.org, AJvYcCXiURi7Tk6p4UdM55Z+A1D8k1zRkpsgnl5Agydb8r5yyhxZLau5kSW9RPLJ2znRg2pTzMWF5BXr/FGV@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWmKSO6frT73T0Z3v6coo0XcMPkCPp+QxrFT+aUMlYvYjWHR6
	dg3mqOb4lxCWmY0aCpzqVUoD09kJleM6urifQQjBqf6OQOqA+7GnbYXz
X-Gm-Gg: ASbGncuEeTQU/HjXxqpK1ExqgPdjAs7eZHF8QVsCahXje2pCnPHolFdUrZzynfoEXcQ
	ntL5HUFfnL3LkhtoL55p/xZplotIXtaJhh3/QdH9Xeyy1mfBjc2ZbIPwvljaHcvF2379AZzUuqr
	VNi937lQdWNtFezoCPWjTXYzcYauSGKCsuazzBw5D5GvK00ihZ1+HKkqL1dJLEnW02HQXbDc6Tu
	athuO+3vv7vc1xzG6lRaQkN11xo/IKUmUh43vllCV+TAeXtPP92Z/2RoAppVZBdc8yY8o1dhty2
	aKbVgU8+9BOovu8G+yfEzTwe7XLM1WSH/SIO2KZjqEugd4c0usTUwE2R5wNgH1K5kw+3V4nBwkD
	+GvCD5ylw1da6yVgkLH1salXlN3/ei47cq7gQx4Uwpi/aA9Sts7lvtSQrygByJ7BLVNFbhUaHdq
	yfic3BnBIes26EgjFe0y5FSH6bx8Y+/tieXN8F58zX/gfGh704JKI=
X-Google-Smtp-Source: AGHT+IF5BJiHWkATOy51K0Tr+ryha9EshfkSFey6xKHCENS9Z985XtqWuYltDSqWXubLndDcE3iXDg==
X-Received: by 2002:a05:6000:4b09:b0:3b5:e6bf:5d5f with SMTP id ffacd0b85a97d-3b61b0f4b03mr11167751f8f.23.1753113471773;
        Mon, 21 Jul 2025 08:57:51 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e103-2700-ebc0-27a3-cde8-9846.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:ebc0:27a3:cde8:9846])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b7404f3sm106792505e9.23.2025.07.21.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 08:57:51 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: andrey.lalaev@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: of: add forward declaration for struct device_node
Date: Mon, 21 Jul 2025 17:57:37 +0200
Message-ID: <20250721155737.261990-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 08a149c40bdb ("gpiolib: Clean up headers") added a forward
declaration for struct device.

Later, commit 07445ae1c263 ("gpiolib: of: change of_find_gpio() to
accept device node") changed the function signature to accept a struct
device_node instead of a struct device.

Replace forward declaration of struct device with struct device_node to
match the updated function signature.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 drivers/gpio/gpiolib-of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 3eebfac290c5..2257f7a498a1 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -8,7 +8,7 @@
 
 #include <linux/notifier.h>
 
-struct device;
+struct device_node;
 struct fwnode_handle;
 
 struct gpio_chip;
-- 
2.50.1


