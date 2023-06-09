Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78660729EAA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 17:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239790AbjFIPgh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 11:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjFIPgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 11:36:36 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260C926B3
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 08:36:36 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-655d1fc8ad8so1639910b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2023 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686324995; x=1688916995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4JwoUjoW61n1BPtqK+L/Xjku5hTO/xlFDRUU5TsXOI=;
        b=STu0+4dSpLe9Y9L6AxyDXFweOn5LyN4f8WpqM49WYzDjowHn91UH0pG8+F8h+EG26q
         SVie/4hDQ0YXDBWSOEflDlL2+RCtXBQk827vCizhLme53agwLFsH0ALj8xN5L/WGQ7wk
         Ti4trWc5l45nLfWHzgjw+cNtqH9P3QrbGMw/cfXx0iT+ZIP6Wt1O6YHbueB2XeYA5TjS
         4QfW45Vu8Fjakuw4tspNrsIO/t9XpiiT9f47o7BN+QdhOJ6E7Xg0PidUj6rot8ZNM1Rp
         +HgGkg2ZIzYg0/bEt/wDGrdv+eVBVvlTE8Wx7vxcCVoy2ANcOeRYDDzsSrwYNTo+YYxN
         f9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324995; x=1688916995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4JwoUjoW61n1BPtqK+L/Xjku5hTO/xlFDRUU5TsXOI=;
        b=Pr/w7gESd/ZNzkpPLPF9mA4KW/Sdiz08Uq5Yur1OFZ8tzoen7zu8zet2E7MS94cZqc
         3ULNNpjDwS/xU8erG+yLkjEnX745NBiSWYXvXLx74Gn3m00DuoK22eTun0w6YMMphe0U
         JNoKHBnnCEp8wW9oHUWp3yaojt0gu4lbNT/iAsIK3+Hs2vgE5OQFJh/WQ1/Kxpeeg0dj
         8/zfgkbK2SsDK4h6rPAmxX1eH+lCrUefFuLfLCI00cYpMKvuxF+1sFog5zhRFRd1dkwP
         ubSQAtKULDQUoF0do7eWz0XIrK8IOGkimJ6i8PYVBo3ovW1oGH4OZJXGW58iy9CKqF/Z
         fLog==
X-Gm-Message-State: AC+VfDzNSqlHahFzI9cpj4GWzkzmbs/EUrMRtnoQ7ZYvqL/Q9Pw1WUPT
        o2McSNzpLYtTineTIp6xSo4DD+E34xM=
X-Google-Smtp-Source: ACHHUZ5zo7l2bTpWRHulfjYTcP3r03OGwRm7RN6REcxNiJi/iK6jvnhNcMcsYztpxQCZgM06ohYrMA==
X-Received: by 2002:a05:6a20:9191:b0:111:1bd6:270b with SMTP id v17-20020a056a20919100b001111bd6270bmr1452197pzd.7.1686324995223;
        Fri, 09 Jun 2023 08:36:35 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b0053051d50a48sm2850288pgp.79.2023.06.09.08.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:36:34 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential glitch in gpioset.py
Date:   Fri,  9 Jun 2023 23:36:06 +0800
Message-Id: <20230609153607.133379-2-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609153607.133379-1-warthog618@gmail.com>
References: <20230609153607.133379-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpioset.py requests lines without setting their output value, and so
sets them all inactive, and subsequently sets them to their requested
value.  This can result in glitches on lines which were active and
are set active.

As this is example code, it is also important to demonstrate that the
output value can be set by the request itself.

Request the lines with the correct output values set in the request
itself.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/examples/gpioset.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
index 372a9a8..b36b376 100755
--- a/bindings/python/examples/gpioset.py
+++ b/bindings/python/examples/gpioset.py
@@ -21,16 +21,16 @@ if __name__ == "__main__":
         x, y = arg.split("=")
         return (x, Value(int(y)))
 
+    def settings(v):
+        return gpiod.LineSettings(direction=Direction.OUTPUT, output_value=v)
+
     lvs = [parse_value(arg) for arg in sys.argv[2:]]
-    lines = [x[0] for x in lvs]
-    values = dict(lvs)
+    config = dict([(l, settings(v)) for (l, v) in lvs])
 
     request = gpiod.request_lines(
         path,
         consumer="gpioset.py",
-        config={tuple(lines): gpiod.LineSettings(direction=Direction.OUTPUT)},
+        config=config,
     )
 
-    vals = request.set_values(values)
-
     input()
-- 
2.40.1

