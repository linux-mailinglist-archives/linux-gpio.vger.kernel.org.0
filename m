Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4520435D3CD
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 01:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343646AbhDLXS0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 19:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243892AbhDLXSZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 19:18:25 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3BEC061574
        for <linux-gpio@vger.kernel.org>; Mon, 12 Apr 2021 16:18:07 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so14427821otk.5
        for <linux-gpio@vger.kernel.org>; Mon, 12 Apr 2021 16:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w7n3vBtKnZ3DFHMlcl+TEKd1DZ3COz1Ei4sifdIcY+c=;
        b=E/Fw3ZxOG9WnbwXOeYTUXDJ5Sw2eIAjcBWHJHeoaJ4vB24UIpsY4BexySlR6v158oM
         Q3njiQGKYmZc1bbWI4F9Rbjgiww7WHrNHC61UQ4dbskb/ADM1Ze07BT+YX0nbUgh6pfv
         4ALpc2l7CELoqF1jWvf5XE8N/A4zsXiZ3iOc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w7n3vBtKnZ3DFHMlcl+TEKd1DZ3COz1Ei4sifdIcY+c=;
        b=qfbDKpLblMr1C67XhAc9mSlb1c2zPqUAXQzqpl573PeXCRTJfsAUe65jrzYYMhgBRX
         rCiQGrfK9YEIDwQLnPVUmAsLBSkvkdeJrZzu30sWUiUhLNSkkeIH3BasQKwyS4AxtJ6r
         mK6a78WA7hqThSlRBXJ+lKvjc8JT54p2ysBBWSV2qFpsTSgYcoxgqGVdDfLqI5siYp8m
         VurEMfNaTkOr05Nc9P0T2RySbWEX80PFpxYx8JGctGEkqaTAgbELELQ/xUsByN/yaNEo
         JXszQoUoj+KFQgnUBQxW++n1RRlvICWD3B3m1AqAXnkhotPuhulDq4euMcI9l++VG0G+
         iN2Q==
X-Gm-Message-State: AOAM532j8KCH+0LNJrWs5ZjUX2e+D7DvCGMpF4HQ3V3FjVNMmZz3mxs6
        uryu8CZqdXOEzVP4Zy+iSy9JdpxuZ7o6vG4nldo=
X-Google-Smtp-Source: ABdhPJwI9j1ZLvLpzRi9U8XLACkHrVtiG3V+sNGi6k/w7tYQbVNVDhI3sun3z75PbB8MconNck8dPg==
X-Received: by 2002:a9d:694a:: with SMTP id p10mr26253206oto.319.1618269486801;
        Mon, 12 Apr 2021 16:18:06 -0700 (PDT)
Received: from dev-yzhong.dev.purestorage.com ([192.30.188.252])
        by smtp.googlemail.com with ESMTPSA id j21sm342893ota.6.2021.04.12.16.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 16:18:06 -0700 (PDT)
From:   Yuanyuan Zhong <yzhong@purestorage.com>
To:     mika.westerberg@linux.intel.com, andy@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, Yuanyuan Zhong <yzhong@purestorage.com>
Subject: [PATCH] pinctrl: lewisburg: Update number of pins in community
Date:   Mon, 12 Apr 2021 17:17:59 -0600
Message-Id: <20210412231759.15474-1-yzhong@purestorage.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When updating pin names for Intel Lewisburg, the numbers of pins were
left behind. Update them accordingly.

Fixes: e66ff71fd0db ("pinctrl: lewisburg: Update pin list according to v1.1v6")
Signed-off-by: Yuanyuan Zhong <yzhong@purestorage.com>
---
 drivers/pinctrl/intel/pinctrl-lewisburg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
index 7fdf4257df1e..ad4b446d588e 100644
--- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
+++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
@@ -299,9 +299,9 @@ static const struct pinctrl_pin_desc lbg_pins[] = {
 static const struct intel_community lbg_communities[] = {
 	LBG_COMMUNITY(0, 0, 71),
 	LBG_COMMUNITY(1, 72, 132),
-	LBG_COMMUNITY(3, 133, 144),
-	LBG_COMMUNITY(4, 145, 180),
-	LBG_COMMUNITY(5, 181, 246),
+	LBG_COMMUNITY(3, 133, 143),
+	LBG_COMMUNITY(4, 144, 178),
+	LBG_COMMUNITY(5, 179, 246),
 };
 
 static const struct intel_pinctrl_soc_data lbg_soc_data = {
-- 
2.31.1

