Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1033326DD02
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 15:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgIQNoA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 09:44:00 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:5835 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgIQNey (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 09:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600349694; x=1631885694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TNfE+J8lkegxF+lyQIW6s0hqN7ALRP/ASxqfWb+N/SQ=;
  b=c7WI1FjpBtQ6OH9CfsZRFSfINLRW8RQQxM5UUMlZkhLkrKyM6WvYbMVg
   nJ3C95Bnl7yBX2nOKv5Rj55ECcu1DSRZumtHn/nl+5gZv2Ov+DUosH9mS
   fbXgsHQN+KafsBVov1oTXlRYQTlVFZHN/lVbRw9bCV4WyY7U8d2Rqd1H8
   pz4rh6hPY4OWSBxbt2uATjklL6WC5DMfG+6Gdo017lyLuQNomY8Lppuuc
   nOdBfmGK/78fceXwkAKA73Z/pTEbQcb9INrs/00l2nr4FtlQf2Mzs6k4k
   rvjTyoWnq9ZjBvbPx5nqfld8geSuAjkJ0QLEXy1kiMIYWwQNyGECHigr8
   w==;
IronPort-SDR: X44fELi7RJXe4sq0o7iB/hYhXm08A1nwl/5ivmu59oPewIaEdoQ3qrXvKytzCFM8VT97LywAA+
 +AZuusOGfOwIJyAnrYbHRWpFgtDRVIjT0P4XUqnhNtMngKP2LBRUeHOiESB3fy1j7IizzgDpjD
 fKzJsCX7gu5D0ylKQPkYd+v/qeKjLZMtHdKHuqvBmLMff5IJJKLmgk6RD5rVz+qQ1IK3onnMHU
 iyDFjjTqTrQWDRfpsrQF1qVkHlC7ysO7mNItAJeAFjiw0jpqLbZ6BT6GSjdkmmoMuDg8EmO2vu
 BpA=
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
   d="scan'208";a="92175720"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Sep 2020 06:13:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 17 Sep 2020 06:12:59 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 17 Sep 2020 06:13:18 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 2/2] pinctrl: at91-pio4: add support for sama7g5 SoC
Date:   Thu, 17 Sep 2020 16:12:57 +0300
Message-ID: <20200917131257.273882-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917131257.273882-1-eugen.hristev@microchip.com>
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for sama7g5 pinctrl block, which has 5 PIO banks.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 1c852293cb96..9f62152d0a62 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -999,10 +999,17 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
 	.nbanks		= 4,
 };
 
+static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
+	.nbanks		= 5,
+};
+
 static const struct of_device_id atmel_pctrl_of_match[] = {
 	{
 		.compatible = "atmel,sama5d2-pinctrl",
 		.data = &atmel_sama5d2_pioctrl_data,
+	}, {
+		.compatible = "microchip,sama7g5-pinctrl",
+		.data = &microchip_sama7g5_pioctrl_data,
 	}, {
 		/* sentinel */
 	}
-- 
2.25.1

