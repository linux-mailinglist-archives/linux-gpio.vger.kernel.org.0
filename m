Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB6D2D8D62
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394683AbgLMNwf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:52:35 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:35021 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbgLMNwf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867554; x=1639403554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AeXALpcFI2zXhzG/wZi1dKZAPJWbKG/DcS+NIXfB8/U=;
  b=h6e76/UJpaLhvqsKYkAsuiZ95WrahJdAM/RvDjCtdextfqm68ettZpLr
   6faHFdLLjPAWizL5197FTjA6NVsQso8SYKR27V86vYodjQkVt/hB/MTwm
   iDUFHfBEQirpXaXmr3yinJ9N6ywSFt1knFTiqmllZ/xAqwtEl0gIIrsH3
   KLc1jzRm9xAD50SN8Uo8hVNfUJyx1p/8Vkys5NDfu7Qpa0qSvZAvH0d4I
   i0KOBM5XyWr1MkE10tMfMYkluGTs4AFHtI39aK61EFhORTZkuhO/6+1Xw
   YIYT83DsFL72THXVkNIoqLSy3GFBnNNObNkF+HzqBspSslBTVtuXom0Aa
   A==;
IronPort-SDR: LRYU4zc6IriCyEJSxHtSi2iGPB9KSgiHNmUR3xm0p2RiDHAIJnFzpWI+YGpii21Y9sd3NN7agm
 MzBXjlF7GgRj6KQRKfUT4BfgZTVr9T5ShGUrcxea81zqYV4Ioy9M2vx9K6WqoZyKM/KEI5BTMi
 UC/4fvUblSRmO/NcUtvgHM+zVAz7os0bpdD0jVoK2XGeqnKumndC4eRBD6v4GetZ6xX64ro0yr
 S/Ct6CV2hVN0KFgYiw3vWioZwMgUbysPUDgS6iIVIs1bTc/VvTckFZ9GAb/9RnOecQ0BNl7jDK
 P+k=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494576"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:04 +0800
IronPort-SDR: Ep7xFKEA1lU5SmvxlaumXXzAycC/tWM+KJT1nr7EkMz4SVI+Afc4PXBmgBTFADlkPOQ+zJfNvq
 LOLoNeE3vwqGOsa27xTbQwulegY1P0oHu+/pySZg2ItXKCCOhPkZLBRDBDV2XyAMr9CgPebl85
 pUMsr+JDsDL1r4mLVPgfD4bjxxeyIPy7n7Qp4Mvk23KE3ZcwwjPR+qdz4jRsMmGTMutDp6ExBX
 PE3kr7ax0txa10NmbZ3CoK2VyiWaKL/QF9Jetxo8WnJUM3ZT0hUte6uhvM3vcgSP3apPVwfQVz
 XbM8jddeASuW4oyoRd9Dt6NT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:34:49 -0800
IronPort-SDR: 1gUr4xZ26XKIGIcViBs1bDpgOXVGiLU09iNUovfjUS0XFMuIGuEK0TKWEtXCpZcr0wO8Au1tk2
 NoTjEOYPwSOM+YA0ANBvVS+lVrh9bRddCzC5hRCvgQQKh9NW3P2rzXa1piT4Dk0T9eMIYgaLcY
 sBPz12BeZ/0Cd2bCoN9yupyeBKrm9rO3MQD2vs9atpCpYyOTVYEJAZXYUngHg78rTmNkSKGWGW
 jBdUN/F3l94N/PZZB2B13mE9JcydffqxZT1KtEjGNFd6IGrBPAYzsB+99emhafBtmBUiVC+p3R
 dXA=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:02 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 02/23] riscv: Fix sifive serial driver
Date:   Sun, 13 Dec 2020 22:50:35 +0900
Message-Id: <20201213135056.24446-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Setup the port uartclk in sifive_serial_probe() so that the base baud
rate is correctly printed during device probe instead of always showing
"0".  I.e. the probe message is changed from

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 0) is a SiFive UART v0

to the correct:

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 115200) is a SiFive UART v0

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 drivers/tty/serial/sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 13eadcb8aec4..214bf3086c68 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	/* Set up clock divider */
 	ssp->clkin_rate = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	ssp->port.uartclk = ssp->baud_rate * 16;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);
-- 
2.29.2

