Return-Path: <linux-gpio+bounces-23514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DEEB0B0C9
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 17:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B5D8189769E
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Jul 2025 15:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58F92877DB;
	Sat, 19 Jul 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VUn5E5He"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83EA1A8F97
	for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752940717; cv=none; b=RIdj8Ok+9ga9HQJO6lvyP0RAp08DdcYbJqDOvTXPdJXnFs801PpnBsNrxx2jn6bKgm3qs680C3Hi4MghQwvfj8FomSqZ6u3GPgiIfzuRvEtcah09Xlx09KUXXRkv62nIHeaBVUPuf4gSOAWgBWKGP7nooCX2MLztEd62d5GCsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752940717; c=relaxed/simple;
	bh=bEF47tufxZ6dSvdSGUWaE3klB8WZIOyovgVbPII9J2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3GHj7RjFB2irvmdaRJD3o9csZVbXMag4MsgOFFdBddYvQEv3ttvzrvW0Gvyf95jAsH/JrxkGVErl9ib19zIWD0vlYzhQMJFaHeYdbxNzg9si4NX+hmGrWJWbkE4foTMy0YggH2ISFNdmssoe7JhUywUz29R8D/NPF6PsNfEbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VUn5E5He; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so24419505e9.0
        for <linux-gpio@vger.kernel.org>; Sat, 19 Jul 2025 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752940714; x=1753545514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYyl5d+POA5pKdskZCzfbVSjJZF5xujhhOtF/207ebU=;
        b=VUn5E5He3MLpOLbYs6e0RCb5cEdgg4ARKYdwBK9Iijdw0wPYjMCxZ6Bb8Xs29ouUFt
         +cs6hUu8Z3odELLB7iluIBbuiFuJjpeRIWu16Mr/kQqnVsZahwTV/TZOyOKv4S+ZAGGO
         oBRC86KmpRSxHsjFU/QKWtExpIyOZC1+5yKGQuGr41aIQN9GCe0UwwqjJAvmvffTABXM
         efnrYNzJ3Hvw6uryERq1K3ZK8KUwzyVypBKGxA5vKI3EXay63+T2Z3Y5p2mikdNE1AV8
         001c7vXixjXNPXiN6JwqzA6RAfjZtqb94hnkvD0a6HbA8UFWd8eP/aSK2dV2CAOrtwNE
         Jz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940714; x=1753545514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYyl5d+POA5pKdskZCzfbVSjJZF5xujhhOtF/207ebU=;
        b=CsGBjAOWCNKBbaHJhvSeGJ1lFhUB2E7gBVhkGptFu0hnhAoj3vYBceo4mhLCmSUtee
         FOx+0JDHK/1c6dMtlI79YR9Lheu/aZir4VThL7R5UBj5bgWvOfmf6GNffkLifVGhw1Lk
         T7swHT7RtSD+DqRAs3alvM+u+f6qlQm00VlVdvMi1p02A84rFzHEr+ghtiYxWLapTfhA
         fmhFXULhP0kjJvzWPzollDssX8k/SALZWckLZMi7apvH0690Cd73pO8pP8+N5cY3Evmd
         VpAP8Y27IQViO/CXXGr9VG+l/57gNeq2vHiHhV2K3SeB3QpThd6EsQ6oStvP6w4LT+gJ
         FZMg==
X-Gm-Message-State: AOJu0YxS144Ko2lr7Ai+SYcesymn3/exAZfb6HEdA7LNwxK+0MzMZw4s
	fVZuOg/dfZUTzfGHxUrUt0pCaRWwbX3fM4KMmpM0tzjirJedi2NUwQwjCN8qyabvV9E=
X-Gm-Gg: ASbGncseEwCvczJaHzQXOpbNG3vZJRpQc6daiy1OwRvRwrY5EWFqVYbzb9nD8pqAVjM
	Ro1qTpCjh7lYz6Tr6XjkzWThKTXzKCcct3cKzdCkR/wpHdlTN+OEdsJ8LuI94Sa4Jqv9qksgGuw
	Etx6SiiTflbC4dwKQrkAfY/dcqMawK51DUm4UZiyZCqCEWoxxQP3f7+nANHk7bULVZJhbNIbbLW
	ZSq8XYxUy3atMUX6BfSRRnmvRuea9VT/u5+3ed23jU89F6uDhSI5ItugXVDwVk0Y75Apw3LRHoD
	4OBZWIsJ0gbKsZPbRV04SwXE29Mu2fNX8NgmyxhjsVndIOKwCMa4jai4D2iDQGqhmWf/jWIA+Hh
	nh2R5m0uRfKqyMKHH18f6Bw==
X-Google-Smtp-Source: AGHT+IETOfBgO76xVR+/uSR7+VdwifQBdFxnl3CWfU5pB1U7/a311WyFN5/D81L/dL9uc1nWhk49VA==
X-Received: by 2002:a05:600c:a113:b0:456:18e:eb7f with SMTP id 5b1f17b1804b1-4563a4fcf8bmr60767305e9.3.1752940714233;
        Sat, 19 Jul 2025 08:58:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:caa7:1023:8441:61fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b740285sm51528875e9.20.2025.07.19.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 08:58:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andrea della Porta <andrea.porta@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH] pinctrl: rp1: use new GPIO line value setter callbacks
Date: Sat, 19 Jul 2025 17:58:25 +0200
Message-ID: <20250719155825.6938-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This driver was not queued via the pinctrl tree as it should so it flew
under my radar and it uses a deprecated interface that we *really* want
to remove in v6.17. This patch addresses it. I would really appreciate
it if it could be queued on top of the SoC tree before the merge window.
Arnd: could you take it directly?

 drivers/pinctrl/pinctrl-rp1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index d300f28c52cd..6080b57a5d87 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -779,12 +779,14 @@ static int rp1_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ret;
 }
 
-static void rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int rp1_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct rp1_pin_info *pin = rp1_get_pin(chip, offset);
 
 	if (pin)
 		rp1_set_value(pin, value);
+
+	return 0;
 }
 
 static int rp1_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -849,7 +851,7 @@ static const struct gpio_chip rp1_gpio_chip = {
 	.direction_output = rp1_gpio_direction_output,
 	.get_direction = rp1_gpio_get_direction,
 	.get = rp1_gpio_get,
-	.set = rp1_gpio_set,
+	.set_rv = rp1_gpio_set,
 	.base = -1,
 	.set_config = rp1_gpio_set_config,
 	.ngpio = RP1_NUM_GPIOS,
-- 
2.48.1


