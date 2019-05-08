Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2159E172A2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 09:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfEHHdi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 03:33:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43359 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfEHHdi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 03:33:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id c6so4836751pfa.10
        for <linux-gpio@vger.kernel.org>; Wed, 08 May 2019 00:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cXDSUoWLJ80ofU9SNBABTlyG/UyP3q/4EzPOKhLgxHM=;
        b=JAI6ShQFH5LPrZX4xP0iFXDlDAd4VN4ubLGwY2TwHwEtFJ4qd+UKB0kAFNMmlDUy3/
         9k6f03F08QS2BDgt/s4UrtkxIbFJsaLs76mX9jjd5fOIsOuNzAivPbnD08UX7gb3Jgqw
         1ldBY+aY6kti87kHKpHzxW5ZMzbT0SLV3Eitc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cXDSUoWLJ80ofU9SNBABTlyG/UyP3q/4EzPOKhLgxHM=;
        b=t6pQjKiSsIHDOD2Y48dJZlY0q1q4IKTYe3msxg3zaocLUyfJ/E5dTJY+q31zSvjIua
         ty6vfLaVgQH4hjTo+U12bbHOMKQouDnEzrptWBPFpezHVQlkGAfDcbnFJU/yq0u629SO
         0DC9v620Uq/FX6wTja/s6gcgAc2P/M/7ig6nNkRcD1b/2nMY2KFgFc+YtVyP1gq6Az0D
         aHpNsm/W1Bt+a2kJpTjqXwvoDRR26Zie7EjfsnphyijrzTFtZcZBulGI5XsAMTVxIziF
         chbRST7I9YRwbSv8FDDAFasauY/GKwIPPVHqXjf+/7d/QRoeh6/UK/OmSZEfT29HA8OE
         imCQ==
X-Gm-Message-State: APjAAAUL+nF7M2ABtOyyMOYUw/Qm2UJNxtSGIg8G4a2Lge/wzKLbAyT8
        Os+QVeyfPRTmGZZERGNtFtHTvQ==
X-Google-Smtp-Source: APXvYqwZZ1j+Kgl5thN1AhwfMfoLsny+ZI4X49uRTCohf76ophHTPd+CXngETV9CgnXsMhUfkhp3zg==
X-Received: by 2002:a62:1897:: with SMTP id 145mr47430119pfy.122.1557300817134;
        Wed, 08 May 2019 00:33:37 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id n26sm29539047pfi.165.2019.05.08.00.33.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 00:33:36 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
Date:   Wed,  8 May 2019 15:33:29 +0800
Message-Id: <20190508073331.27475-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
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

Changes since v1:
 - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
   recommended by Sean, to keep better separation between eint
   and pinctrl-common features.

Nicolas Boichat (2):
  pinctrl: mediatek: Add pm_ops to pinctrl-paris
  pinctrl: mediatek: mt8183: Add mtk_pinctrl_paris_pm_ops

 drivers/pinctrl/mediatek/pinctrl-mt8183.c |  1 +
 drivers/pinctrl/mediatek/pinctrl-paris.c  | 19 +++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.h  |  2 ++
 3 files changed, 22 insertions(+)

-- 
2.21.0.1020.gf2820cf01a-goog

