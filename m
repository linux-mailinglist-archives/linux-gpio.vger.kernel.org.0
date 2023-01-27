Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E84467EFA0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 21:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbjA0Ui0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 15:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbjA0UiZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 15:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909377B7A4
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 12:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674851861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4OcSJzUj2LKvO6CfVFSR0SD1r9tiU8Fuk05jF+6fhPg=;
        b=itEn+DoKL0eMxd/1iX0UIycVb7Woflx7Kb6Ldv93/le2aA5K+qY7vgZIRRHIcHxYBHGJxK
        cPnkuC31NluDuEeekuFMbFUL491Ct1vsCGiJtmqj8EeDvI4uxj1UuOx05G7CXJZ4h9NDUy
        6pTt8MylM1Ul5spg9+DmdZZHJiwjEzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-M5gWZ24GPhS_vxMdCjl3cQ-1; Fri, 27 Jan 2023 15:37:36 -0500
X-MC-Unique: M5gWZ24GPhS_vxMdCjl3cQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 803F8802C15;
        Fri, 27 Jan 2023 20:37:35 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.53])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B040E492C14;
        Fri, 27 Jan 2023 20:37:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v6 0/5] int3472/media privacy LED support
Date:   Fri, 27 Jan 2023 21:37:24 +0100
Message-Id: <20230127203729.10205-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

Here is version 6 of my series to adjust the INT3472 code's handling of
the privacy LED on x86 laptops with MIPI camera(s) so that it will also
work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
(so that we cannot just tie the LED state to the clk-enable state).

Changes in v6:
- The LED lookup series has been merged, immutable branch pull-req here:
  https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/
- Rework the media-core changes to correctly free the LED reference,
  this rework also allows dropping the patch to merge the async + fwnode
  code into videodev.ko
- Drop the patch merging the async + fwnode code into videodev.ko

Changes in v5:
- Rename lookup-table names to match those from the gpio and reset lookups:
  s/led_name/provider/
  s/consumer_dev_name/dev_id/
  s/consumer_function/con_id/
- Add static inline wrappers for the v4l2_async debugfs init/exit funcs,
  to fix build errors when CONFIG_V4L2_ASYNC is not enabled

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

Patch 1 adds generic privacy-LED support to the v4l2-core/v4l2-subdev.c
code automatically enabling the privacy-LED when s_stream(subdev, 1)
is called. So that we don't need to add privacy-LED code to all the
camera sensor drivers separately (as requested by Sakari).

Patches 2-5 are patches to the platform specific INT3472 code to register
privacy-LED class devices + lookup table entries for privacy-LEDs described
in the special INT3472 ACPI nodes found on x86 devices with MIPI cameras.

This depends on the just merged LED lookup code from:
https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/

This series has been tested on:

- Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
- Dell Latitude 9420, IPU 6, front: ov01a1s with privacy LED
- Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED
                              back: ov8865 with privacy LED (pled not yet supported)

Regards,

Hans



Hans de Goede (5):
  media: v4l2-core: Make the v4l2-core code enable/disable the privacy
    LED if present
  platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
  platform/x86: int3472/discrete: Create a LED class device for the
    privacy LED
  platform/x86: int3472/discrete: Move GPIO request to
    skl_int3472_register_clock()
  platform/x86: int3472/discrete: Get the polarity from the _DSM entry

 drivers/media/v4l2-core/v4l2-async.c          |   4 +
 drivers/media/v4l2-core/v4l2-fwnode.c         |   7 ++
 drivers/media/v4l2-core/v4l2-subdev-priv.h    |  14 +++
 drivers/media/v4l2-core/v4l2-subdev.c         |  44 ++++++++
 drivers/platform/x86/intel/int3472/Makefile   |   2 +-
 .../x86/intel/int3472/clk_and_regulator.c     |  34 ++++--
 drivers/platform/x86/intel/int3472/common.h   |  18 +++-
 drivers/platform/x86/intel/int3472/discrete.c | 100 ++++++++----------
 drivers/platform/x86/intel/int3472/led.c      |  74 +++++++++++++
 include/media/v4l2-subdev.h                   |   3 +
 10 files changed, 234 insertions(+), 66 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-subdev-priv.h
 create mode 100644 drivers/platform/x86/intel/int3472/led.c

-- 
2.39.1

