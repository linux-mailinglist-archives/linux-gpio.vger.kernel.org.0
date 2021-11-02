Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DFC4433D8
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 17:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbhKBQwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 12:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235028AbhKBQv4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 12:51:56 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35899C061234;
        Tue,  2 Nov 2021 09:12:06 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id o8so5957038edc.3;
        Tue, 02 Nov 2021 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
        b=IlWT9DwelKyx/I3jSjePAMMT+3JB2GrVrwnIAGdOk9hrBzHtziodtGkrUDM/u1/ID9
         tprCOK6dDYnlSuKUXV0iMcgkkU4pQdVaTylJCkRs8H0ZsjkdYP1XxL1RGpmxcqATcXb2
         8ozAZWW2Y0iebPUGc6k42EyJr4l7qW2UqMw7BswX2PmiWHECp4ABGnCv1z3K37u1mwoZ
         3FU2yq7EIgbEFbFhtAcU6cPT2eZeLOJj5RA36psBuuXHduiHnswW1bM7FMDU1Z6DDNue
         qst6+MxLFJWX3Pgsn+pOtWhx1WyLU+1rRIMIRl7GtkBKdtqsBwe5Emd3meHWZ7M3rnFD
         kRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=eESfjL+iaVjt21sHtGEVPwxEB8OqLbpv+keCGxcdIyU=;
        b=dBzHV/KAOqLmzkpkru5fS6X/RUcdPz2nkLA9xjFYJtEeSEMpIk9v2vUurgwsc7aBAp
         Okrb+2Znm5Fl6UUTqXG4qiWHZpKtNjmZ4Umq8VT92rYwsp/DcyAIhZgb/as7IpiHszQt
         dNojq3WnSvYYCyuen9GBv9gbU4KTnLlYzdWO6OMkQ16Aq11Fbyx/3OdJcd24OQcqprNK
         dri782KemjvPZZgnmJgxJVzKQyyWqH2VTeLUgE2fzm6xGs6zig4cjTXj3B9252yRfRPs
         /WveLSG9ODW5kOVTqp9vKpb2q5HO0linudfrHESIm0JpI2z9YxKLiXmykcJ9mf5GEFou
         CJLQ==
X-Gm-Message-State: AOAM533q3L4KnQClenuhSmI79qIa3q5nFuPMB9+jvX83y/v98u+oee6x
        JFtHIpxIaSKEX8ICwhfIn9E=
X-Google-Smtp-Source: ABdhPJzkbLNnfJXKIBGWGnhTUO/fKndK15BD8iMjIXWBbf/l6lYub1R9A4iNr7JgK9QCzISZhmDG5g==
X-Received: by 2002:a17:906:1450:: with SMTP id q16mr48526979ejc.213.1635869524760;
        Tue, 02 Nov 2021 09:12:04 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 09:12:04 -0700 (PDT)
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
Subject: [PATCH v3 13/16] dt-bindings: serial: snps-dw-apb-uart: Add JH7100 uarts
Date:   Tue,  2 Nov 2021 17:11:22 +0100
Message-Id: <20211102161125.1144023-14-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatibles for the StarFive JH7100 uarts.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index b49fda5e608f..12137fe80acf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -40,6 +40,11 @@ properties:
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
           - const: snps,dw-apb-uart
+      - items:
+          - enum:
+              - starfive,jh7100-hsuart
+              - starfive,jh7100-uart
+          - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 
   reg:
-- 
2.33.1

