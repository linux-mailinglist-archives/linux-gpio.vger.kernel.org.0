Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6CF2CA5A7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 15:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389133AbgLAOat (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 09:30:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389132AbgLAOas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 09:30:48 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEE7C0617A7
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 06:30:02 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r3so2938939wrt.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmS1AOYTJduZm5RuQkzYgqsOUKH55c+00NGS1pLNVMw=;
        b=U7Achn23CBNyWiH9eyYw/aWefQrW+ASyn4yKEpWMYJUwhlPPUMme07oCKzPf8LUSBZ
         3TW8JV0qltTaXmMPQGHK14uoSVRBiBR09eSUf0dHlpGlyGPIjDroTGYwe9DrsNCCXbWC
         h01ABC+rQE3wLPACeaDRqHLlwx2X+X/36u0MA/M+MnJAnw4cWRoVNxNHC/H0vXTtJwmR
         Pg4tMXkWoMm9H4N/RpY2HbR8j74KBSezAMG61XzGn7Cv4c0S8e/Hfa4DPqnlw/jSQa22
         kD4TbEdj02R8t6OKYhHzsmRBp80GsYktvrurnHZ3Xy14qqivJgDwqoDnZwnz5SZv6krG
         dSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmS1AOYTJduZm5RuQkzYgqsOUKH55c+00NGS1pLNVMw=;
        b=CFbkML5B4Ymz3gdsWOappsqQ/vgRZcwyrW1MnKbpr/c6nyG2QzrdgSPvHutk9qGKUc
         0NBR737YXx0/XebpxGAB9J6x0XXDxFaxFupPE4MS0JorGX7HqoMXtqH2kZoMgQFvI+lS
         Zwd9bKPJES4KDfifJpoBOIWKaGrPxGvSQhmiME2nLBUe4TCKHt0U953KbBA2jg4GYV44
         7wuRzkQZrK0wgrCpKEfoa/r+0bCUpr0vwLFko5nJ/tiENZkR7D68RqqfRRC8OMCw/4z5
         o+mMm9pLoBCrFd1GQRKqTurNAJFbRLVhz+Pu4BrEuyjn6n3ehEn8E+Czu//w0hJACINH
         hmew==
X-Gm-Message-State: AOAM531kwf3/WYKpsZn1jV1PUwqWcLpHoPIbN30kBm0BMCpKNq1NSCzy
        HwYoID5cNi0kfbCD5wP3FuiAVQ==
X-Google-Smtp-Source: ABdhPJx/A1S/sUAIDOjXHOpNutH0g6JC8i23aEvaWrE3KOCtK0MgOn3D5mrAp+1vSBZju0YnKfPoEg==
X-Received: by 2002:adf:9124:: with SMTP id j33mr4052062wrj.376.1606833001420;
        Tue, 01 Dec 2020 06:30:01 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 20sm50488wmk.16.2020.12.01.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:30:00 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Subject: [PATCH v5 0/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl support
Date:   Tue,  1 Dec 2020 14:28:28 +0000
Message-Id: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
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

Am guessing existing qcom folder should cover maintining this driver too!
If not I can send additional patch to consolidate this along with other
Audio related drivers in Maintainer file!

Changes since v4:
	- added Rob's review
	- updated slew reg range
	- used u32p_replace_bits
	- sorted pin functions and its defines
	- address various trivial comments from Bjorn

Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
  pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver

 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++
 drivers/pinctrl/qcom/Kconfig                  |   8 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 727 ++++++++++++++++++
 4 files changed, 868 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

-- 
2.21.0

