Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD62678C6
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 10:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgILILY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 04:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgILILX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 04:11:23 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F257AC061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 01:11:22 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id e4so2008779pln.10
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04wDqmaZccj9KFUOYymFspinKcticrouVTrfniOEN/o=;
        b=mA5Ix6AZooTpQQSL77Ropm5LAS7wyjvJT6VYH8IX9uZDgjGjt00XuqkizkV++KHlcW
         o9WXwuhIzSp0I5zAtSHggrd6wP7Ebe/WANhrvhtR9/vc3mMqOBgTXq27YQcAr6eIHaQq
         D0k8LO3j87SOqeWLzem49TQ0+6emQ7Eyvsj1kygE7IZYQuzKfpNVFSHcYuDl0328jKc+
         hm5WjsVeeOP7KKU3yljHf2rjn0dNsdIPFPzNrtShRM4VBfVlPn8AdStbkwgl9GId1MWs
         WZnf+fAbNIY9fvmeS/m6zLg2ZfkxHSHm9I7yT6HbAnGJdv2h//+CTSCx01mPJfevx8UO
         7SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04wDqmaZccj9KFUOYymFspinKcticrouVTrfniOEN/o=;
        b=dbYOgNShYVmXkTj5Q4dBwB4nF+P2LSx20jbEP496jVrrIDx6tRy5WYOeawC11HTCBP
         +6TVyMoTdoPt17INGYNh3l4O8Q+eir1SmrlTw5Ie8T6IcC2N9pS/h5jRFH+UDFPhVm01
         SRND9TJsYqoNOot/W2m9+qFkXNgmIVKiuJ1WIsDfv4T0EE90a/FA6YHkUyqjwtL5NngP
         ULwbfX409ZD+MS8sDkoF4LZL/IinGgtKELQ96vqRllUv4R7b0tY3pCIa76+E90Lnz5pT
         ye45/SoMAW9x8zDeVUG3QtP02MWlYyjUW6XnU0rY+KcvLLqOYlfZSy4SfuiGBWvARC/6
         opLQ==
X-Gm-Message-State: AOAM5336NnMNsLGdwdZMScamL3gwUQRApvQGOulRWPyShm6L4AIXMHy+
        Cn+9YahsEHvQE5MVI+LJqC8Z5OnRORE=
X-Google-Smtp-Source: ABdhPJxzOQho1fuhJKnN3fmb0XI7nHha1O1k4yxN/tYgIMxTQMv+z9E5UuPkrpT6YeVbBlrKirXLxw==
X-Received: by 2002:a17:902:ab88:b029:d1:9be2:c683 with SMTP id f8-20020a170902ab88b02900d19be2c683mr5646280plr.24.1599898282021;
        Sat, 12 Sep 2020 01:11:22 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id y6sm4002811pjl.9.2020.09.12.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 01:11:20 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 0/2] fix potential discarding of events by read events
Date:   Sat, 12 Sep 2020 16:11:03 +0800
Message-Id: <20200912081105.1615496-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch set addresses a bug where reading events can quietly discard
events.  The problem occurs any time a request made is for a number of
events that differs from the number available at the time - a number
that userspace is unaware of.

The problem is due to the read multiple always reading up to 16 events
from the kernel - independent of how many events have been requested.

The problem applies to reading both single and multiple events, as the
single event read implementation wraps the multiple.

The first patch extends test coverage to highlight the problem.
The second fixes the bug.

Changes for v2:
 - restored usleep() when creating multiple events in patch 1.

Kent Gibson (2):
  tests: event: reading test coverage extended to cover reading a subset
    of available events
  core: fix reading subset of available events

 lib/core.c          |   5 +-
 tests/tests-event.c | 157 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 141 insertions(+), 21 deletions(-)


base-commit: fc61e740fcbe3c6594295766759888c96c45bd29
-- 
2.28.0

