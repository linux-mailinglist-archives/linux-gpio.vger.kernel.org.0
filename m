Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C0C222DEF
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgGPV3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgGPV3v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 17:29:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884A4C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:29:51 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j11so9995288ljo.7
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSgxBMa/LciITm4xNGQOGJtl7ToeFI5VUQq2fMU9kUQ=;
        b=Zbz3DUNTVx11rl3Ngndz8qWW88ScyQKsu4g0teQujRj+i98pjRKuVKYnCW/epc7n5B
         I6wbujCpX75TTtgGwRqGCy9GuR6bWHtM1mKJwuABaWS9ywnSVCWW+ribuQppt7eSH1fR
         wlqea1KflCfEriSbPlJaKWUA3YCXDhBOVvc+mjYC1LlqchzUGgunlKlzCrpUHHbQUjpG
         9CsqSWeHeZ8padjnQUAxssUX8nRZzKAJkOQQuB+kuoY96tb5J6rPPYrrCkkn1Srn4/EH
         2OKjmy2OqpPkUPNbLIpaLPPCCqB8c+XB5Je8hDktji+BDm8+iwVuvE/9/M1IxzuhaJRk
         kYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OSgxBMa/LciITm4xNGQOGJtl7ToeFI5VUQq2fMU9kUQ=;
        b=dOanMCAykfN1d5n4R7Ab13ssPak+6l+luZA1RRPIkROSc10gz7/+/TG/G3r9FVkx9S
         rHkH3wytSAN4PRgr9CmYpeBI5XpOsVNgCZDMsXtJ44xuXoO9+qCmL1QbAMLt6SJ75IiR
         1fNp6KipV1HMRhAwtvaT/8LWhENGBIqfpU0nphWFnI+PSp6FHafmEgHcxo7m98fwy3hh
         B9+TAi5g9f4ddKLespMhhviPi1Qyrs/wde+T6z06LPM95czCt4ptx88jukYaNBLa85TZ
         sJW3W/jPX1fSMwhRE9jCOYomFineLnYMxjRKQIM+wH26eu1fcbcJoB7lR2kg44xRzZuK
         XS1w==
X-Gm-Message-State: AOAM531J/2chG2VFF9MWyB3xznYkJGR1tuhAq2v20Evk923GjdD3ZcjV
        XmRGH8+VkjFn74pOoHZSGu7DsQ==
X-Google-Smtp-Source: ABdhPJyZvXQ8kQ0bJomu189c2+ewR7hN0lGTxEt+uwwWJdCfMT1d2Lobc/YG1w6zV/sSMoEOa52Mzw==
X-Received: by 2002:a2e:8216:: with SMTP id w22mr3132272ljg.2.1594934990067;
        Thu, 16 Jul 2020 14:29:50 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id r11sm1277137ljc.66.2020.07.16.14.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:29:49 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 96f3d442;
        Thu, 16 Jul 2020 21:29:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Qualcomm MSM8226 TLMM binding and driver
Date:   Thu, 16 Jul 2020 22:55:27 +0200
Message-Id: <20200716205530.22910-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block

Changes in v2:
 - Changed node name pattern to '-pins$' in qcom,msm8226-pinctrl.yaml binding
 - Expanded example in yaml binding with a 'serial-pins' node sample 

Bartosz Dudziak (2):
  dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
  pinctrl: qcom: Add msm8226 pinctrl driver.

 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 132 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c        | 631 ++++++++++++++++++
 4 files changed, 773 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8226.c

-- 
2.25.1

