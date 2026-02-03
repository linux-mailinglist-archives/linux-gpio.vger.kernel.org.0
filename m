Return-Path: <linux-gpio+bounces-31394-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEfHCrIfgmlIPgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31394-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:17:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 924AFDBC91
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 17:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E95E73086268
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 16:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBCD3D1CB7;
	Tue,  3 Feb 2026 16:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nW3HSxwN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071473D1CB0;
	Tue,  3 Feb 2026 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135454; cv=none; b=hDhwW9QMhMnAMQZu/kfIZTd0Xi/jc1SakRHqRT0w5LNCTxzl7eJ+9L9bUPFlfXbgGT06yylPHoXu50p0UPGE7W2lhCA8yiX9ly3N9mq5e9eSjXLoJu07ikw+8YsVSTCLa5KwpWdQlPZ5080M8PP5669mn+yHn+me4rToAyt63Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135454; c=relaxed/simple;
	bh=t0pahqHxkD8WOqNTV7Gd8i8Krv2yBRmUEy3BYV6hbWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=egnh33WRkFUmOMPStt1KJeMfzbtLyQDOxfMYC1NcnxSTbk9sJdKzARjsgD3N2Cx2Cu5ujvv+XnaY/MdQLN85zKaPRE3QoHQ4Zol7F1dNq14VARb+k0fwNmR3FuwRpi2Fh/s1dcHNV93BaufF5+49pEPQIH2689iq88ExECisqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW3HSxwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8122AC19421;
	Tue,  3 Feb 2026 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135453;
	bh=t0pahqHxkD8WOqNTV7Gd8i8Krv2yBRmUEy3BYV6hbWc=;
	h=From:To:Cc:Subject:Date:From;
	b=nW3HSxwNgImm+htCdGGb1KrWsi4WDyKQRZZVJ98XJJU0SkcoUKt9u4MYOBh089ig+
	 sD4vR65N+gXWMqaQTmMsZc8IKVG6QDN8aC2Gtyb4w1gg+1l8KliDwMbthLNPmu/0Ms
	 4NYAvLPgpQS6Aagb9RqoVhefNN1gkJWReWAG24Xasn4yvjUF1WWxIz8N4RGkciyjx0
	 xwMgHQ5EHR0rbh7WMFHC1/TNTNDmWf3sqh1F8BQMlryijIZBvaZc5XPE+rTwLP2rvx
	 ACJdN/RT9qP3e+zeAJg8M0iL1JwL1osMuU54hLcwi+BQivoNEj/fy0XUfzTyQUh7GO
	 5vnK83p6XgACQ==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to amlogic-am4 driver
Date: Tue,  3 Feb 2026 16:17:07 +0000
Message-ID: <20260203-craftsman-battered-3491ff68f462@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9541; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fPiT2UToPxliK4qfPSkNC22QUXGjpLo8+s/WAHJ1Tts=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlN8o36yaICMmvvXBZz3tdtsqFAZcHaqZKPXr3c++kN2 9SjwcebO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR5mpGhjcqDxfMyZgluO/G 2pVFuY8/Ov28uzA38ncpg6bHeh5hz9cM/519biecsWqeV/5OtPo1+4qVN26qNvZ96817GzpJ/3/ We24A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31394-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,amlogic.com,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,baylibre.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 924AFDBC91
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
function, and really belongs in the amlogic-am4 driver. There are three
reasons why.

First, and least, of the reasons is that this function behaves
differently to the other dt_node_to_map functions in a way that is not
obvious from a first glance. This difference stems for the devicetree
properties that the function is intended for use with, and how they are
typically used. The other generic dt_node_to_map functions support
platforms where the pins, groups and functions are described statically
in the driver and require a function that will produce a mapping from dt
nodes to these pre-established descriptions. No other code in the driver
is require to be executed at runtime.
pinconf_generic_dt_node_to_map_pinmux() on the other hand is intended for
use with the pinmux property, where groups and functions are determined
entirely from the devicetree. As a result, there are no statically
defined groups and functions in the driver for this function to perform
a mapping to. Other drivers that use the pinmux property (e.g. the k1)
their dt_node_to_map function creates the groups and functions as the
devicetree is parsed. Instead of that,
pinconf_generic_dt_node_to_map_pinmux() requires that the devicetree is
parsed twice, once by it and once at probe, so that the driver
dynamically creates the groups and functions before the dt_node_to_map
callback is executed. I don't believe this double parsing requirement is
how developers would expect this to work and is not necessary given
there are drivers that do not have this behaviour.

Secondly and thirdly, the function bakes in some assumptions that only
really match the amlogic platform about how the devicetree is constructed.
These, to me, are problematic for something that claims to be generic.

The other dt_node_to_map implementations accept a being called for
either a node containing pin configuration properties or a node
containing child nodes that each contain the configuration properties.
IOW, they support the following two devicetree configurations:

| cfg {
| 	label: group {
| 		pinmux = <asjhdasjhlajskd>;
| 		config-item1;
| 	};
| };

| label: cfg {
| 	group1 {
| 		pinmux = <dsjhlfka>;
| 		config-item2;
| 	};
| 	group2 {
| 		pinmux = <lsdjhaf>;
| 		config-item1;
| 	};
| };

pinconf_generic_dt_node_to_map_pinmux() only supports the latter.

The other assumption about devicetree configuration that the function
makes is that the labeled node's parent is a "function node". The amlogic
driver uses these "function nodes" to create the functions at probe
time, and pinconf_generic_dt_node_to_map_pinmux() finds the parent of
the node it is operating on's name as part of the mapping. IOW, it
requires that the devicetree look like:

| pinctrl@bla {
|
| 	func-foo {
| 		label: group-default {
| 			pinmuxes = <lskdf>;
| 		};
| 	};
| };

and couldn't be used if the nodes containing the pinmux and
configuration properties are children of the pinctrl node itself:

| pinctrl@bla {
|
| 	label: group-default {
| 		pinmuxes = <lskdf>;
| 	};
| };

These final two reasons are mainly why I believe this is not suitable as
a generic function, and should be moved into the driver that is the sole
user and originator of the "generic" function.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Jerome Brunet <jbrunet@baylibre.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: linux-amlogic@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 71 +++++++++++++++++++++-
 drivers/pinctrl/pinconf-generic.c          | 69 ---------------------
 include/linux/pinctrl/pinconf-generic.h    |  5 --
 3 files changed, 70 insertions(+), 75 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index d9e3a8d5932a..67c96e4661f5 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -24,6 +24,7 @@
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
 
 #include "../core.h"
+#include "../pinctrl-utils.h"
 #include "../pinconf.h"
 
 #define gpio_chip_to_bank(chip) \
@@ -672,11 +673,79 @@ static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
 	seq_printf(s, " %s", dev_name(pcdev->dev));
 }
 
+static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
+				     struct device_node *np,
+				     struct pinctrl_map **map,
+				     unsigned int *num_maps)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *pnode;
+	unsigned long *configs = NULL;
+	unsigned int num_configs = 0;
+	struct property *prop;
+	unsigned int reserved_maps;
+	int reserve;
+	int ret;
+
+	prop = of_find_property(np, "pinmux", NULL);
+	if (!prop) {
+		dev_info(dev, "Missing pinmux property\n");
+		return -ENOENT;
+	}
+
+	pnode = of_get_parent(np);
+	if (!pnode) {
+		dev_info(dev, "Missing function node\n");
+		return -EINVAL;
+	}
+
+	reserved_maps = 0;
+	*map = NULL;
+	*num_maps = 0;
+
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
+					      &num_configs);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: could not parse node property\n", np);
+		return ret;
+	}
+
+	reserve = 1;
+	if (num_configs)
+		reserve++;
+
+	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
+					num_maps, reserve);
+	if (ret < 0)
+		goto exit;
+
+	ret = pinctrl_utils_add_map_mux(pctldev, map,
+					&reserved_maps, num_maps, np->name,
+					pnode->name);
+	if (ret < 0)
+		goto exit;
+
+	if (num_configs) {
+		ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
+						    num_maps, np->name, configs,
+						    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
+		if (ret < 0)
+			goto exit;
+	}
+
+exit:
+	kfree(configs);
+	if (ret)
+		pinctrl_utils_free_map(pctldev, *map, *num_maps);
+
+	return ret;
+}
+
 static const struct pinctrl_ops aml_pctrl_ops = {
 	.get_groups_count	= aml_get_groups_count,
 	.get_group_name		= aml_get_group_name,
 	.get_group_pins		= aml_get_group_pins,
-	.dt_node_to_map		= pinconf_generic_dt_node_to_map_pinmux,
+	.dt_node_to_map		= aml_dt_node_to_map_pinmux,
 	.dt_free_map		= pinconf_generic_dt_free_map,
 	.pin_dbg_show		= aml_pin_dbg_show,
 };
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index d182ec84e2df..30475da0fd10 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -424,75 +424,6 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
 
-int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
-					  struct device_node *np,
-					  struct pinctrl_map **map,
-					  unsigned int *num_maps)
-{
-	struct device *dev = pctldev->dev;
-	struct device_node *pnode;
-	unsigned long *configs = NULL;
-	unsigned int num_configs = 0;
-	struct property *prop;
-	unsigned int reserved_maps;
-	int reserve;
-	int ret;
-
-	prop = of_find_property(np, "pinmux", NULL);
-	if (!prop) {
-		dev_info(dev, "Missing pinmux property\n");
-		return -ENOENT;
-	}
-
-	pnode = of_get_parent(np);
-	if (!pnode) {
-		dev_info(dev, "Missing function node\n");
-		return -EINVAL;
-	}
-
-	reserved_maps = 0;
-	*map = NULL;
-	*num_maps = 0;
-
-	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
-					      &num_configs);
-	if (ret < 0) {
-		dev_err(dev, "%pOF: could not parse node property\n", np);
-		return ret;
-	}
-
-	reserve = 1;
-	if (num_configs)
-		reserve++;
-
-	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
-					num_maps, reserve);
-	if (ret < 0)
-		goto exit;
-
-	ret = pinctrl_utils_add_map_mux(pctldev, map,
-					&reserved_maps, num_maps, np->name,
-					pnode->name);
-	if (ret < 0)
-		goto exit;
-
-	if (num_configs) {
-		ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
-						    num_maps, np->name, configs,
-						    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
-		if (ret < 0)
-			goto exit;
-	}
-
-exit:
-	kfree(configs);
-	if (ret)
-		pinctrl_utils_free_map(pctldev, *map, *num_maps);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map_pinmux);
-
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np, struct pinctrl_map **map,
 		unsigned int *reserved_maps, unsigned int *num_maps,
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 1be4032071c2..89277808ea61 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -250,9 +250,4 @@ static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev
 	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
 			PIN_MAP_TYPE_INVALID);
 }
-
-int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
-					  struct device_node *np,
-					  struct pinctrl_map **map,
-					  unsigned int *num_maps);
 #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */
-- 
2.51.0


