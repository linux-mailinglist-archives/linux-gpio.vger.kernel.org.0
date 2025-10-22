Return-Path: <linux-gpio+bounces-27461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47715BFC537
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69E7C565B42
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B1134AB18;
	Wed, 22 Oct 2025 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1VNOiWHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A034A3A5
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140479; cv=none; b=h0IkvoN5bfqurfVb7Q2+jCmfpEvwu5kKRShc3aYnVlkV8aioZFKFF7I8wN1Dsc+9XdOrsLpSlkBmh8eHE1+S0uvdcfv4PP15yJFPp0FrbUbq9SeyG+8W3NjZwQa1plsLBjEx6FDqYKj4guXc+S8DuN3Dx1or3w2L8F7R1fmk2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140479; c=relaxed/simple;
	bh=xumNdv5tHSlGiR6Uo5wMB7QnOViPzTZ1LJlOZQLZ++8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUOoe8O3QWSyiTua/LQAkcaoM799y3bULxBVtAj4YN5++PjLYFao5HhpCrN9GWi57cVJJHi8psdBfYs9hVH2KaD+UzxjCjfehMTFq6Kh5UOIS5gMbdf8UofgqkwYS0TMKYDeniJ2B6itn8WSL62SMQfZxUStrEV2RzcgMcYQdH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1VNOiWHK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4711810948aso48784245e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140476; x=1761745276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4k+rjq3pbnrn+KAlFDQYkobdD01FjitFCK3sS/xHt4=;
        b=1VNOiWHKYlPOOv1RVsWgmqwuxEs3nbvYAm7JA7prDS3bxwQauk00Evh5YEE4o8EmWD
         YsTNB/6Xy9ImnssnhZlFlSpDi67u5REj5NddN5K8gEhsInLqKgcN+RWZZnMdpSzZuBKJ
         Pjiz+8ICl2UnpUpPVIN3K5F2mqT+YCgXIpEMaazqWxnISArcbEIwlf2ZqA5/PwA5By6M
         hWxYq777dbrD5TJH429bcgGVysjI4+2JMHGAh6SSl8eYbxXncPiGZzOp+YPMFxWYKUSa
         b/9ZvRtRebxNGf7IgxZt+Ibv3MxNbHzSkILrJN7HHI40WVSR0yasLANM++1Yv1C9jpeL
         0pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140476; x=1761745276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4k+rjq3pbnrn+KAlFDQYkobdD01FjitFCK3sS/xHt4=;
        b=O3+HiPg8R4qoX4aEnkgM+WMRVzgYr61TcJlLzAMrbyLH37nAwpYOdcN7J2aWuMoW+g
         cNRFaRzGnqKryMCEIyP1mKoDa2xXaZdCvdRdE/zH764wNEIhy+T7+YWpr9KjbxcHBQfq
         lIoB+16kJxXKhdjnrZmAvOSApu4pAYR32IuE1bqrIR8eqTZn7wWsoWC6mthWvZmfhnDb
         6OYLTR9Amhmv2IxlWamMYLlWZ0rl82ZkfkODFp+vfdWWdAIfrjVDur37vM/3U/HmabOr
         pH4XK7KUxSR7Nz9mGebmFWQkVj/O3hOeMy4AjEvHS4LaxPwJPaZWq2nqCXLhDAAT3Fdq
         90+Q==
X-Gm-Message-State: AOJu0YxwhQrDIA0eJFnWVr9SWoAFS5J5AaTOdqKgQWt/hVJBKDB6xdNT
	AVkqY/tUxqzl41iSPbjy7WuVP/fdcHDfLfqGplJJLSshJUayjh4bMBnL0hr3ad6SlLs=
X-Gm-Gg: ASbGncv78PvDw8ngaGhERRr8HSdkryVQHYdQZDz9fz/M8Z/jGUHNPQCo9CL1tNVI+wZ
	DnlJb5ZKyixFTNJDLuZBWpwtQoFU5wGmikih16mR0RysM0Ewep1+QJyo/hrLkJlfWUi/9QEsn8V
	T9szdOOV3SmdOvVV9PCdkPPC7Wqki1PiZsq/40ZHtDPY6FoAhjeDO6eIusUshsO0+engb5S5HHj
	1pGKdObhaepl/xqnvPhJ+x972heJAhWBZkaLbvxNVeiwGJDqF50RzUzJf3hYWWUqo6tuhuAJ5ew
	cM+bt8gCCUZQjkaToSYb5Lg8alvKEASK3Qu6XhoBKX3AjlrNXwYJnVNTKgorBA+YFdt3FroiG7N
	jbYhAoDv6fGqO7CkM3gP4SvNGX7RCPPaerYi+K83wQ7akWGKCiQmhEt24ccoCxl3gmC5bnod5jR
	T9snT3TDqSHkDVFXqq
X-Google-Smtp-Source: AGHT+IHLfDyL3EXchB673RpcLSv0UUAc7v6gA04DageBPZBXkPdvk44uHqu3KvEupWX+WpjPqYyHJA==
X-Received: by 2002:a05:6000:144a:b0:427:e1bf:13bd with SMTP id ffacd0b85a97d-427e1bf1a74mr11502789f8f.52.1761140476166;
        Wed, 22 Oct 2025 06:41:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm24863066f8f.36.2025.10.22.06.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:41:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:41:02 +0200
Subject: [PATCH v2 3/9] software node: allow referencing firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-reset-gpios-swnodes-v2-3-69088530291b@linaro.org>
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4835;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZS81+7IzW7IqtPIzir6NGPfgS1nTcIoT685vTF8Lc9M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+N7zTt0c6nD8CCMyT/wCZsYMF9bOwMUJXHUr9
 OwPYRna4KSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPje8wAKCRARpy6gFHHX
 crI8D/9bScu7f2CHOXGM7dLVq6qAmDKz4JY/aRgl/l9+uCKnjRoH+1Sz/Hj7wX0NjFnI47lNgoB
 tEUDOgeUnHUdvN4TB11MNBa7AXkDnERkBEe31BayTup8V068l9IonpW1g+HxalXhdpGdVJXLmwA
 HLUYxm6bYSNEjFbI3EHEmXL6uO9894BNNteWAcsKbERmDaWoLvHebFsYo7GErT9TnHX553qbZRr
 5Qq0oTQL3JhWkQlvkOu0CYYH4F92Ce7BQHqbYYCCTksxg6tJn+t5wolL4yYQuzqxjRMuDeEc61E
 gy8hzhLqOFUM0wvypmnceDLggvtnNSf3Hsd8LgBg7i3a7SCUjrkVa4BAWB3Ze+lthKfWYAVK642
 OkDbaFtUHuDjEsyn69c50VjoaZUG5qBLeKfmEyf5QJtkUhFBHxond6dyaCJNUEDwEV676Qnva5o
 uS6VOx7VnfZ/BpIkHWxnfTrK6bt9P7nAqksjOkNp9oUowOWJ8dwqKalhhTc43WCznMF5b38WHWc
 odkRu5y4SaY1n4eoXuzzI0xxj3acesE8Wqk9oVSU7KJRhB94+o+qazvVVTg7Fu9OUCi4ZMFfnTm
 LKQqO4Yka9L2reV4ro8pslWyU9WTxGHIdYplp8VCIC9tuhXCBzGxof8TZokqQXne5QQfCjFOK2g
 ZHOI2aHB/ANHNcg==
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
 drivers/base/swnode.c    | 14 ++++++++++----
 include/linux/property.h | 40 +++++++++++++++++++++++++++++++++-------
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index b7c3926b67be72671ba4e4c442b3acca80688cf7..d08b914c07691336540cdf1dfbd77a697e7b4521 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -535,9 +535,12 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	ref_array = prop->pointer;
 	ref = &ref_array[index];
 
-	refnode = software_node_fwnode(ref->node);
-	if (!refnode)
-		return -ENOENT;
+	if (ref->swnode)
+		refnode = software_node_fwnode(ref->swnode);
+	else if (ref->fwnode)
+		refnode = ref->fwnode;
+	else
+		return -EINVAL;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop,
@@ -634,7 +637,10 @@ software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
 
 	ref = prop->pointer;
 
-	return software_node_get(software_node_fwnode(ref[0].node));
+	if (!ref->swnode)
+		return NULL;
+
+	return software_node_get(software_node_fwnode(ref[0].swnode));
 }
 
 static struct fwnode_handle *
diff --git a/include/linux/property.h b/include/linux/property.h
index 50b26589dd70d1756f3b8644255c24a011e2617c..52e784a3dfd4c93cee8b35e1cef5e0600639ecc5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -355,23 +355,37 @@ struct software_node;
 
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
+	const struct software_node *swnode;
+	struct fwnode_handle *fwnode;
 	unsigned int nargs;
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
 };
 
-#define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
+#define __SOFTWARE_NODE_REF(_ref, _type, _node, ...)		\
 (const struct software_node_ref_args) {				\
-	.node = _ref_,						\
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
@@ -463,14 +477,26 @@ struct property_entry {
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


