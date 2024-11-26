Return-Path: <linux-gpio+bounces-13290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E19D9C61
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B88AC166403
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FA81DDC05;
	Tue, 26 Nov 2024 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq/rMQGf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0EC1DC04A;
	Tue, 26 Nov 2024 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641777; cv=none; b=jAWXG76IP7rDtX5C0AlmXA2pZATvrwX5007cAHNFEA6+OXYwycHGmDKrlacLgIcjb30VidaTJfqAJi5tcqCRIki1VJbhSs0sl1i3YBAOBmSPhuygn7jq5YmxWzTbNqo8a8+ixTnI44p96A742EZVi6gsUIyATQBugqn5GDowd2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641777; c=relaxed/simple;
	bh=g+K6g2+C+56PC91YCpejfEXqfjjG6DRnO5EU3AxJo4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJK+juJI8cYIVRhauqmD1s+MnCZAFWw1GzK10TstiJ5o6h8T6ul8ksE9zVCXYF+Hd0VAryPccm6t6YM4o4aVJOvQwQTIJghO38ZPrGOZ7eXbN4DqN62WOy2NfPbDb8PniWfTrFzh29wfu41/iZRf/JzqyRSnv7ZWZooLnkvw/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq/rMQGf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641777; x=1764177777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g+K6g2+C+56PC91YCpejfEXqfjjG6DRnO5EU3AxJo4s=;
  b=Rq/rMQGf5Nev+dfJt4jLBBMqkrPliC31t7259qU5JuTuST+Jikz9GmR+
   m6YKDp+fN1KNiSoKsrLpI/JfPLitp/Lx/Y49+uvZ3lKxxsa5tm+gR/4fH
   5oY9ZzMlge9pt7v4qZql8ntgM6eYMKRdp1lWZogWBOF2axQfPYk95o7v6
   if3+ixaR4ZJOU2Hf98O266eo1+qJ+4lxsz5gsf+SfVQPR+ZawxzxIb+hK
   7VLYDIECHg+TmKqpCXr0bZIOSv7smulncuf9Ro+4GtDTPzZRY/kHJmzw2
   oNagQKLLl24k49sim/4fA5hWQzJL1vZ2Wlf4eqS3aDVn0LWo2bJCElyPn
   w==;
X-CSE-ConnectionGUID: H3daPEiCQv6qzyo5YBYAUw==
X-CSE-MsgGUID: xiOjqys2QOeATaRdtwdauw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312953"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312953"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:53 -0800
X-CSE-ConnectionGUID: LAsf38AWTz6XoAszamDHIg==
X-CSE-MsgGUID: h6l7CKbzSTm6khIu2tgLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730562"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:49 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 3E7A51CAE1;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 3D7CE160011B; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
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
Subject: [PATCH v2 6/6] ASoC: Intel: avs: use devm_kmemdup_array()
Date: Tue, 26 Nov 2024 22:52:40 +0530
Message-Id: <20241126172240.6044-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() which is more robust.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
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


