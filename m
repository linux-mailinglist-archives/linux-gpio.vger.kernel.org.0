Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCA4436947
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Oct 2021 19:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhJURoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Oct 2021 13:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhJURow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Oct 2021 13:44:52 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E89C061764;
        Thu, 21 Oct 2021 10:42:36 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g8so3983078edb.12;
        Thu, 21 Oct 2021 10:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
        b=mWE89sHweGOY+j+hW1QqqLKuiSPz/xmgEmzzCdXW9hBTP8EQ64s0Ulzhnf+MkDLHjm
         KR8Yh/YYtyBFzl1p6vEe6mifgP6KedlBFOhfoaTRI47EoyWoNUWpEBd1AI1X94KTCd21
         AGzdVVtPBGE8kptSU9ylZLKF1zX9yJPDjfNC+6R+ne11dB7ce0EUVqx8OlXBXvmcBI/I
         jDkL7z2PeK+JJsPCCjyw/jqh3ZlcMSpLKuBVTBGLfiv7ansubYoSnYcKBF+tIwkdzjf/
         9lTzDQetVCj051Vgi1qEmdyveEkm7W6eBmQRVQRSkOrknLN6mANdY//cVx+6WOHK/REb
         NFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CMB5icMsNI9B+HlHvOZ/rsWpb2j9DPNZlwQY5zjCx08=;
        b=n1OU9UONIF6d46Fr9DVSp1od6UmKkagwQdEwJCrdYdEcwN076JYKvELu2LgiQ3dKji
         lAG/w8Bx00GstEoWx/U819F1Ns/8pbXmyRXshU9BtycXbipG/q9Zjmt95jEwpYSqvTRu
         fi+vbmNxlX509eX6CCEH4mCFQqKQ6kJiXbntD7oqSaPdRK/8HquNsbk9GwgP51TFECKB
         0FaU7T9A5ElqDL53A+IsPYdEtD4B8BbQFTlqf2V7j7ez6C4sORxkPVENQxH0DfNbT391
         avlG7sZceHMpPVg9UX8B0drW4MbN8DUaC6+Fs0A3oSVFYS45p6H9x97s4SPC+ZIDZt6s
         MyDA==
X-Gm-Message-State: AOAM531g8BrXWjR1Vy8b9eDwMXKio2pZTO4yDlAtySfmLgLtgOIdtubV
        +Yjq8N3jOTq3DX4JAHmeoaM=
X-Google-Smtp-Source: ABdhPJzWkkSvUs6yInTJJZYFPlu1bzWz0iSVhWp1tfIf6nvqfEmSq7afQ7b1RqTbUkWQth7PleQ67g==
X-Received: by 2002:a17:906:4793:: with SMTP id cw19mr8576035ejc.200.1634838154702;
        Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 10:42:34 -0700 (PDT)
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
Subject: [PATCH v2 02/16] dt-bindings: timer: Add StarFive JH7100 clint
Date:   Thu, 21 Oct 2021 19:42:09 +0200
Message-Id: <20211021174223.43310-3-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
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

