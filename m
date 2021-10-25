Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52EFB438D2E
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 03:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhJYByo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 21:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbhJYByi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 21:54:38 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6F3C061224
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:16 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id g184so9377061pgc.6
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=us+DEGe7Bde42JLzfPTqO7yYFZzU/2BEo0hOJNb73cY=;
        b=y1n6X1XiZppqnpsBaxJyiVYmkUiR5ywSR8syiTZ4riYtH8QKC8ydhgEvx+aXH81wBo
         zNamZAzGW3R+X3J7CVZWyBKVxD1vXlIMNa9oR6zjsvAPWOqxCA8QVduo77xsoakxanZR
         Cbap5uAEc1u784wK6x9R/n6kZr9gO5RnpxecGIqE92X3azeUSbV7e3A2cKno36i4Gtck
         BXuJgMtX5L/yHpu3FKCjPjD54V/20rOton88t8TmMgOzsPYsEgFTEZyJYciKkkEh/l31
         dd0X7zfFC+OmOfOuGNLlmtyF1zIihmOOdrq941A3QIK5Xqf0N2peFeSTXC7hPsdYyhOj
         b2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=us+DEGe7Bde42JLzfPTqO7yYFZzU/2BEo0hOJNb73cY=;
        b=3kHxYCgAIIGuszm/VMMncych/EOmfSFJjXjKMYDgObNXmLTaX9UxqNImOyVcaOrPI/
         +RgGOgTyCo/wcWDmwUpb245tOxEHdNanuNDRsAmCfGUNLrSr03Dw6f00JfPDIK1Xh28k
         coKTnt+yxR3VjTXb/Kn57UmgMr5zRKJ4UMO7xFfYO1E9n8NJdECkEIP6ZkngKJsU/3Y4
         ZlSM5uQR5u+oTqSOSF0UAv40jLUOGH+48MSfhgRWJ1+448rT2MeDH6f3CKH+3wozxZ9H
         10uHL85xh2JYaNzb5cSXZhyB/kgugHSnJRGAM1O3vqciZjB8qRHoOdpSR7RlUraeDHIA
         3zPg==
X-Gm-Message-State: AOAM533ZBS8WA+Rsh6VqHTb0oUiA6mcCK+u9QGKWo49Eg3QzYn9MvbQa
        y9v8LYcRvLuW+jJyISICDOg7Rw==
X-Google-Smtp-Source: ABdhPJxOXzYCjd9pS331GFVvas57pWqpw/9D74X/TzP/h8A1Ln+6RFJL6dFVgLoTysbyCBOR94+duQ==
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id i22-20020aa78b56000000b0044c010a4ee9mr15706789pfd.46.1635126736110;
        Sun, 24 Oct 2021 18:52:16 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id q10sm14855225pgn.31.2021.10.24.18.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 18:52:15 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/11] spi: dw: Add Pensando Elba SoC SPI Controller bindings
Date:   Sun, 24 Oct 2021 18:51:50 -0700
Message-Id: <20211025015156.33133-6-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025015156.33133-1-brad@pensando.io>
References: <20211025015156.33133-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Pensando Elba SoC has integrated the DW APB SPI Controller

Signed-off-by: Brad Larson <brad@pensando.io>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index d7e08b03e204..0b5ebb2ae6e7 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -73,6 +73,8 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
+      - description: Pensando Elba SoC SPI Controller
+        const: pensando,elba-spi
 
   reg:
     minItems: 1
-- 
2.17.1

