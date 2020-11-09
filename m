Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021DA2AB80B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729750AbgKIMSp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729766AbgKIMSi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 07:18:38 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3611C0613D3
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 04:18:37 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id 62so6983218pgg.12
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sSxJk69Cd2LemrQN9ehPZlO0F43/6TrspTvKZvZYbs0=;
        b=pmuo933XaVA/Fh1QO2JzQbKDac6h4v+Oqyf8ncJqYZu7oaVjlJRKOZwKmCJhUncmdn
         DfBorPy72/HklgC5k0HSiiIAJ9cXSHXMx93z3lc8+OuZISmktsTJFcGxk/wupSQZF2cK
         Q7gUtLBoltY4foSLBOhZixUrYKs7D5k4JYRXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sSxJk69Cd2LemrQN9ehPZlO0F43/6TrspTvKZvZYbs0=;
        b=dbabDG+P1DnE/YN4E7pYBrGlSD7h8jnho14uNj8HmgK3HBiV/5ECEEGnGaDhe4FqzQ
         Eq7hMnYbZ1cbW0LHg1WtzqkbgVUxBfSfgHtONZu89PGsDwqFqHSfStGEf8J1ebsBfIO9
         v5nWsc3g5c6Kx6bL6y3bfChmyGTf11DwQgw8kE8vLe3gGRagpTZ0mNFYZb+cUcT7XeCT
         4kzKaA+1gsTNo9uimFG9TH6Uo+kl3izJWTQdMfpMtNkTPk9G2rSMD9+IgMdyAf9ckbnF
         xXCMj1HTL0PEY09ij+odnl3hl57oFkclZ+ff9HZJimBTGAgK6s60VLckxdHjVkH4CGrI
         qaeA==
X-Gm-Message-State: AOAM531Lkm5gv1SamP0YxANZEH9PIwIRiBo8E0qNeM4XM3DC0+LH99AH
        jmTnHjy0imFeqWxFf+UKS4ZFrg==
X-Google-Smtp-Source: ABdhPJzdFErnM/SPti1r7wDEP5FTsyTtZ5m0A/fqhvdDHYaRqZmUPHvt/xRUFxuyf/HE2hWsFGYJ6A==
X-Received: by 2002:aa7:9f06:0:b029:18a:e1a6:cec9 with SMTP id g6-20020aa79f060000b029018ae1a6cec9mr13488102pfr.20.1604924317330;
        Mon, 09 Nov 2020 04:18:37 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id i123sm11425204pfc.13.2020.11.09.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:18:36 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     soc@kernel.org, linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3 5/5] ARM: mstar: Fill in GPIO controller properties for infinity
Date:   Mon,  9 Nov 2020 21:17:31 +0900
Message-Id: <20201109121731.1537580-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109121731.1537580-1-daniel@0x0f.com>
References: <20201109121731.1537580-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fill in the properties needed to use the GPIO controller
in the infinity and infinity3 chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-infinity.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity.dtsi b/arch/arm/boot/dts/mstar-infinity.dtsi
index cd911adef014..0bee517797f4 100644
--- a/arch/arm/boot/dts/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity.dtsi
@@ -6,6 +6,13 @@
 
 #include "mstar-v7.dtsi"
 
+#include <dt-bindings/gpio/msc313-gpio.h>
+
 &imi {
 	reg = <0xa0000000 0x16000>;
 };
+
+&gpio {
+	compatible = "mstar,msc313-gpio";
+	status = "okay";
+};
-- 
2.29.2

