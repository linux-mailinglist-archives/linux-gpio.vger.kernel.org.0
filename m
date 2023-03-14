Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D376B9E65
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Mar 2023 19:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjCNSbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Mar 2023 14:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjCNSbI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2023 14:31:08 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1928D12F20
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:30:57 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c8-20020a05600c0ac800b003ed2f97a63eso948819wmr.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2023 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuuEjmrbMj1oVSmMC53YE236zaBmRiKiAfz/V0m6A8g=;
        b=wNzmctlA1WtK9v028tbq9ylEjdTPyatTxL8veKW1ylMOMx7tN3jbK6zUnnQ86iYWHY
         L5pjuTrVpyXrVLaqqMD3bhEcoMo+5MFK+OthVb/taJGnIMsdFLzPruA67XHdrDgR9983
         RsQe3FPLjpMyhL8LiPuapf8+/fwgRrqd+q6cfNO+Dj2Ei5rO8zSfdqL6cbNUaLRPNWQj
         PXp+OEsl5PsO24/OA4aQv37NLbRQf8zMpLDMinKQIcqKfXitzii8BeYeX7/tX7CqzaYV
         qS9GDdmscqjbYVDR0dN4OxkJrgfY0Evz5qOZVGQoRAYCxpqmI2I5++aTxoW3AZbb45nl
         sDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuuEjmrbMj1oVSmMC53YE236zaBmRiKiAfz/V0m6A8g=;
        b=Npc4WKH3Yrcd4EPe4buCihyXiA5Iw82exDB7SuRh6N5QAzHqPy0Pro71B7RFhoayhs
         /r/2Gfmgv4L0VJ+dQx3k6fT2ekIfE2/qC4Ymyf3HG0cGv6qPVrjQrdlnh/sJQImgvp9t
         V0nIJkgFr5TjpwC4UXIuxf2+LuFnPPW6Qwa81BPxVX+n+We1QwO+xW/NZeEeGiFlrHlW
         Uq+PRD+qxFTRxzhM0OsOiaiwkcCbnEsE7ZHcraR61dICqvnscDUeV37IDsB+W93eA7zI
         +QQRI5UivdlCIz0ZsKDrIIlnkvKxmrFqB+f2gBnXHUJokUJrbbUsqK27nsDluX5tIDqB
         2Ulg==
X-Gm-Message-State: AO0yUKXFd8KM1cWmOa411r9n+hZx6wNj56YS1xVDoRRzMcywSF1Q/3ET
        VEBIUr5IYqRR9BgQKTPl8phAyw==
X-Google-Smtp-Source: AK7set+DuSjV0TVBYAzpUW5T23+3Dh5B6PpeWaJX6Qu4GYSM7vLMdB6o51w99gLRrR4EhcTYd6O15A==
X-Received: by 2002:a05:600c:4ecf:b0:3eb:29fe:70ec with SMTP id g15-20020a05600c4ecf00b003eb29fe70ecmr16501959wmq.27.1678818655642;
        Tue, 14 Mar 2023 11:30:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:30:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 02/14] arm64: dts: qcom: sa8775p: add the pdc node
Date:   Tue, 14 Mar 2023 19:30:31 +0100
Message-Id: <20230314183043.619997-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the Power Domain Controller node for SA8775p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index c5b73c591e0f..428d9e0849b8 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -585,6 +585,47 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
+			reg = <0x0 0x0b220000 0x0 0x30000>,
+			      <0x0 0x17c000f0 0x0 0x64>;
+			qcom,pdc-ranges = <0 480 40>,
+					  <40 140 14>,
+					  <54 263 1>,
+					  <55 306 4>,
+					  <59 312 3>,
+					  <62 374 2>,
+					  <64 434 2>,
+					  <66 438 2>,
+					  <70 520 1>,
+					  <73 523 1>,
+					  <118 568 6>,
+					  <124 609 3>,
+					  <159 638 1>,
+					  <160 720 3>,
+					  <169 728 30>,
+					  <199 416 2>,
+					  <201 449 1>,
+					  <202 89 1>,
+					  <203 451 1>,
+					  <204 462 1>,
+					  <205 264 1>,
+					  <206 579 1>,
+					  <207 653 1>,
+					  <208 656 1>,
+					  <209 659 1>,
+					  <210 122 1>,
+					  <211 699 1>,
+					  <212 705 1>,
+					  <213 450 1>,
+					  <214 643 2>,
+					  <216 646 5>,
+					  <221 390 5>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-- 
2.37.2

