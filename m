Return-Path: <linux-gpio+bounces-13211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 825BB9D6B61
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 21:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DF9282307
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 20:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACE21AA1EB;
	Sat, 23 Nov 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aj55+Kd4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4D1A01C3;
	Sat, 23 Nov 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392371; cv=none; b=h9xBU53efX6JLYzQVhCgQj7TgINyvLxbF/GPMX0PrF8eZDCBYSrAH6q2D+628p1NyqBhuqtVjygq+zInFmQwgQTbcFbTAIh2ghdNfBVzdJyDjk5Y/XHtisST3y19aGoMBmSjL5Pw62wuj6CHd5jO9d7yeqNq49tSE0MvOw6vlYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392371; c=relaxed/simple;
	bh=UMESgxlu6dg0rI3zXwf63L7oJ9xxwpAQqZvdoZhqkuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uxRgGBhSSsgltyd++OcAPwDnkj6XhUL7g8/H/ClaWtUfpnivgjsO1ad+AnTP4Jjp0u7vwXoQEXW1wgraPtiDBxDprOeoBlLIltXuwdFAMa+YWQT+N+SH1sRaXbP84WWS814GPnlfsqEYbWU5KvH1P/i2pl/vPQ70nAHBCrH7b7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aj55+Kd4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732392371; x=1763928371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UMESgxlu6dg0rI3zXwf63L7oJ9xxwpAQqZvdoZhqkuE=;
  b=Aj55+Kd49uICQjzQE/NFBf9543qGeMZyxxAeDi7ZC+rMN0JbVYRt0az+
   eIjx1+tzvW6qoKA7DnpB2ZPEtV0DrnWK5rObEyLkKpY0/bY0VgylVT9Pc
   NgvEZjOmZpvWK3hLYo4aZwY30Us7vUpMPht1b5Zkbt0MIYzrZdtwCWmdw
   TeEE82/QCSc9GjmSjSkJ+BL0OzBwOHH2V8eFf3YtO+9GLv9CnxX3hAC4Z
   ren7XEYQnq/N6uhtoI0XIl2qYHrJuhpKjpTi9BVhNl2TxY3chWJi+2mTl
   cVmdQcbekQxeXvX57xm8TxCEy6IegAcXY1eSOk4c/8BcGkPIix/KTPP95
   g==;
X-CSE-ConnectionGUID: 9DSFbN9rSu+7UoJ/NbVHXA==
X-CSE-MsgGUID: yYlWtD7MT1yJ5m4k/1Qdqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32678554"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="32678554"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 12:06:07 -0800
X-CSE-ConnectionGUID: cF0Xm40AQsKReCrd/Ya44g==
X-CSE-MsgGUID: A86QlW7bSmCKzpfbE+boTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="121737996"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2024 12:06:04 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 189B31CADA;
	Sun, 24 Nov 2024 01:36:03 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 03BBA160010D; Sun, 24 Nov 2024 01:36:03 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	dmitry.torokhov@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.dev
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/5] pinctrl: pxa2xx: use devm_kmemdup_array()
Date: Sun, 24 Nov 2024 01:35:25 +0530
Message-Id: <20241123200527.7830-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241123200527.7830-1-raag.jadav@intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() which is more robust.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index 9e34b92ff5f2..9fd7a8fb2bc4 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -281,9 +281,8 @@ static int pxa2xx_build_functions(struct pxa_pinctrl *pctl)
 		for (df = pctl->ppins[i].functions; df->name; df++)
 			if (!pxa2xx_find_function(pctl, df->name, functions))
 				(functions + pctl->nfuncs++)->name = df->name;
-	pctl->functions = devm_kmemdup(pctl->dev, functions,
-				       pctl->nfuncs * sizeof(*functions),
-				       GFP_KERNEL);
+	pctl->functions = devm_kmemdup_array(pctl->dev, functions, pctl->nfuncs,
+					     sizeof(*functions), GFP_KERNEL);
 	if (!pctl->functions)
 		return -ENOMEM;
 
@@ -314,7 +313,8 @@ static int pxa2xx_build_groups(struct pxa_pinctrl *pctl)
 						pctl->ppins[j].pin.name;
 		func = pctl->functions + i;
 		func->ngroups = ngroups;
-		func->groups = devm_kmemdup(pctl->dev, gtmp, ngroups * sizeof(*gtmp), GFP_KERNEL);
+		func->groups = devm_kmemdup_array(pctl->dev, gtmp, ngroups,
+						  sizeof(*gtmp), GFP_KERNEL);
 		if (!func->groups)
 			return -ENOMEM;
 	}
-- 
2.35.3


