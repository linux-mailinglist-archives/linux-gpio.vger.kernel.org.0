Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C97AEAD82
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 11:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfJaKfQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 06:35:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41173 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfJaKfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 06:35:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id p4so5622201wrm.8;
        Thu, 31 Oct 2019 03:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJNIZOQTxM0zeJaNJN5sH+4c5oquNyJR2kBX9u+CPCs=;
        b=U5xTHC14vlwt9GARToj5nzIazVE+hkLcztEtmIdMcB37KOlkPjFn7KdYYBlb4j7S8q
         So5moPh2R8ujgzeOWjf1rgfbcvv6ZPG9HRaMoAzo3vsxZYgzPGlmTzK3hT1D1fItz47d
         KGmi1RzBwghJqRzk3QY5CFhUbkRxRFaMT6n/KjxKUQI6Gc12Jj80+i2LwLlRv9jxo3tn
         iat5o4XUB9U9KWegs1cLje0YsSqQqBHb5LEbX+OHb5cilAwej/yUOjmQh/BISeCT2zm1
         UYfZn4mAB1fcQ+MWHbJwMAZiw3bP+gLasDMAfePO5M4bZkSTiYG/+jjdgR51gxM23G1/
         Vv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJNIZOQTxM0zeJaNJN5sH+4c5oquNyJR2kBX9u+CPCs=;
        b=PJvbD+Dw7Qdj6MDcAmHPbDTwkrAaGNG0l++FRZ7enfbFhfF7iUomBI8F5zpv4xfST+
         8wLWvM5ayrquYDjU0ZVv0lgoJaWiXvnl4dMjyRj9F/JqWwcl31q6e56soTrpj5qNCLtD
         zbS8oNwFgwILYHZZ5ThHTtbP3kN7u7xDFmdK/Y79biPf24ItHt9YNj1bvLOztO+SEYyC
         EyFwhSMjfMzrpaf1AyKpHSH1ztMV8o3Ub0hl1+wvJzl3sGBkuQ2YGGxd7h/UumW+IxCE
         MA8vo1sHxNeX0kSkmF+luaPfZHCMyy9hW3mgfz9Uj6/vcb45jck3adBceBtRPkkfUswE
         ZuZA==
X-Gm-Message-State: APjAAAXyjukoPHwv9jebSIRqwhSlAZaq9z2Xm6VzCciDpuLCECBlQdJU
        1FB8MZdWRmRZKwl9P+nU6mVoj/M2bdc=
X-Google-Smtp-Source: APXvYqx9RKPCqDI/2b9KXJ3R8DJd2rG249dDMoSkWWGhvc4UAS6dpY13f4eklk+lBBEo3eDopck0fQ==
X-Received: by 2002:adf:d846:: with SMTP id k6mr4949509wrl.178.1572518112705;
        Thu, 31 Oct 2019 03:35:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id o15sm3414687wrv.76.2019.10.31.03.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:35:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, bjorn.andersson@linaro.org,
        agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for PM/PMI8950
Date:   Thu, 31 Oct 2019 11:35:05 +0100
Message-Id: <20191031103507.30678-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031103507.30678-1-kholk11@gmail.com>
References: <20191031103507.30678-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Document the bindings for PM8950 and PMI8950 PMIC GPIOs.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 2f48cca1d581..7be5de8d253f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -15,9 +15,11 @@ PMIC's from Qualcomm.
 		    "qcom,pm8917-gpio"
 		    "qcom,pm8921-gpio"
 		    "qcom,pm8941-gpio"
+		    "qcom,pm8950-gpio"
 		    "qcom,pm8994-gpio"
 		    "qcom,pm8998-gpio"
 		    "qcom,pma8084-gpio"
+		    "qcom,pmi8950-gpio"
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pms405-gpio"
@@ -93,9 +95,11 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio38 for pm8917
 		    gpio1-gpio44 for pm8921
 		    gpio1-gpio36 for pm8941
+		    gpio1-gpio8 for pm8950 (hole on gpio3)
 		    gpio1-gpio22 for pm8994
 		    gpio1-gpio26 for pm8998
 		    gpio1-gpio22 for pma8084
+		    gpio1-gpio2 for pmi8950
 		    gpio1-gpio10 for pmi8994
 		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
 		    gpio1-gpio10 for pm8150 (holes on gpio2, gpio5, gpio7
-- 
2.21.0

