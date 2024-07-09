Return-Path: <linux-gpio+bounces-8151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A392C4BA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 22:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B32FB225BB
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 20:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCF1150981;
	Tue,  9 Jul 2024 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AbY2fAmZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-211.smtpout.orange.fr [193.252.23.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9A144313
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720557546; cv=none; b=KsBmQPqI54Nk67eXv5/bOF8zyNr/FqmrYAbNb8SWYykHn7ohqgZzZcoy2TaT/KppXZJEguYcDa746Q7RB6yotW6++bE3WDfIZsYuDnJdm3CKyJdg32zvdtLwo0Px7OWq005JK65fsmdBHJlRa+hzkj20776K6de7VSS9jS+Rn/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720557546; c=relaxed/simple;
	bh=llFZ5aPJDx2WrJXH1NObb7neLFOzkO7dYUOOKAZtZ0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdcupyYy+yOFt5776QeivKxh5QKLy//23KkPz+4rsbrPiyKuIv1GztmZSscidUzrroNPVPEZWR43gapw8tHHg6TxJbeIT8t5eEtl64GVv2T7PQP4ECIDm2Y0kgn5tr8QBIpP5NZ+3s43SZI/8D/4/lP+MLwzkursZ1hIAG9MlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AbY2fAmZ; arc=none smtp.client-ip=193.252.23.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.. ([77.130.249.53])
	by smtp.orange.fr with ESMTPA
	id RHavsh9C6phyvRHazsZbXS; Tue, 09 Jul 2024 22:37:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720557473;
	bh=+me7JYfSesC2CWqSWLCbwjuqC3c9WAmwPVCVuqT+erw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AbY2fAmZ6eUgGUwipFLztgOcs6AFrYXSfOah4P30/5H6N4YZU83PTd3gmNVMuXs9x
	 KEzYhrhxb8m2TfNUZeAuhD+LzM5t0bmOj9ZRJlE4KTz7UK8HxHZOsHSAQUMEdpwVDA
	 Xame6nsUg851+J87XF9amVcXLb+/CCasTdxZKvyJZrBWF+eHP+SnOf5HZYLjxlLF+G
	 SOjkkv5aXHlOBu32vanOoGo7ydg/qr3qXHjWbnrN+oVrhzm4flUmNJhSqymX3uYCSY
	 T4J3Ny5tiPs8nA1dlZnFlG+TJH3gG2sL/BV7sj7j6MEpp/OzhskrjDO7DcTaNFcIh4
	 2Como0q/yAY0g==
X-ME-Helo: fedora..
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 09 Jul 2024 22:37:53 +0200
X-ME-IP: 77.130.249.53
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linus.walleij@linaro.org,
	lokeshvutla@ti.com,
	nm@ti.com,
	robh@kernel.org,
	tony@atomide.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/3] pinctrl: ti: ti-iodelay: Constify struct ti_iodelay_reg_data
Date: Tue,  9 Jul 2024 22:37:44 +0200
Message-ID: <40d6e67ab4e73d2cbe7ca0060ac27afc894fc415.1720556038.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
References: <cover.1720556038.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct ti_iodelay_reg_data' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  17259	   1788	     16	  19063	   4a77	drivers/pinctrl/ti/pinctrl-ti-iodelay.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  17355	   1692	     16	  19063	   4a77	drivers/pinctrl/ti/pinctrl-ti-iodelay.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 451801acdc40..65f9439d0d5b 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -783,7 +783,7 @@ static struct regmap_config dra7_iodelay_regmap_config = {
 	.max_register = 0xd1c,
 };
 
-static struct ti_iodelay_reg_data dra7_iodelay_data = {
+static const struct ti_iodelay_reg_data dra7_iodelay_data = {
 	.signature_mask = 0x0003f000,
 	.signature_value = 0x29,
 	.lock_mask = 0x00000400,
-- 
2.45.2


