Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A418D470040
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 12:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240650AbhLJLqH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 06:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbhLJLqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 06:46:06 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD297C061746;
        Fri, 10 Dec 2021 03:42:31 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b1so17445234lfs.13;
        Fri, 10 Dec 2021 03:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ObDcMYbFb8Q/B5RNxet7nNCWx66ODqNzEQgdnxZJ2c=;
        b=ch0nfpynEWYkw0i1yiE9lmy36+mnwU7ZnwPcyFxbs/5k4IcwO1Wgg1VZojF3XZbNnj
         em+Oit3Y9uOq4Oxpsv9OhO0uQHGaf6EYLuowQHYg14RGGWJG7inurDmxo5ktSOu7DU1c
         p3Fy87o7rQRkPfdWOxlDQC7h+Cr2w+t57WdoCODzOHkcnHftjr5fG+M6K+hFUnDvgvnA
         6NjIrKV0SN2lG7KceH1USflJfzx3tQMJuiFyYAIFWaDBjmhoUKg0f1npJ4h4kXM8NenX
         X41RJPB6Jukr3y/4/GOJFZkGYKWq/ZF+huA/e8J+3jf/ALsCaQb1wZ/VOMoJZH8g6WlB
         LKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ObDcMYbFb8Q/B5RNxet7nNCWx66ODqNzEQgdnxZJ2c=;
        b=P5dOjf/alQ9gBF53HWBfg8nfFF/TzTet2rYqNWytYukLmo1zrNO4bchOIs0TI0OOlw
         TjhHNTMLdUN3liBejI819T4GQlffY96DPm3p1QycFLLmlCvtT2yyJzLDJZoun8Ga5qhM
         dgUzrtZ4CHX6p/GcSkCX3DU5KfxDOxQjArJXo3J2BChG2I/9L/wrDRRUXzOai7C+0kl/
         2bkv9ZA2HrZfmsCFqTN2nk3ducU+FJ5ByauciGi2bvr0INwxn/qP6glL1XOlTH0hKrKx
         5kjr9Az4TgIcHjv2wiFDpkwUsqYzLOKtRziL/Akcu3U4WW+Yc/MDTV3Lhkz0P+T2wnoL
         66Jw==
X-Gm-Message-State: AOAM5318SIzbmRBflhYwnjUJ1rlR3bxAcnK3xzAk+mpqIfNVgJ8ptiSM
        rv2sq6pyC68Lpdg1OMTBgbc=
X-Google-Smtp-Source: ABdhPJw8Z1ozsrU5pIlEsbRzMtYFT+g918PCOytccNAVj056XAU0Fbgx+K+BGtLXs8mnK1JyDTRD0g==
X-Received: by 2002:a19:d61a:: with SMTP id n26mr12108046lfg.313.1639136549971;
        Fri, 10 Dec 2021 03:42:29 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id j15sm289375lfe.157.2021.12.10.03.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:42:29 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 0/2] dt-bindings: pinctrl: pins, groups & functions
Date:   Fri, 10 Dec 2021 12:42:20 +0100
Message-Id: <20211210114222.26581-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This is my minimalized attempt of setting up pins, groups & functions
bindings.

I've been warned that Linux pinctrl subsystem may require refactoring
before it's ready to handle such bindings properly and that appears to
be correct. I'll need to invest more time into reorganizing Linux
structs. Right now it's not ready for tree-like design and it uses
more-or-less magic numbers to handle pins <-> groups relation.

Meanwhile I'd like to get dt-bindings reviewed & possibly merged. To be
honest - my initial reason for that work was developing U-Boot drivers.

Please kindly review those bindings and optionally treat my WIP work on
Linux implementation as proof of concept.

Reference:
RFC: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20211110231436.8866-1-zajec5@gmail.com/
V1: https://patchwork.ozlabs.org/project/linux-gpio/list/?series=272685&submitter=&state=*&q=&archive=&delegate=
V2: https://patchwork.ozlabs.org/project/linux-gpio/list/?series=273711&submitter=&state=*&q=&archive=&delegate=

Rafał Miłecki (2):
  dt-bindings: pinctrl: support specifying pins, groups & functions
  dt-bindings: pinctrl: brcm,ns-pinmux: describe pins, groups &
    functions

 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 38 ++++++++++++++++++-
 .../devicetree/bindings/pinctrl/pinctrl.yaml  | 34 +++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.31.1

