Return-Path: <linux-gpio+bounces-31010-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCpZC5N5c2kfwAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31010-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:37:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844F76569
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 14:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 059C63033ABC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 13:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2862A2FFFB2;
	Fri, 23 Jan 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0iv38m3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE4D38DD3;
	Fri, 23 Jan 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175391; cv=none; b=C6xIX/SKH/unxmu8IvU8lCOs0A7kKEuZQlWd1FCMM26zT1+Sod7CoiuqvDk7Jea8O+5KdmLNBYvFLXI10IsANclreL/RW23ukCCNg5Q9LK2CprkhirkWe5wjF/ZtHPWbBqKZ4A7wdsPMxCt6wgXuPPvt1JuQimO/Ik1Fx85cTFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175391; c=relaxed/simple;
	bh=uhsda+CucBOaR/Zt91EPvftxu2dEouhHw7HKe7tHy3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vi3EvjEdoJW+Xw53P4DUd++0RZR8JmX5+2gSwx9NkJmOZ21CDZv/1g+d3AIXdS15zuFBTdVC4eP5BJwP6Df3x8KeZ7ogCkmtIKIN2yjwujD2r8CKEYceNoyJq1czxoGWf537aI+6TE/y+R/Atqd8xYmADmExAwdirvej/pKFkRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0iv38m3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29DFC4CEF1;
	Fri, 23 Jan 2026 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769175391;
	bh=uhsda+CucBOaR/Zt91EPvftxu2dEouhHw7HKe7tHy3w=;
	h=From:To:Cc:Subject:Date:From;
	b=u0iv38m3kFUKEwKyI28S8Nku3NfDBEhXUPyBRS83+HWfZNY4cBQHARiqlk0VjzUWW
	 oncQFosuvvhbe6Upp2gclgr5bi+W/RkBCnFuO9YNjJmcxI8CSTxJ9fciM6hN7ZPo+r
	 sLQ0CPjHRDSiv5hbZVLImE38gqq0KpYEsSxuAMSqISDwMbeqgsasVNaVQ4pXFfiGkz
	 Qv9JOUv1xRF86Rw0koEEDwy307+c5dH/iiDsAyLHWjaoT3jfqeWXsbezlREb81fCgE
	 vgg2x/TcTKcTcRgCOyqxszsNH+iC21cw2blSza4dGwxKYOMid0F3c2o7/cUt/Djopo
	 5Dyc+z21Uqh0g==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	broonie@kernel.org,
	will@kernel.org,
	grygorii.strashko@ti.com,
	ssantosh@kernel.org,
	khilman@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] gpio: omap: do not register driver in probe()
Date: Fri, 23 Jan 2026 14:31:56 +0100
Message-ID: <20260123133614.72586-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31010-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4844F76569
X-Rspamd-Action: no action

Commit 11a78b794496 ("ARM: OMAP: MPUIO wake updates") registers the
omap_mpuio_driver from omap_mpuio_init(), which is called from
omap_gpio_probe().

However, it neither makes sense to register drivers from probe()
callbacks of other drivers, nor does the driver core allow registering
drivers with a device lock already being held.

The latter was revealed by commit dc23806a7c47 ("driver core: enforce
device_lock for driver_match_device()") leading to a potential deadlock
condition described in [1].

Additionally, the omap_mpuio_driver is never unregistered from the
driver core, even if the module is unloaded.

Hence, register the omap_mpuio_driver from the module initcall and
unregister it in module_exit().

Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
Fixes: 11a78b794496 ("ARM: OMAP: MPUIO wake updates")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
In addition to this fix, the omap_mpuio_device (struct platform_device) should
not be declared as global static, especially when their backing memory can
become invalue due to the module being unloaded. Devices are reference counted
and should be allocated dynamically. This needs a separate fix.

Besides that, the whole construct seems a bit questionable and I'm not exactly
sure what should be achieved by registering the *same* static device everytime
probe() is called for the omap_gpio_driver.

However, for the purpose of avoiding the described potential deadlock in
combination with commit dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()"), this patch only addresses the driver registration
issue.
---
 drivers/gpio/gpio-omap.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e136e81794df..8db71a2db9ff 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -800,9 +800,7 @@ static struct platform_device omap_mpuio_device = {
 static inline void omap_mpuio_init(struct gpio_bank *bank)
 {
 	platform_set_drvdata(&omap_mpuio_device, bank);
-
-	if (platform_driver_register(&omap_mpuio_driver) == 0)
-		(void) platform_device_register(&omap_mpuio_device);
+	(void)platform_device_register(&omap_mpuio_device);
 }
 
 /*---------------------------------------------------------------------*/
@@ -1575,13 +1573,24 @@ static struct platform_driver omap_gpio_driver = {
  */
 static int __init omap_gpio_drv_reg(void)
 {
-	return platform_driver_register(&omap_gpio_driver);
+	int ret;
+
+	ret = platform_driver_register(&omap_mpuio_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&omap_gpio_driver);
+	if (ret)
+		platform_driver_unregister(&omap_mpuio_driver);
+
+	return ret;
 }
 postcore_initcall(omap_gpio_drv_reg);
 
 static void __exit omap_gpio_exit(void)
 {
 	platform_driver_unregister(&omap_gpio_driver);
+	platform_driver_unregister(&omap_mpuio_driver);
 }
 module_exit(omap_gpio_exit);
 

base-commit: ed1ac3c977dd6b119405fa36dd41f7151bd5b4de
-- 
2.52.0


