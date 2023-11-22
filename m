Return-Path: <linux-gpio+bounces-371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A688D7F4D83
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 17:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84471C20AD3
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 16:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95204EB57;
	Wed, 22 Nov 2023 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXzcTe1y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14457A2;
	Wed, 22 Nov 2023 08:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700672207; x=1732208207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=70OauZuRPP6KycCByQoWfpx5xjLJf3PsZvlJylbXqz8=;
  b=WXzcTe1yXjfhs0AbXLORozR1rPNZEzT5nM4ZqzwdOcMbPZhj920mkAOG
   KRA1UmbIMNGLuM4hnHtGdC4stO0Ns0rLVXoPCXlT0uw71Kv3zIKIRR8ic
   PHJNimvTBEi99EadQKbFhA11u3AwpirMU6Lqs2cGXFlojgHA3Ywqy+hko
   RupK2fJkDZ0WQNDpHAyg7+ypM6TRdxJN09RI5ACq1qOCDnHOD6WIVqk/9
   wsmXX+3Ig7Q1vNbrOp6wVXu8jmctVhuP7KU6SmnlgKZiYy4RIqEE57aCd
   5VZlO+Fvb+EYjpUDER2c9Ojx2gMofw976XKGcyWspTC4i3eNRQrdRyxu1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5235458"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5235458"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="857815512"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="857815512"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 08:56:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D2FBE291; Wed, 22 Nov 2023 18:40:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v1 00/17] pinctrl: Convert struct group_desc to use struct pingroup
Date: Wed, 22 Nov 2023 18:35:32 +0200
Message-ID: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct group_desc has a lot of duplication with struct pingroup. 
Deduplicate that by embeddind the latter in the former and convert
users.

Linus, assuming everything is fine, I can push this to my tree.
Or you can apply it (assumming all CIs and people are happy with
the series).

NB. This series contains previously sent patches for Qualcomm and
Nuovoton. Here the updated version for Qualcomm that splits previous
patch to two and fixes compilation warnings.

NB. The function_desc is in plan to follow the similar deduplication.

Andy Shevchenko (17):
  pinctrl: equilibrium: Convert to use struct pingroup
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: qcom: lpass-lpi: Replace kernel.h with what is being used
  pinctrl: qcom: lpass-lpi: Remove unused member in struct lpi_pingroup
  pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
  pinctrl: ingenic: Make use of PINCTRL_GROUP_DESC()
  pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
  pinctrl: core: Embed struct pingroup into struct group_desc
  pinctrl: bcm: Convert to use grp member
  pinctrl: equilibrium: Convert to use grp member
  pinctrl: imx: Convert to use grp member
  pinctrl: ingenic: Convert to use grp member
  pinctrl: keembay: Convert to use grp member
  pinctrl: mediatek: Convert to use grp member
  pinctrl: renesas: Convert to use grp member
  pinctrl: starfive: Convert to use grp member
  pinctrl: core: Remove unused members from struct group_desc

 drivers/pinctrl/bcm/pinctrl-ns.c              |  4 +-
 drivers/pinctrl/core.c                        | 11 ++---
 drivers/pinctrl/core.h                        | 17 ++++---
 drivers/pinctrl/freescale/pinctrl-imx.c       | 44 +++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 13 +++---
 drivers/pinctrl/mediatek/pinctrl-moore.h      |  7 +--
 drivers/pinctrl/mediatek/pinctrl-paris.h      |  7 +--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c     |  9 ++--
 drivers/pinctrl/pinctrl-equilibrium.c         | 36 +++++++--------
 drivers/pinctrl/pinctrl-ingenic.c             | 27 +++++-------
 drivers/pinctrl/pinctrl-keembay.c             | 11 +++--
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  6 +--
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 16 -------
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 20 ---------
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 20 ---------
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 -------
 .../pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   | 16 -------
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 24 ----------
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 24 ----------
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 24 ----------
 drivers/pinctrl/renesas/pinctrl-rza1.c        |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c        | 10 ++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  4 +-
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       |  4 +-
 .../starfive/pinctrl-starfive-jh7100.c        |  8 ++--
 .../starfive/pinctrl-starfive-jh7110.c        |  8 ++--
 26 files changed, 102 insertions(+), 285 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


