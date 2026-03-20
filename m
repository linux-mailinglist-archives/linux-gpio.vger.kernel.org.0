Return-Path: <linux-gpio+bounces-33932-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I1xIXxivWlF9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33932-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 16:06:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ACE2DC4B1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 16:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BD9D3028E8E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3663A875E;
	Fri, 20 Mar 2026 14:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkTjX55j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422D28A3F2
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018604; cv=none; b=kE3LjU37Ozj1D+Sf8YxlE1wA40Wj7B0/meJTqrA0Aw0misbeGZGd5OJ9Q0wccZJtUJwgCvoVICb+3Mrt5RJs0hOuTuDrnJ1ffNYmXnM5HDeO6pUMwloUffJH7ZJ8YKfjw9yItSTCSOEpQeNUpqmpdy9kC21Yj5zwCDYRQDG9DoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018604; c=relaxed/simple;
	bh=dTEF6bdzJt2V7+xYx3YhBkPgCvZNNJYAeLwsU1oWSB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P1C1v9HgIgf/jvYg6GHfK/lyQckiNypu2xIemN3BRZ3lWxnRyT2B3WlOTyj/FLLKcQ6nJuQOSbha4ahVy76p4yIF0plM+KpAatd9nodpETUHIGX4aCkzCFS+v1m5eEVnSwtHg5p5J+dzsuICQKvXJqg1PFMlyeZQzirlRCrv6lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkTjX55j; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b07069e2efso11255915ad.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774018602; x=1774623402; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFetc6x2soh6YI39fkTNs8ZpWw8wHx4vhOBrBQajGIw=;
        b=fkTjX55j/fO7t4zMkgv6Hamw/Vzoov8IqIFi/GrBEGG8sF0HhT7Oto4o8s9psKUTr9
         g1NfBx9jnuWJOCG4VXowgn69lhwLCAkGS8zz5eH6ftyJCGgA+/Edt51D/JYOCFPRwByV
         tbf0N5V7pdaxBK/L/NZH7IBjgp94AxAAn8XMIMpb3hN8kKUrU9R2dxmpef/P8ypoVMyA
         7ufy+TuTsmJufSBEM4cxDrmdDrCGHmbwH+++lpRkFkj7fkzD3NT5x2OLSP6SYxZYH+td
         LObjY9NaKRswE1ObZemQOjD5drIMaiRRKFXY+XLI2ce7xoGuRC9j9vXbWHfKUToEnIIv
         ZqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018602; x=1774623402;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFetc6x2soh6YI39fkTNs8ZpWw8wHx4vhOBrBQajGIw=;
        b=Sp5OmEocwUvUoFUCdK1lqC5RlK/ftgJocphYaCWA4emcUbNRlj79FOrlSiUo8mBty3
         2d+U3XEXRgvjFkVtVdIzc0V0H1vZYr8hgDgCD0zXuvEg1+8nJTCkOAiSYEWmDAT3ywh/
         tYEibtOPfmhw0tSsTTMI+lpgN511GElLCJlsD3nkRK4VvPtvhwjAzn2vGjepYdNq3Kyn
         qbU2okeaXNhej6Zk6hx2EZ3jhiJMTsb6BvXhq+5IdqmgwDNsmDXYbqU08AqPgDtPrK9i
         y7rJbFOg6jBBb+/hu6/lSm6Zwed2I3v9bUbvGZ84YytTU0+4nMWLWCPkSAu0zg1XF6ad
         lBMQ==
X-Gm-Message-State: AOJu0YxblYxvM0+X1BwsAZWlj8Sn7zKUy8FhnJbYqfxkyBmTxU8alFvy
	kh93ZMeZATw0W/OnlONCYqzUKlMjpy3/x9DM3k14NeW1GSx69Jac9FjQ
X-Gm-Gg: ATEYQzx1dU+5qZbxduQ2BzfRRoLRUkfXYzXBYlBEk0T4Qc8cXq3OvJbqMVhCjC3aawY
	beeAFbfvFPGs0+wVinqzqnp+wqTFlSDDbLc6YYYcUfjdky5ipLsoHnZOdkdb/nupSemvsf6uFaI
	9nd+gQGC2aY63l4ynj5WC0geuLAm5DGptFUSTr3R+eSXwUu7B7W622wayBFRyGr7oVpv9SpfdMt
	F7hS31fj8xGOWms9r+0bpiEJgzObGno2Wn1Kb90IAOWWYmcAZce1YGJSe2rxorwInntuiMq5fo+
	GAF/hT1mm8yIZUgcAkOt581Xoho0CDGNOYnZMgu8hr1uCAtzs3f++O0Vfp0KFOBleqb/39yh890
	GhPuXKLc1J4fe7AnRbTdn9oPOxTL1EYsx2WI8iDtF8iv98k16CE8gEiVHXjE+m7niIeHGtTr/H1
	r+0w4x+uvxQmJYbIsAyE4fhRO3DkOuPYW3PRSd
X-Received: by 2002:a17:903:2449:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2b082724e99mr29516015ad.19.1774018602048;
        Fri, 20 Mar 2026 07:56:42 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354bce3sm32099775ad.32.2026.03.20.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:56:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 20 Mar 2026 22:56:38 +0800
Subject: [PATCH] gpio: qixis-fpga: Fix error handling for
 devm_regmap_init_mmio()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-qixis-v1-1-a8efc22e8945@gmail.com>
X-B4-Tracking: v=1; b=H4sIACVgvWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMD3cLMisxiXbPEpCQj05TUREszSyWg2oKi1LTMCrA50bG1tQCdT0f
 OVwAAAA==
X-Change-ID: 20260320-qixis-6abb25dea969
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774018600; l=1201;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=dTEF6bdzJt2V7+xYx3YhBkPgCvZNNJYAeLwsU1oWSB8=;
 b=FpMb8FisNCCxEePHeBXcUNiYu+dd27SRy9R57Lwaz2+LMCO63yAW/Qa7xNSKte6fBfvsocbe8
 zHVLgQAQoGaBYMRwaEnV+hf/Dt/a17aoMNTeTFMzJ6wfMoZTPfSarEh
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33932-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30ACE2DC4B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

devm_regmap_init_mmio() returns an ERR_PTR() on failure, not NULL.
The original code checked for NULL which would never trigger on error,
potentially leading to an invalid pointer dereference.
Use IS_ERR() and PTR_ERR() to properly handle the error case.

Fixes: e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/gpio/gpio-qixis-fpga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
index 6e67f43ac0bd..3ced47db1521 100644
--- a/drivers/gpio/gpio-qixis-fpga.c
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -60,8 +60,8 @@ static int qixis_cpld_gpio_probe(struct platform_device *pdev)
 			return PTR_ERR(reg);
 
 		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
-		if (!regmap)
-			return -ENODEV;
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
 
 		/* In this case, the offset of our register is 0 inside the
 		 * regmap area that we just created.

---
base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
change-id: 20260320-qixis-6abb25dea969

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


