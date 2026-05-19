Return-Path: <linux-gpio+bounces-37135-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULFPHRgxDGpuZAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37135-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:44:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D717A57B871
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E947730D7E87
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75BB40DFDE;
	Tue, 19 May 2026 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv/kf4aU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C3409E16;
	Tue, 19 May 2026 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183450; cv=none; b=TNWHmrQLWpiu2fnpVJntRpvDLDDboRvoItZxmmgRXiQ1dJclKznJwwiXGRpQbzyTAZ+Sd48Il5uVYenFAnnailV4Ep+92jp+DmV6Dk6cVmlQ0O0FPx0vCh8x5clCJqLx6NIihwl+ySMRK9vDkGSt/nhmwlxdZya2l8VMmugU+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183450; c=relaxed/simple;
	bh=RFyrFTiNvN7xCwsRMUno2FUHCmve5OC3JrfqhPiTFJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwuzHLanFed1jt3XqBkn628Jfbhk40QhRJPOTYE5kctEodGNEm+2d75pv5rpaliscaWj69B7PRiPKjKc6kag6AIhf4FZ20vfBW/2VhxhYExPMv8zKHJA7jzvbsm9ppwDywxOUztCFk0nWCPK7RmNmQJU0+ceIv2u7affC/2+AyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv/kf4aU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE0C2BCC6;
	Tue, 19 May 2026 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183450;
	bh=RFyrFTiNvN7xCwsRMUno2FUHCmve5OC3JrfqhPiTFJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bv/kf4aU8lc5/mevxSccRStEldhW3GXPxrki7RGX8i27r4wSdpwjHfGfyAL9uMRwu
	 yZz7LBn+oBSfUHwgGJg0u4Mk1Ni+A6MrF94XX+wtpZTib3TEs901qzKHyFO7ss0P2k
	 qMNDF0S/hDIwYp91PKssMf7iJT+h9esiphi4swjwqrhbnj/WRzb+jD23IQhQ2EhwYx
	 gjhmYK3TU2goDj75SzDTgmCUUVlTdxMe+HvnWz2r58/+W+xusU6nGBl5+xjLmGHzxu
	 TStjzL4l9uNBe29zdqN46yXqc6MYQ+rfJHSXIllRK/dIHqVrNKjiMp3K0R8C2/v8e5
	 Q72TGYTewNEwA==
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
Subject: [PATCH v2 1/4] pinctrl: generic: change signature of pinctrl_generic_to_map() to pass void data
Date: Tue, 19 May 2026 10:37:22 +0100
Message-ID: <20260519-plod-irritable-632bb27b8110@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IKzfFin2jBmcdZM/cVLi/EAoXE7JtVz0kxmyuCS5/1c=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+kHH5N7O3LX9DZ/M5Pdrl+7d+v7Y3VW72A/fTFn2I L55fpbzsY5SFgYxLgZZMUWWxNt9LVLr/7jscO55CzOHlQlkCAMXpwBMpGEmI8M8nu0+Cus8C6+1 iqSX7Z5wLXjGH9Grn+Y2NBW1zdNnyNJi+Kf1MVeX55V96tqAo+XHSqcEXDbVfm6kmZT3+PZkbY2 2r/wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37135-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: D717A57B871
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

In order to make pinctrl_generic_to_map() usable for controllers that
use pinmux, change the functions char array pointer that it passes to
pinctrl_generic_add_group() to a void pointer. In the pinmux case this
property will contain the mux setting as a number rather than as strings
in the pins + functions case.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         | 6 ++----
 drivers/pinctrl/pinctrl-generic.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 9711d16c38b62..b2fb757cc6ecb 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -177,8 +177,7 @@ int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *pare
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
 			   const char **group_name, unsigned int ngroups,
-			   const char **functions, unsigned int *pins,
-			   unsigned int npins);
+			   void *data, unsigned int *pins, unsigned int npins);
 #else
 static inline int
 pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -194,8 +193,7 @@ pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
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
index e4cd16ce2bda3..a3faad7911cbf 100644
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


