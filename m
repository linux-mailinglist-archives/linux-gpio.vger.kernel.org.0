Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415D0DAE3
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 05:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfD2Dz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Apr 2019 23:55:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36049 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfD2Dz2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Apr 2019 23:55:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id w20so3809062plq.3
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2019 20:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXk34VsYreRCPNz4i6pWPCyTwvp96N833kW5KsYPoLI=;
        b=QA3b1VEMbb59818pXyhhNImtFA59xQ9SCX5WROV+Ul/trmfLt4HCeV030EL6SVf+iL
         N4s8vtOptfY7n0NAMyGYKVz7OOd8lsdVcIlBDOPBEJ/X1a81gLUMzCzapAfpsJkywWNo
         7uLoYVxud71OMLp9bl+NqVQ57Yadzqm9zi1pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bXk34VsYreRCPNz4i6pWPCyTwvp96N833kW5KsYPoLI=;
        b=bB0Tp/p9z0gBq7JxEOfopN71MIdF0T5dib0bfTYme7CXnkRe+qK4VfhoUCMQi0vm0O
         EooMn79CcI9lZ0/tasNYP1PfXea/dXtS7bEdH+cGnAhIDIKU59UhP6lI4YwfL+jGfgn7
         eI1jvNZTeZqxO2xmBi1ZthBWk+vrzZOlj0PBRb0D0ZqHPW15IRqsfCo6h5SglHhI6oZo
         41ggk2r6J4PP/u/5ToIPt7OemcPpkPEZCkkCZS18oqZKzJ8k7hTGqlh1omvtOxJFGj+t
         dqffEeAOfverUHgUS6OILiX01VBo+B3qUYmBddEHTvwOcANpJabxeL51scBKIbrH9/ki
         UdFA==
X-Gm-Message-State: APjAAAXqMYPP14AoI8sEviX4s1IiNelRCTCzlNsb4TwxVGeUdcgY7/Bh
        cDYxgwqKJfjVCuD2fiJgygEtxw==
X-Google-Smtp-Source: APXvYqzjt4UrpemC6KYvWhVVLUW4VYRT494asAiDQflS3Vl76Sn5i0szake9Oj3w9XgJcvbp9UevSA==
X-Received: by 2002:a17:902:6f17:: with SMTP id w23mr39043760plk.29.1556510127299;
        Sun, 28 Apr 2019 20:55:27 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id x128sm55433585pfx.103.2019.04.28.20.55.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 20:55:26 -0700 (PDT)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>, evgreen@chromium.org,
        swboyd@chromium.org
Subject: [PATCH 0/2] pinctrl: mediatek: Fix 2 issues related to resume from wake sources.
Date:   Mon, 29 Apr 2019 11:55:13 +0800
Message-Id: <20190429035515.73611-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes 2 issues when resuming from a wake source, especially if these
wake sources are level-sensitive.

Tested on mt8183 with the series in https://patchwork.kernel.org/cover/10921121/,
but this should affect all mediatek platforms.

Nicolas Boichat (2):
  pinctrl: mediatek: Ignore interrupts that are wake only during resume
  pinctrl: mediatek: Update cur_mask in mask/mask ops

 drivers/pinctrl/mediatek/mtk-eint.c | 34 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.21.0.593.g511ec345e18-goog

