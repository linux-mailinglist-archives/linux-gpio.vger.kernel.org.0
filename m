Return-Path: <linux-gpio+bounces-28964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D53C7ABF4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B0784ECDF9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5975350A14;
	Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlkNNUK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8237D34EF16
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741338; cv=none; b=PRPIiwHpO/pk6WYk2wR3+XurfT0Ni4BaVZJk3u7A5VVwCoBsfpY2rbko73DJUgbWyX5Q/gYHSYOeBbBe4CDyY+GOTswgzDEbLtcij8xn3zQf0G7FL2btOfcy180yWuNzplf1/q4moRnrKMI8vJbyv5AEAtM0Wc0YnNCyjgwRLN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741338; c=relaxed/simple;
	bh=6d3UawdJbIGNpQ1r+t0ClfBpoFcfP4pXx/49sOBT1uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AICq8dmjZN89PIrd59ia61ndrwwTsTXWIzrDYCgr/oXTqsMG9V8ii4KcrE83DEqhmOw74hyaH/Blila3L6zHO6s464pQsOcY8F3vxl1pAZJ/E56wtNWYMht6JttyiEnXtFqSWxqostuRDRJWeGBGS4P0pdKVGfu/eGxl43Y95/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlkNNUK9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so13114865e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741333; x=1764346133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrSuBxCexGS87tmWsDBU0gBjhQ4SwSQ7srqw0RC4gYg=;
        b=LlkNNUK9VhuyQ8JHMYcDKCXpPybTzHs5PyofT7YOvnPGUH4WeT2UOawGElNjY+x9rW
         VWZdi6LIOixX10VFyJwkZAPDd+boNxavCi4aOEKQUAP1cZM0nVI56B+oKJr+xI75ft+y
         dGP5phaX2lF+43TzI9LE1V2U0/xPxXI11dOKpJA7YLPC4HIEhGjK5PAAdDXn6AEOVyoD
         B1JVg1h67obq9Icz0MU1KOQkzjHAkNj1817N6InA80pFnRNl28achBePtUD4kISnQmjv
         1gsbEOuvGOwozm+cy78pExm7ZF1PB7rB3gfQSQvGXIgZZCt9q2houzcIEvTXQ+Qyq0hq
         5H8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741333; x=1764346133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hrSuBxCexGS87tmWsDBU0gBjhQ4SwSQ7srqw0RC4gYg=;
        b=rcgVaqqnPPxXDWx4mWqUn3fFULu9tfW8yQnW0qpfNsVi7EEEkAmZ6OU3pNC+rQws10
         EKJ6MnLMfoPSq1JoYAlWfK9uMAh7vcyC29/Nvh4CX6UpBSihRnG0XOT+5Qvir98jpiOn
         20A+YZ66cBNbsV6T3KGPRHfpr+8ioNOpoyGUzDcnfjyI940AqUFUQq6SvAb/bvYmDZCD
         LTXVNNfxRz0R6jp29J0n1kiyGhmIumRs9Jap6eetE0QhOlPIMaT7lLetcfy9DRfvQhb9
         1GmuUPaA6tOPGs1+ZNX1O7B3nhttQ/cVQ2uShPbjuD7R7UzXsjJJqzI+nD8xCehBS1D3
         k8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXaDbDM0pmx/Yi52Otw+tvbYzPv+sDA/Frv6bwV9yTUKfbUI1PawLd3AE/pD8gFdVvIKtKz/rhclLlv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5EaA68Gz5zXx3Gjv83Dva8ABfVg1cELKcmqwmFH2HX17p6CW
	CFgwvbQpPepsk26jennnSGcGrXKUaJQL2bfnacmFF64utAqIcifRjeMY
X-Gm-Gg: ASbGncuY/D1QdScHBxREtqIFlROHFSMc0wB3lrUVTBVmgUeULrNrGbBaCrqlkmGs8ZA
	XOvgfh3DaBY4bc1AHcB7P/wfjpFHeXLNFQCFCbN/5kcy/CFCaobG+U1hxul9BktuKOBR6VTfsNs
	6Fxjhvhnm2MwiAy/btOlCKVGYYhDg1EhpqFNbkWUar5SPQdg3C+HM8KTVkOvEqIzemGjSCas9zT
	CtF9M+3Rd96byLGKZP6WjftEXk8IWZFDx5hRWUazXq6F40VRGxmmp2et12FZZQ5YFjL3ClWfS5l
	uEUOzafbDur8G27QYbQfgTtYfgI0xA5qgd1tLmNjKCIABPbkJo4tiZCJe5+FBxerQoyQHXyY9NA
	q0TVuumeTL9PkMiKnPnctho7mWSSncfH1zddJhAD6ilqC3J2AhxqHfAs9PA7Et9BAJffIOXL3tI
	fn7oTCLN+aaMYn+PtgRZIBoPpwa+EtIUddvNDHaQ/AphiG/ncqrrW07BqAfT9dm+vvikBhXNg=
X-Google-Smtp-Source: AGHT+IEsDBPrjJf1KURwoq8uXlilefcsQLW4264GczEDAFI2hLFsKc/qZ1a0TXfu+QIo/tHMJdFj3w==
X-Received: by 2002:a05:600c:4f88:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-477c01c0c9cmr28504395e9.26.1763741332734;
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 11/15] pwm: rzg2l-gpt: Add support for output disable on dead time error
Date: Fri, 21 Nov 2025 16:08:18 +0000
Message-ID: <20251121160842.371922-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch adds support for output disable request from gpt,
when dead time error occurred.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pwm/pwm-rzg2l-gpt.c   | 9 +++++++++
 include/linux/pwm/rzg2l-gpt.h | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index a0100e1b948d..0e158f677f01 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -84,6 +84,7 @@
 	 RZG2L_GTIOR_GTIOA_OUT_HI_END_TOGGLE_CMP_MATCH)
 
 #define RZG2L_GTINTAD_GRP_MASK	GENMASK(25, 24)
+#define RZG2L_GTINTAD_OUTPUT_DISABLE_DEADTIME_ERROR	BIT(28)
 #define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_HIGH	BIT(29)
 #define RZG2L_GTINTAD_OUTPUT_DISABLE_SAME_LEVEL_LOW	BIT(30)
 
@@ -502,6 +503,14 @@ int rzg2l_gpt_poeg_disable_req_both_low(void *dev, u8 grp, bool on)
 }
 EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_both_low);
 
+int rzg2l_gpt_poeg_disable_req_deadtime_error(void *dev, u8 grp, bool on)
+{
+	int id = RZG2L_GTINTAD_OUTPUT_DISABLE_DEADTIME_ERROR;
+
+	return rzg2l_gpt_poeg_disable_req_endisable(dev, grp, id, on);
+}
+EXPORT_SYMBOL_GPL(rzg2l_gpt_poeg_disable_req_deadtime_error);
+
 /*
  * This function links a poeg group{A,B,C,D} with a gpt channel{0..7} and
  * configure the pin for output disable.
diff --git a/include/linux/pwm/rzg2l-gpt.h b/include/linux/pwm/rzg2l-gpt.h
index adb5b9cfc8b3..f9365bbca57c 100644
--- a/include/linux/pwm/rzg2l-gpt.h
+++ b/include/linux/pwm/rzg2l-gpt.h
@@ -8,6 +8,7 @@ int rzg2l_gpt_poeg_disable_req_clr(void *gpt_device, u8 grp);
 int rzg2l_gpt_pin_reenable(void *gpt_device, u8 grp);
 int rzg2l_gpt_poeg_disable_req_both_high(void *gpt_device, u8 grp, bool on);
 int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp, bool on);
+int rzg2l_gpt_poeg_disable_req_deadtime_error(void *gpt_device, u8 grp, bool on);
 #else
 static inline u32 rzg2l_gpt_poeg_disable_req_irq_status(void *dev, u8 grp)
 {
@@ -34,6 +35,10 @@ static inline int rzg2l_gpt_poeg_disable_req_both_low(void *gpt_device, u8 grp,
 	return -ENODEV;
 }
 
+static inline int rzg2l_gpt_poeg_disable_req_deadtime_err(void *gpt_device, u8 grp, bool on)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_PWM_RENESAS_RZG2L_GPT_H__ */
-- 
2.43.0


