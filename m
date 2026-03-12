Return-Path: <linux-gpio+bounces-33228-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP5ZNL18smkcNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33228-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:43:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2026F178
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A4BA3028B54
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2BD388E58;
	Thu, 12 Mar 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="iGqgAF3E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473838736B;
	Thu, 12 Mar 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305009; cv=pass; b=HLx62Fiu3IC0DAiN29y40ezaaly3yuZ4Dtyojmdy58bEERgRcoNLxrZHiY7rvGKNfKDaFH1PVVrj+D7Hj1Ev4NwDoPAiZIOl3RU5+ZOz8TJNvFiBYGTgw04AzwCZMmH0zMNfZoqiXqLthTELX9nHLjLkGRAMbSYhaInq+g5xxRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305009; c=relaxed/simple;
	bh=f+PIqqu6oVpYXE4fiunpYM9+RC9U5ZQdIJciIwi3PyY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HPvxyE+TT2ekMJzU/zL1doZ0diF1xVpVVCZ7togDDzJkyzh8HFAlHnyTKrEf0qeF0lka26I1qMpVVg9UAZyUNQgWaOhIg2ssGzAwipveYCDQgWKAO2w6G34P9e/sTfKzAeH8hs8FQNdinKHm+bljmLL9HC9m+u7UyUnhmr4IGP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=iGqgAF3E; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1773304989; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F5hSwpNZcQtPKx7PQE4uUw6GIsAXX1/M4MwaBj7AJ8XzgPjtg/nW1GQ3DCbHGYuda2RvWQHaKnVoAgvLUhf4RViwXDOH8++InsmhJGcIdus2Pw6Nqx6Tg0yD7hCowC3rHtRo3z7lBVnVJnQjL73IayheJ/KOXnJXegTVi3AJYCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773304989; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uQj6ZycW4k8NABW6ZEGD6JBqWI4xAvj29ErMyDzsZ7k=; 
	b=m2l6mmAxbSZ6YrZB5dsSZ/LhWb93JExKcXB0CoLvvqTJPEs9v0Dm3AXo8bPzI/gtm6ki63XzJDz0ZKmSEKBHztal2mjNExQSon0cBFiQsxesCdZLWh6uDabGPDPF4zX/7YhmqVqOo3bx4JLl3A2bgsWGrx6PlmReDceuXsXrTko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773304989;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=uQj6ZycW4k8NABW6ZEGD6JBqWI4xAvj29ErMyDzsZ7k=;
	b=iGqgAF3ElbsFNoBBYvYlk+7yISCfZose0UO9SS4fheago7uHeddrXBQot6fi8PXw
	aHkloALKzy/Djrmzef/fbzPgRvjeCI+RKyGUb5QaCES88o08X3hyckMyXvv6INm73IY
	K8GNxEV5a4iTihTzxZcKAjv0xoF91jwrm+RWOLB0=
Received: by mx.zohomail.com with SMTPS id 1773304988251269.8455882910689;
	Thu, 12 Mar 2026 01:43:08 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] gpio/pinctrl: spacemit: Add GPIO pin configuration
 support for K1
Date: Thu, 12 Mar 2026 16:42:41 +0800
Message-Id: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqAIBBA0V+JWTfgA3r9SrQoG20IVDQiCP89a
 XkW976QKTFlmJoXEt2cOfgK2TZgjtU7Qt6rQQnVCS0VnhJd5ICZLjTBW3ZoxdBrGhVtq4EaxkS
 Wn386L6V8uku2DGQAAAA=
X-Change-ID: 20260312-k1-gpio-set-config-f0873e92ebac
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304980; l=1284;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=f+PIqqu6oVpYXE4fiunpYM9+RC9U5ZQdIJciIwi3PyY=;
 b=5zW2jnVH1u6pfK3Opx9MYniDsQj3a+gJXL+kgsic5po1fkwmnfqQDhiSxKdD/08ykbVl2Wnfq
 33jyxJufWOAAXHu/XQ/JCfVvmzJZA3UMs2Zh+nGhnJcwaO/FuMdCroW
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33228-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pigmoral.tech:dkim,pigmoral.tech:email,pigmoral.tech:mid]
X-Rspamd-Queue-Id: E9A2026F178
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This add GPIO pin configuration support for the Spacemit K1 SoC. Some
use cases require configuring pin attributes like pull-up/down when using
GPIO lines.

A practical example is the SD card detection pin on the Banana Pi BPI-F3
board. Since it lacks an external pull-up circuit, the pin must be
configured with an internal pull-up to function correctly. Such
configurations can be specified directly in the devicetree:

    cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

To address this, add the set_config() callback to the gpio-spacemit-k1
driver to enable pin configuration through pinctrl, and modify the
pinctrl driver to return -ENOTSUPP instead of -EINVAL for unsupported
parameters, allowing the GPIO subsystem to gracefully handle them.

---
Junhui Liu (2):
      pinctrl: spacemit: return -ENOTSUPP for unsupported pin configurations
      gpio: spacemit-k1: Add set_config callback support

 drivers/gpio/gpio-spacemit-k1.c       |  1 +
 drivers/pinctrl/spacemit/pinctrl-k1.c | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20260312-k1-gpio-set-config-f0873e92ebac

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


