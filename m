Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B7F26248F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 03:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIIBki (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 21:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728954AbgIIBkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 21:40:36 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E551C061573
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 18:40:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v196so840854pfc.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 18:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28S4zavePL6qOKUrGQ/Po0NyjPaciupAl6D24f7gf7g=;
        b=FXeWiHdNasLLq0gZzGU4j+HIdAgDRBEUui/OU6XRymP7GXygsAx7yHAV2f+uhwJbAY
         lAaz0GVx0l/TBHbtMSAoMSNlNhrWm/XMT4RnrD75vRsK4yM9pEzrzijUTB88Nx8PgXPX
         hvZcRTZd12gPgJmEiR0gV4QKXo7x9t4YVNLoZbLRu5uTq7YK/RFltOYffY4PhIR9EmKR
         gV8iHPmsISr9pKujYDHYju1IZ7D8lDdC75McfLCteQylpSZ4qhIqDl2+543oy4WdQF65
         q9GEigjCHIKpcvFLpWXITJ7G2F4DS8ayjNT3CpnrtFhNX2bBM1CjjD7GEw2tv/N3i4Ad
         7uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=28S4zavePL6qOKUrGQ/Po0NyjPaciupAl6D24f7gf7g=;
        b=jGY2bEBloQSAjzFSJNYtbq0miulAepTY8G6VKXqH5aJuTgr6a8GHzep7xYhbqtb6Ip
         lLTgZRCYfALbjwX3Gc2/JZGnm8a+K9vS7LKPyCvM+v7a7PPLPbsyTtAA77Fp1cRa6tV5
         9O5rgceRC7U7UgTfP4XFzOIMFJOp8jRfyUeV1HyOMZussE9K6RosFvsMBPQCbzJYx4nC
         qrtRusa/3WwjGeBEItoBmX6IqCgEIbVHynt/zSdU/SRL1/lGmZsGdOR6TodYNUtIcsV5
         jkKHrCsvq/wwPjqYe5oSs+LAdTp7mms/5JGsjccAlh3J7XTOc8xD6Clo/BfGSDSNKF5S
         QsqQ==
X-Gm-Message-State: AOAM5306tuAUbolXSXVC4EBtIi9hvtDca8PmGUKCmveayr6ZF2CQShgM
        vvvpztARMeAJ0jFgwC0qV6cL3lTJbSw=
X-Google-Smtp-Source: ABdhPJxkYxbMsNt75HkiKBQxgbg3YtiGpY3f5wn8myLkpzaa25fheZrNecGgJQiV0vSfUKQX3rUmLw==
X-Received: by 2002:a63:5656:: with SMTP id g22mr1159857pgm.44.1599615631363;
        Tue, 08 Sep 2020 18:40:31 -0700 (PDT)
Received: from sol.lan (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id s22sm665530pfd.90.2020.09.08.18.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 18:40:30 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        florian-evers@gmx.de
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: cxx: fix event timestamp calculation for 32bit
Date:   Wed,  9 Sep 2020 09:40:03 +0800
Message-Id: <20200909014003.11487-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use appropriate C++ chrono library functions to convert the event
timestamp from a struct timespec to ::std::chrono::nanoseconds to
ensure correct conversion independent of platform.

Reported-by: Florian Evers <florian-evers@gmx.de>
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Florian suggests a C cast before the multiply, but using the C++ library
to do all the work, which removes the 1000000000 as well, seems the more
correct way to go to me.

I don't have a 32bit setup handy to test this, so perhaps Florian could
check if it works for him?

Cheers,
Kent.

 bindings/cxx/line.cpp | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 11deae6..b71b6db 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -215,8 +215,9 @@ line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
 	else if (event.event_type == GPIOD_LINE_EVENT_FALLING_EDGE)
 		ret.event_type = line_event::FALLING_EDGE;
 
-	ret.timestamp = ::std::chrono::nanoseconds(
-				event.ts.tv_nsec + (event.ts.tv_sec * 1000000000));
+	ret.timestamp = ::std::chrono::duration_cast<::std::chrono::nanoseconds>(
+					::std::chrono::seconds(event.ts.tv_sec))
+				+ ::std::chrono::nanoseconds(event.ts.tv_nsec);
 
 	ret.source = *this;
 
-- 
2.28.0

