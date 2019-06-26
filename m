Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8987A56542
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 11:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfFZJHa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 05:07:30 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:39400 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbfFZJGr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 05:06:47 -0400
Received: by mail-wr1-f41.google.com with SMTP id x4so1780562wrt.6
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
        b=a30c8DGxnt4ylB0Mmk238bZxwi3a5YpWwbJrwN62x5e6CuIG5Scn8PIKIxfG0tUsXh
         QRBt4rnHgkyg35xASa73uAW4ZkLEIrHnNtyYZBZfK6kmELIExmw5MhOrqlblGFqtPVMF
         Ffhsb1fkN+onB1QqEVt3IahLdsQ/zN/Igcs3BJ3e9+JGoy4p34ba9d6ALTCjV9p+hj2S
         iBzW4pCl4wsYkgs6t8RFiHOj8qWqr9oQ9Z61nrL72fJRuPIppVAELWSFg4YVgcCX6LR7
         CigTgM8RMLv7fOjfr71feX/nmbHCwiS7LLCFdHgfjJJhEHmfGsFb2s9ycRt4xc7hqSZb
         v5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
        b=Dgd3WF061sOz90K4ykBI5GDFjXUsAp3ROzc1Nd8YdkNQ+iT/tbo161dy6vQKNsKtFU
         RVmzwRxPyaLgupIwj7ErhtWkRvNTpcXv1daDLk4DbhK0CmVxYJgvgioaFvncO3gi0GIu
         CgC5/NyfE/7cAm11SKRAAFjIjI5CTU2nlhpyJu1tcGqbD4/8AKGVmgPTwCnJPXUTaryT
         yTAhKIfSiOqX1S/eGRcPz/UlW0sUcL3nZBIimSXPqS3X79GMJo/ScnccRbo1em4j7spo
         A2hXyYKC9EUoBQj3DOHYx01cGOiIDKzINn2gpoZpfn0n8XlVnkuEfbyL1Oo+D9oCNOkp
         nE6A==
X-Gm-Message-State: APjAAAX2eG/+X37iMNeDcBzOo1ycpgS9CBNpdiArtcMXr7Onk9ndbbP9
        Y/XoSLqvS61YApZ6LBFKVttP3ijOvS0=
X-Google-Smtp-Source: APXvYqzd+pHsHBIReUyJC87gldN99wQMDEQzxY2CeH7Qw6uiKNnQ0Fla5ojXQIGERhKAPYSQESKZgw==
X-Received: by 2002:adf:fb81:: with SMTP id a1mr2541965wrr.329.1561540005294;
        Wed, 26 Jun 2019 02:06:45 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 02:06:44 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v2 08/14] clk: meson: g12a: expose CPUB clock ID for G12B
Date:   Wed, 26 Jun 2019 11:06:26 +0200
Message-Id: <20190626090632.7540-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
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

