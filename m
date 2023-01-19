Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301C767392E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 14:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjASNCk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 08:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjASNCN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 08:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5857A511
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2023 05:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674133270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=YS5Ir38Elhb6HV9SyUQSGtU4MyH6j2g+acIl2GVuLWI=;
        b=e28+7AoLZ2maxHjkAn9StQs4NL/VXOsgAJLV8n+RBNjgFiLFGenCyK+/4ro9OepGvUFfCF
        Ufe6uH6fA6dHJFnGBlsr2J2YdeRQq1r1k9RGCSBD1HM43NXzdwyyYa6+WMWapDg/B/C8ry
        vQRjVQ1+WJtx5dN8rVhGM2m38N5kvB8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-reto4L9cPiO4Yu3jlFyVfw-1; Thu, 19 Jan 2023 08:01:06 -0500
X-MC-Unique: reto4L9cPiO4Yu3jlFyVfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 579F88A0112;
        Thu, 19 Jan 2023 13:01:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E01C71415108;
        Thu, 19 Jan 2023 13:01:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v4 00/11] leds: lookup-table support + int3472/media privacy LED support
Date:   Thu, 19 Jan 2023 14:00:42 +0100
Message-Id: <20230119130053.111344-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Here is my version 4 of my series to adjust the INT3472 code's handling of
the privacy LED on x86 laptops with MIPI camera(s) so that it will also
work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
(so that we cannot just tie the LED state to the clk-enable state).

Changes in v4:
- Rename new __led_get() helper to led_module_get()
- Drop of/devicetree support from "led-class: Add generic [devm_]led_get()"
- Add RFC patch to re-add of/devicetree support to show that the new
  led_get() can easily be extended with dt support when the need for this
  arises (proof-of-concept dt code, not intended for merging)
- New patch to built async and fwnode code into videodev.ko,
  to avoid issues with some of the new LED code getting builtin vs
  other parts possibly being in a module
- Move the led_get() call to v4l2_async_register_subdev_sensor()
- Move the led_disable_sysfs() call to be done at led_get() time
- Address some other minor review comments

Changes in v3:
- Due to popular request by multiple people this new version now models
  the privacy LED as a LED class device. This requires being able to
  "tie" the LED class device to a specific camera sensor (some devices
  have multiple sensors + privacy-LEDs).

Patches 1-5 are LED subsystem patches for this. 1 is a bug fix, 2-4 add
the new [devm_]led_get() functions. Patch 5 is the RFC patch adding dt
support to led_get() and is not intended for merging.

Patch 6 + 7 add generic privacy-LED support to the v4l2-core/v4l2-subdev.c
code automatically enabling the privacy-LED when s_stream(subdev, 1)
is called. So that we don't need to add privacy-LED code to all the
camera sensor drivers separately (as requested by Sakari).

Patches 8-11 are patches to the platform specific INT3472 code to register
privacy-LED class devices + lookup table entries for privacy-LEDs described
in the special INT3472 ACPI nodes found on x86 devices with MIPI cameras.

Assuming at least the LED maintainers are happy with the approach suggested
here, the first step to merging this would be to merge patches 1-4 and then
provide an immutable branch with those to merge for the other subsystems
since the other changes depend on these.

If you are one of the folks who requested the new LED lookup table +
led_get() approach I would appreciate a Reviewed-by or Acked-by for
patches 1-4.

This series has been tested on:

- Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
- Dell Latitude 9420, IPU 6, front: ov01a1s with privacy LED
- Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED
                              back: ov8865 with privacy LED (pled not yet supported)

Regards,

Hans



Hans de Goede (11):
  leds: led-class: Add missing put_device() to led_put()
  leds: led-class: Add led_module_get() helper
  leds: led-class: Add __devm_led_get() helper
  leds: led-class: Add generic [devm_]led_get()
  [RFC] leds: led-class: Add devicetree support to led_get()
  media: v4l2-core: Built async and fwnode code into videodev.ko
  media: v4l2-core: Make the v4l2-core code enable/disable the privacy
    LED if present
  platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
  platform/x86: int3472/discrete: Create a LED class device for the
    privacy LED
  platform/x86: int3472/discrete: Move GPIO request to
    skl_int3472_register_clock()
  platform/x86: int3472/discrete: Get the polarity from the _DSM entry

 drivers/leds/led-class.c                      | 173 +++++++++++++++---
 drivers/media/v4l2-core/Kconfig               |   4 +-
 drivers/media/v4l2-core/Makefile              |   4 +-
 drivers/media/v4l2-core/v4l2-async.c          |  15 +-
 drivers/media/v4l2-core/v4l2-dev.c            |   7 +
 drivers/media/v4l2-core/v4l2-fwnode.c         |  21 ++-
 drivers/media/v4l2-core/v4l2-subdev.c         |  18 ++
 drivers/platform/x86/intel/int3472/Makefile   |   2 +-
 .../x86/intel/int3472/clk_and_regulator.c     |  35 +++-
 drivers/platform/x86/intel/int3472/common.h   |  18 +-
 drivers/platform/x86/intel/int3472/discrete.c | 100 +++++-----
 drivers/platform/x86/intel/int3472/led.c      |  75 ++++++++
 include/linux/leds.h                          |  18 ++
 include/media/v4l2-async.h                    |   4 +
 include/media/v4l2-subdev.h                   |   3 +
 15 files changed, 380 insertions(+), 117 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/led.c

-- 
2.39.0

