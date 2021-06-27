Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A80A3B54C2
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 20:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhF0S7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 14:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbhF0S67 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 14:58:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B958C061574;
        Sun, 27 Jun 2021 11:56:34 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id p8-20020a7bcc880000b02901dbb595a9f1so9485601wma.2;
        Sun, 27 Jun 2021 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZVCbLxE3JVWJ6OiTR2PWU77oLUlzutzXarRMDsZ96io=;
        b=ojvkmt1Pr+G99tQ7VZSF3s+vIiWcJpg7UYG2nNEYhVXQ3hHfwuUR2TW3J765+LWufM
         fUvBGwrTpSYvuUfB56Bma6oZXD9t0O+F+RCyBpv+9G2s4O0jxL2PGesvJW2URqyRj19E
         RhOsbCz9TUyHCH4HptZzlERwDKXmSl5ok4T15KxSz/tj/RhQNy9PEH5su8OBDErZ/GAW
         pw4cNwkkSgKNf4C+pTypICPjyEHKELP/9Zls4Dfx38cTmtNSmjWjx0O0hpeIOFqIgaZr
         6tmDFDpA+kUl1T2a/VSZF5ngdUDfZuJyRLFPfef6W7sPPGbuabe1R8h3k5E9UYcF+GD2
         XAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZVCbLxE3JVWJ6OiTR2PWU77oLUlzutzXarRMDsZ96io=;
        b=TEOsjxx02rOeyFBhCf5tLTAH8iYMXXySQOXH9RyBGEoCGAJSZ8yi0aeyn3Zny1I+fb
         OuhOfrAMRpAHvbRMZJUmT8DQVbevlXZFOkvbZKTWDyGNRDuwFergRMAa5FSFNKBknnRe
         EJRGm+eQ4WzuBvDqNnofN41t6Ai1g8qf02MKoGd38t2acjJkP+BUBN2UuIbOyrYVE3cV
         hJ1ETecQWWIuFoOzqppLXOvkquXK+lQPhfvcpfFMldxmk5sq+bczvKtjp87aoJ10vVjf
         bLpr9h5wG1uGl+RIzFdVNZjLdWu30fqpVR2PPkgpybQFcS6NR1zm1yjCxiY6fP6S4tJb
         j4JQ==
X-Gm-Message-State: AOAM530rGF4XCiVEZ7I/OUEZfwQiffSuojmSk7hIPbFLTifO2e0fXXZ0
        rZesW4ptADXHamLdMd2qOlo=
X-Google-Smtp-Source: ABdhPJyrvsvLCHJaQjr2v0TFWf44O2OrXQYXmk+dGrzbteJYET82FFTS/f9HtLjOIG2l2WhB1FFpzw==
X-Received: by 2002:a05:600c:a45:: with SMTP id c5mr22925061wmq.153.1624820193165;
        Sun, 27 Jun 2021 11:56:33 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id 204sm11766383wma.30.2021.06.27.11.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:56:32 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v5 0/2] Add Pinctrl for SM4250/6115
Date:   Sun, 27 Jun 2021 21:56:26 +0300
Message-Id: <20210627185628.691435-1-iskren.chernev@gmail.com>
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


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
-- 
2.32.0

