Return-Path: <linux-gpio+bounces-33442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C30nGfLmtWnj6gAAu9opvQ
	(envelope-from <linux-gpio+bounces-33442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 23:53:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B6028F650
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 23:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82384301A3B0
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 22:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9878234F49F;
	Sat, 14 Mar 2026 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnfmHR4o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B343267B07;
	Sat, 14 Mar 2026 22:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528813; cv=none; b=CRBU1+zi1nl2ENQQTpuMkyjzQXZmLS9EUl7vbKs53oR3d42bujRtdN+BF4q56d+gzPQ6wzazDrDC1Jk14I1kHZfUmXT/3wsPlYDctUgTaUOxxXxW72AM2TnJLM86Kvk76rQQxzj5n9MTU+craImPp/xeuIwBGO5CW8c+CW1GMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528813; c=relaxed/simple;
	bh=r18FvCyxLWfveJGiN0KHoA0IIwaSpvTnPS4qX2UT8DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CJo65KU9qd2/ByrjhImE5QoUhIMU0jT6jTwXfjDzgMbABSNznJpwsLQech0yyO3tEipQygGoLC1hC2e8dirhsSnQXJpEktAqxX+qlixK+khts2k7y4rAPxxa/tKkxTBr1IqZRXbik7d2O2CgIFShUERbYOunadABHndY0uQtGuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnfmHR4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8795C116C6;
	Sat, 14 Mar 2026 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773528812;
	bh=r18FvCyxLWfveJGiN0KHoA0IIwaSpvTnPS4qX2UT8DU=;
	h=From:Date:Subject:To:Cc:From;
	b=DnfmHR4oH65Ww6KB7yFz2LwIXnKPm1s6XAkLI93qPYeRCS5RZL8KCujv+SILdmUuS
	 j1KfBLJFV5J6jihoMXorM4q4gDS1GDrWrxBQTEzpVDfyI+s+KzxIyxfYxFez1G7E6h
	 13E4miAjbCJDAaYxAPbb1DrZLsTaGmP28s6QzZMuMpQTJvMyzjPh7Fc/gvvSaXSF8Q
	 XrZ0WDto3SUQd0Bq3Wwyq5qjh+o+0SI8xJRO/+WKNCVjmC7FO5Q0WG9b1aTuB2aMdj
	 7UDwfcSEVtCEIwAOpQX9cad6R3mw5nrGjnum5eB0lZiWXDP7YvyQWrfFBBZ2QyxDlo
	 n+7Nt8JMA0MuA==
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 23:53:27 +0100
Subject: [PATCH] mfd: arizona: Drop legacy irq_gpio handling
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvQCqOuEi0kx5pFWiNEJN09a
 fkW/2dIJEwJxiqD0MWJYyjQdQXLZsNKyK4YGtUY1eoOd+/QCj8xWGQ50XjqPel+sGqAUh1Cnu/
 /OM3v+wHYxAX2YQAAAA==
X-Change-ID: 20260314-mfd-arizona-irq-6fe7fe179a09
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33442-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1B6028F650
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It turns out nothing in the kernel defines this platform
data entry so just delete it along with all code handling
it.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/mfd/arizona-irq.c         | 37 -------------------------------------
 include/linux/mfd/arizona/pdata.h |  5 -----
 2 files changed, 42 deletions(-)

diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
index 544016d420fe..43d188a72ee2 100644
--- a/drivers/mfd/arizona-irq.c
+++ b/drivers/mfd/arizona-irq.c
@@ -136,21 +136,6 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
 			dev_err(arizona->dev,
 				"Failed to read main IRQ status: %d\n", ret);
 		}
-#ifdef CONFIG_GPIOLIB_LEGACY
-		/*
-		 * Poll the IRQ pin status to see if we're really done
-		 * if the interrupt controller can't do it for us.
-		 */
-		if (!arizona->pdata.irq_gpio) {
-			break;
-		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_RISING &&
-			   gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
-			poll = true;
-		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_FALLING &&
-			   !gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
-			poll = true;
-		}
-#endif
 	} while (poll);
 
 	pm_runtime_put_autosuspend(arizona->dev);
@@ -350,28 +335,6 @@ int arizona_irq_init(struct arizona *arizona)
 		goto err_map_main_irq;
 	}
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	/* Used to emulate edge trigger and to work around broken pinmux */
-	if (arizona->pdata.irq_gpio) {
-		if (gpio_to_irq(arizona->pdata.irq_gpio) != arizona->irq) {
-			dev_warn(arizona->dev, "IRQ %d is not GPIO %d (%d)\n",
-				 arizona->irq, arizona->pdata.irq_gpio,
-				 gpio_to_irq(arizona->pdata.irq_gpio));
-			arizona->irq = gpio_to_irq(arizona->pdata.irq_gpio);
-		}
-
-		ret = devm_gpio_request_one(arizona->dev,
-					    arizona->pdata.irq_gpio,
-					    GPIOF_IN, "arizona IRQ");
-		if (ret != 0) {
-			dev_err(arizona->dev,
-				"Failed to request IRQ GPIO %d:: %d\n",
-				arizona->pdata.irq_gpio, ret);
-			arizona->pdata.irq_gpio = 0;
-		}
-	}
-#endif
-
 	ret = request_threaded_irq(arizona->irq, NULL, arizona_irq_thread,
 				   flags, "arizona", arizona);
 
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index f72e6d4b14a7..20118bad869a 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -188,11 +188,6 @@ struct arizona_pdata {
 	/** Haptic actuator type */
 	unsigned int hap_act;
 
-#ifdef CONFIG_GPIOLIB_LEGACY
-	/** GPIO for primary IRQ (used for edge triggered emulation) */
-	int irq_gpio;
-#endif
-
 	/** General purpose switch control */
 	unsigned int gpsw;
 };

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-mfd-arizona-irq-6fe7fe179a09

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


