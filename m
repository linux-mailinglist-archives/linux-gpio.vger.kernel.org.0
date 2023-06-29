Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70BE57423CE
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 12:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbjF2KQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 06:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjF2KPY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 06:15:24 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EA23AB8
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 03:15:20 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b7f9d66812so4281775ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 03:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688033720; x=1690625720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DziYa7TlLyZNpQV8BzYS1AqDExwgva1rE2OK3DKjFs4=;
        b=G4r+XkYVhZShdi8+6qyxQu7QE48Ki2ffzYE99uSlC12p3Ps99lYUg4WXRbLqCDRtpV
         i/C1H4sNfl7s6glPDrdbxoQvnZjK4IjJEeBvji3U6fs2glMe4tzWwlqhBrztc3jDfQdT
         62oQJKypGjp4TjGHE3dTvgYt7i798/H42n/yJboSmY68YcjY67oOFJoeGqxtWxw5ire3
         X73H/kQ6zPOrO8HUtHysncQh5yWQqDhFL7rSwi+KS5GQ7lEImG3X34Cf+ctgL+SzfCCT
         aEQoRqy8cCAAxCsdQn7Ob/5mlBf8zaEiCyOsXnVI3/klacuyLAk7UsN90r89YZA4HJN4
         UQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688033720; x=1690625720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DziYa7TlLyZNpQV8BzYS1AqDExwgva1rE2OK3DKjFs4=;
        b=b9gL7lvBCKKntakeVlezLly/NkS7B9rw+nbeXvfFwkMQVL70mpJNt1prOjmmgYFn70
         9i9q8oX9H/p/16VgL5VnboOrGohj6zL+gx17HIupZ4yJ+nU9LT2w5D2BOUeXWLa/FqIL
         2HalqNx0kiFkOJECYB6l7AxYVzJgKR9kPA4KawsBjn1YDNVTvU74pW5kFChRiP7WDDdG
         T25N6puJzav1OK6jIePC70epsFEofBm9ulzk/bnEltcS6moSr6msAa8UJGfv1DJx8IOK
         v1DvravZASVJjvJSFzjIjY4Y1sKnR3/ilCrjO8I17pfCvk2B+Hrye/uYQO+Tx5jIJoBm
         lLCg==
X-Gm-Message-State: AC+VfDz+r+L8mWpGXVXCX0r+fRMZoRQHCDx+FvskmyFj/GglFZelS6PB
        yQuhno5KpbI6HEFRbJz4FoovDS6brSw=
X-Google-Smtp-Source: ACHHUZ5YBG2jae/JxlcexwQPjJgZYEUFG68lu0guMMfCcd3688pHVr/3ZpgYulmC8TvrvbOXc4W1mg==
X-Received: by 2002:a17:902:ea0d:b0:1b7:c666:dc5e with SMTP id s13-20020a170902ea0d00b001b7c666dc5emr20143811plg.8.1688033719917;
        Thu, 29 Jun 2023 03:15:19 -0700 (PDT)
Received: from sol.home.arpa (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902a60d00b001b7f71ec608sm7394249plq.155.2023.06.29.03.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 03:15:19 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/2] bindings: rust: fix unclear resolver warning
Date:   Thu, 29 Jun 2023 18:14:55 +0800
Message-ID: <20230629101455.127795-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629101455.127795-1-warthog618@gmail.com>
References: <20230629101455.127795-1-warthog618@gmail.com>
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

Fix the following warning:

"some crates are on edition 2021 which defaults to `resolver = "2"`,
 but virtual workspaces default to `resolver = "1"`"

Clarify the resolver selection as the 2021 edition by setting the
workspace.resolver to "2".

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/rust/Cargo.toml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
index 2e026b4..e385027 100644
--- a/bindings/rust/Cargo.toml
+++ b/bindings/rust/Cargo.toml
@@ -9,3 +9,5 @@ members = [
     "libgpiod",
     "libgpiod-sys"
 ]
+
+resolver = "2"
-- 
2.41.0

