Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 311965B78B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 11:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbfGAJNX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 05:13:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35636 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbfGAJNX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 05:13:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id c6so15042511wml.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2019 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLPdkIIajL0BePyX9s9LXKBvN5QXDWO/1gyRVKFqDN0=;
        b=aE0/HsdUowLdBiwwT5Llzn0yz2Mvoo0fNfQZ5VdqgzbnTVn1ofeKlzTJ7TiheerzSR
         i+0YiHLPhzrVP676eQ/tK4gvqF0+gkZwOPZ9830FpXIbP6EI2Mrsodt46cWtxlIwLMbz
         f+ijT/977kKhzkbELGMiD1/5N5FnkI/58DZwTALokN6CfJEj6z1wc4I9YtYNXd2UqvGY
         dkkVBXAffZVlAgGrsfIRDrzfT7/eVJaD6ETXKzHAODaDrRasdA69TK7QmA3+r21ozjtd
         vf9awc9KkKIal/dK7VuA0RRgM0y769hNiNlgQZI9SZV0EfVUf8YcBhExp7Iubzzbr/Lm
         m5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLPdkIIajL0BePyX9s9LXKBvN5QXDWO/1gyRVKFqDN0=;
        b=j2cGSFtMKofl/DZtC4jCXnPr05T5oyINPtaiVzGwwt7tmvn7OHNDq0nvrBwvuWMAZX
         Th8tVKupzxwtVn1GPl243BZMhu2fUlzC5d4nEj7BgKJaQ6NHhUp4H+wKAyxHg+2pT7Q8
         jbanoWADy9Tl3m0uMv8KtxivhLlJFEHXVi/zMumDlNfjMOhfkEt3/jFYfnDUHjb5kxPP
         uwFdc1ofTjDc/2A5360zQ8s5AEOsJTfTnvJ48LKC2T6wK7+wmH6KQXDPeSR+o8F+BPbB
         rCuYF4wy7IqAFlN4UFIeU1T/mjXsPFVuDszj4UgvZvxZp1KiwydTpclvxas93cAs5VA1
         fX9A==
X-Gm-Message-State: APjAAAXlU9n2qJZ1yFVCPy2/mCW5R8POC2Yjgxkoqn6xuxptnWtH/5LP
        OhtSEu1dripnMFMdYOp3PE2TIH4YfYQ=
X-Google-Smtp-Source: APXvYqw3bjE+2MC197ZVmKI9jTgl7nRMUlNZcDxQsa1ro0kO0ElgRLoXdMMsi1K/ozyeevudDXTctA==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr15428508wmc.64.1561972401463;
        Mon, 01 Jul 2019 02:13:21 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 01 Jul 2019 02:13:21 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT v3 10/14] arm64: dts: meson-g12-common: add pwm_a on GPIOE_2 pinmux
Date:   Mon,  1 Jul 2019 11:12:54 +0200
Message-Id: <20190701091258.3870-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the ao_pinctrl subnode for the pwm_a function on GPIOE_2.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9f34004625e8..ab8a72a226df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1970,6 +1970,14 @@
 						};
 					};
 
+					pwm_a_e_pins: pwm-a-e {
+						mux {
+							groups = "pwm_a_e";
+							function = "pwm_a_e";
+							bias-disable;
+						};
+					};
+
 					pwm_ao_a_pins: pwm-ao-a {
 						mux {
 							groups = "pwm_ao_a";
-- 
2.21.0

