Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071DB3B3C74
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 08:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhFYGLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 02:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFYGLY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 02:11:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF3AC061574;
        Thu, 24 Jun 2021 23:09:02 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w13so5886278edc.0;
        Thu, 24 Jun 2021 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cB6SHhnptea5AXwthxguFpyULM/fN97QuDr3TvFBru4=;
        b=jSXeYMdAUoVSpQ7wAUAhyY5d8KzH87BVf6YOwG4EcHRIagN/0o+oiRkElvM5LFsvY0
         NjF5obNHjpvCtNWgvlTklXLh3MNO5Z/ENc8nfaYz6LzwT+C+1Q89+snyHzEsMZAQTqDq
         3SdDsQJHM1+4vL7I9NjDCOkhNNNVJVazHJB7va+8u2RFzdD9ZqJuIpVYBU225hIKBcYv
         RKGy1SVg/I0MI4wNZqaUxHwYQ235RaXuyt1wWV5SbuxvgWXpd9EPUPfIIBEWNpDc9bSb
         LYvvGVzMqa8k5vAG1lFfPA2zvkkQGkJKYG1g4SMwzIAVE52PjHJI5ccbIaRscXeicxmz
         6Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cB6SHhnptea5AXwthxguFpyULM/fN97QuDr3TvFBru4=;
        b=aEHvSLURXsqsIAQMdDtnADUI3hP9zIcnv7vgKdcK9Gl82kSmifbWlC9cnC1nqzz0+g
         93Mv+zSBM2yEvRnRauVGCyezwhd7IXpV364ygWlzRO53Aw/tPbyNRv8YNFG2RvSh7diY
         pDGe+8as7YzXKtSmh6lnKhHQSXdiTHz3CfgNE/eutuAztUYBQ0j+UYxPf+2fXO5x4gPk
         PknY+2dSbXKpBM1vrkjLIO8AzMDKMbrJz+aNz+pROCzYK38+y+kagxvNqPN52WtgCOmc
         pd2xcAx/sljRfYfndg+GCFZkuVOiGCrD4WSf5Jcs9lRm+JEjJpZG4tr21AYivPlHUwXO
         ePqA==
X-Gm-Message-State: AOAM5300KGlcJIOvj2sNQNeYWfOi4w9OAQRZlFoGDFN+QsZXRNH1gTh4
        z5Yv1MljGx7VypTNQvatYas=
X-Google-Smtp-Source: ABdhPJwjtpUuOqL7xAONY+oGXQ53Rdmuehkc898Fy4zYhfMXR8aV95jtC4NXSEIinEAtM2eF0fD1cw==
X-Received: by 2002:a05:6402:206b:: with SMTP id bd11mr12588146edb.238.1624601341428;
        Thu, 24 Jun 2021 23:09:01 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id l22sm3121979edr.15.2021.06.24.23.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 23:09:00 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 0/2] Add Pinctrl for SM4250 and SM6115
Date:   Fri, 25 Jun 2021 09:08:55 +0300
Message-Id: <20210625060857.3069255-1-iskren.chernev@gmail.com>
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

 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml |  208 +++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c         | 1482 +++++++++++++++++
 4 files changed, 1700 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
-- 
2.32.0

