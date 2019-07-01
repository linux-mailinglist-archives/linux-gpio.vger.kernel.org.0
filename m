Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7315B789
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbfGAJNW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:13:22 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:34581 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbfGAJNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:21 -0400
Received: by mail-wr1-f46.google.com with SMTP id u18so4752123wru.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
        b=nVj4kZjPsghODf8pIYMBdQTJlSwuNFTN6LsNESZwAy+s3XPZgxLAc9G5YNpLsK8F8l
         MFC2qNPQCvPYWeIssqBDmsmeTnJ+sQE4t8OQK1OkFv58nn4CaTGmOt4Om5+AEw5oxrAg
         viqJz3Gz9bdBpEJRK5faApunYLOKpkyBcsb/S7OY2py+WNG6ThDKp4krYMduM1gficTU
         ZZin5WAl30gP7LP/+mmIC1mipA120aXCYbxX4o/bZX2fc+zVCW+OQ0x99IA8Im2x2e8D
         MsfXe37/sDUycbobHLlc9L4ugM+YZypY+3CH9exoSzbbLH/bi0ShBQpgh8cG5ZzpysSX
         iDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
        b=aD9B4XvswiDIFnAlKR+EOVru0jWYd1B+GZ/YnfAXha+aqCWX8EPOuFWnUuW8B4ez5v
         PW4p/Ntu+sywVP5P1R6RMg5qFqmRISzd3Ye+6HbWDOckTZq0SmxEH8DvnLKnafezmD4N
         I0cZGHlCKHqWTw2aPTpbdBdwUnISkbceI3jXkMrNNXzwgaSNTJ+E5siEyvdKO5ZKc5eW
         J9VCma56WaGqbcBTX3uYDCjhTMGUK4w3lc6n9bGSm9mz6OGODnveU+XDAf/FYOtJHufC
         XMAAyLZCZY8QCOMTm6UGwNsSOSbN45G4/pOyNfr5WCwRJQm3PltvvO6zW3fEeX3yeLNy
         RkYA==
X-Gm-Message-State: APjAAAUYpzZUnK3u35ZvTVyjf7kfBuKazMkvcD+SEazPKBH+4YE8+4xg
        BffFGEmMWHXL/xBBcJUCoUlMrQ==
X-Google-Smtp-Source: APXvYqzv3VoNE0QJ3qVFoa2fNSEmM/eDXNEDXdsWqAqO9ZhU482BSwxibAPMdy0qG7HfgH7P4bBC7A==
X-Received: by 2002:adf:c541:: with SMTP id s1mr17881931wrf.44.1561972399431;
        Mon, 01 Jul 2019 02:13:19 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 08/14] clk: meson: g12a: expose CPUB clock ID for G12B
Date:   Mon,  1 Jul 2019 11:12:52 +0200
Message-Id: <20190701091258.3870-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Expose the CPUB clock id to add DVFS to the second CPU cluster of
the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index b6b127e45634..8ccc29ac7a72 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -137,5 +137,6 @@
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
+#define CLKID_CPUB_CLK				224
 
 #endif /* __G12A_CLKC_H */
-- 
2.21.0

