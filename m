Return-Path: <linux-gpio+bounces-13213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E79D6B67
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 21:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA34281C4F
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 20:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1031AB530;
	Sat, 23 Nov 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZWzLDo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3B1A3047;
	Sat, 23 Nov 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392372; cv=none; b=VlXALqQknh5wHXVU3b14WFgrUagDvxUCOeznXYZpwlpHAyx3TX1msyXojptTV0yhWEnygXIYbe4V7hGcylCqpRwPRrIXhuxw9Ra/zmEn3KuuSuqsMErAOXUBbxyvUTiq5knUR73L24NSv5KXcawzAViXJIXxr/KazoiMiG5CCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392372; c=relaxed/simple;
	bh=++FE/7iFKI7NjgLLAi5nkL/mj98q5NwZkvRUtGH5+AI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UyDBPO5/MuoTQOKKfvz1HxO4QwFL5ED/lM2Q0BtFAK2oG5DCF15vp2MgkLxr5HQ7ijqW6bnKVAZby2ft050q8BZ5YpwDxq5zkXw9Rj60wQDJHe8LBfc6mPBNLD5LmsKAb/HM0baLKsw6Lgki3xQ21MmiYj01M/JF2YfWtqQxz6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZWzLDo4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732392371; x=1763928371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=++FE/7iFKI7NjgLLAi5nkL/mj98q5NwZkvRUtGH5+AI=;
  b=YZWzLDo4uznLcATZqS+bKSNvfmTF9y9dqC1W5P5c8QRX12qx2wa99toT
   DfVvHqer4npjxll+SMWo5StTcyQhkIR5ER06Ic4eU2lKRrnFiiRN8H+Ab
   9a3Ho3JwWjCQxWa6afBINO2sGGRQnMD59ZBnwVD93zCgSDdkD9WWv0FRh
   Zsv2WekRt8X3RBMrXwaCacelSp2R9CY7PQMBs85J8ZOB3l2miLoNIK8xN
   68+gBMjMXoyKByThd9Y/HBSDXF59XltRZYt04Hbku9DcRB6jwpVKxvoQa
   GWS4/E8V3OmxiQYB1/IOtZ6+zL7EmS+UZqRJUurE3rmfXoHHZiB9XepEY
   g==;
X-CSE-ConnectionGUID: jSn91T7fSdyScDwBrtcbCw==
X-CSE-MsgGUID: PGmtXOudRT6nLqxOI3T0rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32678557"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="32678557"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 12:06:08 -0800
X-CSE-ConnectionGUID: fhU+mkJvQ5CJ+KPPPODyZw==
X-CSE-MsgGUID: kOVrtAkcT9erutaGHfsrNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="121737998"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2024 12:06:04 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 2428D1CADC;
	Sun, 24 Nov 2024 01:36:03 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 098431600112; Sun, 24 Nov 2024 01:36:03 +0530 (IST)
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
Subject: [PATCH v1 5/5] ASoC: Intel: avs: use devm_kmemdup_array()
Date: Sun, 24 Nov 2024 01:35:27 +0530
Message-Id: <20241123200527.7830-6-raag.jadav@intel.com>
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
 sound/soc/intel/avs/boards/da7219.c  | 3 ++-
 sound/soc/intel/avs/boards/es8336.c  | 3 ++-
 sound/soc/intel/avs/boards/nau8825.c | 3 ++-
 sound/soc/intel/avs/boards/rt274.c   | 3 ++-
 sound/soc/intel/avs/boards/rt286.c   | 3 ++-
 sound/soc/intel/avs/boards/rt298.c   | 3 ++-
 sound/soc/intel/avs/boards/rt5663.c  | 3 ++-
 sound/soc/intel/avs/boards/rt5682.c  | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a95654..1b8f58b611a4 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -113,7 +113,8 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 	}
 
 	num_pins = ARRAY_SIZE(card_headset_pins);
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index c8522e2430f8..8103e539e08a 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -109,7 +109,8 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 	data = snd_soc_card_get_drvdata(card);
 	num_pins = ARRAY_SIZE(card_headset_pins);
 
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a..0945a539b364 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -88,7 +88,8 @@ static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 	jack = snd_soc_card_get_drvdata(card);
 	num_pins = ARRAY_SIZE(card_headset_pins);
 
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb4..bdf36c7c744a 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -98,7 +98,8 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 	jack = snd_soc_card_get_drvdata(card);
 	num_pins = ARRAY_SIZE(card_headset_pins);
 
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb..f94382389430 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -59,7 +59,8 @@ static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 	jack = snd_soc_card_get_drvdata(card);
 	num_pins = ARRAY_SIZE(card_headset_pins);
 
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2..985bfa977edb 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -70,7 +70,8 @@ static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 	jack = snd_soc_card_get_drvdata(card);
 	num_pins = ARRAY_SIZE(card_headset_pins);
 
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e90969..fd8b0c915efa 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -65,7 +65,8 @@ static int avs_rt5663_codec_init(struct snd_soc_pcm_runtime *runtime)
 	jack = &priv->jack;
 	num_pins = ARRAY_SIZE(card_headset_pins);
 
-	pins = devm_kmemdup(card->dev, card_headset_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_headset_pins, num_pins,
+				  sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc..6d7022707ca7 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -102,7 +102,7 @@ static int avs_rt5682_codec_init(struct snd_soc_pcm_runtime *runtime)
 	jack = snd_soc_card_get_drvdata(card);
 	num_pins = ARRAY_SIZE(card_jack_pins);
 
-	pins = devm_kmemdup(card->dev, card_jack_pins, sizeof(*pins) * num_pins, GFP_KERNEL);
+	pins = devm_kmemdup_array(card->dev, card_jack_pins, num_pins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-- 
2.35.3


