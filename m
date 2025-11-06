Return-Path: <linux-gpio+bounces-28195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D6C3BCD9
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 15:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C917423239
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 14:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F080340A73;
	Thu,  6 Nov 2025 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="03BxHOI3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2E033EB0B
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439572; cv=none; b=tpxkse6Yy7b1hqUsNc4LATkiJ+YgYdQ7cgKRt4wHNRVLXqTtt5OZiRYs5O0PPmNzteyAWyv+Dd77BWPtUBDDmund7+AjurFoezIWMWAK1QFJFRcmfMzjnQODLXBMUB49AQgR28FyfuI0VYwjvJOsu94hYFTXLfcAAF3JY/vwNzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439572; c=relaxed/simple;
	bh=ogys2EZhfFSnh9TKbDolepyjerxXO8VxWq72k0lyQGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sk3gqAGP7/szkC0YDuz8kibC9hQHLMlyV2xxJYx/6R6faJJzYhx5a2GTx5TK6/nFerxNiiYedjJBVuujedHMYT065hhGqKBz2748WjMlh5HDu5EyDXwwU9zzfezyLYdzL6i7TU/22yA3pCP/mVyj/4Ev9yDZvQ/Ui4DbbhLEMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=03BxHOI3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477549b3082so9695245e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762439568; x=1763044368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImGcemsFvXDjNWCPFtBPW0d7o3wRSDm6gKdcQwQP5/M=;
        b=03BxHOI3BN60VwT45As+Ah6FpKi5H0t+nNRc7l0t5f3gd9aY0gcFnYCqsUPn8EPxMo
         RoYHrPyKerdN4Y/SXelrAVVVkBQUbqEqdmIOipjak9171/AoSF3M5sXK1eR+AgOHcteg
         nwE837ty/C1DdT88WilHyC+bsl652QEHEpAihnwkjQyoAQ1OgF2Jeq9ofrNYbXpGm5ui
         2VFGnKrLne+C63jG3n7WBsjR04/TyyP46Q68VYhKMqioJz6y+kosflnRO+TQdSysrZgT
         HKhE0hfc059pa2o3mLC8gkx9oPm+deEGNcDfhIgOhNMXaIF96duUvg/UHrHiEJaam8ED
         Hyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439568; x=1763044368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImGcemsFvXDjNWCPFtBPW0d7o3wRSDm6gKdcQwQP5/M=;
        b=Wmi00xhlr0ZL3TwTs2f428Y0qmt4xqreaMt+bOl29WugxQ0mSuwjlAaqHrIcTGAoeh
         tk04Pt/Z4JLVSOge1KqfqwF5fY1SlISUrIOjwp7v7AkZ/QJYfXy4Rxzc4IGKgZHLr4re
         0k1QdUNkWT4+1QdYqRaTtqRgS61l4FXq/CsGjlRspxcpU2wFDnIJKUslfQV3siINFaCQ
         aTrHk7EJ0nu5NUIpMaemY8YeCvv0HN62zY0aNwc9oBraf2Adjtti6525Gg0Crmi6HC6f
         S1nkulmjUQ7flaCETyjDIjFZQEXIvUaD7BvNNMQsbMmqJ4tH/jU4nQ/6WI1xd/xM1FFt
         NBbw==
X-Gm-Message-State: AOJu0YxyBUnhgZuKpgAgvU0oeN5TZ3iAGKOUob669BvJAOHlJiy1adqP
	HxWgpivPMv9okCFONYkQsONJKQYds6ss6RQjbcaC72muWxYYzNm/gWCG7TD31eH+EUE=
X-Gm-Gg: ASbGnctIrYvjRi8rwFnlgSU0wQ6uCiM5xOzn2i+u27AEX2xZpdui2uSoKczr1Vs6VS1
	BaoY6c+BLigq7zahhNfISqJiXHI3md8HvMtqNhuFKFYHrRwMoSLUXybTvEecbUIQmrJ2syMLvwo
	AGGzpA9W1IyQU1iRGGKxbDhBKNKvgDegF18rL2z+1mAAiDjYiZeU7u7GRmw0uZfwKq/RxUIBJ7y
	M8CzuwmuhieIzDqlVNl3nrmDlDQyj20wQ9+MHLVYSJM22vpNiBCXrb1NnA8u/VVNNfZl7d3sqXU
	+viIpzyWIIqOuLKFFLOjHIEh/bIPMKNHUZbJzBges+eVWNBWX5Tyd49VIpd2NCteJaYzU5cJoG5
	MK/0/C37GOaa2dQfH53h+/HM0f9iovD2uKUPUOgpUK9pFn9cdmLWAuFnSs4NswOMgJLxuU4snGF
	OZcxI=
X-Google-Smtp-Source: AGHT+IFCdm6f1PqAwQZCefwuN5Ba+GuMsPPYnzn4FUIGeoArk2eJIorYQiEN4nUrGo8VvRcbFXORbg==
X-Received: by 2002:a05:600c:8216:b0:477:3e07:217a with SMTP id 5b1f17b1804b1-4775ce211b8mr75203125e9.36.1762439568104;
        Thu, 06 Nov 2025 06:32:48 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763de4fb5sm18871515e9.2.2025.11.06.06.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:32:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 15:32:32 +0100
Subject: [PATCH v6 3/8] software node: allow referencing firmware nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-reset-gpios-swnodes-v6-3-69aa852de9e4@linaro.org>
References: <20251106-reset-gpios-swnodes-v6-0-69aa852de9e4@linaro.org>
In-Reply-To: <20251106-reset-gpios-swnodes-v6-0-69aa852de9e4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3881;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HpU6/kofClihOZLaRH1MDHt2R8t6/Ip5QySfB23CsUM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDLGHwEikvsoeb9jagwVVc9pM4AhbQuq+ekwJc
 haYtxnuhxaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyxhwAKCRARpy6gFHHX
 ckRJEADFED31WNfI5lyOtIRU/+69mQA47s6BhhAoyJT3rgmTi+xR6J6SYX7UEPKClkl8QBKySuK
 EzoTSSub4t5nIioNOq6/Eh3lPQerwcYNkG3Ss4cHUEKqyO3YdIN6RHqBXghJLWFali1D3JzD1D3
 YhE6mrggGCJePbPB1bLl3MLwnooDoEXPE0WsJ/uLWvaAZ/UoYIWnEYdOpmAVKZU8onnHuYfQOJa
 J2pxr3aUbl0Cb4kD1w8T7O8sBZFKyRHGWIzceIiRRU1NhPWjuZUaz392xhkUqteLwvTezt4tHqS
 7eAyFyUGMJCT4F2sbHgP5Am/WIcN7gqb8Mw9LaR19Ssv7H09Rut6QDn3X5cGCC2vKZOX10lRDCb
 YUpWmoAHT9PxtLKy4N+MRvvi/cU4XOJYe+tRBRWTNJYBBaCbfPwG5YVih93FlkVvtCAge9kWPm6
 /lVoVBLt02Po759Tx1LicpW04gw0rDNi03FKxAm0uC4xcmePmOs8WtYnPhwCY5qylyvHUSP1PIS
 YRHGG4yF5MrnkE4rcMuB0KjsNSvuc6mEONM99XUC6/VtRGRf9UeDEoNArl3pgzk57EISMEW2PXL
 XmKyv5Qgg3ihungUakZh84sp+SO9WXOhIaplRudJNf1EsiCeAEsSalA3S87+JG23LnrCjdbCJIB
 cXdPC8E+824DlXQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

At the moment software nodes can only reference other software nodes.
This is a limitation for devices created, for instance, on the auxiliary
bus with a dynamic software node attached which cannot reference devices
the firmware node of which is "real" (as an OF node or otherwise).

Make it possible for a software node to reference all firmware nodes in
addition to static software nodes. To that end: add a second pointer to
struct software_node_ref_args of type struct fwnode_handle. The core
swnode code will first check the swnode pointer and if it's NULL, it
will assume the fwnode pointer should be set.

Software node graphs remain the same, as in: the remote endpoints still
have to be software nodes.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c    | 24 ++++++++++++++++++++++--
 include/linux/property.h | 13 ++++++++++---
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 6b1ee75a908fbf272f29dbe65529ce69ce03a021..16a8301c25d6390ba304c66411d1a261345184f3 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -535,7 +535,24 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	ref_array = prop->pointer;
 	ref = &ref_array[index];
 
-	refnode = software_node_fwnode(ref->node);
+	/*
+	 * A software node can reference other software nodes or firmware
+	 * nodes (which are the abstraction layer sitting on top of them).
+	 * This is done to ensure we can create references to static software
+	 * nodes before they're registered with the firmware node framework.
+	 * At the time the reference is being resolved, we expect the swnodes
+	 * in question to already have been registered and to be backed by
+	 * a firmware node. This is why we use the fwnode API below to read the
+	 * relevant properties and bump the reference count.
+	 */
+
+	if (ref->swnode)
+		refnode = software_node_fwnode(ref->swnode);
+	else if (ref->fwnode)
+		refnode = ref->fwnode;
+	else
+		return -EINVAL;
+
 	if (!refnode)
 		return -ENOENT;
 
@@ -633,7 +650,10 @@ software_node_graph_get_remote_endpoint(const struct fwnode_handle *fwnode)
 
 	ref = prop->pointer;
 
-	return software_node_get(software_node_fwnode(ref[0].node));
+	if (!ref->swnode)
+		return NULL;
+
+	return software_node_get(software_node_fwnode(ref->swnode));
 }
 
 static struct fwnode_handle *
diff --git a/include/linux/property.h b/include/linux/property.h
index 50b26589dd70d1756f3b8644255c24a011e2617c..272bfbdea7bf4ab1143159fa49fc29dcdde0ef9d 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -355,19 +355,26 @@ struct software_node;
 
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
 
 #define SOFTWARE_NODE_REFERENCE(_ref_, ...)			\
 (const struct software_node_ref_args) {				\
-	.node = _ref_,						\
+	.swnode = _Generic(_ref_,				\
+			   const struct software_node *: _ref_,	\
+			   default: NULL),			\
+	.fwnode = _Generic(_ref_,				\
+			   struct fwnode_handle *: _ref_,	\
+			   default: NULL),			\
 	.nargs = COUNT_ARGS(__VA_ARGS__),			\
 	.args = { __VA_ARGS__ },				\
 }

-- 
2.51.0


