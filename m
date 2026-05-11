Return-Path: <linux-gpio+bounces-36533-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIJkBc7AAWrKjQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36533-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:43:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D03650CFD3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0297C306BDD2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 11:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83CA377003;
	Mon, 11 May 2026 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY4FAfIA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34B7371D1F
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499457; cv=none; b=nP9AJraO+EJICpQwN19lqKV/rLnkcfWNa51BL4GzA9qFAtu4h4ofzoHsF23MZWfd5x/TcBYt40AKPx5zRv/cBBizoQZpok8Hawr4jQf277hvef8SKZaqJT7kjzm8+EpwLl0Way6ZCs7YY1M6bQWRerZXue9yoeWpGDoBMmebyJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499457; c=relaxed/simple;
	bh=ULSxsA99WtOVeyQnnnWwi4Szn0714xC40QbXKSsl18o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tK8UzRwaJG9VgyhuxTSXKS8RaddjSTwvLZu2+a/uE0TVAXumdkbbrv2OLoxrQY3oc4Zog0/GlPkQ2h7yydtd1qZ7OHm5bSiXEA0hkh5EQGnBnazT/SIZVM+3dhmWuNaSSzWppwZNqiG+oL8eV8mBP0XwrUt4peW6aGm0vVTw5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY4FAfIA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a4113ab355so3871644e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778499454; x=1779104254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk/ryGv+w8weiU5QHQuVNcKF565C/DJ9GpiFb4c/EJM=;
        b=aY4FAfIAP5iGjoRSa+GybgKWTQ07w7xp7My0SKkySC4RGZqFV9+rb0bnnr5ZPMkKkd
         dwhcwQyeejK8WoP6aKyiS51LuSs0cuZut2OGqK5NS+lMA73B09XDzv/JCakxpN5SRA9a
         PnAjg7Ew/TNYkynei1bCg2oryDPQK0KRzy/wCR0qDOe3ccfzykDpunWQkfOvFy2MnE1B
         JG5gc7RzBwYyRQsC4ohhDvWGjoYeApI8xicJL5d7Y/ALL8GIazSDo6m5EpVuIDa4ovNw
         TeIrwHEypSd4HYN3W0BVexaKnYQoQjTV1VRHHG0AAEuijtBNLWHZsqYnQqGmXu2+3aSA
         Oa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499454; x=1779104254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pk/ryGv+w8weiU5QHQuVNcKF565C/DJ9GpiFb4c/EJM=;
        b=hi1wyZf/dJ+Ya83vWiymHTmbJVnE//tGW1L5hbV0MsyDszTsQruOj3zdrFYnxhG9H0
         dPwgsnVe7nz0n8OgTM0fn50kEFhGpDjKbMoIrBIQFishyPyKxP2X6Q61OtXQejlYTNJY
         tr0WEjO0uaOs4MnJ3sfuNJAArhjqG5HuzKEafeES8bi2cnrJYgPdT8oRZ+v3rI59BjLm
         9S+uh21P4f3p0z6wjsIxzf1BR1Oegvq0coMvUxx5dQWl54oErYFyQxk4NJQjnHqzncdI
         gCVaUkd2HI/juLjdTLXcxP3tyqZNkI/mOOFUYAaprKFvwqWfXGdUuBTjhYFOQbIfg/qt
         MvJw==
X-Forwarded-Encrypted: i=1; AFNElJ+r3B3DkDb+MmXHq1NGjkVS63ih+Duo1Vg3GllDi9Q+KX2avgsRYC8AxyAtJDv70QGZQz6s/4UdStVn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8uoado5DtIOG10/37CUwtnmxijs7sbJ3UqbnubkMcwlVG6O96
	WXzsKWWFnO3aBK9xadEtYS4+SdtAIHzj0GvnP9xFE6/L09+JLB4h3rzH7bG+plkp3VM=
X-Gm-Gg: Acq92OHCqA1DTtkk2cccqqzTJALgSsqgLO3lY91RNtXrY49my2nDbxyDaJ7DqJXG9H2
	jq7p8siCcUFQ8b4vnUrtFguOArVNC5sRLEphVjEO7BYJPitPwvDKnZncMp911RE2ebCJlT8YjKL
	hWc2nYVCnKyYSwkxnQcCUXWdpyGLLMhO1riZ6j1KhSh6sQNC3ihygFf2HW4j/xW+BsG7cj5/lLw
	I7jsXse5h+4eN2cB3RdYz4MCw/qi8yo45vXz9B8WDM5pTlfBjZjxwMVnICg7e7CeJiR4BZDXiCq
	rcHQoY88DrIlA0xA+Gj5K1EJMKXFfhOVRtw6AeJY2PtZaOQPCQv2RSJLRY8M+ZY2PZZI0x0KDk4
	tacWIGm4gCtsTe9z3xosQzA/GCBLaD2/IczhzdhsCoXLRi5pBjvzne2+fwAeKGsRptjbEFblsYd
	+BeAB4foeXRuLr4pvlX1oi8/XUQrs0RgmcEVVr0IFKkiThbg==
X-Received: by 2002:a05:6512:2252:b0:5a4:52d:4abc with SMTP id 2adb3069b0e04-5a8a949f19amr4681273e87.8.1778499453886;
        Mon, 11 May 2026 04:37:33 -0700 (PDT)
Received: from C-PF5D4647.localdomain ([147.161.186.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b1cfsm2593967e87.73.2026.05.11.04.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:37:33 -0700 (PDT)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v5 2/2] i2c: core: support recovery for single-ended GPIOs
Date: Mon, 11 May 2026 13:37:26 +0200
Message-ID: <20260511113726.49041-3-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511113726.49041-1-jie.i.li@nokia.com>
References: <CAMRc=MfMcEbQ3kkW3fMn-jzDoT2xdJWjp2xVBVsu7n683_5g9A@mail.gmail.com>
 <20260511113726.49041-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D03650CFD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36533-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nokia.com:email,nokia.com:mid,sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Currently, i2c_init_recovery() only assigns the set_sda/set_scl
hooks if gpiod_get_direction() returns GPIO_LINE_DIRECTION_OUT.

This logic fails on certain SoC controllers where open-drain lines
in a high-impedance state are physically reported as inputs. This
leads to a "deadlock" where the I2C core refuses to assign the
recovery hooks because it incorrectly assumes the pins are
input-only, even though they are fully capable of driving the bus
low for recovery.

Update the recovery initialization to use the new
gpiod_is_single_ended() helper. If a GPIO is configured as
open-drain or open-source in the firmware, it is safe to assume
it can be used for bus recovery, even if the current hardware
direction is reported as input.

Signed-off-by: Jie Li <jie.i.li@nokia.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c46147e3506..a3c33e804d47 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -445,8 +445,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		bri->set_scl = set_scl_gpio_value;
 		if (bri->sda_gpiod) {
 			bri->get_sda = get_sda_gpio_value;
-			/* FIXME: add proper flag instead of '0' once available */
-			if (gpiod_get_direction(bri->sda_gpiod) == 0)
+			if (gpiod_get_direction(bri->sda_gpiod) == GPIO_LINE_DIRECTION_OUT ||
+			    gpiod_is_single_ended(bri->sda_gpiod))
 				bri->set_sda = set_sda_gpio_value;
 		}
 	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
-- 
2.43.0


