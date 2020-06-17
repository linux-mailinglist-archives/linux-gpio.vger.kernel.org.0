Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4841FC470
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 05:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFQDHQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 23:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFQDHP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 23:07:15 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B43C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:15 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k2so326698pjs.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GNkNZqL13bLQFzeD3p2zbS0KOjVhAmx4VDNBi0m0M7o=;
        b=dyrnwNs/idrvFaScAK93w1aGslsLYgYM7ygqFS2o1+3mjvWMIPOzdqZN1thBDinmzR
         9wzFCYi2+F15D5+M/oQYC6smrznTxwmo7QNghFOGMRb7HP8dcMG3uPo/R+oks4dOe2Mj
         n+knD6uhxxjKN2TE77tFdBCl9I9GWzHPZOpasTDQOcaZcjdaBG7TqgqOyrY3+ikH6F8P
         KTV2+Fj+VQSHeJlybaxEWWvpVefFlj/hkGmar9AGc/SZN5Sm7deAuSr61CDIQKugoWsO
         OotxawgobrBwzsqev7ZcMdf4qJNiYiDlPPyIvx183ydHQiIAL1DlzPL3VKp9dhlLXaeT
         aEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GNkNZqL13bLQFzeD3p2zbS0KOjVhAmx4VDNBi0m0M7o=;
        b=dWZByaw/M+V09auzdQ4APHGXo28rVkQEym02cycUIRd00NOPfRJUWDbZzE+UDtKt2A
         lCg7yTtVi6/JSc645/udKTItRFmL6Ibvmb65CO2iBrbf0TTizWlk+vtTXL2JEB+lyDFq
         CPN/ff+lVPk44lhhxuJyOiuz5IIdR/C7LR4o1Ahdq7CId6/JDP+NiibHDnE8TlwH7SMI
         RHNMyeu7ISMFZuBHxCRJM3jA2ez2CVwebp7yfW8HtF7iuEFm8xCFxZos8PeWUk3Dqjnk
         kYGuv49HR4AoTndLqGFJi4iT1KXtT706B8/o0/7Qky8AyxUTn64Bap89HZ4YvoAJqs96
         939Q==
X-Gm-Message-State: AOAM5335B/QZvkg2hQHsLWEPjlDm5hxraZqkAciQwk4hOT2aAuKbfgcB
        +LFuE8RZwRCMT4j3aq5+FyvqaDJU8hc=
X-Google-Smtp-Source: ABdhPJzrO3MPhXtZnPL9QqxUD97alqao1OmxIwmgNUbagTYzDxrE/aJeXc4f8ei+X47ZqMN7dgcgzg==
X-Received: by 2002:a17:90a:9484:: with SMTP id s4mr6007705pjo.30.1592363234635;
        Tue, 16 Jun 2020 20:07:14 -0700 (PDT)
Received: from sol.lan (220-235-93-205.dyn.iinet.net.au. [220.235.93.205])
        by smtp.gmail.com with ESMTPSA id p6sm9185578pfb.152.2020.06.16.20.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 20:07:13 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        ml@ionscale.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/3] fix get_values for events
Date:   Wed, 17 Jun 2020 11:06:36 +0800
Message-Id: <20200617030639.27690-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series fixes getting the values of a bulk of lineevents.

The problem was reported by Gerrit Wyen <ml@ionscale.com>, using the
cxx bindings.  The first patch adds test cases to confirm the reported
behaviour with cxx.  The second adds corresponding tests for the
underlying gpiod_line_get_value_bulk with events.  The third fixes
gpiod_line_get_value_bulk so that it returns the correct values
for a bulk of events.

Kent Gibson (3):
  bindings: cxx: tests: add tests for bulk events get_values
  tests: event: add tests for gpiod_line_get_value_bulk events
  core: fix gpiod_line_get_value_bulk for events

 bindings/cxx/tests/tests-event.cpp |  36 +++++++++-
 lib/core.c                         |  33 ++++++---
 tests/tests-event.c                | 110 +++++++++++++++++++++++++++++
 3 files changed, 169 insertions(+), 10 deletions(-)


base-commit: 2efb0075a7779fa61bfe01c40aa97f7d23a8e528
-- 
2.27.0

