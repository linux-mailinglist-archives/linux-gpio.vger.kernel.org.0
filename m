Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83638438D26
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 03:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbhJYByh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 21:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbhJYByf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 21:54:35 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7096BC061243
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:14 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id s24so2838560plp.0
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yaB5sMWDeRg8Wvtv8HtqDzaWjvoJExyww+FfG/ZDrT4=;
        b=uflj1WC38Cux4fFGllmthvD+J8givJ+1nYWnprlocYYSxdRRsS0oASqYz00AczK2dy
         YDgKI8F9Umb4dqo4HcBrX5zWM1K7KXw50iu4aRP2U86fC3fdil1v3nV9KfEseAuuoRt5
         b/dNHCYMch/lHaBrysTccht0yTqMg5fbgAwPof+/fbfjZBB7EM6uS7Wp+/ESWkIyjMSg
         T5UHGsJpsht3pz0iwH96EdvJrqCGc8NzcETUz6zldqQbQA9BM9Priibxiszp8P/yUyUp
         4M2yewAfAJo4j2uyLLEOtE/WR3Y6KYstN+t/VjUUnvNq0EvjCTmOQLaz0UC8WbL7m34M
         MdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yaB5sMWDeRg8Wvtv8HtqDzaWjvoJExyww+FfG/ZDrT4=;
        b=T4lkN4TMIXK3PpWY8X+n8DQDuj4B/uq4iEaXk8bRX2CCFhSeguLDKwedmiinTT9DnN
         S4lNqfAZRyKpeG9yPDjeaXmUMNB2AgAtHilraebqmgDdeKZXQWv0+iI8nUPfl0MTDHzG
         RT+9UQuehxA1nQn2VHKP/89TfrSg9Wq7NUc/SI6DcuEjWU3WVz0OU9NHyu9/e/WwA9m/
         AGt8w1IMSMvO+QOOiakND6rHh0lWgq0iQdDwBIfKW/MgFUM5y90rO/8ngYEhpLK7rZFv
         F1gD3b0vc9JMWG8PVN6XqzSfciVkqdB3+6c6XJWh4HLSYIajE5B920q5Evit8O7bQDvw
         PomA==
X-Gm-Message-State: AOAM531xVNlFmSux+8Xy4b3UrY9d4O8N1Inoa8hR0u+B5GZihRP9adnY
        fqZ9lq3lql59Sod2eXSFNlrXlg==
X-Google-Smtp-Source: ABdhPJx/BF3zt7qnTYuuniMwBlB4LeVyXKA5Wedd7pQuVPEuVE9XHOC9UGlOEtipxNLf61A5jbVuNw==
X-Received: by 2002:a17:90b:4a48:: with SMTP id lb8mr17619416pjb.236.1635126733999;
        Sun, 24 Oct 2021 18:52:13 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id q10sm14855225pgn.31.2021.10.24.18.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 18:52:13 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/11] dt-bindings: spi: Add compatible for Pensando Elba SoC
Date:   Sun, 24 Oct 2021 18:51:49 -0700
Message-Id: <20211025015156.33133-5-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025015156.33133-1-brad@pensando.io>
References: <20211025015156.33133-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the cadence qspi controller compatible for Pensando Elba SoC
boards.  The Elba qspi fifo size is 1024.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index 0e7087cc8bf9..d4413eced17a 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -20,6 +20,7 @@ properties:
               - ti,k2g-qspi
               - ti,am654-ospi
               - intel,lgm-qspi
+              - pensando,elba-qspi
           - const: cdns,qspi-nor
       - const: cdns,qspi-nor
 
@@ -38,7 +39,7 @@ properties:
     description:
       Size of the data FIFO in words.
     $ref: "/schemas/types.yaml#/definitions/uint32"
-    enum: [ 128, 256 ]
+    enum: [ 128, 256, 1024 ]
     default: 128
 
   cdns,fifo-width:
-- 
2.17.1

