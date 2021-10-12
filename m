Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C48A42A5FE
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 15:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237043AbhJLNns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 09:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbhJLNnq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 09:43:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E4BC061753;
        Tue, 12 Oct 2021 06:41:44 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y15so87958275lfk.7;
        Tue, 12 Oct 2021 06:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DGGFcJwUluytadH8SL5R0mewhPlMj47K6tSGZLmd1as=;
        b=Q5kCK0dM7MzUIVG0cBAevxVJPYiYEAnI71yoYWbZFo8+BKIvv8xDZO7fBxoZuP20U9
         AjIgofOFufwMB4nb1JTDoboEzAMGdrAJiaPpa2iZD4CsDPmbYJm0hgEhJYCsuliooudu
         1FZ/f6/F8a5V3s1zZpk7dsgGbrp769AMUbWAY9+o3KE6Tv4dYzOLe4ETbRCXhK09Kuxs
         NVNwP0TcetF7/E8+KYXw9KBxT7RvHnmOBlBQXmoOlFQTp1xPHLWazCAmwGiTCgVkSsrn
         L+VelMvBtCMQDQmXO4WCf7pZSymi93egYm9BYB7j1rq0WrfZ+y02liLIJyoYfHKW0a3X
         jOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DGGFcJwUluytadH8SL5R0mewhPlMj47K6tSGZLmd1as=;
        b=a9fk12LZmGf0f+3fd8J3IIp0K842MCtTUhfbyCUFTwsVEzv8ZeetQo3VKHNuE2n7DX
         hgHsJKC3cW+y0zgY4SHoX0Q2Wf+gPlMjktoO8G8vmygGofTd0ifwLa6mcQdzhUpiq3i1
         bpvxMVpZluWV9r/yq7OkqT+9YVhc5qVBOBSOb8H4TZpuA/0rFSk9Rcm4cBopL6yVI4Q4
         V0TfgsOZIn8hISlXufHHyy+pRlrods0EAofGNU0jbCFQJIH5AMaSXxSXK8VCQMi0YBHz
         F5RRQdFW03JCf6Evbv18Ec3xAP34xpXlZQPh0eZhyzC94qK2OqvjKWrQwMQS3/GknH+Q
         ru1g==
X-Gm-Message-State: AOAM532xBsG1MdBrUuTVHXuaml/mpEzj81iChayWUDKN4pkbKISjxYNx
        0dPzBLH3ZvxrWOQ3pWs4AB0=
X-Google-Smtp-Source: ABdhPJwez4d+GKyXDGVd9Y+nTRN59R9RrisJjzFa5FgxOuhnTRN/34SvnIlTQWXm6+Cb+4talE4IMA==
X-Received: by 2002:a05:651c:a05:: with SMTP id k5mr8906846ljq.288.1634046103011;
        Tue, 12 Oct 2021 06:41:43 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 06:41:42 -0700 (PDT)
Sender: Emil Renner Berthing <emil.renner.berthing@gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
To:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date:   Tue, 12 Oct 2021 15:40:13 +0200
Message-Id: <20211012134027.684712-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for the StarFive JH7100 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..8d5f4687add9 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-clint
+          - starfive,jh7100-clint
           - canaan,k210-clint
       - const: sifive,clint0
 
-- 
2.33.0

