Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E004433E9
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbhKBQwg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbhKBQv5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:51:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3F1C06120D;
        Tue,  2 Nov 2021 09:11:50 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 5so76678658edw.7;
        Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
        b=CMMVSV/17ZP/t0ZBRMEqWcOl9jcn9EdPRril8YLsjXXQ2q8NvoJjHJ57oTlhFh45V3
         +ZOLem70FEuu1QiZh/Z1w1z2E6gYgboUv6mQltr6qS6vJ++TyWSIHKL6/MfV5WL4U+Ds
         y/ANstadh3d4G8+mjG3SM/OaZJwZU26njMFC5d7xyCEJgGJvjmF+DQf+xjDYHQwLHwBc
         BMMdUPomJAblZRysCg+B4xOsLGYcpi56j0TOj4IRnzCn5zmC7CPGu9M2x81mN8aXjkd3
         9tNPV+vYKt2iRfzLaI78XilKWkYJJmvhRSlsHetuS1MAgy2XfVKpo2ID/KF80yZIMGVj
         /ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
        b=5WMbvdC4bHaBIoLoryLBI22lDePYo/hi6BD5nCZgPAcdktJxjEmvwo9EyPnK5MbfKD
         3i8UcGrWIbj9ZyZo/iDyMkF+ymiIIjnrTACwbyPNHmzw9tPBOQLEM4YU0q1hGBaSNExJ
         C1pLyAvMAYqp6eBeaj7UB1g4o38w/PBpySx2IbDUpLg9RVHwNugUGy/XOuOUSmRdNHTk
         TE4Jo4NTQdCHzZocBqj+cko2TN1vzrTRKnnEq/DFQIiAGSaK0Q1Am9+7yn1sqN2FuZwD
         GJD0ergsf92xsowo/6ta7vkkjiucd13jYxm8GauNMrUKj9SPu1OmzCbVgJBn0bJEEjJL
         OJ/Q==
X-Gm-Message-State: AOAM533R9qQ4pDSXRDMvDBW9EkCjDGSSyscq0BRd/QzCHawrmq1SllUK
        wgp3eAbaQdQN6wlRy+wSWOA=
X-Google-Smtp-Source: ABdhPJyoAG8vEmS8dlIAtihH24GOCuPEV/1mht6fav6+Hnp4TnUGEtAeeO/iUfhnB8QhPY8fzmFSsg==
X-Received: by 2002:a17:906:1683:: with SMTP id s3mr33340791ejd.331.1635869509118;
        Tue, 02 Nov 2021 09:11:49 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:11:48 -0700 (PDT)
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date:   Tue,  2 Nov 2021 17:11:11 +0100
Message-Id: <20211102161125.1144023-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for the StarFive JH7100 clint.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
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
2.33.1

