Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986834F6EA2
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 01:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237852AbiDFXjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 19:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237885AbiDFXjK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:39:10 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CE81FD2FB
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 16:37:06 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b13so3955780pfv.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QK8+4fUiKFidFtwDTnzjiT6o2I/M1O28JcVYOpK+fEI=;
        b=yNDw2XDQkg9R8u4+kmc5T2VvUaV+duY5HRN5myxhw0zKpy6MtPhspE1WQr1d8QahFs
         Q7sJGQXnlee6BS84nwIbw1gDVj3fWnja6v7EiC4LlLcfSn/FsF479Ce01jHdnO3YuWbu
         GQ1By+IzCavFFk/c5FKPHY09esq854gQPWQb/HBPkOdro9k28aa+dID/jPvA93rL63KC
         3Jt5+dYwFJcPJ/L9MsU46Uljoi2bAyLEr0wT7Ac9cWx4F3qz7eS1GXr7vCovmDqa8KKw
         OXjbZAmA2V2h9HlwqtOQtwdT5vgwJxdJOqPdB9ll1gIhUU7VT+ymg+ez4NCRiqM92vSr
         d1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QK8+4fUiKFidFtwDTnzjiT6o2I/M1O28JcVYOpK+fEI=;
        b=R1iwW1RzGCvtzdimm0SdKlrj8XMedyom4EOuwepvtJPMDkSjxgx51gZvv+FLwfkF9G
         ReG60aTZktDjCGsjtme7Re05ksNwwggvcvznTRne7NPWG21h9UFvcyCO+Re/wHSQav0n
         JkwQyCTDlE3+kIOme8tNZI/zl+U5hZCXiC1YlGDzzq7O0rTrv7zGnSzYIwAm7pucrCpN
         9+r1soH7R8NTJiYbVHlKSjw4MAS8gbSBo9BMe65/tXhoRGv/PvB53CXyjiFE9dyVjxw3
         b3+UkJ8RqBKJKq7btH0V231recVKhgm9vwuNMfLRNI39I66tYlNzbXI5DFkt5jsK+iWq
         7anw==
X-Gm-Message-State: AOAM530HsZ/YcgQdn2DcXm9UKXWQXaCdiHREJjaskP8F+xfKKZM6O3+8
        pkt0XbG2bRYYwFFfRv72QBQlrA==
X-Google-Smtp-Source: ABdhPJzaezBCtvwGYSV1mX/+b9wnRQsY8UmbEyVes0OC4123FLUN6x1hyG91/ObI3Za45Bldidy0eA==
X-Received: by 2002:a05:6a00:1988:b0:4fa:c15d:190d with SMTP id d8-20020a056a00198800b004fac15d190dmr11020521pfl.44.1649288226244;
        Wed, 06 Apr 2022 16:37:06 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090a7f9500b001c97c6bcaf4sm6903667pjl.39.2022.04.06.16.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 16:37:05 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, dac2@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: Add vendor prefix for Pensando Systems
Date:   Wed,  6 Apr 2022 16:36:39 -0700
Message-Id: <20220406233648.21644-3-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220406233648.21644-1-brad@pensando.io>
References: <20220406233648.21644-1-brad@pensando.io>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add vendor prefix for Pensando Systems: https://pensando.io

Signed-off-by: Brad Larson <brad@pensando.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..0ce8f94eab08 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -936,6 +936,8 @@ patternProperties:
     description: Parade Technologies Inc.
   "^parallax,.*":
     description: Parallax Inc.
+  "^pensando,.*":
+    description: Pensando Systems Inc.
   "^pda,.*":
     description: Precision Design Associates, Inc.
   "^pericom,.*":
-- 
2.17.1

