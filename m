Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D16584A7E9F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349287AbiBCEXF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:23:04 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B8DC061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:23:04 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id z14-20020a17090ab10e00b001b6175d4040so8900778pjq.0
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EbHkElAxdxg7UeMWDYrSHAO+RpshB1hCDYOyLTuzLF8=;
        b=ji2Crxf29WymASA7SKUltPrwgBoYTSuYTAADN3qxQn8ZN6ViOuU7W2bz9XZsK3sbPw
         r4xd1UQ/LeW5qYjA/x1jjRyuOvSnvH++Zl2Y9aSySWLunUYvR2qqMuBkgg8B1l6gBLLI
         dpvjGeY7QffRc1aEqW81pH15562o5MxrQ1TCCjFbJG08kpvpc1aafjS53xir4En+zy+t
         vCXQoRxQeBkgQ7M2h75qYxNRMTymJigHLBr+8sr5F8vnQi7qMQnzBSuRf1JNDH/3bKW+
         pNi7XdUQB6ayo72gxw+NLMKP4Ei3cCUT9JXBP/Dt1hWpFM63W6O+YekDe+nCJPRVio0S
         +MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=EbHkElAxdxg7UeMWDYrSHAO+RpshB1hCDYOyLTuzLF8=;
        b=rd/7csPzrfKgbxAo45RGGiMb2bqbt1cZwL3xSXGwcGNdsuf0HD+wQXsh4Gj9/4Xw0y
         zgCxn2yeztt0g5AUWkpSspMN20tOTD00pC8q/d1qdvsGGQxO2NFuM0lojD53DmGlbT5Z
         QEmNNnoQMIJgOr0Ns2dkkZHzKQ/mHed9hbpqIwB/aNLg5CxHT1Zh8vQmii+psC9ezXOL
         OEa1UbCxteDe+MANrciCwTrr/cJntmUUG9ob1oXQEgy2Gt+4KQjTAubfNX2P21bceKM8
         qpvBUijWoX6/MrUi+rxybiX1Ve/vo4DvLCPtxi3Pm3mLG0+uHvzaTDcSiuNPOhU3+vl0
         yM0g==
X-Gm-Message-State: AOAM530zYjT6xA4MgUUlIPYaNSOs2GQcjV6RiEwDB1z+2HXWvEb11gb5
        d7eaWYWQO6HXRJwJTIOR8cE=
X-Google-Smtp-Source: ABdhPJzOoDrfzluWROAW59ZI8pGI551htVXlaz9j3xa9P2KCEJiIh5pFGwtavtaFXrECAUfozSkuoA==
X-Received: by 2002:a17:903:18d:: with SMTP id z13mr33767848plg.113.1643862183946;
        Wed, 02 Feb 2022 20:23:03 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:23:03 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 6/7] gpio-tools-test: Add gpioset --by-name tests
Date:   Thu,  3 Feb 2022 14:51:33 +1030
Message-Id: <20220203042134.68425-7-joel@jms.id.au>
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
 tools/gpio-tools-test.bats | 111 +++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a5b97e1f98ee..a90c695fbc0f 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -670,6 +670,117 @@ teardown() {
 	output_regex_match ".*unable to request lines.*"
 }
 
+@test "gpioset: invalid value (by name)" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name gpio-mockup-A-0=foobar
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid offset<->value mapping: gpio-mockup-A-0=foobar.*"
+}
+
+@test "gpioset: invalid line syntax by name, missing =" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name gpio-mockup-A-0foobar
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid name/value 'gpio-mockup-A-0foobar'*"
+}
+
+@test "gpioset: invalid line syntax by name, leading =" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name =gpio-mockup-A-0foobar
+
+	test "$status" -eq "1"
+	output_regex_match ".*unable to find '' on a gpiochip*"
+}
+
+@test "gpioset: missing value (by name)" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name gpio-mockup-A-0=
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid offset<->value mapping: gpio-mockup-A-0=*"
+}
+
+@test "gpioset: invalid line name (from different gpiochip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name \
+				gpio-mockup-A-0=1 \
+				gpio-mockup-A-2=0 \
+				gpio-mockup-B-3=1
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'gpio-mockup-B-3'.*"
+}
+
+@test "gpiogst: invalid line name (non existant line on a chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name \
+				gpio-mockup-A-0=1 \
+				missing=0
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'missing'.*"
+}
+
+@test "gpioset: invalid line name (non existant line, no chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name missing=1
+
+	test "$status" -eq "1"
+	output_regex_match ".*unable to find 'missing' on a gpiochip*"
+}
+
+@test "gpioset: set lines by name and wait for SIGTERM" {
+	gpio_mockup_probe named-lines 2 2 8
+
+	coproc_run_tool gpioset --mode=signal --by-name \
+						gpio-mockup-C-3=1 \
+						gpio-mockup-C-6=1 \
+						gpio-mockup-C-7=0
+
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 6 1
+	gpio_mockup_check_value 2 7 0
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
+@test "gpioset: set lines by name using short option and wait for SIGTERM" {
+	gpio_mockup_probe named-lines 2 2 8
+
+	coproc_run_tool gpioset --mode=signal -N \
+						gpio-mockup-C-3=1 \
+						gpio-mockup-C-6=1 \
+						gpio-mockup-C-7=0
+
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 6 1
+	gpio_mockup_check_value 2 7 0
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
+@test "gpioset: no arguments (by name)" {
+	run_tool gpioset --by-name
+
+	test "$status" -eq "1"
+	output_regex_match ".*at least one line name must be specified"
+}
+
 #
 # gpiomon test cases
 #
-- 
2.34.1

