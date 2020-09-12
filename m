Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21410267739
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 04:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgILCX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 22:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgILCX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 22:23:29 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9C5C061573
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:23:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k13so1745169plk.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 19:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYYYyqa0FXfDmq6icD1d7rrnqRpBYAjcczwgzELDdkA=;
        b=X0N4B5Qq/HQrbDTV2m5F0gbbO58f1QEurG62VAazzz35xvdxJ8G1CNPmTuXRDEb7kx
         4s5I1Agp1p9TwM3xKbj2EuoLbIBfYzdreJ//0iWS+CudfZMpQzTAa/jsR6GnXvEFmukU
         bq/hBqzFbraZbimVyIqyrKH1r9C7wAjfTUOGdQXCQHyLUQJttvKjX8IxaRBDw/Sd0DPp
         cooy2JCJaVmMSHgaHv0k5Dhb0rYRIU/ciaR90z04FYsB2eR7GwnQU4i4zmswb16BC2iN
         JxJ/RdK2LlrV587vRDglpCU/ZHei51hDSgwARq8b7NMXQN5N2/FWVYem8YOPT76YphtB
         WN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYYYyqa0FXfDmq6icD1d7rrnqRpBYAjcczwgzELDdkA=;
        b=RmzRgXJsy514rvcQBAu3AfKjdXucZfLjRWqubH0BwvZcq6aSKkBv+ByPC83/WE+KM1
         LXemKKZkTANoSu5OUJQVrUU4iBQDS8ME3f6gNvscyd561TxNJf9ZD8DBSD65kMvGqJus
         4GnIS159FoViaKYjUy7ZhUdJryEuwqPqOqPQ855oIPceu5Fvc2mtlUAaLc4csCeL2X0Q
         NcLQ0ZaxZEKX/nFW00iYTMsuAUL36MsFCT+tQ4EhyBvK0Bw9s4H9Kw3A7VPreJMYa/qq
         TuoJe3ryX32nLjVkAtm4dun0cJno9gaYQFm7HUF9Uvg17znsweUl7LGb/aBhERIRjwtK
         C+UA==
X-Gm-Message-State: AOAM533664iIx8cE2ypEc2ngF8w/hCLpKa0vw917ir0Hhnhvkjr/VOSY
        ORny/N4P1YOek9zKqOLt2Eu58mrXhdU=
X-Google-Smtp-Source: ABdhPJzNAI7YVBY4f7to2UXdWnLPbvEIHpLY9zyLgVZsAaNPeFfECwQ7pIhVlhKT4jiGqG31GZiT4A==
X-Received: by 2002:a17:902:be09:: with SMTP id r9mr1129623pls.142.1599877406518;
        Fri, 11 Sep 2020 19:23:26 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id g21sm3545574pfh.30.2020.09.11.19.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 19:23:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/2] fix potential discarding of events by read events
Date:   Sat, 12 Sep 2020 10:22:46 +0800
Message-Id: <20200912022248.16240-1-warthog618@gmail.com>
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

Kent Gibson (2):
  tests: event: reading test coverage extended to cover reading a subset
    of available events
  core: fix reading subset of available events

 lib/core.c          |   5 +-
 tests/tests-event.c | 144 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 128 insertions(+), 21 deletions(-)


base-commit: fc61e740fcbe3c6594295766759888c96c45bd29
-- 
2.28.0

