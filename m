Return-Path: <linux-gpio+bounces-982-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BA80396C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 17:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224D1280EFE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 16:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5E22D61D;
	Mon,  4 Dec 2023 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJjqFwHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF72A9;
	Mon,  4 Dec 2023 08:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701705748; x=1733241748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I3BxyR7sGYM/0yoNVJh1VwzK7MSxRwGnKpjvhvZzSkE=;
  b=gJjqFwHlqW1DPVy5a54rdpIWspG20IXzaRPjaJxLlfeUKcyMlsisig3a
   LNkl8KO5UWMVSL7LZghoKuyzNazzrzl6U6o4HYDGBieCj4oqo7WjW7e2v
   5CQju1Z9xm5WvEyghdtjUhV5FmgyBkspk3FoGoGa7cSSUTvxBtRg4GtQR
   jLRcrpUF+Kcld69mBARMwDYZlX08lzPwE8mz6en9UhDHNV2gDZeqDJCpH
   hUErF65uwU5OrNn/brEYnuBIjP0kF+w1or3BCmTYes5TwsJWHWTUAV5WW
   H9eaXBsFmWADdR0N6JJ6m1Y++TR4E9NbUG+Nx78OdjteS/PPMG1VXaKsc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="807872"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="807872"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774297196"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="774297196"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 04 Dec 2023 08:00:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 12746881; Mon,  4 Dec 2023 18:00:43 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Subject: [PATCH v1 2/5] pinctrl: core: Make pins const unsigned int pointer in struct group_desc
Date: Mon,  4 Dec 2023 17:56:33 +0200
Message-ID: <20231204160033.1872569-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's unclear why it's not a const unsigned int pointer from day 1.
Make the pins member const unsigned int pointer in struct group_desc.
Update necessary APIs.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 2 +-
 drivers/pinctrl/core.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 12daf0bb091e..6380e1fa6509 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -640,7 +640,7 @@ static int pinctrl_generic_group_name_to_selector(struct pinctrl_dev *pctldev,
  * Note that the caller must take care of locking.
  */
 int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
-			      int *pins, int num_pins, void *data)
+			      const unsigned int *pins, int num_pins, void *data)
 {
 	struct group_desc *group;
 	int selector, error;
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 8b59dd72e4ff..8ef4b536bca5 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -203,7 +203,7 @@ struct pinctrl_maps {
  */
 struct group_desc {
 	const char *name;
-	int *pins;
+	const unsigned int *pins;
 	int num_pins;
 	void *data;
 };
@@ -222,7 +222,7 @@ struct group_desc *pinctrl_generic_get_group(struct pinctrl_dev *pctldev,
 					     unsigned int group_selector);
 
 int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
-			      int *gpins, int ngpins, void *data);
+			      const unsigned int *pins, int num_pins, void *data);
 
 int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
 				 unsigned int group_selector);
-- 
2.43.0.rc1.1.gbec44491f096


