Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B124D2A8A8D
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 00:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731060AbgKEXTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 18:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbgKEXTe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 18:19:34 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C97C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 15:19:34 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id c20so2566509pfr.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hnu7BZsCf25j81o0/FyIcCSZu6usgCOiyrsaZLAuAWY=;
        b=ulx3og2JVeePgxNZ0jDe1Q0Nm4UVgQo4WUzZCRJaqY8MiP8qbtyl6BmIcK6pYvxao3
         kS5TM1R131bQbBWbn7hk94pW4dV7r2WmBShAWry073jShECILKo/5ZoWu0Fpb2pUUeKq
         A0eXv44SfglMYykRC8ogdc+Js242DfQ8H7/AGJWIIUrCcs/JW3enxc/DE8Ir2kdx+g4j
         4aWaRLkBp7V9qfyKV6vHexQc8XaYS5wrwwpD1Rish1S04ksWct67ROO9j5YtRuZXaiF0
         m20kDwjHtTNa443Ami1s134rH6mY83D9/JD/yxrE5V7JsTlkZHEi8AmwoR7GcOoUkyWD
         Pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hnu7BZsCf25j81o0/FyIcCSZu6usgCOiyrsaZLAuAWY=;
        b=GiAZt2fDhDMMocqbmuvmipRlCEVLyv4pVB8E0VUYIgjuqLPD7V7XuSGMDXt3ya2/qV
         I3sSEhfNK9QxOQECfAVlEaYf59zgR/XizVZcHzrLUsGNjzh90cHS0rD+Gr1jTPCo0e6E
         D5ZU7QzpE61VdltH10ngHg9FilcfrQ2Ah4XVONUIICQPhW0J/G3w6zaw+Nccx+nVbSFE
         aqT/qQ3uxgBbb8MeEAz1FmjSFrSQgBx3ZB3mXXT9XxMJ11JtvOf8fx1EDZL6E6X+JgBU
         KuHCIOpBSVnRkOgPRPsrR/fZs53uFqH11CB/1oEUc6jM7jhG26piiqbfyWou2P3V8PDI
         mUoA==
X-Gm-Message-State: AOAM533F4xfrqpp7e+K2fME4jrwDpUKHSxdDSdbP6rGPJo8ggpSz2vb0
        lpXskwJnXegZSP7PYyktWAk=
X-Google-Smtp-Source: ABdhPJy31HRbkUymrRY6bPCwzgshxyqrnSW0cjyuBykUK4kmuhj13SAMMyvNzka2Xzk+Rz8JWi0msQ==
X-Received: by 2002:a63:42c2:: with SMTP id p185mr1840311pga.245.1604618374018;
        Thu, 05 Nov 2020 15:19:34 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id w65sm3911562pfw.145.2020.11.05.15.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:19:33 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/4] pinctrl: amd: debounce filter fixes
Date:   Fri,  6 Nov 2020 07:19:08 +0800
Message-Id: <20201105231912.69527-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are three fixes (and one improvement) that fix the debounce
filter issues in pinctrl-amd.

Changelog v3:
 - Explain why the driver mistakenly took the slightly deviated value
   of debounce timeout in the commit message (patch 2/4) [Andy Shevchenko]
 - Explain why other touchpads are affected by the issue of setting debounce
   filter in IRQ type setting in the commit message (patch 4/4)

Changelog v2:
 - Message-Id to Link and grammar fixes for commit messages [Andy Shevchenko]


Coiby Xu (4):
  pinctrl: amd: fix incorrect way to disable debounce filter
  pinctrl: amd: use higher precision for 512 RtcClk
  pinctrl: amd: print debounce filter info in debugfs
  pinctrl: amd: remove debounce filter setting in IRQ type setting

 drivers/pinctrl/pinctrl-amd.c | 56 +++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 12 deletions(-)

--
2.28.0

