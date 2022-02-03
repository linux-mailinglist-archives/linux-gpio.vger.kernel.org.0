Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C614A4A7EA0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbiBCEXI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbiBCEXH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:23:07 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBF6C06173B
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:23:07 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id cq9-20020a17090af98900b001b8262fe2d5so3235349pjb.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0qE6gevIlt5TZkcv2OZGPBrY66lgxFvcf9i3jBRUkY=;
        b=aN0raUAZo+oeseYZz27rcN64NYcG+L6yp0uoPK4vMhQN+eJ355BogSpIO1mzEF4Ni6
         rDoY9TzMDTHLS73j3m+crNB9tMQVopJnFSEDmsBL4JJ+aZyu+cwxRYu01HEulZlu4PDz
         ICk96aSGhfNCtpw1BMMRoyoarHASsrtoU3bk0CM04rGFtd8EA5IN2T94NE7EI2eII9OT
         Ka0WiF4LEzJqYEnkbdKDwHSGbKFxNCUNUC9vgui3D3LlxJLHAo8/Hsu2m6XU3GIFnPcY
         O6YsKntlgniJmMyy/Rzk/FyzOs51nRdrBOR8UmMuQtlQUrfuVCGcPq/34vPPLzKRuG2w
         +M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=N0qE6gevIlt5TZkcv2OZGPBrY66lgxFvcf9i3jBRUkY=;
        b=Wswm5SvHKFAArr7gG1rsp2d8d6rX57+eYjNOW8AZS14Y4CP2fQVGsSMta2XNaQIxZV
         zZsnS45CqskMa1PDnFNfTXSLHz2KsCzbDbarG4zXIt2zHxH0KPWzoE8o/b6QJm23gUca
         0lwsQybWZiPc6tMLgEdpFoTS+xZGcArDFTmnA6s68YavzfEQPva6YnSoZgp+xheHQn9g
         ThR2aItPJfXyhflkZtqaiMf4NNXYPikQDFQ4RqCinMDsIAl9u3Z+sYXBc2bnZNsPNdCZ
         it20GaQNBat00ekcHA6sLRe8MnxqxktXo4xSm4+Q8g/7k5rPOYk9OvHT2j96Rfyg+PSt
         oN7g==
X-Gm-Message-State: AOAM532kCkBmiblV0tJ4aaDBveXpeszAqO2Odskk4q7PuZlNO+GlhTLE
        SJDO5WsIl2Ll0u0JXMm/mto=
X-Google-Smtp-Source: ABdhPJz3EqLpyIF+ZZogMi9RyQMN7PEAmqnQjL4QV3g8bvqn3J7HCotzT0qVMpLUmhHcFI+qU/EVcA==
X-Received: by 2002:a17:903:124e:: with SMTP id u14mr34604544plh.57.1643862187258;
        Wed, 02 Feb 2022 20:23:07 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:23:06 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 7/7] gpio-tools-test: Add gpioget --by-name tests
Date:   Thu,  3 Feb 2022 14:51:34 +1030
Message-Id: <20220203042134.68425-8-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpio-tools-test.bats | 73 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a90c695fbc0f..068ade357a35 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -391,6 +391,79 @@ teardown() {
 	output_regex_match ".*invalid bias.*"
 }
 
+@test "gpioget: invalid line name (from different gpiochip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioget --by-name \
+				gpio-mockup-A-0 \
+				gpio-mockup-A-2 \
+				gpio-mockup-B-3
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'gpio-mockup-B-3'.*"
+}
+
+@test "gpioget: invalid line name (non existant line on a chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioget --by-name \
+				gpio-mockup-A-0 \
+				missing
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'missing'.*"
+}
+
+@test "gpioget: invalid line name (non existant line, no chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioget --by-name missing
+
+	test "$status" -eq "1"
+	output_regex_match ".*unable to find gpiochip.*"
+}
+
+@test "gpioget: read some lines by name" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	gpio_mockup_set_pull 1 1 1
+	gpio_mockup_set_pull 1 4 1
+	gpio_mockup_set_pull 1 6 1
+
+	run_tool gpioget --by-name \
+				gpio-mockup-B-0 \
+				gpio-mockup-B-1 \
+				gpio-mockup-B-4 \
+				gpio-mockup-B-6
+
+	test "$status" -eq "0"
+	test "$output" = "0 1 1 1"
+}
+
+@test "gpioget: no arguments (by name)" {
+	run_tool gpioget --by-name
+
+	test "$status" -eq "1"
+	output_regex_match ".*at least one line name must be specified"
+}
+
+@test "gpioget: read some lines by name using short option" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	gpio_mockup_set_pull 1 1 1
+	gpio_mockup_set_pull 1 4 1
+	gpio_mockup_set_pull 1 6 1
+
+	run_tool gpioget -N \
+				gpio-mockup-B-0 \
+				gpio-mockup-B-1 \
+				gpio-mockup-B-4 \
+				gpio-mockup-B-6
+
+	test "$status" -eq "0"
+	test "$output" = "0 1 1 1"
+}
+
 #
 # gpioset test cases
 #
-- 
2.34.1

