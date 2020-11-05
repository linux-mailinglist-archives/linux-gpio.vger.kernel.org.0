Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736C02A7E00
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbgKEMEW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730270AbgKEMEV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:04:21 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44396C0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:04:21 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w14so1446368wrs.9
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F7fGMdPmROPe5UkdRq2WwhT4pSpGkaYftvSfchlHe9I=;
        b=jvQVy/moGFlICaaMdzGmpvELfWhc3tZVQbAXtWJqeSZgqeJ7PQByMcGmxnVW7aO8QB
         rWuYjitg9sr60VsCKhdyXn/0XqtU4Adu5+szfVknvpWAaae/4rzlv9E3rAH9yWIcqhDs
         CDimoBMUruKdLhiiyrOixDtrpE4MjglBBdLh8hqsIjJ9I8R8jOuWbNW8NZYpjTMAexoU
         GABxLJ/RQPzPS1+K3G2B+jgp/JY1PAZQyUAA2I20WIey7y0Cuoq4McPp1uGcoo6GaHxG
         o8shgiJPLXr0ew+NcjmBCoL+VR1m2Y6Y6LZVYC8VsvRhVAwiz22r44tEhRC9UMIBSCnX
         hjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F7fGMdPmROPe5UkdRq2WwhT4pSpGkaYftvSfchlHe9I=;
        b=pUHiXl1jKvwvKS/3wtg7K4NmgOOTFXGPsmSPisJXsRDTzYjeGLJjXF2iv/uTmnuU3I
         zvO1fr3MKQOnKD4ELEBa0FkppIHPLNYBZQQD0Pyl71tH6EAkS8qYlocNrgQKfhOFIrlx
         VWczH7P2/7CCNtGueghGo888Z7hHqbCO8jjdcay+mHi3SDTAUE9ir2U9+YpnIjU5zPqS
         hsW/8R3STjH6Eyuo2X3vObPzpGlm1bbW2pgh+EjfmM9vfGpUkDbakd8qRUMfbuMuilhc
         U+fStklGIEOfIDwn5FOzTYLCeRK+EHrOyIFeTGAG3OMjD7OoW4eL/urnkSVDtjuBHznA
         N7oA==
X-Gm-Message-State: AOAM5329kO8Nxn1MajNOib0oh44fo7dEd2zXuarTyCLMTCuC2N01HQrc
        P12ORa1nCJTqX/1ohwD4Ep2+Qw==
X-Google-Smtp-Source: ABdhPJxZChYPcvMfHl8DK7CEOtpEpQEzk2qgeFbL2zgtCSn5DWYFcSt8KQUFgf72JLdRLJ8dQQzROw==
X-Received: by 2002:adf:9502:: with SMTP id 2mr2505011wrs.283.1604577859772;
        Thu, 05 Nov 2020 04:04:19 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id f4sm2363094wrq.54.2020.11.05.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 04:04:18 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl support
Date:   Thu,  5 Nov 2020 12:04:08 +0000
Message-Id: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for LPASS (Low Power Audio SubSystem)
LPI (Low Power Island) pinctrl on SM8250.

This patch has been tested on support to Qualcomm Robotics RB5 Development
Kit based on QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers
with onboard DMIC connected to internal LPASS codec via WSA  and VA macros
respectively.

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

Changes since v1:
	- updated bindings to use '-pins$' instead of wild card matching as
	 suggested by Rob.

Srinivas Kandagatla (2):
  pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
  dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings

 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 129 +++
 drivers/pinctrl/qcom/Kconfig                  |   8 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 781 ++++++++++++++++++
 4 files changed, 919 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

-- 
2.21.0

