Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF7F40A894
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 09:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhINHvN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 03:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhINHvH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 03:51:07 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943FEC06115D
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 00:46:05 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 18so11340729pfh.9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Sep 2021 00:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=yUIdWvjj9q23RkzkQJPx6zsYTa4SnqwX2qzQZjHmW4w=;
        b=byiAg5C8jSm77FbYRDqhrcvAwhZ5B5wN50oDH4cED0QvxH2Y9uWex/0V6902ETBKR2
         /0HZ9TB8ARBlldDeoINQE8KiP2/FWuqnChBIK26Jmy5gri20OI0BDog+LR9x/MzZsseD
         7edGRUfeFi4X5yJ5S4bO3c7xMGc4VghXeQW5gYnSzSPQEatM7xy01godPiro8yt+iKFD
         51VzXW+oUEkxbitH1NVRj0DzjqjBRV3b/kd/iYojQUz3T22wiN8iuhk+Vx4nJrOtncF8
         /pdwtcRe4B2ZT2xyOeba2m0/cw0TUHO81yFNTUtH/m+c5q2uXvw3CNZVa9X0wL9Ek5g9
         Z1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yUIdWvjj9q23RkzkQJPx6zsYTa4SnqwX2qzQZjHmW4w=;
        b=z2DaH3XnBgBRt/CGgIGJfd6lzzlgTBBBqgN+6+p/jFuKfhJLcw4HMAFCoJ0S3wiEEn
         7cumKEAcP+gZOHlqdw7TTPSB0CPGymWcS4ydiSXwc7NRnZ/XaSsmQHJhfd2eYTzJcfwb
         fsCJNs9lrI2by+tftcmBdteJdh0j1BY8IkafuZQq1xVGV0vu9fE1VmtBMsRIhylomLY7
         Qk6GAt4TaD6BOTQ4RBG8lSZ6CAY+L30PKRcGo+s2zsESqbFjgs45dlJ7SQSlSH9CWrbF
         tedSyBWkuDk1NnEnRWJkCn9aeCGSse/w/FeDWfPE0u+FyDqNSVxbiA/Yowxb1Pk9NNAW
         uBmw==
X-Gm-Message-State: AOAM531QqHP3Y+7ICZbCqMIT+6kTkkIurPOVmz8AaZCnbHSSMe9lpAHV
        DpDs4/qfn1NMs5nZJd84FRIe3g==
X-Google-Smtp-Source: ABdhPJxnzOsXpAMcB0T5OdV0027JIXHuVA1vnJKKgl1uxVCUqMD4sqwjpcbaaj6TLZb7aZyMZFjhJA==
X-Received: by 2002:a65:434c:: with SMTP id k12mr14497088pgq.17.1631605565093;
        Tue, 14 Sep 2021 00:46:05 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u16sm6696923pfn.68.2021.09.14.00.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 00:46:04 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add pinctrl driver for QCM2290
Date:   Tue, 14 Sep 2021 15:45:40 +0800
Message-Id: <20210914074542.12957-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The series adds QCM2290 pinctrl driver and bindings.

Shawn Guo (2):
  dt-bindings: pinctrl: qcom: Add QCM2290 pinctrl bindings
  pinctrl: qcom: Add QCM2290 pinctrl driver

 .../pinctrl/qcom,qcm2290-pinctrl.yaml         |  186 ++
 drivers/pinctrl/qcom/Kconfig                  |    8 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-qcm2290.c        | 1552 +++++++++++++++++
 4 files changed, 1747 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-qcm2290.c

-- 
2.17.1

