Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E0420C3B5
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Jun 2020 21:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgF0TeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Jun 2020 15:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgF0TeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 27 Jun 2020 15:34:15 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73291C061794
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 12:34:15 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g139so6869311lfd.10
        for <linux-gpio@vger.kernel.org>; Sat, 27 Jun 2020 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69MBcMDXHNYxgXYtTugtvx72wF1ub5Qsq1EL6T7j0eE=;
        b=YI8OfYwsheSeh71u36LYp1+M/Q02yvFYqxDAU3uJ6W4bq7CqPduf3ZCHNoI+919FSw
         dWbAfiaAetmnQGk6YrLwTfAMBsWJl0/JbTKnEod9vGrD+i72NUELFU+cAErsuAJXbZOP
         lquoLXOSKUG4cQC9uAGimy02HEnukHbkEMoYEWxpEMIYcO3lh3Us/Qd3/YdXHHhSTR6u
         rZTuK6Cd/HgBD6lqn4mWL5+KWpy6Z6Rk+F8B3/ti81DZ6w6vWB84qdKkBgB1vYHykpD5
         87u8sj0ffMX1/NlpdsfftKpy+wx5kJkGVNu5/xEk+Ca+O62BLODYLkSzkingejF/MGfE
         ezrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=69MBcMDXHNYxgXYtTugtvx72wF1ub5Qsq1EL6T7j0eE=;
        b=sNllh+yiYX369/719lHpmELEGll3vJNMNB12qsL4lgOlclbhZZuWKnG5cZohUjFeva
         HJBpndXSRblfS1OmEsjAor5yOnqXl6+XfB0cV329czjOaAvcvfumucJdB193Axqj3Sg/
         us1wgvuS0DAJfDhS75F/M/nAI0EbDSiI7hLLbiUHpb+COnfoPL0WyuACs5JkihMhw2i1
         /DI40TznzqeJiSK+J5Fdgg6GRcT04DGjVX4uUA/Tn5IwSnqm2DQwfhbY4BU7cycxSFfQ
         AGCSeO+4A0jTs2v2fH2tt6eK8zMuECtwbiSd7S+t3kHvdfTEz1bnejLmAWG5xFpqL7qn
         HCJA==
X-Gm-Message-State: AOAM5330hZm32HMh4XzfwfKLKe5wQiaT3e/ApPPHOJfUnGLFg2+pjuCp
        R47MoTuW60vlPrGOF2vuWczORg==
X-Google-Smtp-Source: ABdhPJxwIUAXrbzd33RSSoEz6TwA2SFWIdAaigp34yhptEHKLzfIcUDqex+s/0by8U89t5N07FTf2A==
X-Received: by 2002:a19:1d1:: with SMTP id 200mr5342687lfb.57.1593286453852;
        Sat, 27 Jun 2020 12:34:13 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id a21sm991063ljn.2.2020.06.27.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 12:34:13 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 3fa8f19e;
        Sat, 27 Jun 2020 19:34:11 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 0/2] Qualcomm MSM8226 TLMM binding and driver
Date:   Sat, 27 Jun 2020 21:28:29 +0200
Message-Id: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Binding and driver for the Qualcomm MSM8226 TLMM pinctrl block

Bartosz Dudziak (2):
  dt-bindings: pinctrl: qcom: Add msm8226 pinctrl bindings
  pinctrl: qcom: Add msm8226 pinctrl driver.

 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 123 ++++
 drivers/pinctrl/qcom/Kconfig                  |   9 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 drivers/pinctrl/qcom/pinctrl-msm8226.c        | 631 ++++++++++++++++++
 4 files changed, 764 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm8226.c

-- 
2.25.1

