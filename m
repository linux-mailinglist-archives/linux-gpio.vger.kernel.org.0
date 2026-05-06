Return-Path: <linux-gpio+bounces-36275-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCGGNigT+2lLWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36275-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:08:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7E64D9232
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B694C3031F49
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78A93FD15D;
	Wed,  6 May 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNXkQku1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A03402BA2;
	Wed,  6 May 2026 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061491; cv=none; b=W61GQ4AcViBIpNEw4YRRbk5Yjk9jY0Xdb7/gptpGQ3PZxCI3v0pQIuuerqtW4qwBQcBI9ULSG65xHrtU9rN+J3CjxClqh2npslhmo+WySEArs4CW+p3iZfKWt+wVEeanq/afylfxe53UrMEsMJ7OmRXTvd8vE+A9+JQo8U9qSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061491; c=relaxed/simple;
	bh=nS+w53mgZDDz5/WHgJtZUFy3p+Gm1mncA2Mp8hJAH74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YV8gxFaSVr+rQSMW/AYYT7DrAGy9RJDnusj/PPRZ62DfzK2G4iGN0/N+A8ZtnpbQZTid9oFnc1Feav+C+YMfTV4BK1ZNvv9K+SbySw0px3Za6BHJZAYH3Fsw+cD62inqSlk1KN574/1g0D4Kg5JUZxpEr8pWC4JRadcitFpaM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNXkQku1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC201C2BCC9;
	Wed,  6 May 2026 09:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061490;
	bh=nS+w53mgZDDz5/WHgJtZUFy3p+Gm1mncA2Mp8hJAH74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XNXkQku1uHHdKKAtHRjXNdS25Uae4Aqi3pNq5aNNDiyT2Om7uGSnVXCw8dOCAWQKh
	 bKtCO3LCuYUICNBzWGpN9QXT5o7YJPcFe/eZyh02x03CuhfSEVLNlhPmsGCQAULxTk
	 7Xa8mbzQjPaAXrDIeq5A8hGur2yo+iDkeBzIvuR/3U+50vJ/ywNyfr4YfFznDmIDEq
	 Up3hQJpqxC8Jn1WWogcn5xF2FTI9kEnOT762Z2PUEOghRsbpW3DE7IhTGKAQLurCYb
	 zb233IsLBDidkAwMIQ6YZILbIS/5bOjpS3ZVYZ7g94WoNN3geDR/WHRCm7S5oevW0l
	 vuKKXk8jx33SQ==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [RFC v1 1/4] pinctrl: generic: change signature of pinctrl_generic_to_map() to pass void data
Date: Wed,  6 May 2026 10:57:39 +0100
Message-ID: <20260506-impotency-untagged-2b3d46b57039@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=t1tswcXW1xGoS+RayKsRaGJ8HHS0FkJbWLql/CcOziI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSaXfFPfffymmOxen8mpidxeynlPvk6YWfI24PrhW 60m13XudJSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi17YzMvxXXe7/pf72wa03 T0jExSs8/PpVSzVs7w9l5ec+R7J5ymYx/NOM/ta08MfmounxD0rWsbS/mfBd+Opf15pDag6Hdj+ bvIEVAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DC7E64D9232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36275-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

From: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         | 6 ++----
 drivers/pinctrl/pinctrl-generic.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 83f2d00c732e1..5d99fef27657f 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -171,8 +171,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
 			   const char **group_name, unsigned int ngroups,
-			   const char **functions, unsigned int *pins,
-			   unsigned int npins);
+			   void *data, unsigned int *pins, unsigned int npins);
 #else
 static inline int
 pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -188,8 +187,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       struct device_node *np, struct pinctrl_map **maps,
 		       unsigned int *num_maps, unsigned int *num_reserved_maps,
 		       const char **group_name, unsigned int ngroups,
-		       const char **functions, unsigned int *pins,
-		       unsigned int npins)
+		       void *data, unsigned int *pins, unsigned int npins)
 {
 	return -ENOTSUPP;
 }
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index 76670aef62da4..6a13fd4eea65b 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -21,8 +21,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
 			   const char **group_names, unsigned int ngroups,
-			   const char **functions, unsigned int *pins,
-			   unsigned int npins)
+			   void *data, unsigned int *pins, unsigned int npins)
 {
 	struct device *dev = pctldev->dev;
 	unsigned int num_configs;
@@ -45,7 +44,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 	if (ret < 0)
 		return ret;
 
-	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, functions);
+	ret = pinctrl_generic_add_group(pctldev, group_name, pins, npins, data);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to add group %s: %d\n",
 				     group_name, ret);
-- 
2.53.0


