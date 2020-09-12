Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43032678C8
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 10:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgILILh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 04:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgILILf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 04:11:35 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD215C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 01:11:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x123so8921206pfc.7
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uKxJ6l42Rr5bTxZ/Q1sZtoURjghjoZrwJA5CjXTKf5Q=;
        b=iiFo46Qd6phwZUO6BXuAplZcqVwuPgLJJm7FwELFUNBiwo2eiB2WOv9a8D7tKjvN+S
         a502BbI47TzTaoKo5LNFMNw932IAGlcMkxIKoVWa8t4T27tsvh7v+X2REUm14kNA01iS
         MF8tydXioHdDC+TrPsHJL3RSjF1OTwFJX/ySMN/tcr8uIjrqCXJ32zKbkFhDqh8g3sau
         dxEqufV8OAyT2AFr8JoCgYkA5G+5lQVg58p+xwNQzIqdn7E4cjdHMRcS+oMwr9zJ175o
         aRprPkNN2gq4RyoQys7KYd60BFohbPdzb0vd8jEyGlnWBJwRykn4Np7kEySdazEjoEDu
         o3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uKxJ6l42Rr5bTxZ/Q1sZtoURjghjoZrwJA5CjXTKf5Q=;
        b=LX98QqVRxSa1g3Fi74LmOT3/NU2SU5lIr7MV6bYyD7NBxd7bQPGx7/NFH80R64sN3X
         wyV5kru9nsRhFYvCrkBOXDiLxDE9ixvkt5A3FLTkwJf2NZfJc+jO7xKg5XE6C55VWgHH
         KYVRD7a+rEpHiUgrozsPNx7HUicYJaWXngikvEAFWu1UgyJMwMH9to5HBAa/z9w1E86q
         qAwoco43lSqcI18iiUXrYQ653/z/dexkXGbbKz1htfxc+YREw/xZN76aYxblM+GL/zHT
         6eE31nDeMEO+0zErHx+vWTXGttuwvQKTEFkV6v++oyyWwIRGG85G1c7c1uJfGNIF9wry
         iU7Q==
X-Gm-Message-State: AOAM533rPt0N9Ob+TF59+8pfsq0sfvC1vuycWXek0fPUrGogWVkjfV6T
        PI017aei7D94nhE9/bh3F/Z2qg1RiQE=
X-Google-Smtp-Source: ABdhPJxNnO+bMm16RscOS0/jxnj14wHgttHYNcVIxOmxkfwsQ4GhlPuZ80f6EOZUwjgXQCL+fxcWqg==
X-Received: by 2002:a63:f546:: with SMTP id e6mr4183643pgk.7.1599898292993;
        Sat, 12 Sep 2020 01:11:32 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id y6sm4002811pjl.9.2020.09.12.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 01:11:32 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 2/2] core: fix reading subset of available events
Date:   Sat, 12 Sep 2020 16:11:05 +0800
Message-Id: <20200912081105.1615496-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200912081105.1615496-1-warthog618@gmail.com>
References: <20200912081105.1615496-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Only read the requested number of events from the kernel rather than
reading up to 16 and quietly discarding any surplus.

The previous behavour is particularly bad for reading single events as
userspace must read the events as quickly as they arrive, effectively
negating the presence of the kernel event kfifo.

Fixes: 44921ecc9a00 (core: provide functions for reading multiple
line events at once)

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 lib/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/core.c b/lib/core.c
index ad76051..b964272 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -1090,7 +1090,10 @@ int gpiod_line_event_read_fd_multiple(int fd, struct gpiod_line_event *events,
 
 	memset(evdata, 0, sizeof(evdata));
 
-	rd = read(fd, evdata, sizeof(evdata));
+	if (num_events > 16)
+		num_events = 16;
+
+	rd = read(fd, evdata, num_events * sizeof(*evdata));
 	if (rd < 0) {
 		return -1;
 	} else if ((unsigned int)rd < sizeof(*evdata)) {
-- 
2.28.0

