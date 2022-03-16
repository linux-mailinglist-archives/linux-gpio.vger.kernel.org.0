Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2774DBA1D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 22:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345612AbiCPVcV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 17:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355101AbiCPVcT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 17:32:19 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471302612E
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 14:31:04 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id g2-20020a5b0242000000b0062892750241so2920218ybp.23
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=j/W+I4hHsgH0XmEC7Q4gF3YIvEIHceq4+Sd40Z0ZTqU=;
        b=fAPqoEotR6HXIWawKwJLbFLhD0A7kMknqpiO8DHzknb9BSEjSwwaaqwkfL1qrpTi8R
         k3g4JaAfa8Bz0S2VeIr6CON9g3BcIbSAHseYOY//qhUNsFXL+8A0I2+L7MxU265AXL+k
         pIRfpqeZlvbqQwKfGQeYd11YySR1zPqPWgd37R18PwMDphUyr00wLdQMwztwNQSxiVjR
         9kFIiZVpnXNNuOIGc6GANy940pe/XmIDdALFaHfPtnBBbQ288Y9EWfL1xAEN1zpHs8CM
         eiohhkWvfzaKDyZsJGF/55akhba5Za6lOwdQu5lNmeKGOcqg2grWp1PFGW+SlcSEajpf
         49gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=j/W+I4hHsgH0XmEC7Q4gF3YIvEIHceq4+Sd40Z0ZTqU=;
        b=reqi0ILJxap0YDaGQ+jN/kxNK7NIvFOtR7YOtz2yA/ALKBBt7EZ3rSD4/6ibDgSN13
         PUqTfc0HVuhXuCkqfyCFmLItrp95zznuJDaxo6+dDkAVSYzkAYYVZMRUhnCmTQwFjRvO
         TTzjFh+zshOo6dfAL1TihUSVrZbuAsDNxG/OzvGE/o+yWITk67DljF7AlwFcBvflTpmr
         UARjUgDyGyoZrRYkF989C6B0UuA/MSL+1RFhjQxplbiIVbXX3Kq42FrBpUYNO9Oq9S8w
         oI619oF2IzlT5scmjGbOrzCS9sUEELlRTWNFW4iZoTvIhmAuWuc1DZzDBC/Is7t06CX2
         49wg==
X-Gm-Message-State: AOAM531S3HpQjxWa0f5vtIFbwvLACDH+UuFY6zT6GSub1YHJDa0Q096g
        jq1Nr97jS+sGSZtUMMrEVGf+ugjb
X-Google-Smtp-Source: ABdhPJwpDfWf//RRMeE/B+yywXGJvdHVgFFevRfNLr3P2AD8ceUgdkB6afRES9swV7fkNGQt0BKcrzWL6w==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:7dae:6503:2272:5cd1])
 (user=morbo job=sendgmr) by 2002:a81:5dd7:0:b0:2e5:8fc3:6d85 with SMTP id
 r206-20020a815dd7000000b002e58fc36d85mr2327247ywb.393.1647466263509; Wed, 16
 Mar 2022 14:31:03 -0700 (PDT)
Date:   Wed, 16 Mar 2022 14:30:55 -0700
Message-Id: <20220316213055.2351342-1-morbo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
Subject: [PATCH] gpiolib: acpi: use correct format characters
From:   Bill Wendling <morbo@google.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc:     Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When compiling with -Wformat, clang emits the following warning:

drivers/gpio/gpiolib-acpi.c:393:4: warning: format specifies type
'unsigned char' but the argument has type 'int' [-Wformat]
                        pin);
                        ^~~

The types of these arguments are unconditionally defined, so this patch
updates the format character to the correct ones for ints and unsigned
ints.

Link: ClangBuiltLinux/linux#378
Signed-off-by: Bill Wendling <morbo@google.com>
---
 drivers/gpio/gpiolib-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index a5495ad31c9c..be6fb2ad2c4a 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -388,7 +388,7 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
 
 	if (pin <= 255) {
 		char ev_name[5];
-		sprintf(ev_name, "_%c%02hhX",
+		sprintf(ev_name, "_%c%02X",
 			agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
 			pin);
 		if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))
-- 
2.35.1.723.g4982287a31-goog

