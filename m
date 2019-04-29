Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85DB0DABD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 05:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbfD2D0I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Apr 2019 23:26:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39356 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfD2D0H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Apr 2019 23:26:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id e92so4388521plb.6
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2019 20:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VfaUjavgU7FLcbQRnhsJ2vG6fwuvzcfeYnH0eMo2lew=;
        b=ZIO9fcp3UVgcrIpro2HhbPWDhopkv0jrc/1NOivlvUpXqUNgaAWC3mq2KSfBJcfro6
         FnUyZrktLKoHzUugRUgUO1fD0EBf6bACTP64AxQFAlOpDPq31IP1E0S/bAmcVJXu/mAx
         CW/Fu5r6XzT83MF0MjYDhG2nocDhko8GyAYAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VfaUjavgU7FLcbQRnhsJ2vG6fwuvzcfeYnH0eMo2lew=;
        b=rDHefdoo/6KbeeODaoUMq7vGfADbkNHAEuy1GhM0ejxh9TR81uGQBEFOAgGui0P2Lb
         sVhHQg52EpBfXfrmtKc+rOEIXBEFSVQG4RV2V9wvrwfJKvraK+NVf73x5eqyng1CQ8CY
         Zxn7G0kBCfBNiSSjkx2x/mqCC5hTPsiGUvpSFpv2ZEWcQIfvZLN4dr2Q47CHLPbX5CNf
         OtSPLEXTkKZHflVbtSsULNTxFJIqlPfqV5n2UpgAe1KeocnDjd4c26AZkJPyGg9yiqLI
         IUbVlrpbZmPxH0oMAruSgU5rZnMecObi+gre1B7hIqKy6pbmnmCz6bMdhJ1khneu5ueD
         0aaQ==
X-Gm-Message-State: APjAAAVtzYonlWFsZtVMMmvZVjqQYe2A8hFza2TogfLjtyZbGzWQiDb9
        LQKwjiMKQSt4kY+ALvd4iVSXPg==
X-Google-Smtp-Source: APXvYqx3ji95ro+Qgz/gh/2nu0EmODc2XcZ6cLoCoVh777KZZC76LVFq9Evhuk0WPUubiVGpIc4D9g==
X-Received: by 2002:a17:902:b089:: with SMTP id p9mr59602794plr.185.1556508366781;
        Sun, 28 Apr 2019 20:26:06 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id a10sm41364938pfc.21.2019.04.28.20.26.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 20:26:05 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
Date:   Mon, 29 Apr 2019 11:25:49 +0800
Message-Id: <20190429032551.65975-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds support for wake sources in pinctrl-mtk-common-v2, and
pinctrl-mt8183. Without this patch, all interrupts that are left
enabled on suspend act as wake sources (and wake sources without
interrupt enabled do not).

Nicolas Boichat (2):
  pinctrl: mediatek: Add mtk_eint_pm_ops to common-v2
  pinctrl: mediatek: mt8183: Add mtk_eint_pm_ops

 drivers/pinctrl/mediatek/pinctrl-mt8183.c     |  1 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 19 +++++++++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
 3 files changed, 21 insertions(+)

-- 
2.21.0.593.g511ec345e18-goog

