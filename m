Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720CA1E347A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 03:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbgE0BJ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 21:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgE0BJ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 21:09:27 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7A2C061A0F
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 18:09:27 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id l73so519932pjb.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 18:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AU5a3q0seIjEGwhcFAZFmLw24gAA8frep0HpmLM0D4I=;
        b=YSisnJ7z4jcmNU2txaLK5r9Vixue7AInAVWxXp0Y9iDNdCWPtchxM4EvxLkXBqoBTj
         ZG2+Znc1ee+DtiA1Lo9vTZyw0BLzPl9AHV+UA+e+oYcHpGBXdWpKo3YqVhCij0yeB49Z
         BW42CCyN5ScBDOw6oTAoreHkdPgYaxZVcDfOxOKCVbct4LMMyRAoCpfKaYvc4sVEMyE2
         NT5RB2PhhhqkDUT+zduwSpB0AIePJoPp07s1gZsz8Nfy7rIwBvPooufVp4+JA72XJECU
         BTUqCD+qvSgtY8Nwx4sGczu2qA1Ks1XLIokYe+wO2irpM3UXtaNB+TGON6wTi6flUGsx
         gRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AU5a3q0seIjEGwhcFAZFmLw24gAA8frep0HpmLM0D4I=;
        b=Gw7jd0hmru3uW16pOfw9JmGg4bqCul91ZuWap0g8QNqEeU9uqr7KzEDuzbuYZVcXC0
         /NPB4Z/J5FaHmzMPnDBZvJ8Pzhy62AMU44NbCum9KbvTrifr2GnoRP9ZlzHY+ACTUqru
         yigRsDcA0J9/cWqe/ywrOhFiQ+EMnezZ/n1Ur8x42V/MmVmHzRW8JwNveeNS842URnL6
         h8FIIQbuwyrwUQrRB4MIwMg9b4uPIInFi0MjbNy5w0om0SHUn1OTz9/9I352k7WzqVLz
         CPBE41ATDqm/1prLChW6+ioq/iR8ZRfs85wUidDwEKHt1u2XPrZI+ybhPQwy2sW9PjBR
         WVuQ==
X-Gm-Message-State: AOAM533SkJHSfaFx5pfgeZmHliC7ueJh6CVy9YshCGVa82GsGaJWj7fB
        KXz1flO/TtvPHLXZJ4jZHCN4iJPG+yQ=
X-Google-Smtp-Source: ABdhPJyu3fl0nbJNLSA71ys8yq8initYH79nyoIy+tBVgcb3gz8xh8i3Ses4ytc/nec609qzw7vI3w==
X-Received: by 2002:a17:90a:d497:: with SMTP id s23mr1945517pju.222.1590541766211;
        Tue, 26 May 2020 18:09:26 -0700 (PDT)
Received: from sol.lan (220-235-68-201.dyn.iinet.net.au. [220.235.68.201])
        by smtp.gmail.com with ESMTPSA id f5sm628652pfa.104.2020.05.26.18.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 18:09:25 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] tests: remove debug asserts
Date:   Wed, 27 May 2020 09:09:04 +0800
Message-Id: <20200527010904.12542-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove asserts that are a hangover from debugging test cases.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Those asserts were initially there to debug the test cases when they
were failing, and I forgot to remove them.  The are not part of the
test, as errno is indeterminate unless the function returns -1.
And that clearly isn't the case as the asserts immediately prior verify.
Having them there can cause spurious test failures and head scratching.

 tests/tests-line.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/tests-line.c b/tests/tests-line.c
index 97b7df9..334046f 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -980,7 +980,6 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 
 	ret = gpiod_line_get_value(line);
 	g_assert_cmpint(ret, ==, 1);
-	g_assert_cmpint(errno, ==, 0);
 
 	gpiod_line_release(line);
 
@@ -1001,7 +1000,6 @@ GPIOD_TEST_CASE(misc_flags_work_together, 0, { 8 })
 
 	ret = gpiod_line_get_value(line);
 	g_assert_cmpint(ret, ==, 0);
-	g_assert_cmpint(errno, ==, 0);
 
 	gpiod_line_release(line);
 }
-- 
2.26.2

