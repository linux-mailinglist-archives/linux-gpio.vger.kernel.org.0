Return-Path: <linux-gpio+bounces-4453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02187FC88
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 12:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3A91C2226F
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 11:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244FA7E572;
	Tue, 19 Mar 2024 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="ZqxUXM9e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75C4F8A9
	for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710846468; cv=none; b=ozT6QOeiu6wPSekV4IG+5XV1b7a4VnsotQuPfZzKbAfdRBKez2io25A9ONfqwEphwd+FqfZvbeWt5ZxkrI0EZJ6mITGRHdAOyq7kq0bqYS8RFilFfxSVs1EuvvC8Ff8elHnvyaQpC7X6ZnqE4FwDNeKL9G9BukRma7EX51Dtmgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710846468; c=relaxed/simple;
	bh=inKup3D/8dipB+Qu0lMvoshz+kgaaw/op0vTkz2/AG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sMYc3skX7nSD7boCeIQreZcWam4ac7b+0L1H78Zy4clYRkOlrD/Lvctep/aBKpXQnaN2CdzYKPTnGXDbATO7rPq6fQcqTx//bQB7s/Ejxc+iw495HZRuGvreWur6PK0Phuh305WeTg7dE7y+Pfh7COI5j5oRoj4p4WndFEJn/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=ZqxUXM9e; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/V3VUchtkJBjrXmDOTYW7qyOyeFhpgq7uaPdWRkylas=; b=ZqxUXM9eXpusNSP/1jmA9i9xk3
	5sjk6dNajeOWc54iUUcUnN0HQtBo1poe5oA9Fu/5d0W9kUqovh6BxBpZejhLv7Pi1A3v5PumtgfDn
	ZFjkV3nWtlHR8Ha+CtL2i1hqjiErFSDMFtoZWBVrf2TLrfYCS3lvDqorkwwyuWk52jkc=;
X-Preliminary-Spam-Score: -2.0 (--)
Received: from 86-88-12-114.fixed.kpn.net ([86.88.12.114] helo=dottie)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1rmXJn-000nto-1q
	for linux-gpio@vger.kernel.org;
	Tue, 19 Mar 2024 12:07:43 +0100
Received: from matthijs (uid 1000)
	(envelope-from matthijs@stdin.nl)
	id 40d99
	by dottie (DragonFly Mail Agent v0.13);
	Tue, 19 Mar 2024 12:07:42 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Haojian Zhuang <haojian.zhuang@linaro.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-omap@vger.kernel.org,
	Matthijs Kooijman <matthijs@stdin.nl>
Subject: [PATCH] pinctrl: single: Fix PIN_CONFIG_BIAS_DISABLE handling
Date: Tue, 19 Mar 2024 12:06:34 +0100
Message-Id: <20240319110633.230329-1-matthijs@stdin.nl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
References: <Zflxi8SCzzouP9zW@login.tika.stderr.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl-single driver handles pin_config_set by looking up the
requested setting in a DT-defined lookup table, which defines what bits
correspond to each setting. There is no way to add
PIN_CONFIG_BIAS_DISABLE entries to the table, since there is instead
code to disable the bias by applying the disable values of both the
pullup and pulldown entries in the table.

However, this code is inside the table-lookup loop, so it would only
execute if there is an entry for PIN_CONFIG_BIAS_DISABLE in the table,
which can never exist, so this code never runs.

This commit lifts the offending code out of the loop, so it just
executes directly whenever PIN_CONFIG_BIAS_DISABLE is requested,
skippipng the table lookup loop.

This also introduces a new `param` variable to make the code slightly
more readable.

This bug seems to have existed when this code was first merged in commit
9dddb4df90d13 ("pinctrl: single: support generic pinconf"). Earlier
versions of this patch did have an entry for PIN_CONFIG_BIAS_DISABLE in
the lookup table, but that was removed, which is probably how this bug
was introduced.

Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
---
 drivers/pinctrl/pinctrl-single.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 19cc0db771a5a..c7a03b63fa812 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -554,21 +554,30 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 	unsigned offset = 0, shift = 0, i, data, ret;
 	u32 arg;
 	int j;
+	enum pin_config_param param;
 
 	ret = pcs_get_function(pctldev, pin, &func);
 	if (ret)
 		return ret;
 
 	for (j = 0; j < num_configs; j++) {
+		param = pinconf_to_config_param(configs[j]);
+
+		/* BIAS_DISABLE has no entry in the func->conf table */
+		if (param == PIN_CONFIG_BIAS_DISABLE) {
+			/* This just disables all bias entries */
+			pcs_pinconf_clear_bias(pctldev, pin);
+			continue;
+		}
+
 		for (i = 0; i < func->nconfs; i++) {
-			if (pinconf_to_config_param(configs[j])
-				!= func->conf[i].param)
+			if (param != func->conf[i].param)
 				continue;
 
 			offset = pin * (pcs->width / BITS_PER_BYTE);
 			data = pcs->read(pcs->base + offset);
 			arg = pinconf_to_config_argument(configs[j]);
-			switch (func->conf[i].param) {
+			switch (param) {
 			/* 2 parameters */
 			case PIN_CONFIG_INPUT_SCHMITT:
 			case PIN_CONFIG_DRIVE_STRENGTH:
@@ -580,9 +589,6 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 				data |= (arg << shift) & func->conf[i].mask;
 				break;
 			/* 4 parameters */
-			case PIN_CONFIG_BIAS_DISABLE:
-				pcs_pinconf_clear_bias(pctldev, pin);
-				break;
 			case PIN_CONFIG_BIAS_PULL_DOWN:
 			case PIN_CONFIG_BIAS_PULL_UP:
 				if (arg)
-- 
2.40.1


