Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C17B415613
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 05:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239053AbhIWDeV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 23:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239048AbhIWDeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 23:34:21 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACF1C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 20:32:50 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id g14so4507124pfm.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 20:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=tcoYfX3/98y4K9KP+mnZIxRToGjbL4tIkZ9GEops4pw=;
        b=RZgWl3hQXEjvAdU3p2jzbQT16CDGzlKWYXooN+FjXrbd1aoXhfmT4ZD2klD1qLq//N
         RE6ZvLN2ynlk0TjbNkoxZSKfRKbVEocGLYh/mM6jGOIzRUINix5nsSM6YzzqzUUEHobx
         zQxOtAHn9bJ8xuN4lJOqnGYdCRZadsdCdUrM447wv9vSBCq9/VJFemfWU370q6YJkNeM
         Sk3oY4OTwIhq0/Ee5GWTkU8FIlWNba3JdDuF8ttcbtjcrvvUjXP0Io7uzeURpPgw7iyQ
         J/LHrCoLfuQuNVnCNsBMTzYhzPSlybpF0+c+NGr7SMiCCbhsby55SKgO7qKfw9ZcEEzy
         lEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tcoYfX3/98y4K9KP+mnZIxRToGjbL4tIkZ9GEops4pw=;
        b=K9+Bk0wq6AMzQoc/alzzfA6JhuzSzktjqQR9ssdst5SvtBbE+tsd61xyIZcywmvSGB
         Dp9JqEXVvIzi0RtkVn/OSS6YsEkDLwRfxzPfKxusBJFuAb5I0qimeXiQkR8kFDTk1eS6
         SXXOFLYpJr/QBaKRODmjByAl0B/uE4nI8z5tvgdnGfT6Mf+P2yGBdFATlKnCAaVqtkOn
         IYRyfExzLXp5NVUmV+2m+HWwPD8pSbtMuIYgZelzRaVr5loGe1DBXVvrdCdx7XsQ36pS
         G1L529D9FdroiEY5y9P+9/BoTMhDmW+me10LFzmJnN1yxynnHO/HJX9JW1jW0Unkc5gn
         e1fA==
X-Gm-Message-State: AOAM533Gof4Jda2QLqX+V/pP+CIHsYC3Kqjrso592edtkBQCNtI//HeZ
        +lPAnSMPtKeWw2brsYNzBo4yGQ==
X-Google-Smtp-Source: ABdhPJx8sndiakc68NZLAYAF+UxgdFttx7aatNehrNRiGc44cHSt/HsgAQ0XtTE8YBkTVulzxfjJnA==
X-Received: by 2002:aa7:8298:0:b029:338:340:a085 with SMTP id s24-20020aa782980000b02903380340a085mr2371502pfm.46.1632367970017;
        Wed, 22 Sep 2021 20:32:50 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h18sm3817168pfr.89.2021.09.22.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 20:32:49 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 0/2] Add pinctrl driver for QCM2290
Date:   Thu, 23 Sep 2021 11:32:22 +0800
Message-Id: <20210923033224.29719-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series adds QCM2290 pinctrl driver and bindings.

Changes for v3:
- Update function enum table in the bindings doc.

Changes for v2:
- Update pattern in bindings to cover entire GPIO space.
- Sort qcm2290 functions.
- Group phase_flagN into a single function, and same to qdss_gpio, atest
  and dac_calib.
- Correct .compatible to be qcom,qcm2290-tlmm.


Shawn Guo (2):
  dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings
  pinctrl: qcom: Add QCM2290 pinctrl driver

 .../pinctrl/qcom,qcm2290-pinctrl.yaml         |  165 +++
 drivers/pinctrl/qcom/Kconfig                  |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-qcm2290.c        | 1129 +++++++++++++++++
 4 files changed, 1303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcm2290.c

-- 
2.17.1

