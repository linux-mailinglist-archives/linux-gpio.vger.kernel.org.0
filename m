Return-Path: <linux-gpio+bounces-14871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66BA14014
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 18:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F96718854B6
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2025 17:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349DA15442C;
	Thu, 16 Jan 2025 17:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="uHZJqAUq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267522D4C2;
	Thu, 16 Jan 2025 17:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737046942; cv=none; b=HN+hGE0wFjsQnQndiz/2YzNpug2dZE2DHa446OtXr21ci6JtTgvFkU96l6ekIMVXpaxc2k9CDfvrvpAEpIsZ/MLx7Tknk2FulxUchbjw/cyeUctwCHVkl+OVbDAe3Zwj+fd6OqWvN69jRP16O5SlBJEXI0GAor9rT6kLbwdY1MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737046942; c=relaxed/simple;
	bh=jMEEum3ve00CUjEyPkolngv1gL/2j1F7iZMqQ7jeUgc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jdNRtwLjUCG09yQhtTmUrro5uytdeMKa1uKp3d1YlEV38d7X3AkGn9jFlWE6dSi7jRHx2QnT4MqjW6N/9QsrGx5cJJ1oGckJZVNRc6zjj4GB90b3GDcgKkKA5v0jjE+bosWedN27BgWSwvVfVIjtNtSjveqVIlMqmlUMjqPMP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=uHZJqAUq; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEG8rK001971;
	Thu, 16 Jan 2025 18:02:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=XqUjAnkdbdKoF2m0xLK69F
	3jtB/Ne1m5lxZSAdspRZE=; b=uHZJqAUq15jYge9OZr0WDLwPwSaIIud3h1Wjyu
	HaRgRHg19fk1j6CpTaueu+ZDn2Rt0cUxC77Dm1efD6xShw/NTwQdH13/57ctLhnN
	BDa64z0fSswVXD2R2pG8bLly+YUvpAlyYrzuQlIU4S7ZjMND/Ugek0YBOlsSJJ1s
	fLLp/0gItNfbuMBUjJUDtghYPfkBxL1OezKRb4CAOVXcKcrVhz9peryuAIvQsnZZ
	u/YfkQh+SjeSHQGetHp5NJn6kUFgt4HHOluGqGAhz3rxR1jL49U8jJu4BkuXTcaD
	KTOocIo+Jn0uznpQjxr+Zas7DcDEzMmzn67iuy3y/reaqDAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44709r1ta3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 18:02:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7023040092;
	Thu, 16 Jan 2025 18:01:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BECD125E65C;
	Thu, 16 Jan 2025 18:00:16 +0100 (CET)
Received: from localhost (10.48.86.111) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 16 Jan
 2025 18:00:16 +0100
From: Valentin Caron <valentin.caron@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Valentin
 Caron <valentin.caron@foss.st.com>
Subject: [PATCH] pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
Date: Thu, 16 Jan 2025 18:00:09 +0100
Message-ID: <20250116170009.2075544-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_07,2025-01-16_01,2024-11-22_01

Cross case in pinctrl framework make impossible to an hogged pin and
another, not hogged, used within the same device-tree node. For example
with this simplified device-tree :

  &pinctrl {
    pinctrl_pin_1: pinctrl-pin-1 {
      pins = "dummy-pinctrl-pin";
    };
  };

  &rtc {
    pinctrl-names = "default"
    pinctrl-0 = <&pinctrl_pin_1 &rtc_pin_1>

    rtc_pin_1: rtc-pin-1 {
      pins = "dummy-rtc-pin";
    };
  };

"pinctrl_pin_1" configuration is never set. This produces this path in
the code:

  really_probe()
    pinctrl_bind_pins()
    | devm_pinctrl_get()
    |   pinctrl_get()
    |     create_pinctrl()
    |       pinctrl_dt_to_map()
    |         // Hog pin create an abort for all pins of the node
    |         ret = dt_to_map_one_config()
    |         | /* Do not defer probing of hogs (circular loop) */
    |         | if (np_pctldev == p->dev->of_node)
    |         |   return -ENODEV;
    |         if (ret)
    |           goto err
    |
    call_driver_probe()
      stm32_rtc_probe()
        pinctrl_enable()
          pinctrl_claim_hogs()
            create_pinctrl()
              for_each_maps(maps_node, i, map)
                // Not hog pin is skipped
                if (pctldev && strcmp(dev_name(pctldev->dev),
                                      map->ctrl_dev_name))
                  continue;

At the first call of create_pinctrl() the hogged pin produces an abort to
avoid a defer of hogged pins. All other pin configurations are trashed.

At the second call, create_pinctrl is now called with pctldev parameter to
get hogs, but in this context only hogs are set. And other pins are
skipped.

To handle this, do not produce an abort in the first call of
create_pinctrl(). Classic pin configuration will be set in
pinctrl_bind_pins() context. And the hogged pin configuration will be set
in pinctrl_claim_hogs() context.

Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
---
 drivers/pinctrl/devicetree.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 6a94ecd6a8de..0b7f74beb6a6 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -143,10 +143,14 @@ static int dt_to_map_one_config(struct pinctrl *p,
 		pctldev = get_pinctrl_dev_from_of_node(np_pctldev);
 		if (pctldev)
 			break;
-		/* Do not defer probing of hogs (circular loop) */
+		/*
+		 * Do not defer probing of hogs (circular loop)
+		 *
+		 * Return 1 to let the caller catch the case.
+		 */
 		if (np_pctldev == p->dev->of_node) {
 			of_node_put(np_pctldev);
-			return -ENODEV;
+			return 1;
 		}
 	}
 	of_node_put(np_pctldev);
@@ -265,6 +269,8 @@ int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev)
 			ret = dt_to_map_one_config(p, pctldev, statename,
 						   np_config);
 			of_node_put(np_config);
+			if (ret == 1)
+				continue;
 			if (ret < 0)
 				goto err;
 		}
-- 
2.25.1


