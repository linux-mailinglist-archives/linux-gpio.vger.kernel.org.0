Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D5128DC6E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 11:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgJNJJs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 05:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728980AbgJNJJi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 05:09:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E619C041E5A
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:48:24 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f19so1156736pfj.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymXjerOG7F5lrdWGzRbH2dXBpMBc6Bk/cbcPiJCkZ8U=;
        b=XR6KUMdz/2GweOB4GCYUsPp8Jzd54farqylH4yep5nPRsR2dSbCvsiWOswLUlRVmdv
         4u1QZH8qUGoH2EtW1MgYMgjAuaHMqf8Ro/mdU0vxqZq8/wAZ36t8uvIBu+5bLW/MfJqN
         2+PTBBpUYQc9wFB/4tsOyY2uFhyeErlqs+5JIDdpvqSDBwPYRj+s5Y3RsevHu2S4KpPe
         ziq2/1/qOr0AmOjIQIlR9HrttfuNK60VY7PbcJa84R9R70usrK9Lvz85dDVun68wInhX
         fqiYpjTxTqmtLkjOnpdGIqZXNrPv6HjlrA+5Vqb3zreggqBaWxLeD2GphCqVqx9GDHuk
         2PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymXjerOG7F5lrdWGzRbH2dXBpMBc6Bk/cbcPiJCkZ8U=;
        b=LIDuCNctoGnLVTWhXNMe81KcBISkNJFmmWpr8ltqyK7gw946vkzejGDqA36rfwmgBq
         q+wmOigoJ1KyEWvLzYqbz6k+XiqEylilgPrWc8pDl2QD9SIRXDgBZ6sKw49NCTNwsnvO
         J2aMtrDtUEHD3Hd61fBEJ5MtYhwN0nD01uqWcKWEDb5tfjvllRhDIs6k81fndkNamJ5X
         H0iyumaU9nLYXsm7P31HzgJbBlhJIpqlG1po7LdMMQ1BGjN8j/YsP+nUYNf38uERK1bZ
         3MkXwRiEPpO+CiFCzahqjJz7Ho6IumqByMDhoN11dgAKeJ/jYZhkup5c9Q915hea6f8T
         Qh3w==
X-Gm-Message-State: AOAM533JU6ve3aJSnihg6iHiVNhvTuLObnqBGshywsFsnAgLviX2SLw1
        Gj+DkXym+i0kpSwavhlrDd1jjAkvJSVOpg==
X-Google-Smtp-Source: ABdhPJwiIobw+yCej5NzCkkjsBZVTawUOCUc9ttE3dxynXfYeAW7WODhgOInYUleNJQmNWT6lrh7bw==
X-Received: by 2002:a65:6086:: with SMTP id t6mr2251146pgu.146.1602647303629;
        Tue, 13 Oct 2020 20:48:23 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id z73sm1362940pfc.75.2020.10.13.20.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 20:48:23 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/2] tests: add check of event offset to wait_multiple
Date:   Wed, 14 Oct 2020 11:47:58 +0800
Message-Id: <20201014034758.19427-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014034758.19427-1-warthog618@gmail.com>
References: <20201014034758.19427-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The offset field is added for uAPI v2, so extend the test to check that
the value returned is correct.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tests/tests-event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tests-event.c b/tests/tests-event.c
index a43f865..0e5effe 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -570,6 +570,7 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 	ret = gpiod_line_event_read(line, &ev);
 	g_assert_cmpint(ret, ==, 0);
 	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_RISING_EDGE);
+	g_assert_cmpint(ev.offset, ==, 4);
 }
 
 GPIOD_TEST_CASE(get_fd_when_values_requested, 0, { 8 })
-- 
2.28.0

