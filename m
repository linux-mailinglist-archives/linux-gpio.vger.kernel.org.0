Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291F663B458
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Nov 2022 22:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbiK1VpQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 16:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbiK1VpN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 16:45:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A682A1DDF4
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669671857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jjeIa9pagPqNk41fRJdTkVrz+H7PIkcsjSzIe9Ct0qI=;
        b=Mo8cL5hKaFX+pWiy6wtsMeNJA4sdFictngyhoDdjvBnHQFHYkT4D6/aBe0KoeD/eTKk1XR
        5XZo1TQvMp/9PeXLmnbT1T1DxJ2t3T14eIlX0DEz+y8pM8aFYr9/pGqwq4a5wpVqVwmyK4
        2SiU50xi/ApKYcxPnqbwFlWNKs8h3Ks=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-WGq9Iw5XNrS9CZv8JPvVEg-1; Mon, 28 Nov 2022 16:44:13 -0500
X-MC-Unique: WGq9Iw5XNrS9CZv8JPvVEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3702811E7A;
        Mon, 28 Nov 2022 21:44:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2291940C6EC2;
        Mon, 28 Nov 2022 21:44:11 +0000 (UTC)
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
Subject: [PATCH 0/5] gpio/media/int3472: Add support for tps68470 privacy-LED output
Date:   Mon, 28 Nov 2022 22:44:03 +0100
Message-Id: <20221128214408.165726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

While working on the earlier discussed changes for dealing with
the privacy LED for "discrete" INT3472 ACPI devices I was wondering
"how are we dealing with the privacy LED when the INT3472 ACPI device
is a tps68470?".

Well it turns out we were not dealing with this at all, leading to
the privacy LED on the back of the Surface Go series not lighting up
when the back camera is on.

This series fixes this, it consists of:

Patches 1-2: 2 small bugfixes to the gpio-tps68470 code
Patch3:      Add support for the indicator LED outputs on the tps68470 as GPIOs
Patch4:      Add support for a privacy LED to the ov8865 sensor driver
Patch5:      Add gpio-lookup table entry for the privacy LED.

There is one small issue here, I believe that patches 1-3 need to land before
4 + 5 do. Once 4 + 5 have landed the ov8865 driver will try to get a
GPIO with pin number 10 from the gpio-tps68470 provider and without patch 3,
that will fail because only pins 0-9 exist until patch 3 lands.

The easiest way to avoid this issue would be for me to merge patches 1-3 +
5 through the pdx86 tree. GPIO subsystem maintainers, may I have your ack
for this ?

Note patch 4 is not a problem without patch 5, it uses gpiod_get_optional,
so as long as there is no lookup entry for a "privacy-led" GPIO it is
a no-op.

Regards,

Hans



Hans de Goede (5):
  gpio: tps68470: Fix tps68470_gpio_get() reading from the wrong
    register
  gpio: tps68470: Make tps68470_gpio_output() always set the initial
    value
  gpio: tps68470: Add support for the indicator LED outputs
  media: ov8865: Add support for a privacy-led GPIO
  platform/x86: int3472: Add support for the back privacy LED on Surface
    Go models

 drivers/gpio/gpio-tps68470.c                  | 52 +++++++++++++------
 drivers/media/i2c/ov8865.c                    |  9 ++++
 .../x86/intel/int3472/tps68470_board_data.c   |  1 +
 include/linux/mfd/tps68470.h                  |  4 ++
 4 files changed, 49 insertions(+), 17 deletions(-)

-- 
2.38.1

