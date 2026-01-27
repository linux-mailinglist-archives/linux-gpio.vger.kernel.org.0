Return-Path: <linux-gpio+bounces-31152-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIQ4IbuUeGncrAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31152-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:34:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED192DDB
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 11:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF19303C2BE
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E21834251B;
	Tue, 27 Jan 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHiZfO4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CF341AA0;
	Tue, 27 Jan 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510014; cv=none; b=HBd+emmjQhZNORm/mDtlbjehZ8cYtLBhcKvHH6Mscl049PtDFYF1sYGCQ+IrZiIAbe3mYokkxYEqF2SopE3aGEtZCexbu2bcp2adLUKPcqsxQx7QroWpIjZGQ8Zz+0YR+gc3tpznTBA/oBRtzJH/s2jE0Vmrpmc4Cmg1QAcK3dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510014; c=relaxed/simple;
	bh=MP0MnsR/BquRxvUNp+TB4jwxKm3J5DHmTOVK3JU0UvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqUsYC7mqF3ewVamdAPgO9xK0VtBXBi2gqEiQjk3nRrafO4HrY6gp4AIT0QAtmrpoNHy8tDTmIXJvzDtG/L9vFMitDS8MF6FGGbTzNk+tUdegmxUbJ6cJ4E5d60KwWq9YBHXXOfnnpIAtUkZ0UVvFl8oYnihXqEyGuwS/ma6XYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHiZfO4m; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510013; x=1801046013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MP0MnsR/BquRxvUNp+TB4jwxKm3J5DHmTOVK3JU0UvI=;
  b=kHiZfO4m5gQi05xlmVyxzAnExr7sKNGuFxs47tspR6dJdBjrzXHupprV
   TMMnHLH6Gg+nEeCrS8tB8lmIw6SmdwFgKJ6lB4dfW8p/MWyhXAoq6xShi
   qASiS6Foyjb+mwn+mU26FNUS/54g7Ju/jAQ0nAJnYWLnXZDZf2LHgdjIp
   7KKs2uc+WN5ZmvlPTPvKrujFSmQriYDD4r7LVZP3VcMupxy1hXMHUzAh8
   hT7j1PO5TOymo4B8gRx9k/f02SwAjDo7ljueOaTwYHlpC5I/Si6vwbygg
   laB/P85S/ov6qXFTCZVXcFBhcRuriCb2S3RxxFdXrgvPa8tRx714PUiwy
   g==;
X-CSE-ConnectionGUID: o/TBxanOSliIf51jmKSJ0A==
X-CSE-MsgGUID: y/7YwD19T56wKsCFJRETNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93360009"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93360009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:33:31 -0800
X-CSE-ConnectionGUID: Jhy0DzNlSsiX6QnAq/0nug==
X-CSE-MsgGUID: cSR+34z2QIOlPYax2W11tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208184406"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 02:33:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 993789B; Tue, 27 Jan 2026 11:33:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1 2/3] pinctrl: core: Simplify devm_pinctrl_*()
Date: Tue, 27 Jan 2026 11:32:07 +0100
Message-ID: <20260127103325.3925173-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31152-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 31ED192DDB
X-Rspamd-Action: no action

Use devm_add_action_or_reset() instead of devres_alloc() and
devres_add(), which works the same. This will simplify the
code. There is no functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 67 +++++++++++++-----------------------------
 1 file changed, 20 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b2b86c4d8475..ebf803bff867 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1383,9 +1383,9 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 }
 EXPORT_SYMBOL_GPL(pinctrl_select_state);
 
-static void devm_pinctrl_release(struct device *dev, void *res)
+static void devm_pinctrl_release(void *p)
 {
-	pinctrl_put(*(struct pinctrl **)res);
+	pinctrl_put(p);
 }
 
 /**
@@ -1397,31 +1397,21 @@ static void devm_pinctrl_release(struct device *dev, void *res)
  */
 struct pinctrl *devm_pinctrl_get(struct device *dev)
 {
-	struct pinctrl **ptr, *p;
-
-	ptr = devres_alloc(devm_pinctrl_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct pinctrl *p;
+	int ret;
 
 	p = pinctrl_get(dev);
-	if (!IS_ERR(p)) {
-		*ptr = p;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	if (IS_ERR(p))
+		return p;
+
+	ret = devm_add_action_or_reset(dev, devm_pinctrl_release, p);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return p;
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_get);
 
-static int devm_pinctrl_match(struct device *dev, void *res, void *data)
-{
-	struct pinctrl **p = res;
-
-	return *p == data;
-}
-
 /**
  * devm_pinctrl_put() - Resource managed pinctrl_put()
  * @p: the pinctrl handle to release
@@ -1432,8 +1422,7 @@ static int devm_pinctrl_match(struct device *dev, void *res, void *data)
  */
 void devm_pinctrl_put(struct pinctrl *p)
 {
-	WARN_ON(devres_release(p->dev, devm_pinctrl_release,
-			       devm_pinctrl_match, p));
+	devm_release_action(p->dev, devm_pinctrl_release, p);
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_put);
 
@@ -2316,10 +2305,8 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 }
 EXPORT_SYMBOL_GPL(pinctrl_unregister);
 
-static void devm_pinctrl_dev_release(struct device *dev, void *res)
+static void devm_pinctrl_dev_release(void *pctldev)
 {
-	struct pinctrl_dev *pctldev = *(struct pinctrl_dev **)res;
-
 	pinctrl_unregister(pctldev);
 }
 
@@ -2338,20 +2325,16 @@ struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 					  const struct pinctrl_desc *pctldesc,
 					  void *driver_data)
 {
-	struct pinctrl_dev **ptr, *pctldev;
-
-	ptr = devres_alloc(devm_pinctrl_dev_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct pinctrl_dev *pctldev;
+	int ret;
 
 	pctldev = pinctrl_register(pctldesc, dev, driver_data);
-	if (IS_ERR(pctldev)) {
-		devres_free(ptr);
+	if (IS_ERR(pctldev))
 		return pctldev;
-	}
 
-	*ptr = pctldev;
-	devres_add(dev, ptr);
+	ret = devm_add_action_or_reset(dev, devm_pinctrl_dev_release, pctldev);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return pctldev;
 }
@@ -2373,23 +2356,13 @@ int devm_pinctrl_register_and_init(struct device *dev,
 				   void *driver_data,
 				   struct pinctrl_dev **pctldev)
 {
-	struct pinctrl_dev **ptr;
 	int error;
 
-	ptr = devres_alloc(devm_pinctrl_dev_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
 	error = pinctrl_register_and_init(pctldesc, dev, driver_data, pctldev);
-	if (error) {
-		devres_free(ptr);
+	if (error)
 		return error;
-	}
 
-	*ptr = *pctldev;
-	devres_add(dev, ptr);
-
-	return 0;
+	return devm_add_action_or_reset(dev, devm_pinctrl_dev_release, *pctldev);
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_register_and_init);
 
-- 
2.50.1


