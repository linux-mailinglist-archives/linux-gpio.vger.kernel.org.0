Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F110728ECD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 06:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjFIEHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 00:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238298AbjFIEHt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 00:07:49 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABDA210D
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 21:07:48 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b034ca1195so3070325ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 21:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686283668; x=1688875668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CNcavYyXNZOCNAg4Bfgy+VRiGl+GN2H33ehnHzakcE=;
        b=DwrH7wCBnBjBsXwWSpVQWTk3shd/uFp8DMiedgUbakVhJrvRz5AU/VRVVgzChfBgl5
         FDsdtabHw2Z3oDeb0Zlk/RrALdDJ/95vrJkj5fcRxWDmF8yKKKeG/MOLY29cgDrpvSCr
         ffysjDq4zWhJqd4fTvsEw/ooUW+U1Oa5QUwgZOpeU+pHkU8OA/dhaiaHP8pNuglc0MfO
         vMBRYeNYw7sm6axIdJgBZ+/cUgFo6yJ+yX02tB2wQLjH1THxSrpmk05JWPnorhHTZ7M1
         3mLGct8R0yPDf5y2wW04kGkLwnOvgYTpf0eJw3G2ewAUUu/8eaQBG2qB89VoU+5P9GOc
         nttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686283668; x=1688875668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CNcavYyXNZOCNAg4Bfgy+VRiGl+GN2H33ehnHzakcE=;
        b=PFAsEJKijosssQzwBqWJGAXIoTNmXz7xaFZpv5pj8u3GOezDrWO8Q89ohlaJD7cb/9
         7c6FSWebRUewDbXLRRbOcdwYSwYbN4K4UOeGzUWTdPdmEBRE+bddkuiUD7HUImGaO85U
         63IV6Q2JPXDKEmiaBb65xXx6EsyWYRNU+zCm9tUtJg5mzuK9IHS2ro/n5Dk8SUGgb9Cm
         4R4Rh+poeRVr15ScN7wSCPQQia7hJVTgQ6DiGSROFp2VkuMgR80GL92i/LBKaWWJVq3f
         OxAWajKenSsLtSwcYj5KOsooOEqKdl3fx6Tg/9MXI0x9dlfJIOnV7pwViQKZADiv86Hb
         R7LA==
X-Gm-Message-State: AC+VfDwrjG6eKzSqVt+u177Ka1AA7unM7MFqFTvC1qC0PZQRWxfFeraB
        ck9o/aFZ+56cQqYrVbN4x4Eef1ofvfE=
X-Google-Smtp-Source: ACHHUZ5pvvfkXKQXG+6NVPtKgUe4IjkuEzeRqSPbTzhtOeIUSeHKPApJ3M+bE8n1EtgHl3buK78WIw==
X-Received: by 2002:a17:902:d4c7:b0:1ab:29bc:bd87 with SMTP id o7-20020a170902d4c700b001ab29bcbd87mr137455plg.35.1686283667739;
        Thu, 08 Jun 2023 21:07:47 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902bcc700b001b052483e9csm2143819pls.231.2023.06.08.21.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 21:07:47 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] core: doc: fix line_config documentation generation
Date:   Fri,  9 Jun 2023 12:07:37 +0800
Message-Id: <20230609040737.25666-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The line configuration is missing from the generated documentation as the
comment for the defgroup is a normal comment, not a doc comment.

Add the asterisk to make the section a doc comment.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

I took the liberty of patching and updating the rtd documentation, so it
is already fixed there.

It would be nice if the generated documentation would provide links from
the "struct gpiod_line_config" to the corresponding page.  But not sure
how to do that, or if it is even possible.

Cheers,
Kent.

 include/gpiod.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/gpiod.h b/include/gpiod.h
index d1833de..5d4b6af 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -715,7 +715,7 @@ int gpiod_line_settings_set_output_value(struct gpiod_line_settings *settings,
 enum gpiod_line_value
 gpiod_line_settings_get_output_value(struct gpiod_line_settings *settings);
 
-/*
+/**
  * @}
  *
  * @defgroup line_config Line configuration objects
-- 
2.40.1

