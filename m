Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6923856544
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfFZJHh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:07:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39875 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfFZJGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so1780437wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
        b=EnSOVVnY6HmW74fsUG11uqh4W9Ca4fhJ6b5ER6IbuUpbfQu++NdU/5WF603Kdm+tcR
         8Qt0AUaAuNZ+O0/4eJBu22IJ6rLN+IhUSoCUJFwXv98a8K5b6osxC5AJ4aHO9p9ryvJX
         qBbMvEAY/TDyWVnHEMQp3n+nr+M6YuHimQVA17Oglt+iPBFs5OgtmJPG+G6M2BEdg2QR
         gr4R89VAPzlxxwU3/vgiVpjydXGpqNYFOQcN3/dkh8M9IAkZfzq+NwCLa54zL7RvpQoZ
         4YQGtIQ3hpSRX7qed0bdC+ASgPHKNsZD09k7UmbT5JnuK6UM+bEy0RsllPrsz5Aams3U
         ce1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
        b=MF3liERuvoBCLTsRogZYsVx9reZv3eni+dNbI6nz/qGS/fC6z/OPRydy6/9GLU/xMT
         W5fSn/EJ4TMsu0Dy3s1LZKTyOCvO3AELmtLw5oJuikiCvFEY9nyGp57TNquj90DJEYAV
         rmt8bwNvbM2udZEn5wuu9Q1YUOm1ZO+PKcGKHxr/RBt98Ba6JpFpPBMtwpncMGjFUUGo
         5G0QQinPXHsPXsI4Bqt8V4Wrf+NZiSSR9uFdL2hQaNQRxl+oWhLq9r3QQP2xaL4ixH/o
         gGdLZUy14yhWdaGK6U7WuZTxVQUlEQFaMbq/TADOiuJBrajHN+yhNbsIwpWviTNw8xvA
         HCNQ==
X-Gm-Message-State: APjAAAWheq0uF7n+y+RihF9STZtf9aOzAP5dzwiDT5h5B81h9q8Q7xJ7
        Dmvs2EpGkioUCxDATwMBTcJfwQ==
X-Google-Smtp-Source: APXvYqz+1B6DzS6Kjekyrh2jZBiRU6kd29TGoNp8T45F8kR2z/VFBuW6kGnRaU/9KV8IL6dxlckyrw==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr2893052wrs.21.1561540003566;
        Wed, 26 Jun 2019 02:06:43 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:42 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 06/14] soc: amlogic: meson-clk-measure: add G12B second cluster cpu clk
Date:   Wed, 26 Jun 2019 11:06:24 +0200
Message-Id: <20190626090632.7540-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.

These IDs returns 0Hz on G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index c470e24f1dfa..f09b404b39d3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -324,6 +324,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(84, "co_tx"),
 	CLK_MSR_ID(89, "hdmi_todig"),
 	CLK_MSR_ID(90, "hdmitx_sys"),
+	CLK_MSR_ID(91, "sys_cpub_div16"),
+	CLK_MSR_ID(92, "sys_pll_cpub_div16"),
 	CLK_MSR_ID(94, "eth_phy_rx"),
 	CLK_MSR_ID(95, "eth_phy_pll"),
 	CLK_MSR_ID(96, "vpu_b"),
-- 
2.21.0

