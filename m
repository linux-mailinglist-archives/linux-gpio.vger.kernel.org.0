Return-Path: <linux-gpio+bounces-37136-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLlpJoUxDGrdZAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37136-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:46:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315657B91D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A4CA30E1D62
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED46F3FE661;
	Tue, 19 May 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMFgm7Dl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727C43CEEA;
	Tue, 19 May 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183452; cv=none; b=hTqfjUO64qcMiB3FuE0COmwcb8R+f0dTMfrMhRPVN6cjopElXcOZe8dSRpcU7f3NaOtvt6SjlGtMTjbQ2Rgk7Jy4FXUyQsrx7Cc63OTVewuDMKkreOVgXW2TeQHynhkSxopwBL0T+7FB73j1PWjjmxBIFQGlHmqP/LXNjkyC8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183452; c=relaxed/simple;
	bh=29NbVoajZTtTH3m99IJaWbdrnfsufS249hOJeHdzXU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F92mpLU9K76iOlZqcW7mdcWf6bACPd7rP4yy2P/7XZx0KglLjo7/c08J4WPQAFWbf3ibfkZZnKyb5vHN1H9VC0D81bjgOF1ftX/+PLj+DJFvEanPz/Y5+i19xK8vDz5a3xMMIWJUM0GGwxCCx+hqD24js/sCP4TEAhSn7tXsL/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMFgm7Dl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF393C2BCF5;
	Tue, 19 May 2026 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183452;
	bh=29NbVoajZTtTH3m99IJaWbdrnfsufS249hOJeHdzXU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jMFgm7DlWGoa7FcFXbiQRhV9j8RlzxJgmeRJBLRuVhaqBejVJ/8z9J/lMaHtm2QnC
	 R11PoknF+h93yNyjpJQ4ew5cakznV/a2eYDlUsSDo+G2ZmQa1VS9FLa0t9PAqa2/lu
	 S/xwtETlFhe4WXerU3y/7Rd/Eex1xLjXOrl+/00KOMlDMIaENnF6rak2vkWHzqV8zX
	 LF/k5gJr6VU4MWi+MrXbc5BknbfMIebrsNr/zsoNK4pL3SpGLBohmNsfOXxckHiqjC
	 jIRVMoMj7fKrIX+Em8rUG5StGkHrZjOvM+AzGOu8a/2BWFMpLYDRrLsGrjuir8N5AJ
	 1wTPWlwC20qzw==
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
Subject: [PATCH v2 2/4] pinctrl: add new generic groups/function creation function for pinmux
Date: Tue, 19 May 2026 10:37:23 +0100
Message-ID: <20260519-storm-karma-e457ea68904a@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7907; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=m1LZQAbTBJymAR9P4E9u1jLAfhLsJ/LYRIX80WcFFg0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+kGvFH9+Xf4miyuntTJEiMfpaY/eK22BgxrpfT62W fdWxAp1lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIFWYwMr/9bf90voBU99+/q 55On35M77einOqHqud+5hPmZ7LPPv2Fk+GK9/W2AVk1LzvR6dY7sqbsTl944K7BH+qr3TLaoPt1 7HAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37136-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email]
X-Rspamd-Queue-Id: 1315657B91D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

Akin to my recently added pinctrl_generic_pins_functions_dt_node_to_map(),
create an analogue that performs the same role of dynamically creating
groups at runtime for controllers using the pinmux property.
The pinmux property is freeform, so this function mandates that the
upper 16 bits contain the pin and the lower 16 bits contains the mux
setting. The group's data pointer is populated with an array of the mux
settings for each pin it contains.

Since the node parsing and subsequent pinctrl core function calls are
practically identical to the pins + functions case, other than which
properties are examined, it makes sense to extract the common code from
pinctrl_generic_pins_function_dt_node_to_map() into a generic function
that takes the case-specific devicetree parsing function as an argument.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/pinconf.h         |  14 ++++
 drivers/pinctrl/pinctrl-generic.c | 119 ++++++++++++++++++++++++------
 2 files changed, 112 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index b2fb757cc6ecb..2e40512fed776 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -173,6 +173,11 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
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
@@ -188,6 +193,15 @@ pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
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
index a3faad7911cbf..9759b0186bcc2 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -119,17 +119,64 @@ static int pinctrl_generic_pins_function_dt_subnode_to_map(struct pinctrl_dev *p
 				      functions, pins, npins);
 }
 
-/*
- * For platforms that do not define groups or functions in the driver, but
- * instead use the devicetree to describe them. This function will, unlike
- * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
- * and functions, create them in addition to parsing pinconf properties and
- * adding mappings.
- */
-int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
-						 struct device_node *np,
-						 struct pinctrl_map **maps,
-						 unsigned int *num_maps)
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
+static int pinctrl_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps,
+					  int (dt_subnode_to_map)(
+						  struct pinctrl_dev *,
+						  struct device_node *,
+						  struct device_node *,
+						  struct pinctrl_map **,
+						  unsigned int *,
+						  unsigned int *,
+						  const char **,
+						  unsigned int))
 {
 	struct device *dev = pctldev->dev;
 	struct device_node *child_np;
@@ -152,11 +199,8 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (!group_names)
 		return -ENOMEM;
 
-	ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
-							      maps, num_maps,
-							      &num_reserved_maps,
-							      group_names,
-							      ngroups);
+	ret = dt_subnode_to_map(pctldev, np, np, maps, num_maps,
+				&num_reserved_maps, group_names, ngroups);
 	if (ret) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
@@ -180,11 +224,8 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	ngroups = 0;
 	for_each_available_child_of_node_scoped(np, child_np) {
-		ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, child_np,
-								      maps, num_maps,
-								      &num_reserved_maps,
-								      group_names,
-								      ngroups);
+		ret = dt_subnode_to_map(pctldev, np, child_np, maps, num_maps,
+					&num_reserved_maps, group_names, ngroups);
 		if (ret) {
 			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
@@ -202,4 +243,40 @@ int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	return 0;
 }
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ */
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pins_function_dt_subnode_to_map);
+}
 EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
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
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pinmux_dt_subnode_to_map);
+};
+EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);
-- 
2.53.0


