Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D7328DC64
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 11:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgJNJJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 05:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbgJNJJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 05:09:37 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B1EC041E58
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:48:13 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h4so836703pjk.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VM0pA9gZiI2iJBY4/A6woXhAFXNEozAONJTBfLhLtGI=;
        b=lQxX83PvsB9OcvfGQF9jQOrK3Si2yYpF27Z4vuMpWFOj7gNE7MG5Kc8EtNnka5EDTX
         W3FuDlEN1DnO1gU2uVg7zd2ktpHL+r5X3jwLCC26GjE6Fl2nfGPwczirgWUB4bvlsAZz
         oAxwWXBOOTJ5ERBVcuqZ1i3ICH4XUn17KWbqdZHkW+fs3btVimukspNwbKoLs/HvEIBq
         z8eD6wuQZN16RE07LN9cP0H2woxEjBou31Z9g/C2rM9qYMCqBpxvwcTEOTETlOaq3Fiv
         jDR3Mp18QAZQj8lzYC7Yj+tuAyteY0RrSHgQjzFB9aeD+JrbGAZX3VE2ApeQ1Ci09jRc
         a50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VM0pA9gZiI2iJBY4/A6woXhAFXNEozAONJTBfLhLtGI=;
        b=ZFwTp6e9rcxgeGxHsdTa0FCQqfOt4YzeErTQ4dMf+lMhWhLJnXPVMcxbAK+a7W7BRc
         k+gnHE7EDp+SiBz53VpP8AqQk56QT0ZKTI77jfBKJIJE6sPJfZt2+BzFvssj6pvJsYML
         F1W145j27tIVfePx7fwozbTw0INpcM2lMlYkjx8szhZw6Ym3vhYtc4Jq5Y8IDJnu9osY
         SDtlMv83pMyw1c7jNMbARihROMGtjTXJqzZriLlvZC0FD/tUrfyvOnNPtsPY0Fy4cY9G
         hZe5afniR1Kn7C+3UTaYQEprF+pry0DZSjPEbgbnNXqJAD9Jtt6uepUxaAZWq0e6T+Id
         8/Aw==
X-Gm-Message-State: AOAM533V9QVtgPW2uwH3c835oSyhA2kQXpV7vj+eHg5AcQZ4ENU1Xh26
        1wIoT0m8xrnPfmlUp3y+P8bBajzVMBPVrQ==
X-Google-Smtp-Source: ABdhPJyxmNlEz3nf3UhuWECk+CMLpT7wqUHoCC2rTYQ/fvOJMHyDpitiKsEYSsv+ZsLsiS+Wd4SsEA==
X-Received: by 2002:a17:90a:65cc:: with SMTP id i12mr1515896pjs.193.1602647292529;
        Tue, 13 Oct 2020 20:48:12 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id z73sm1362940pfc.75.2020.10.13.20.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 20:48:11 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 0/2] tests: improve wait_multiple coverage
Date:   Wed, 14 Oct 2020 11:47:56 +0800
Message-Id: <20201014034758.19427-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A couple of patches for the v2 branch that improve the coverage of the
wait_multiple test case.

The first creates a mismatch between the chip offsets and bulk offsets
to highlight the problem with my initial implementation of
gpiod_line_event_wait_bulk() for uAPI v2.

The second adds a check on the event.offset field added for uAPI v2.

Kent Gibson (2):
  tests: create mismatch between chip and bulk offsets in wait_multiple
  tests: add check of event offset to wait_multiple

 tests/tests-event.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.28.0

