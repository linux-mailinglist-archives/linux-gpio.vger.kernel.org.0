Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767373B4181
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 12:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFYKYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 06:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbhFYKYO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 06:24:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D982C061574;
        Fri, 25 Jun 2021 03:21:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id s6so12649144edu.10;
        Fri, 25 Jun 2021 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1f5PfyIGOazp+4XQe+W5WTgmVXLCa6NWwYJmG2wqXmc=;
        b=RUS/TESyXiq8i2HWAQsJvNzUSUEzLUbEzCyUGrJuAxgqehII2+/akcPCTDeu7wu9Gs
         u5+O6Lw2+b+JZ2JSo1C4VGmTWC4cFGVuR4cmqXxMX1ekl03kofKicg1EHfUa4mxOr190
         23epN7VaHiaWsu5UQhET2MdQT+nFe7rYnT3jXVUo5g6kgYfjFJ6M8sALBU2dcH5i9baH
         7FrrJ+YjjJqfI3YGtrTbblodMILpnh93V9DxIhTnpi4XtHSgedMOyPYTSvZkMEtxHw2f
         Bvvs/aWEVlaPebnJ8znaKYfxjJswcRH9aQhmuQTNmR1obGSCQ4hHbY66utAvaZyVmm/M
         Uc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1f5PfyIGOazp+4XQe+W5WTgmVXLCa6NWwYJmG2wqXmc=;
        b=pUcbnqxHBNXM4yJ5chXyRwdfsUd/EQ2rhpHmCL1ka9ec7tO6vzi4h7upK2pih1XCxk
         Il9Nklg++Px+QXmAeW6olygV7BHU0/RSPU6jyK8XdXQtrcO4G29SHOSGq9IMixKwFEaP
         KmB12YMKTdkTR92+UbKPnTcvEjLPZ0p/ijbL20BVdU9uJiQCsO68xbueSSu+CVQ1j+Kc
         PENZWvoWZwq2jwt/9pe4QJW/oRkbtEjPlSuwMY9a8NXPT1TOHD7l66hmNzbSixwFvsBH
         ac5FLapuZrMh9Ic4vonSjuGZWAbvT9oTCr2vPqt+GuQ0mGYZ+97sgj1O2brA2DuldoPe
         dg/Q==
X-Gm-Message-State: AOAM533KXOpbKb9NptZ0nhC0CSqAxhu9/EhHseShSe+aFlVDXScbKwmy
        WttaMVG9nR+yC5HvyzU1pwQ=
X-Google-Smtp-Source: ABdhPJwbZqc3uwNIS3Qj2TPwlCHpzl+Q2U1a2z0pBRAkLszen3zfGnNhO/SCcd73DNVm+d1im37WtA==
X-Received: by 2002:a50:b2c5:: with SMTP id p63mr13393399edd.5.1624616511891;
        Fri, 25 Jun 2021 03:21:51 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id s3sm2586519ejm.49.2021.06.25.03.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 03:21:51 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v4 0/2] Add Pinctrl for SM4250 and SM6115
Date:   Fri, 25 Jun 2021 13:21:45 +0300
Message-Id: <20210625102147.51162-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the TLMM block on QCom SM4250 and SM6115, codename
bengal. The code is taken from OnePlus repo [1], and the keyword bengal
corresponds to sm4250 and sm6115, so I'm adding both compat strings.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

v1: https://lkml.org/lkml/2021/6/22/1163
v2: https://lkml.org/lkml/2021/6/25/28
v3: https://lkml.org/lkml/2021/6/25/72

Changes from v3:
- driver suggestions from Bjorn
 - merge similarly named functions
 - sort functions alphabetically
 - move ufs-reset to 113

Changes from v2:
- suggestions from Rob:
 - remove quotes around reg-names
 - use -state$ subnode regex
- suggestions from Bjorn
 - remove '|' from description field
 - use state def to allow arbitrary nesting
 - fix gpio pattern to allow valid pin numbers
 - fix number of gpio pins
 - add tlmm label to example
 - remove wakeup parent
- other
 - add some pins in example
 - removed required function

Changes from v1:
- fix binding example
- fix cover letter text

Iskren Chernev (2):
  dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
  drivers: qcom: pinctrl: Add pinctrl driver for sm6115

 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 182 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c         | 924 ++++++++++++++++++
 4 files changed, 1116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
prerequisite-patch-id: 0949ba2e2f20cd3acfeff8be80dc78c7a02962fc
prerequisite-patch-id: f72aa823fffe9b245a924a6da8a14a473fffa5a2
-- 
2.32.0

