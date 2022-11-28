Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D346A63B463
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 22:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbiK1VqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 16:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbiK1VqQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 16:46:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B0D2FFE3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 13:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669671865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6RkPyT4Az4Oqk+MW9n0yAQ0aGyPFE38zf6k639wdOg=;
        b=IGdgvidQ2rP815DJ7pwmUFRrY4U+UbQDL+6SrjIa245/0W7eIiFmSTUjj42TzqHug1mY9n
        4bfAYL7mJ4vPp/+VV2H4S2ECv8Mq562BgAMMNYlUvAQN94hLCOwSwzaEzKc0C+AeiMvuC6
        QWihDcthKx95+5vuPyFX5XdxirewhAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-_v_EHgyHOMiDWvbifqOSjQ-1; Mon, 28 Nov 2022 16:44:22 -0500
X-MC-Unique: _v_EHgyHOMiDWvbifqOSjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4803101245C;
        Mon, 28 Nov 2022 21:44:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4865340C6EC2;
        Mon, 28 Nov 2022 21:44:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: int3472: Add support for the back privacy LED on Surface Go models
Date:   Mon, 28 Nov 2022 22:44:08 +0100
Message-Id: <20221128214408.165726-6-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-1-hdegoede@redhat.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The back camera on the Surface Go series has a privacy LED too,
this is connected to the indicator-LED-A output of the tps68470 PMIC.

Add a GPIO mapping for this. Together with the patches to add support
for the indicator-LED outputs to the gpio-tps68470 driver + the patch to
add privacy LED support to the ov8865 drivers this fixes the back privacy
LED on the Surface Go models not turning on when the back camera is
active.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 309eab9c0558..ac40fdc13876 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -134,6 +134,7 @@ static struct gpiod_lookup_table surface_go_int347a_gpios = {
 	.table = {
 		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 10, "privacy-led", GPIO_ACTIVE_HIGH),
 		{ }
 	}
 };
-- 
2.38.1

