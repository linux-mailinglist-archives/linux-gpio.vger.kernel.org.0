Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A2528DC68
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 11:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgJNJJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 05:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbgJNJJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 05:09:37 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F1AC041E59
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:48:20 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f5so1142962pgb.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 20:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UiqZjFRSnrMFRi/m5ijtrvDGe3gJuzomeF0Arv3qS7Y=;
        b=vc2LXEBrc6fAPFsAEIlMopqd0S7MiuMN63xTH8/QI1lfCw3cIwFOTY/jLTzN05s2cz
         708TpoQCfQR7qjrKbhFoVrYujxknvDCyqWW8VR4W+PLE+i6beiU+UHlWNQ5geeYOQxMj
         RBAu9v7aA3PNQBWQE8Wa1rG+1wK4KDBRduZ63avabMnk1pGOYCwmW8Cywn6vHKyNIP0c
         FpQsxJN4z6jT02o76dhkc9kVW70ABdqJqmU+wb28KnyDxDCtO6eqYwasa2nPfLGKcmla
         svtCy0cN8oPa0CuSGdM/NmdTss33CWQIQRaPiYlBv3XoUNLJwwXm2lOhiBB5WJ+V9eGC
         BuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UiqZjFRSnrMFRi/m5ijtrvDGe3gJuzomeF0Arv3qS7Y=;
        b=b7zIkdrpkkugD7HFuxjBqf5gDiwbL5VpLq2RJ6WG7jXWyz8IZySbHDxZh9Uj3DkBmO
         nWOrOaEhkJvgVuFLcC6cR3v3PCxIjy0b8yTW1DX+J5TKoPB7zCNTimYhrDeHFZwKEEOX
         Mp1wnc/25kfLIgmDVcy6SqhHNMkXdq8EKnRred6FFydN0kBx7N2uZ7+2zaWkKMlhR71K
         4are2Est+ERd09Mx6zxBI+1faIK7p8YeNx06rL220i9Fx50QLwkjK/e+JmcJDUexIbOM
         PRkCkGNiYcxIm/xUVDvcN86L1aNop8vIDekKnbFgzxhbEvK/Lg4EIA3huftmNtFTDQt+
         z7ww==
X-Gm-Message-State: AOAM533WPw1UqaO/GNnjnAVgUWXXOfjiq3nFtx+bg/7U0HVE/qV+/MB0
        5syjObyI41r5ov/pujYNIa80+ptgf04uYQ==
X-Google-Smtp-Source: ABdhPJx+H59yuP4WJoQsJeUSnIDahcwfYOuhYdo8nIhZZ0PulNwTJLe+NLOGdiNr3vGP874Ue8dsaQ==
X-Received: by 2002:a62:8497:0:b029:155:9366:381b with SMTP id k145-20020a6284970000b02901559366381bmr2416223pfd.15.1602647299888;
        Tue, 13 Oct 2020 20:48:19 -0700 (PDT)
Received: from sol.lan (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id z73sm1362940pfc.75.2020.10.13.20.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 20:48:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/2] tests: create mismatch between chip and bulk offsets in wait_multiple
Date:   Wed, 14 Oct 2020 11:47:57 +0800
Message-Id: <20201014034758.19427-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014034758.19427-1-warthog618@gmail.com>
References: <20201014034758.19427-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Create a mismatch between the chip offsets and the bulk offsets to ensure
the implementation is not dependent on them matching.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tests/tests-event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tests-event.c b/tests/tests-event.c
index 6066e45..a43f865 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -546,7 +546,7 @@ GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 	gpiod_test_return_if_failed();
 
 	gpiod_line_bulk_init(&bulk);
-	for (i = 0; i < 8; i++) {
+	for (i = 1; i < 8; i++) {
 		line = gpiod_chip_get_line(chip, i);
 		g_assert_nonnull(line);
 		gpiod_test_return_if_failed();
-- 
2.28.0

