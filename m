Return-Path: <linux-gpio+bounces-983-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109680396D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 17:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E15F28093B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 16:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9BA2D629;
	Mon,  4 Dec 2023 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6g/bhyr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0913E83;
	Mon,  4 Dec 2023 08:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701705750; x=1733241750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mX8nkFa+pUFM3JtjtNpLHJ2j2h/kDkAZjOuxZ+/LWq0=;
  b=i6g/bhyr6pd+nzjHfyVPWB8XrkdeQRJousy5sE7zljg8cznKg8y9U+qO
   +ge8Ax7hTVyEGSNtqRB8kyPZHZUNBGcSJ3uUiHJbKreLHYaoGk0W3d4pC
   DdpPMjLWixp7CX085SVwJDa69VwmAtUek5I9HXkL7Vgjk4Ifq+jW8OSGY
   mNqRZlqInyhBIAI1VNU7UaRLrGEluwbtTWoAsDlXWZAE8tS+O+dU4V/tf
   2R6CaCEjA5FjaBmS77jJxaK9408yWhIwfBWtW1H5LUpLnb2GjByD6TWhN
   TR6e3cR2FfLRgL2FICpSt+0vqAgFNda/uDDCkLKvt4lJMSOvwV4EjOHXa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="807884"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="807884"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774297203"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="774297203"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 04 Dec 2023 08:00:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2D122A5F; Mon,  4 Dec 2023 18:00:43 +0200 (EET)
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
Subject: [PATCH v1 4/5] pinctrl: keembay: Convert to use struct pingroup
Date: Mon,  4 Dec 2023 17:56:35 +0200
Message-ID: <20231204160033.1872569-5-andriy.shevchenko@linux.intel.com>
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

The pin control header provides struct pingroup.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-keembay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 152c35bce8ec..87d328853ae4 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1517,7 +1517,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 
 static int keembay_build_groups(struct keembay_pinctrl *kpc)
 {
-	struct group_desc *grp;
+	struct pingroup *grp;
 	unsigned int i;
 
 	kpc->ngroups = kpc->npins;
@@ -1528,7 +1528,7 @@ static int keembay_build_groups(struct keembay_pinctrl *kpc)
 	/* Each pin is categorised as one group */
 	for (i = 0; i < kpc->ngroups; i++) {
 		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
-		struct group_desc *kmb_grp = grp + i;
+		struct pingroup *kmb_grp = grp + i;
 
 		kmb_grp->name = pdesc->name;
 		kmb_grp->pins = (int *)&pdesc->number;
-- 
2.43.0.rc1.1.gbec44491f096


