Return-Path: <linux-gpio+bounces-14993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B622A18AA2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 04:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6FEF188A286
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 03:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E9B15F330;
	Wed, 22 Jan 2025 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfGIzox8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3341156F2B;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737516366; cv=none; b=WE5Zjf+zKgBUC+k/4dHErwdELE06/b7PU7GZRC5tXDXdMwV4VM7/XYNXUv8eFy2nWDpc9Iohes42MjAkLNuWuMuTwot+btHc7EtXa4VQz4ggH/+/dMA4n3KY+nP4ax/fZ9jtrNeeHlB4G5BLsgiVK1EXjrGfNFRd1LRSNUTOsnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737516366; c=relaxed/simple;
	bh=XL7xgtK2u7YldrOEUnHxMb1LEyE3M52/Fl9sJ94c2pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BQrlHpuP6PwzHepcZEbnLPhD/cdvYKeY3mOwuUXM78QXhmKxkD5LbfrL18KQsu1b71RKA7+NUGRbE5avsYq2b8cl+BlGs9HRyWuedGbg+7SQUPTtMfuuAzcEBVmv6i03t/lgdFTKYjpsYvbGj8Adj4eZCaJX0ncI1mRTJH0ogyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfGIzox8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51599C4CEE0;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737516365;
	bh=XL7xgtK2u7YldrOEUnHxMb1LEyE3M52/Fl9sJ94c2pc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HfGIzox8y13K6MdF4TRJmm9bYjS1DH7fIS2JBji7y3s24OShDv3yTVarAVeIg53aC
	 I8xXJq3+v/XOuSlSzcZdhr7vW0HhhMtBJvRzRyuJ+FdRJ4zyNKXupK0C+++1JqWIs+
	 v2owQgrVEhvhTBmA9h8kpEd4NWf6hFeWHaDVkgqCRyJtJ+NgtqFMrxiNzJMaKVK3dA
	 r9bJ/AwveRSMZ8oTE+GtemqfQ1Y6LDXFcs1n367Olbs8RYdTQReA0g4fDirHy6b+GF
	 1h+PWV8PYM6k0NU+c8fOIXxW44zyWx2/cSilTfIPlI9eEmB+al+XnE3Ld1ypgrI9B4
	 fOT06uU31ujXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482DBC02181;
	Wed, 22 Jan 2025 03:26:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 22 Jan 2025 11:26:00 +0800
Subject: [PATCH v4 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-amlogic-pinctrl-v4-2-4677b2e18ff1@amlogic.com>
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
In-Reply-To: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737516363; l=5889;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=0V9oW4wj+wgR5xyuwmzT7zLRhqxwLpzfCdcpq/8d8uc=;
 b=orYi6UbxkU3mFWcy4yDQJqf6o/gb42xS9bFKV1A+KZRYTtWnqkU1leimCUtuJnCCKXuMK9mDX
 i15wsrRcrcyDX3B30nto9WMuAqEkVB4UX0JvrzDHImR19EBroMA95BJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

When describing pin mux func through pinmux propertity,
a standard API is added for support. The pinmux contains pin
identification and mux values, which can include multiple
pins. And groups configuration use other word. DTS such as:

func-name {
	group_alias: group-name{
		pinmux= <pin_id << 8 | mux_value)>,
			<pin_id << 8 | mux_value)>;
		bias-pull-up;
		drive-strength-microamp = <4000>;
	};
};

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/pinconf-generic.c       | 130 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinconf.h               |   4 +
 include/linux/pinctrl/pinconf-generic.h |   4 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 0b13d7f17b32..b8e5e441e67c 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -233,6 +233,67 @@ static void parse_dt_cfg(struct device_node *np,
 	}
 }
 
+/**
+ * pinconf_generic_parse_dt_pinmux()
+ * parse the pinmux properties into generic pin mux values.
+ * @np: node containing the pinmux properties
+ * @dev: pincontrol core device
+ * @pid: array with pin identity entries
+ * @pmux: array with pin mux value entries
+ * @npins: number of pins
+ *
+ * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
+ */
+int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
+				    unsigned int **pid, unsigned int **pmux,
+				    unsigned int *npins)
+{
+	unsigned int *pid_t;
+	unsigned int *pmux_t;
+	struct property *prop;
+	unsigned int npins_t, i;
+	u32 value;
+	int ret;
+
+	prop = of_find_property(np, "pinmux", NULL);
+	if (!prop) {
+		dev_info(dev, "Missing pinmux property\n");
+		return -ENOENT;
+	}
+
+	if (!pid || !pmux || !npins) {
+		dev_err(dev, "paramers error\n");
+		return -EINVAL;
+	}
+
+	npins_t = prop->length / sizeof(u32);
+	pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
+	pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
+	if (!pid_t || !pmux_t) {
+		dev_err(dev, "kalloc memory fail\n");
+		return -ENOMEM;
+	}
+	for (i = 0; i < npins_t; i++) {
+		ret = of_property_read_u32_index(np, "pinmux", i, &value);
+		if (ret) {
+			dev_err(dev, "get pinmux value fail\n");
+			goto exit;
+		}
+		pmux_t[i] = value & 0xff;
+		pid_t[i] = (value >> 8) & 0xffffff;
+	}
+	*pid = pid_t;
+	*pmux = pmux_t;
+	*npins = npins_t;
+
+	return 0;
+exit:
+	devm_kfree(dev, pid_t);
+	devm_kfree(dev, pmux_t);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_pinmux);
+
 /**
  * pinconf_generic_parse_dt_config()
  * parse the config properties into generic pinconfig values.
@@ -295,6 +356,75 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
 
+int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **map,
+					  unsigned int *num_maps)
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
+EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map_pinmux);
+
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np, struct pinctrl_map **map,
 		unsigned int *reserved_maps, unsigned int *num_maps,
diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index a14c950bc700..a171195b3615 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -138,4 +138,8 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 				    struct pinctrl_dev *pctldev,
 				    unsigned long **configs,
 				    unsigned int *nconfigs);
+
+int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
+				    unsigned int **pid, unsigned int **pmux,
+				    unsigned int *npins);
 #endif
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 53cfde98433d..1bcf071b860e 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -232,4 +232,8 @@ static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev
 			PIN_MAP_TYPE_INVALID);
 }
 
+int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **map,
+					  unsigned int *num_maps);
 #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */

-- 
2.37.1



