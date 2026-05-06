Return-Path: <linux-gpio+bounces-36276-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJYhBPoS+2lLWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36276-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:07:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EAF4D91BF
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 12:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BD1C3084059
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 09:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3C63F7895;
	Wed,  6 May 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cw6BHAn2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678231D375;
	Wed,  6 May 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778061493; cv=none; b=eVeDEiHJb6MWmwd4krPURWHvOrVFX6sNv3FVBPBLBj5mWrs3/BnQY30ByfqXdfkF04PVNpt8qPUg6fXUpB7zhQjn72Cowr0dz4Ze0W2iJSe2DAlYSYZSwGz/9ENHsNIrO+YH/Fo3I4IGGl6J2yAcNClyF/GBOjNHcOEIGWi7Caw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778061493; c=relaxed/simple;
	bh=TVBXqFY3A1biRCKkk5PCThVDRBq0+hrygrveT6A+Tc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9Fegx7jmyEfecKkhZeDEVW9fZhOgo7I4SC4XDym3L/qkP5+0ZXmgdz7NC6E8Su2oifCcvVsZI2ZBoZ072vJpksves9M3aGwHj11s3OCaMyemfla3CWUkD0oAW5vG8gKmcFD3nwiAY/OFf4iGkU+1DK0dop/J4naa8N3Rt/umL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw6BHAn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05979C2BCC4;
	Wed,  6 May 2026 09:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061492;
	bh=TVBXqFY3A1biRCKkk5PCThVDRBq0+hrygrveT6A+Tc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cw6BHAn2KmedwdcWVbFXyvNcRPQEIRONAyjCBbZ+epA5/Sa7T/Ud1NCNhWle/9UHx
	 jfpgSRECQquqSvlIA4GW+QdRpHLHLSGyC2K+fgaLI+ANLYDYltVxEC+bHRKVYsFMuw
	 3q+lH+i4aruIE3OIvHDNUs5eFcL3WctXZd6MKbJ6iOfMnDnc8dpSBldIUByhKmz2Wp
	 hQydrlJrIHnKguASji1EU9DHOgI/CxHSCEl09PrTWXFe1yUpvjpA9AuMGnJ98aH0Mk
	 1AKWaJNIs8AEkeqfU/S7B/opRpgv/aGx1fuRnbLihUaiKtKBJutorUf8jBZjnrjdfc
	 AjxRXWJA2Eypg==
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
Subject: [RFC v1 2/4] pinctrl: add new generic groups/function creation function for pinmux
Date: Wed,  6 May 2026 10:57:40 +0100
Message-ID: <20260506-matted-prominent-6352c26a65a6@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5876; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IAVHCqBTU/I3FABmI0dhZe5pmDWDVP85YHHq0Hd5uPY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSazdPHMnDO9p/DhFo6FG3kW7/d03HzCUur7NR85/ 50eJ/Vfd5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiZ6UY/pk5BU3UcHJ8XKv+ +Od6bc1NDYpNV/Mre58flTEp7gvfc5vhr7TJSa7G52+PuUxQ5Yh+tEjmpcqam1mKrSvzuyx+RFb +5AMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C4EAF4D91BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36276-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Conor Dooley <conor.dooley@microchip.com>

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         |  14 ++++
 drivers/pinctrl/pinctrl-generic.c | 134 ++++++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index 5d99fef27657f..30c42d81e8829 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -167,6 +167,11 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 						 struct pinctrl_map **maps,
 						 unsigned int *num_maps);
 
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps);
+
 int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 			   struct device_node *np, struct pinctrl_map **maps,
 			   unsigned int *num_maps, unsigned int *num_reserved_maps,
@@ -182,6 +187,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return -ENOTSUPP;
 }
 
+static inline int
+pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+				      struct device_node *np,
+				      struct pinctrl_map **maps,
+				      unsigned int *num_maps)
+{
+	return -ENOTSUPP;
+}
+
 static inline int
 pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
 		       struct device_node *np, struct pinctrl_map **maps,
diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
index 6a13fd4eea65b..69df211f6b964 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -202,3 +202,137 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
+
+
+static int pinctrl_generic_pinmux_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+						    struct device_node *parent,
+						    struct device_node *np,
+						    struct pinctrl_map **maps,
+						    unsigned int *num_maps,
+						    unsigned int *num_reserved_maps,
+						    const char **group_names,
+						    unsigned int ngroups)
+{
+	struct device *dev = pctldev->dev;
+	unsigned int *pins, *muxes;
+	int npins, ret;
+
+	npins = of_property_count_u32_elems(np, "pinmux");
+
+	if (npins < 1) {
+		dev_err(dev, "invalid pinctrl group %pOFn.%pOFn %d\n",
+			parent, np, npins);
+		return npins;
+	}
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+
+	muxes = devm_kcalloc(dev, npins, sizeof(*muxes), GFP_KERNEL);
+	if (!muxes)
+		return -ENOMEM;
+
+	for (int i = 0; i < npins; i++) {
+		unsigned int pinmux;
+
+		ret = of_property_read_u32_index(np, "pinmux", i, &pinmux);
+		if (ret)
+			return ret;
+
+		pins[i] = pinmux >> 16;
+		muxes[i] = pinmux & GENMASK(15, 0);
+	}
+
+	return pinctrl_generic_to_map(pctldev, parent, np, maps, num_maps,
+				      num_reserved_maps, group_names, ngroups,
+				      muxes, pins, npins);
+}
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ *
+ * It assumes that the upper 16 bits of the pinmux items contain the pin
+ * and the lower 16 the mux setting.
+ */
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *child_np;
+	const char **group_names;
+	unsigned int num_reserved_maps = 0;
+	int ngroups = 0;
+	int ret;
+
+	*maps = NULL;
+	*num_maps = 0;
+
+	/*
+	 * Check if this is actually the pinmux node, or a parent containing
+	 * multiple pinmux nodes.
+	 */
+	if (!of_property_present(np, "pinmux"))
+		goto parent;
+
+	group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	ret = pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, np,
+						       maps, num_maps,
+						       &num_reserved_maps,
+						       group_names,
+						       ngroups);
+	if (ret) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	return 0;
+
+parent:
+	for_each_available_child_of_node(np, child_np)
+		ngroups += 1;
+
+	group_names = devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	ngroups = 0;
+	for_each_available_child_of_node_scoped(np, child_np) {
+		ret = pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, child_np,
+							       maps, num_maps,
+							       &num_reserved_maps,
+							       group_names,
+							       ngroups);
+		if (ret) {
+			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
+					     np->name);
+		}
+
+		ngroups++;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, NULL);
+	if (ret < 0) {
+		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
+		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);
-- 
2.53.0


