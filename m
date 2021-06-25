Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0003B3BF8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 07:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhFYFOH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 01:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFYFOG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 01:14:06 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EAFEC061574;
        Thu, 24 Jun 2021 22:11:46 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hz1so13165397ejc.1;
        Thu, 24 Jun 2021 22:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oc95jJXeMpiKraAdXgqoK6A7w7KlYG9cqVCO+4x7mD8=;
        b=Zytjk9nzmXQr4q8lgiCVcyEnVRLmb0P5dMdX+i+uuW92XA3HWLRY+sqhyshqzy4aXu
         FlFMgDbCMOKIC3XTkUarJ+v5Gd1gn+/VRAE+zJ9yAwu7l+ZEl20wWQClkV+K4ryJ2Jmj
         dOwNfyZZc7jBh3AGEMy2nsvI68h13lNKsZf1HSNRKG8ihpOvnrjacRu7PNURuIKQABM2
         DIuQGlPuQejWYk1Nhw6QDBYQdqOph8jDJDdG4uSzHq/qTGl5y4kWBn0AoGbOzg0aA0pV
         amw/0EeQBf5cHUjySxNjwR+4F97FwteSZ1jG5NJecxp7tfcuesNw6CRE7fEA33S/JIE3
         gTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Oc95jJXeMpiKraAdXgqoK6A7w7KlYG9cqVCO+4x7mD8=;
        b=Rb/OXFl/Gdl4KeNQHteL/Jcz7tf94nCoH2/sUKg1rH9lWBq9hKCIRee3eBHdMqqwTV
         OtYJSV1YWbPYqDZwRGKqbkY+vEUHiDCjIGCS8BqwX7qkDvNeMox/da9vh48KLBySpMr9
         SXUcnYR4shQaEnWUiX6buapiJYx3jEbtTEj81CLe6SbQQiniKP4JVRLYZ4A9zYKjp31A
         4TPBs/3GZgosx96d6Pw/kjVqUkFgjxUvcgFKpvwU5tD85QlPJEC+/R0R0IXMmgIbZday
         L7IoWWts2Q5G7a7I52npaJuBh0G5baZujtoR6oCY8tIl7QOsQVCqAclRdFV+mwnZ/uqG
         2X+A==
X-Gm-Message-State: AOAM530rwFbM8VZsl/tMRKxgHx8i19n1yXonGUHn19P4zHWof3eJ/Nvq
        GPnbt3QagEPy0XhEQVzXGAc=
X-Google-Smtp-Source: ABdhPJxhVWfnAZSGWeeHW8Zk6T4g8BqwfrP8qIYbjwi8yorwvg/Czz8GOS0o8IvYd1WYtkiqoIg7NQ==
X-Received: by 2002:a17:907:7708:: with SMTP id kw8mr9145133ejc.111.1624597905261;
        Thu, 24 Jun 2021 22:11:45 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id cb14sm3174461edb.68.2021.06.24.22.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 22:11:44 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/2] Add Pinctrl for SM4250 and SM6115
Date:   Fri, 25 Jun 2021 08:11:36 +0300
Message-Id: <20210625051138.2997854-1-iskren.chernev@gmail.com>
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

Changes from v1:
- fix binding example
- fix cover letter text

Iskren Chernev (2):
  dt-bindings: pinctrl: qcom: Add SM6115 pinctrl bindings
  drivers: qcom: pinctrl: Add pinctrl driver for sm6115

 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml |  172 ++
 drivers/pinctrl/qcom/Kconfig                  |    9 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-sm6115.c         | 1482 +++++++++++++++++
 4 files changed, 1664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sm6115.c


base-commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
--
2.32.0

