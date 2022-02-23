Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85FAB4C143A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 14:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbiBWNcm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 08:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239491AbiBWNck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 08:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E296AB460
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645623132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yRCbM22renqYP7o3spvVr/K44KCHTnSuAYlIHartXBE=;
        b=MmPBzUr3anUJV2/qpGG+NClhKNT/gLmmFvkck7JM8yzCqaqq0fQvucovVGXwNjfq/mT/Ye
        FNncGZ4FzpJr4xl+6zV3clZzsD/2zVAQ1bphi4+q4v1UR17Jd72ptJ/sg7e5YOs4jU171L
        ENavEmAillGd67EpwDmvTBseptxE3X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-xqxHnUP5P-SAFrCnWR2TFA-1; Wed, 23 Feb 2022 08:32:09 -0500
X-MC-Unique: xqxHnUP5P-SAFrCnWR2TFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77832800422;
        Wed, 23 Feb 2022 13:32:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 028D2832AF;
        Wed, 23 Feb 2022 13:32:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/5] pinctrl: baytrail: Add pinconf group + function for the pmu_clk
Date:   Wed, 23 Feb 2022 14:31:49 +0100
Message-Id: <20220223133153.730337-2-hdegoede@redhat.com>
In-Reply-To: <20220223133153.730337-1-hdegoede@redhat.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On the Lenovo Yoga Tablet 2 830 / 1050 / 1051 models the 32KHz PMU clk,
which can be muxed externally to SUS pin 5 and/or 6 is used as a clock
for the audio codec.

On the 830 and 1050 models, with ship with Android as factory OS the
pin-muxing for this is not setup by the BIOS.

Add a pinconf group + function for the pmu_clk on SUS pin 5 and 6 to
allow setting the pinmux up from within the x86-android-tablets
platform code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 7ae71152b480..fec888c1cd05 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -444,6 +444,9 @@ static const unsigned int byt_sus_pcu_spi_pins[] = { 21 };
 static const unsigned int byt_sus_pcu_spi_mode_values[] = { 0 };
 static const unsigned int byt_sus_pcu_spi_gpio_mode_values[] = { 1 };
 
+static const unsigned int byt_sus_pmu_clk1_pins[] = { 5 };
+static const unsigned int byt_sus_pmu_clk2_pins[] = { 6 };
+
 static const struct intel_pingroup byt_sus_groups[] = {
 	PIN_GROUP("usb_oc_grp", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_mode_values),
 	PIN_GROUP("usb_ulpi_grp", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_mode_values),
@@ -451,20 +454,26 @@ static const struct intel_pingroup byt_sus_groups[] = {
 	PIN_GROUP("usb_oc_grp_gpio", byt_sus_usb_over_current_pins, byt_sus_usb_over_current_gpio_mode_values),
 	PIN_GROUP("usb_ulpi_grp_gpio", byt_sus_usb_ulpi_pins, byt_sus_usb_ulpi_gpio_mode_values),
 	PIN_GROUP("pcu_spi_grp_gpio", byt_sus_pcu_spi_pins, byt_sus_pcu_spi_gpio_mode_values),
+	PIN_GROUP("pmu_clk1_grp", byt_sus_pmu_clk1_pins, 1),
+	PIN_GROUP("pmu_clk2_grp", byt_sus_pmu_clk2_pins, 1),
 };
 
 static const char * const byt_sus_usb_groups[] = {
 	"usb_oc_grp", "usb_ulpi_grp",
 };
 static const char * const byt_sus_spi_groups[] = { "pcu_spi_grp" };
+static const char * const byt_sus_pmu_clk_groups[] = {
+	"pmu_clk1_grp", "pmu_clk2_grp" };
 static const char * const byt_sus_gpio_groups[] = {
 	"usb_oc_grp_gpio", "usb_ulpi_grp_gpio", "pcu_spi_grp_gpio",
+	"pmu_clk1_grp", "pmu_clk2_grp",
 };
 
 static const struct intel_function byt_sus_functions[] = {
 	FUNCTION("usb", byt_sus_usb_groups),
 	FUNCTION("spi", byt_sus_spi_groups),
 	FUNCTION("gpio", byt_sus_gpio_groups),
+	FUNCTION("pmu_clk", byt_sus_pmu_clk_groups),
 };
 
 static const struct intel_community byt_sus_communities[] = {
-- 
2.35.1

