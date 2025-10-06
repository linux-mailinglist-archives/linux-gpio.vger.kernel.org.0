Return-Path: <linux-gpio+bounces-26829-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9EBBE1CC
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 15:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A82B3B5D73
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 13:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C662848BE;
	Mon,  6 Oct 2025 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gAh7h24W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66A2857E9
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755643; cv=none; b=ANtUAv0KbOIWdQG6P7rJoTJ3unroyQFQzP6A6JyH4od2BHkR3lsyxMfKOEtxcrMl/FFkKazUCbjf1rVbifYm1ysDIO/misNlTfjE4oVKWu2oeb7yFASPbQ0VWroAfmETr3twSSVTM8v6hwjYMmc5XeePb0wWdQXvZrXVK8mHKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755643; c=relaxed/simple;
	bh=AvhkONgnV/f/76mBmtjAh8xDscHo0o2v476DsPf7hi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ueo/kPKVrMq4yPMC4b2+v0M7YkzSgeJT2Ny6mBoPS+l09Rl//4hConZo4Eq/kpkzYR4ua7EsLPp9qdcCpuZFYtOm0A8H6WOoFXE02Y+B2eHyyRuTkpAxkBytYlhwLheKLvigQxu3AR+EtZ+GV5hD9Nu1FrMWRhY1fpvI5wdRdWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gAh7h24W; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e29d65728so28392615e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759755639; x=1760360439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnG+vzoldItCA0lZEefd0SGWib4/b//mffQktXnGmVc=;
        b=gAh7h24Wda+4iatJHpPsBJDExrritNuNFuVadKU3vdxszQ6PUdqz7ZOa3qvlaUhzEl
         5DvUEmRpIbrhUgDGQrVE4weISJu7UjPpfDz4m3HGmxsVt7iOQI+smwCsEwRrN1VSPipQ
         kTadpuwE8G8M7KVVi0vyh3gpfROAbdNVnHMhqCPGkX511QGkdgXv8QflIeMjEpLDkLEd
         bJJcsyMBu0lr2mX8XX51+6RUui03uKkfsEd2o1vw1ynauYU4ATli99/AoT4rRx09Fp7j
         tqm2iJYVoW4DxwF4qoi7T/PFpaqvOsSF71eJ9lqX+M/ils5rIz7Iph1HBYL/UzWAWbh0
         7ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755639; x=1760360439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnG+vzoldItCA0lZEefd0SGWib4/b//mffQktXnGmVc=;
        b=m42VtWgo35jxuR/N+7vwI/jxphGiorBhZOct622qu/KyZevgMUmtuhB8sULm5m65UJ
         4cVGSJehSx3fpTwBGt9WnYTX9tmmbcHdifwoXllqhBsgAIjUOIFJcKqoV6yWNA9UBPrD
         x7xqABHqY+tCJiLT1HvAltHQBXXUnQt7KLnUwhqGYxShzOsXvu1V2QJXLq2x7lOhrwTz
         iG4OQAGh67S55szQfVdwGYI7FAwltkqUVqyxqNdLUKfKhfZjxvaWoat9GoPjvNtHn+BB
         3AUt+09wFsiec/SCZ3+K99aVcErS8dnunorY0RctfknoICnY+urOpSYRDVAyaI3J8eei
         ooDw==
X-Gm-Message-State: AOJu0YyocouQtxLJKxIadiuuzdcTBazwBz9qkFFQTOPB7Y2tdEZgzXcf
	0wwizZY6GiusRkzvWlD3cJuEf1avDAY/LG0NEKosL8xWdml9tvKJrXVN1pbyspqg6/A=
X-Gm-Gg: ASbGncvPM14w6ATAoyzYWSoAccYdt/MqE1pUfpx/6fo0iIVIN/J4RzOrEJILuLPIfXu
	jXNP0JS7XL2PH3bGQZ1DymqsNr9iOtHfO0D0+gxCrDzqFKJrP6OEi/sam3XajHXlPBi47CIV53d
	V5ek3o0IGW5uXdHBgshVlXfN2+wuRy0DvS98D6/Y8mc8RPNWLf9dLAOsmbvylRRD278XxRvTkVr
	0FNYsiEupyFvUt19q3BPOPC8Gs5tn3CPJctKvYjAKrjMQx/NpV4dokhwaBQTHmvrhr77UvmpXJv
	blj7rocPiX45a5LTOkvGz3aBdbu9NylI/jth0yC49n0W6qDUFNLxjysHaKRRQHgNG5EYpfxMIaj
	lMc63gJAyJzFSGfl5x9sSz3o+VCCoF54kwMlHjEipOw==
X-Google-Smtp-Source: AGHT+IHtbeYY26Aypf28VgCSf3z+x7Hjb1RGm5XsiB/bpY4Z1Yu9YNHJN1j1b7isg7ZJPQAbsKQoYg==
X-Received: by 2002:a05:600c:a31c:b0:46d:996b:826f with SMTP id 5b1f17b1804b1-46e720c2cbbmr59775545e9.25.1759755639349;
        Mon, 06 Oct 2025 06:00:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b86e1sm249725965e9.5.2025.10.06.06.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:00:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 15:00:18 +0200
Subject: [PATCH 3/9] software node: allow referencing firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-reset-gpios-swnodes-v1-3-6d3325b9af42@linaro.org>
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
In-Reply-To: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5346;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WSFYyWyrCPT2bWeYqzfvmUvOWn0rYkTPMrQkBOPvC6I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo471vKgVRBHpERVfLsLbgWt/+rXyWS6AU64Kv+
 1hJSkKBMbOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOO9bwAKCRARpy6gFHHX
 cnghD/wKQr5daJtf++yPSFf9su52sfGvfzMLCm1h1An8vgqVJgkFvg5v2qEajVO/0lzeGxzN3sa
 c1f7E/Ijl+gH1rPijvku9ln9ylGq/RgdlGhklZzmq0jWutqmRqeXDkoAX0csJLBMA9lK44igQAm
 hpIdprn47fQEpNKoBR5wafciAarAOMVSj2kMmRDEzkBHXiARyUV6I+/yD5xKgO1Dmn7hadmSd48
 XbhvxdMnCqAnMJ/8D7ZKPhR50iHY+uuCkPYwKACB/vhmDGdp6rIjZE9j1QliL+L/3Rqdz1DvMsX
 hEFi0GeD2sbT1hEkJ5RkJvpgFRbHCKitjclJCiao3AQTTBVyKp81twYVz2/fLeidOurRdkR2Hlq
 CQ9LqexuK+cE+Rsq+zxMX6S9H+mMG0Kcc3ON8QNA2OpLru4MSN0LH2rg7vFhAvpCTI0fo+r9Qtz
 TSGnFpPBkqe3S0zB9v3g77SS5t3FmXpH3572t99SpnO8Z99WnJVau8fhQfZI7dajs3hPP9vhSPF
 j9MIHtic86hHclpTPfViCa/IQ5iKW23KtV8tF36ec+mn4xX4ncubvXZKvMkVJsAtXGuA/6y5RB/
 tp5JOhE2xXI9zSwUiPu2OJ8qKJKXSsrxN3S2NLSjFam7K0wmsNyBAXKy6y8UlpQL4lLuj3ZCUCB
 82cvqlUL5kX7ymQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

At the moment software nodes can only reference other software nodes.
This is a limitation for devices created, for instance, on the auxiliary
bus with a dynamic software node attached which cannot reference devices
the firmware node of which is "real" (as an OF node or otherwise).

Make it possible for a software node to reference all firmware nodes in
addition to static software nodes. To that end: use a union of different
pointers in struct software_node_ref_args and add an enum indicating
what kind of reference given instance of it is. Rework the helper macros
and deprecate the existing ones whose names don't indicate the reference
type.

Software node graphs remain the same, as in: the remote endpoints still
have to be software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c    | 21 ++++++++++++++++----
 include/linux/property.h | 51 +++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index a60ba4327db8b967034b296b73c948aa5746a094..b7e91c60c1d51b167adc88afb0f06feeeccf900c 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -535,9 +535,19 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	ref_array = prop->pointer;
 	ref = &ref_array[index];
 
-	refnode = software_node_fwnode(ref->node);
-	if (!refnode)
-		return -ENOENT;
+	switch (ref->type) {
+	case SOFTWARE_NODE_REF_SWNODE:
+		refnode = software_node_fwnode(ref->swnode);
+		if (!refnode)
+			return -ENOENT;
+		break;
+	case SOFTWARE_NODE_REF_FWNODE:
+		refnode = ref->fwnode;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32_array(refnode, nargs_prop,
@@ -634,7 +644,10 @@ software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
 
 	ref = prop->pointer;
 
-	return software_node_get(software_node_fwnode(ref[0].node));
+	if (ref->type != SOFTWARE_NODE_REF_SWNODE)
+		return NULL;
+
+	return software_node_get(software_node_fwnode(ref[0].swnode));
 }
 
 static struct fwnode_handle *
diff --git a/include/linux/property.h b/include/linux/property.h
index 50b26589dd70d1756f3b8644255c24a011e2617c..af72f579e8026cee2456b0983819e7a4bf0c6805 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -353,25 +353,50 @@ fwnode_property_string_array_count(const struct fwnode_handle *fwnode,
 
 struct software_node;
 
+enum software_node_ref_type {
+	/* References a software node. */
+	SOFTWARE_NODE_REF_SWNODE = 0,
+	/* References a firmware node. */
+	SOFTWARE_NODE_REF_FWNODE,
+};
+
 /**
  * struct software_node_ref_args - Reference property with additional arguments
- * @node: Reference to a software node
+ * @swnode: Reference to a software node
+ * @fwnode: Alternative reference to a firmware node handle
  * @nargs: Number of elements in @args array
  * @args: Integer arguments
  */
 struct software_node_ref_args {
-	const struct software_node *node;
+	enum software_node_ref_type type;
+	union {
+		const struct software_node *swnode;
+		struct fwnode_handle *fwnode;
+	};
 	unsigned int nargs;
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
 };
 
-#define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
+#define __SOFTWARE_NODE_REF(_ref, _type, _node, ...)		\
 (const struct software_node_ref_args) {				\
-	.node = _ref_,						\
+	.type = _type,						\
+	._node = _ref,						\
 	.nargs = COUNT_ARGS(__VA_ARGS__),			\
 	.args = { __VA_ARGS__ },				\
 }
 
+#define SOFTWARE_NODE_REF_SWNODE(_ref, ...)			\
+	__SOFTWARE_NODE_REF(_ref, SOFTWARE_NODE_REF_SWNODE,	\
+			    swnode, __VA_ARGS__)
+
+#define SOFTWARE_NODE_REF_FWNODE(_ref, ...)			\
+	__SOFTWARE_NODE_REF(_ref, SOFTWARE_NODE_REF_FWNODE,	\
+			    fwnode, __VA_ARGS__)
+
+/* DEPRECATED, use SOFTWARE_NODE_REF_SWNODE() instead. */
+#define SOFTWARE_NODE_REFERENCE(_ref, ...)			\
+	SOFTWARE_NODE_REF_SWNODE(_ref, __VA_ARGS__)
+
 /**
  * struct property_entry - "Built-in" device property representation.
  * @name: Name of the property.
@@ -463,14 +488,26 @@ struct property_entry {
 #define PROPERTY_ENTRY_STRING(_name_, _val_)				\
 	__PROPERTY_ENTRY_ELEMENT(_name_, str, STRING, _val_)
 
-#define PROPERTY_ENTRY_REF(_name_, _ref_, ...)				\
+#define __PROPERTY_ENTRY_REF(_type, _name, _ref, ...)			\
 (struct property_entry) {						\
-	.name = _name_,							\
+	.name = _name,							\
 	.length = sizeof(struct software_node_ref_args),		\
 	.type = DEV_PROP_REF,						\
-	{ .pointer = &SOFTWARE_NODE_REFERENCE(_ref_, ##__VA_ARGS__), },	\
+	{ .pointer = &_type(_ref, ##__VA_ARGS__), },			\
 }
 
+#define PROPERTY_ENTRY_REF_SWNODE(_name, _ref, ...)			\
+	__PROPERTY_ENTRY_REF(SOFTWARE_NODE_REF_SWNODE,			\
+			     _name, _ref, __VA_ARGS__)
+
+#define PROPERTY_ENTRY_REF_FWNODE(_name, _ref, ...)			\
+	__PROPERTY_ENTRY_REF(SOFTWARE_NODE_REF_FWNODE,			\
+			    _name, _ref, __VA_ARGS__)
+
+/* DEPRECATED, use PROPERTY_ENTRY_REF_SWNODE() instead. */
+#define PROPERTY_ENTRY_REF(_name, _ref, ...)				\
+	PROPERTY_ENTRY_REF_SWNODE(_name, _ref, __VA_ARGS__)
+
 #define PROPERTY_ENTRY_BOOL(_name_)		\
 (struct property_entry) {			\
 	.name = _name_,				\

-- 
2.48.1


