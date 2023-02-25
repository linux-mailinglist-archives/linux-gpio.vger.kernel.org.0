Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6892C6A26E2
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 04:08:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjBYDIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Feb 2023 22:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBYDIo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Feb 2023 22:08:44 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F243FE397
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:43 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id l2so917137ilg.7
        for <linux-gpio@vger.kernel.org>; Fri, 24 Feb 2023 19:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x1v92lSXKqFNMSFYAAQc2LehKw8iRSB93ZZoT5jMbM=;
        b=Z0GEeqXS51w5AFWfETIZKT4o6nbHivX6bBUaNBVGGoe8o7frikENKE7mpG3Q7WJKFn
         aGBX2CGsEH/1I0sBXwFlBYwN2r3WItb+7AdQRjUWOc34xP3A4q4TZqAsJRegiqpso4nn
         6FUZslKdgdDytb3oynd1ENXm9ZjA70FcNCQ1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4x1v92lSXKqFNMSFYAAQc2LehKw8iRSB93ZZoT5jMbM=;
        b=RvjgOT69UtevcCj+oAYL3sc/NyFmBCUtyF/LFEnkR/cZnYCQf9mNMub95b1QMDk+Ek
         prd7nQ+9ocRR/Wgao9jxYVRFQRjveyN7lopqo5PXtjjsHaWhyxnv2Ds1qvIKGr/TcVAJ
         vwPC7IfXY+Qi148WF9AGATEUrJkRAtQrnhB/RjtOmjHiOc+L3fQfO3DoBjaSxyY/PBOJ
         EcpzEAQLXcvhnINPxU5AP+j/5Y1eqSCjueFX2AfxY7amnSn/2pcWEq1zE0hLTNQzo6ru
         Qj7wbaM1nG/ITzuwFL4M6cLlbUvge9PlXAEwUDZPXl8y1l+q7Idl0+GMxCt4fHIpqETk
         h1ZQ==
X-Gm-Message-State: AO0yUKVGCa2mNLo0eF2aFBOKIFujdrFj0EFV4vUVOmxbDa8aHEkC/4CA
        sWg5WTkLVrd6mg/SOVf7iAi3iRxRNkLdp/Nl
X-Google-Smtp-Source: AK7set9KkPV/JZdqk/gtlK2kQsML6CeXlba7V8n2JujI83ByCwLmCUtUsL+tWQi47Dz1RyTBfDklxQ==
X-Received: by 2002:a05:6e02:1d1a:b0:315:475c:5cfb with SMTP id i26-20020a056e021d1a00b00315475c5cfbmr17249460ila.2.1677294523079;
        Fri, 24 Feb 2023 19:08:43 -0800 (PST)
Received: from localhost (137-025-033-021.res.spectrum.com. [137.25.33.21])
        by smtp.gmail.com with ESMTPSA id g6-20020a02b706000000b003c4ec576030sm191902jam.4.2023.02.24.19.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 19:08:42 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     Benjamin Li <benl@squareup.com>
Subject: [libgpiod,v1.6.x,2/3] core: add missing #include for basename()
Date:   Fri, 24 Feb 2023 19:08:12 -0800
Message-Id: <20230225030813.3885661-3-benl@squareup.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225030813.3885661-1-benl@squareup.com>
References: <20230225030813.3885661-1-benl@squareup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a standard include, it looks like an error that it's missing.
Probably pulled in transitively by one of the other includes on some/
most other platforms.

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 lib/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/core.c b/lib/core.c
index 35dcd8e..cf1d677 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -10,6 +10,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <gpiod.h>
+#include <libgen.h>
 #include <limits.h>
 #include <linux/gpio.h>
 #include <poll.h>
-- 
2.25.1

