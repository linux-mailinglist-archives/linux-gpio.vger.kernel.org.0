Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56FF422B50
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 16:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhJEOpc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 10:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhJEOpZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 10:45:25 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B601DC061753
        for <linux-gpio@vger.kernel.org>; Tue,  5 Oct 2021 07:43:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y23so47889440lfb.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Oct 2021 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQm6k61ZSp2Hab4WhNcd29dBFTSpKLfNa3/5SrkRnKE=;
        b=nOsiEjYFl3aW6T/inaJvCgRmrFdBE7RjE+3EkIBB+LyroVbllh+TpIzWM3aluAxSNy
         cHF4eZ4pDUB/jn4yymaNgGIo+U62VKveeFgrLOkyWbrvwmcW/dewPfFka3W2vHoVRCTI
         RojMqoFDmo4JJa3/6U7zsj5f8xeAksoeUmFk8B7hpmqOehDKq3dnvLbDoVafGGX4OY/k
         w1sLMUu0JVt1Uk5bo+TNSSEY5YwJQR9Bd9TY9TERtYpKc5pYdFm9JSrXWQiwc3hbvR7n
         IoUgTz30heGeBr4ZCB5Bndjzv8Ltiq1SRJ2l4NQdJ7Fd9596C32U0/canEJC+VXDCwGY
         bR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQm6k61ZSp2Hab4WhNcd29dBFTSpKLfNa3/5SrkRnKE=;
        b=SnXkB80NnzdsLnASYUOnSFhm1QfrSvWA1xr5LkVQ5Hp6E0ozWjD2+10TLgmqo6Od36
         GbFEl4CSRsbTMVBLRt5HlYRRyTlg3QaHVr7yiomDZfY1+sa8bFRJNv+vQ88FOLdEPHfM
         Ksgv2qWtBFUlFI69YSGGd9pV9S19Wg54eeKK5taRZfDsugtJ9nH74da7xnDeQsE3xfmH
         b/1OSUDogo4Vn59O1od4WoHkiqV3YCmDPj2Bz2I+PDH3bIMU9axTB5Ay26YClKEWB+5S
         r2f7uMiZohyjm/Lrj17sN1g25w5SUdyxnm5uCVV3rMSaFBV8X21zV18zgOnJlSiEkYtM
         P3Cw==
X-Gm-Message-State: AOAM532gnKTPS1OnNBuSottHEt0rGHQGfUGrZhkhl4CPYHQbgcbqwJ2M
        d7hQSGPhGBeEyUz7AGo42BXezg==
X-Google-Smtp-Source: ABdhPJydMuD3RqETE9J8kTSbZmeJMK2Yn3+tyh1FTZ7XBbzIlE6ZfIM+dzc0ge56WVh6fbuI+kX6TQ==
X-Received: by 2002:a2e:80ca:: with SMTP id r10mr23139626ljg.347.1633445012540;
        Tue, 05 Oct 2021 07:43:32 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm1987173ljc.120.2021.10.05.07.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:43:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/6] pinctrl: qcom: convert ssbi-mpp and spmi-mpp to hierarchical IRQ
Date:   Tue,  5 Oct 2021 17:43:23 +0300
Message-Id: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
to hierarchical IRQ helpers, however MPP drivers were not converted at
that moment. Complete this by converting MPP drivers.

Changes since v1:
 - Drop the interrupt-controller from initial schema conversion
 - Add gpio-line-names to the qcom,pmic-mpp schema and to the example

----------------------------------------------------------------
Dmitry Baryshkov (6):
      dt-bindings: pinctrl: qcom,pmic-mpp: Convert qcom pmic mpp bindings to YAML
      dt-bindings: pinctrl: qcom,pmic-mpp: switch to #interrupt-cells
      pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
      pinctrl: qcom: ssbi-mpp: add support for hierarchical IRQ chip
      pinctrl: qcom: spmi-mpp: hardcode IRQ counts
      pinctrl: qcom: spmi-mpp: add support for hierarchical IRQ chip

 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  | 187 ---------------------
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml | 180 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            | 111 ++++++++----
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            | 133 +++++++++++----
 4 files changed, 360 insertions(+), 251 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml


