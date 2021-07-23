Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5763D40A5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 21:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhGWSnb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 14:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhGWSna (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 14:43:30 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51ABDC061575;
        Fri, 23 Jul 2021 12:24:02 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id b7so3432891wri.8;
        Fri, 23 Jul 2021 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J55q72yArSUbiH3EMJZktqEzhRxtiUpg9a9enEexVsM=;
        b=N/Aqe8my+wIJybFcu2TUrB0YaL0E11k6jlhvi31yrfZgJCuca8HrwDRbre3LO7D1go
         vCylF4Hq8pbPw4ZdLm2Y8U2Sd87RZMHsKAn7pkpsU2QWfD8hcgYVojMLqFCwozqx9r8e
         E+7YDQsMJ4fB1lcGqqoNXvTXKLBlULSzERP5EuOPcdGv7fzrxsCXq1Tu8jeP7r5mD3Vz
         NzBWvpxuG3xYbI9vvwgE3PmOQYoLhauEFBFU+wtxsE+velrN1jPBCXnZ5/CAPsTwHPTJ
         UTkKNkKQOC6VOor8mnDP2x/b3vdsKbEOUYqGw/536Qi4ve9vpIzT3xHblMuEFj+pXPn1
         yUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J55q72yArSUbiH3EMJZktqEzhRxtiUpg9a9enEexVsM=;
        b=TxmsWbEFNg8NWhrYG1fkcVAWDtp4dnqNfSnvf4zHKUPkYZyDIvy5+ALnjvoQhn+FdU
         xscO0qoK9iT+7406yoBsMtbTJpy0kSl1tQnR2qYR5HzLbPeC3sZi/yINzvTnC6UIvi+u
         Zdydnb1cmuhEHCU07O/YsaERl2KpEmnzH8aCvL3gC6FSl9i2pmSu+zKg754gkaGXRDSA
         lbAcy6FDDfuaYxhgGyHGU89EJsPK1Vqj23Qtm9H4GBfeeIxeh2kya+X4hAZPZseEZ/Fi
         IQCgZPDGq5fC7NJD0sa099WMnc1pFJJDdlGpspZ6y5WLj2PVjC91aO8bz9Y5QaoiOpaD
         zqug==
X-Gm-Message-State: AOAM531bhJWhPugApP0XbhG+6Xgs5hZ4ZqLVqcPPasP+szBOogAZiI5t
        m38gTTL4qgl1Sd9CNWZ3dAk=
X-Google-Smtp-Source: ABdhPJwKl5qm9bsouc5rEmzohrzmVBo6lUMnTF+QMrHrm8AgA2FK13sQ9BUkSrxlDnhpbIymN8KizA==
X-Received: by 2002:a5d:4751:: with SMTP id o17mr230746wrs.252.1627068240983;
        Fri, 23 Jul 2021 12:24:00 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id u16sm40538911wrw.36.2021.07.23.12.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 12:24:00 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v6 0/2] Add Pinctrl for SM4250/6115
Date:   Fri, 23 Jul 2021 22:23:50 +0300
Message-Id: <20210723192352.546902-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the TLMM block on QCom SM4250 and SM6115, codename
bengal. The code is taken from OnePlus repo [1]. The two platforms are
identical so there is only one compat string.

[1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

v1: https://lkml.org/lkml/2021/6/22/1163
v2: https://lkml.org/lkml/2021/6/25/28
v3: https://lkml.org/lkml/2021/6/25/72
v4: https://lkml.org/lkml/2021/6/25/351
v5: https://lkml.org/lkml/2021/6/27/160

Changes from v5:
- suggested from Linus Walleij
 - applied on top of v5.14-rc1

Changes from v4:
- suggested by Konrad
 - remove sm4250 compat, there will be a single sm6115.dtsi for both platforms

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

 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml | 180 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c         | 923 ++++++++++++++++++
 4 files changed, 1113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
--


