Return-Path: <linux-gpio+bounces-38631-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sRwIDKduMmqIzwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38631-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 11:53:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96357698224
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 11:53:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=NT0Toa7G;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38631-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38631-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E670314A44D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 09:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADFA388374;
	Wed, 17 Jun 2026 09:41:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D30839D3F1
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 09:41:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689319; cv=none; b=GulJWMWUPXtIv1lKWGFjAIr5nEi/NbRtxgURPmqSB/M7dEGYro1XxqfRy3s0HFGWdu5ET9S7gjJQNh1A6vS6hm1uSfI1r9aDD+ehoJSwSQ0sZHF9WI5zTKchU5GnuZBhJ/jkgy+uDM4+HGONhJ8QtV2yEFCzu1mRsEakGhPvCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689319; c=relaxed/simple;
	bh=Tz2U4aa4r2L6c5MgiQtCST5v5LB369yfPwSVmbc5WAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uYhHNloCLkcM1UONRXJIlpgWkSvfBLOH+1vUaVJWUsRM+f+20x6ZyTYNU9gNQko+BNeMoN4zu/4XrZdOCu0MioN8rx6n6OFCYeezVYVOindx0S4M6gjRn9oh2JiGgQupILxXRMZX0I5iDUJYNWZ4zwhzyu/q8D2FVR+6YYYup6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NT0Toa7G; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso42194445e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781689317; x=1782294117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiycEI0K89UfGBPRijVeVid8zfJcpLlj8A8KclF/STE=;
        b=NT0Toa7GlvAyfeDrKiNmd5E1jp3snzJM2Lk/eCSFN2GtRGPXt7hymrKgbsnkljMaM6
         j3CMSJcbUEEfezk9P87lP1viEdI/YyNV3dBq+aSTZFU563EfOAQFVQSVQw/PtsjNaZf/
         43LYC2EeKkFjwjkIqijyecu5ZG3yIWQi3OX6NNZ1M5fRvi58VzlgCkQQQc00H+iEXIL2
         7JBqaKfUplbHlqmjeMeBQ/2pPV737hE2qxAC31l1qCHhhcTvlgNRrW+eU/LwHy+2KByd
         KWX2Vx4Y1XiVpZKc37kkZ5A4ftWT3QIgfQZQDFCjVwEmdZ0oQpVRPz88vZmyBm9+/nSC
         kY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689317; x=1782294117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiycEI0K89UfGBPRijVeVid8zfJcpLlj8A8KclF/STE=;
        b=n3pmR41P/4CgmJvQWJPnLUf3aDtovhzyNH09kCq0zsgf8xKZe+Wk5Lq0tXbIlWXhUY
         4aEeOENAjjOXHyhSoyOjmEcwewsAQhov4I1CIyuF6h7zEXHHJAbW9gTu4vcoxxZUg6wy
         If4Gac7z4zx/pCD82WMrmGUwCnoezjTO5JHRTtRO0mLp+/1kvo7OC+L3XqlwKt1mgNdC
         S402iDDqNoj80vkqbdbVTGm9sLK3Bq+fNDXVSy8PXYP08ko+/eWCuXbAZNnO9/oIz5RQ
         bVEXXPlKbIjdKTGuhntSSOEa78B+XPpJ4jJvmci7WccTkHV+WBTzdb2Xa3ShHak+rZjl
         j9yw==
X-Forwarded-Encrypted: i=1; AFNElJ8L23SNknKNqs+2Uxb5OkXxXKP7VmnIRTNwQ0fgf+J0TX1QDWJlGzfggyrfZZWbRGre566q38hKiG/r@vger.kernel.org
X-Gm-Message-State: AOJu0YySDqvxXGMPOXdTd/+DVeVbjieyEB663ZzZjWZW4z8I0/BiS4zq
	GBCiNI/w3gX07bT6u/07+a9d9xqrL0kZkwCHhkzWKZeji/QP67OOBIKiyOgfQ3q9aNw=
X-Gm-Gg: Acq92OE6mzrKAXp1WDYoktCql+FoiAt17sWLPS/Dz9atFFQ/VCPR1jNPCM6if0Mr/Wc
	9H0STqJ0JTqOVQ6CHDm1cX5b+7e0To5ShEwENdqn5UNH+2eP3itnL/StCkY1cX3DwJ+uRlNzu+R
	AItCeaZos7AL9w1/ch5WloRcnD3Eiwhb0ReEVGmPEwc3cfOWM9nBFpSdZjJROz91D/9YjChUmj8
	FdqvsWPNCG8r6F98xrG7Z4W7eBW+tCYAyPZxMvYp+ZGHD0deQ/myarG9zzdqAAJLqi24Ye5kH1d
	maYGEy2HfzdDIFKJTPgq261RSq5JgAtE8a2lEoiYIVnjowlrf6yPzyybNFAXO90Q/EyrcXHaMxQ
	7Et+3NLkkXpGYDLzx2efWbGdxCiIW9aUOZ3zgRHxRJwukLRMN79YkXJEU21WbnOm/7FverAnTYi
	LmFWq1PRyIKcG5Tet4lhBe0b7tqoKtxcaTkf5eeLyXcLUaQCHpATcp/aDCnvbJE2ZqAImJU3Btd
	WO9
X-Received: by 2002:a05:600c:3e05:b0:492:2e58:666c with SMTP id 5b1f17b1804b1-492333f8014mr54683495e9.37.1781689316666;
        Wed, 17 Jun 2026 02:41:56 -0700 (PDT)
Received: from localhost (p200300f65f47db04bc2080ea3c93ea6d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bc20:80ea:3c93:ea6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-461eaa0d1c7sm9118044f8f.7.2026.06.17.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:41:56 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pwm: Use named initializers for platform_device_id arrays
Date: Wed, 17 Jun 2026 11:41:50 +0200
Message-ID:  <b515eb1644e793d019163fd2a717d3fccef857f5.1781689255.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Tz2U4aa4r2L6c5MgiQtCST5v5LB369yfPwSVmbc5WAc=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBqMmveH9DsdXyFGFrVbLZjAXgPNn2JCE/2ZJl+5 zzK+VFWVn+JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajJr3gAKCRCPgPtYfRL+ TuddB/YtPTBlkmS5kcR8CR6fr6KVpgDTVbSLbXwmuVWCWLQg9kT9SDOgfozZ6SixCgFOJo05fJK zhuMkq27DUzVFwd+KD6opvO6HQoZsVbSKg3lcKA0iF2zUKsMnXjGSSXhzMGKs3wDDqKpI6FZIdD EzwtkjG4NfqDvYJWq7qHYVZ5NWtrmjI8BvlIqEaXYJ/k3cEcVsmPZW/Z2ScaMp8bKSYRQz2gKwC bAQ6RxWMN+2MVU252lAvvKEYkRu9rhu0CfO1hJ4DjMhL7hFjqrHR974WZfS3C3ItUab0XOMNfS9 8eS80y60S73vfjzlPy2bFi5aw7Vd+cWUKGSDjVlP8DsP0ao=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38631-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-pwm@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:dkim,baylibre.com:email,baylibre.com:mid,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96357698224

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays drop a comma after a list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-adp5585.c |  4 ++--
 drivers/pwm/pwm-pxa.c     | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-adp5585.c b/drivers/pwm/pwm-adp5585.c
index 806f8d79b0d7..f4aa74b44ed2 100644
--- a/drivers/pwm/pwm-adp5585.c
+++ b/drivers/pwm/pwm-adp5585.c
@@ -203,8 +203,8 @@ static const struct adp5585_pwm_chip adp5589_pwm_chip_info = {
 };
 
 static const struct platform_device_id adp5585_pwm_id_table[] = {
-	{ "adp5585-pwm", (kernel_ulong_t)&adp5585_pwm_chip_info },
-	{ "adp5589-pwm", (kernel_ulong_t)&adp5589_pwm_chip_info },
+	{ .name = "adp5585-pwm", .driver_data = (kernel_ulong_t)&adp5585_pwm_chip_info },
+	{ .name = "adp5589-pwm", .driver_data = (kernel_ulong_t)&adp5589_pwm_chip_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, adp5585_pwm_id_table);
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 80d2fa10919f..b844bb2dd92e 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -32,12 +32,12 @@
 #define HAS_SECONDARY_PWM	0x10
 
 static const struct platform_device_id pwm_id_table[] = {
-	/*   PWM    has_secondary_pwm? */
-	{ "pxa25x-pwm", 0 },
-	{ "pxa27x-pwm", HAS_SECONDARY_PWM },
-	{ "pxa168-pwm", 0 },
-	{ "pxa910-pwm", 0 },
-	{ },
+	/*             PWM            has_secondary_pwm? */
+	{ .name = "pxa25x-pwm", .driver_data = 0 },
+	{ .name = "pxa27x-pwm", .driver_data = HAS_SECONDARY_PWM },
+	{ .name = "pxa168-pwm", .driver_data = 0 },
+	{ .name = "pxa910-pwm", .driver_data = 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, pwm_id_table);
 

base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
-- 
2.47.3


