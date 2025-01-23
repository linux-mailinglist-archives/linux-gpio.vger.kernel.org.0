Return-Path: <linux-gpio+bounces-15033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A182A1A199
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 11:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF151889750
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2025 10:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F76020D51D;
	Thu, 23 Jan 2025 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="feAfP992"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E3820D515
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627094; cv=none; b=pC5rdMKLtDWheWCueLqMGEbGMT3456VJjazXeHP2ga4u2kibx84FgCiyNtpWvaN/sgJRyGu+w5qAk06Y6hyLEGaHBFxR8mZUTKB9SeebDpeokGSAMvv1YsT3cAGkaDs0Q/zCcEKE7Hw6vKY65FROH8ixCDD0OedrLRyULI7otWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627094; c=relaxed/simple;
	bh=ge5RZPhFn6Hcr3DnmwhCinqGK8/TCxIYXiyA1B+aOEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cL4TUzmvL3vJA5uOSWlnxraocR61ySzkSPn5AlL81zSw6noLKPWq8bpHngjxhtF7gT5dy9Bh6qBTJoRsvmfPz4n5hhjVZvQSpdUtfmFl6JZaNWDpqnqeAn03hqy9Xi7UDaE95+YAD2OakH0TtE5jONN6O2SWNEccVh1b6spjz3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=feAfP992; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so1114099a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2025 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737627089; x=1738231889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDSygjJeffviRVz32nmKe1obDDR2MaeUIVDMViuQtnM=;
        b=feAfP992njb3ze0l3HEfMSOMiDVpwW6oZTJRkuMkRneOSAFRtdoGkyvu6OQqZdMIa+
         kKaw4B6UiIP+CauUWNvvSOCyFNUyeqT3sFyC7H5aGfGNcihHkbb005dmttvXuCeHLieT
         f4IMiBaP/7DoyNBxTyhKZgUB7Qw0Szb+zsTc/ZK5oXYcslHEQfcnSnmCqRL9GG/pEGbn
         GNzNgcT7OAk2ZUjsvhhAv2MRRZZCcEdjstMZvCS4vGGCGlgzWTpNJOCYaB1bEWMsnnMs
         M7SxA5UkFr3ZCRm+smQUVPiNlwtsIrWVEguD3pQudZE4L4Xc2QOWe4iHhlPvBkFcGvhG
         TLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627089; x=1738231889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDSygjJeffviRVz32nmKe1obDDR2MaeUIVDMViuQtnM=;
        b=owNhkXOvR3ciSLQ9dx/g2Bb8KfAZ4PFFX4VDcs87e9lBcrn0Slc+iNQ8OGVnPnxCbl
         vHlyMti3y3ahzCTCMy/cvX8ZLBeC6zICYMgCa6/8euSGhgNxYNtfbBkfBkWn5iQjCzYo
         EBAXHVFvDDPsG4Mf6F/kIuSKUNIm5JmqDWaTjLHsyC8xVLzGrqvd//JC6vGMm261yZYs
         0wHVxtXOsSaoYXxJ+ebGQsoqOvnHROrCykWhNKcHUplkfwy0mgYWuKEft8bWIJQZUZ2Z
         64LYgmz8aGcRzmjcWhvfk5VyQ1Y7QOUC1xClITPd2BO1LaaheKB586WbM0E90l7bq8IX
         zK8w==
X-Forwarded-Encrypted: i=1; AJvYcCWaujp0RaqIsDvnh8c8wKdOCrkIWZ+/qnGXOqLQ40WvbPmAgIkXERr8NDhVzzhN6sdp5/3Qvo8xUSwT@vger.kernel.org
X-Gm-Message-State: AOJu0YztNVzFIrhBcuhHV6MuM5RNfue09z5XE0KWs5h93448EVdQ/kVg
	I+gGRMCinFSeVW9c1JW9QeA2ZVjoNX/BSZCzsseE9uqBVS9kimfVbbW1P5t7NTs=
X-Gm-Gg: ASbGncvDW6cl7acDXcgCZ8S/iA1AXyKNMUTfltiK5Fl2iQjPij32Dco4ilcndFyNvZY
	8u8qFXZIjroUpFYVyo4IajaoVJpzmc6jKHU9Aice5d7EIz81yC5wyuAnTdXMxo14W8Vf2AnpVLJ
	1IFbb3TBQB81w4lwKheo5uXDO9xTwoji2T71z1nVpph0uqv5d22Jh6btdr7alam6mCcHkwtwEd2
	CEC5rBisRcvrLvPDoJ0LwItfZQ3GMJobPDxAhpS91AXx6hzFMoGqhcJFvU+2vcwDkl+Pa1fDKkK
	tpjj9ekIf6XcbE3PZ9IRzbOAId/0Bo5med0QyVbe6HExn18=
X-Google-Smtp-Source: AGHT+IEiej3kjVDey0/11bFdOMpCs7p8PGomthfxPt/dN2T0bi2hgs4WUw15UFfYrhjy0ehbGWhbuw==
X-Received: by 2002:a05:6402:2745:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5db7db07846mr56070171a12.23.1737627089376;
        Thu, 23 Jan 2025 02:11:29 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab3999638f8sm910761566b.9.2025.01.23.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:11:29 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/2] pwm: lpss: Actually use a module namespace by defining the namespace earlier
Date: Thu, 23 Jan 2025 11:11:11 +0100
Message-ID: <20250123101110.339337-6-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123101110.339337-4-u.kleine-koenig@baylibre.com>
References: <20250123101110.339337-4-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ge5RZPhFn6Hcr3DnmwhCinqGK8/TCxIYXiyA1B+aOEc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnkhXEMeBkwVZg1JtRb0pf4s1xa0sEugu8VXh2c /kPn9ufwkmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ5IVxAAKCRCPgPtYfRL+ TlCWB/9BY1S09nj9M8vyPnpMotgSrqWnvT8UyXK3XKHs6Cgolb/W8ALXQyBYVu1Zgw2l0Fqpvin R7CR1tJAjt2jo5qDoHbpTyH9UJ5CTMLKt9psY/LOJfCLgC9CFZypJeNdWyr1QPYSNVtxzjSDvNM GOps/0lbUB4PNadV5+XSCYrDh+n+Nt9DHkIRdCDbynk2IZS64aKkpkaOkJU/0Q5yojHFW9zYuoa NkXDOMB2G3Kg+4OE+fhxZYmi1lHd57Fp6lHVuAFUT0MteKSEDiMjGfmQPE/Po0pJXMqyodPf3f2 Dp5k0kmlYFRmZnIK1kxjCqKrq21U+VK90ElgvWp/lakYEAFb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

DEFAULT_SYMBOL_NAMESPACE must be already defined when <linux/export.h>
is included. So move the define above the include block.

With the DEFAULT_SYMBOL_NAMESPACE being defined too late, the exported
symbols end up in the default namespace. So the respective modules can
use the symbols defined in pwm-lpss.c just fine and up to now just
imported the PWM_LPSS namespace without any gain.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-lpss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 3b99feb3bb49..e3c72ed7fff1 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -10,6 +10,8 @@
  * Author: Alan Cox <alan@linux.intel.com>
  */
 
+#define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
+
 #include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -19,8 +21,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/time.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE "PWM_LPSS"
-
 #include "pwm-lpss.h"
 
 #define PWM				0x00000000
-- 
2.47.1


