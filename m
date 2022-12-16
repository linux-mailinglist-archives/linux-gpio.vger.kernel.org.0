Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F45564EA76
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 12:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiLPLbM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 06:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiLPLbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 06:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6045C75C
        for <linux-gpio@vger.kernel.org>; Fri, 16 Dec 2022 03:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671190223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=us2r/Cka/DVYppZUWMqDY3fKam1bvS45Ua8aIbvfMVA=;
        b=LTOTmuV6yjH+jNiTp4/8XVG1MlJuhoxia49CXmK1fe1fG6IbbBJTZ/E7yHuGJAf+baCcKP
        Umx0a9I8U8Z8C0Ucphrznv0nEGgBGWcga3+XWbpiAqkfBd3SHQ3DFQMVnw0kzeoujc0h+s
        XdA+gG1AngCNtbwZ+e3NZR/6z8Uwzu8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-RgHZAHtvNzyjKwP8I_HhQg-1; Fri, 16 Dec 2022 06:30:19 -0500
X-MC-Unique: RgHZAHtvNzyjKwP8I_HhQg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488C8101A52E;
        Fri, 16 Dec 2022 11:30:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C1CB7400F58;
        Fri, 16 Dec 2022 11:30:14 +0000 (UTC)
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
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 00/11] leds: lookup-table support + int3472/media privacy LED support
Date:   Fri, 16 Dec 2022 12:30:02 +0100
Message-Id: <20221216113013.126881-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Here is my 3th attempt at adjusting the INT3472 code's handling of
the privacy LED on x86 laptops with MIPI camera(s) so that it will also
work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
(so that we cannot just tie the LED state to the clk-enable state).

Due to popular request by multiple people this new version now models
the privacy LED as a LED class device. This requires being able to
"tie" the LED class device to a specific camera sensor (some devices
have multiple sensors + privacy-LEDs).

Patches 1-5 are LED subsystem patches for this. 1 is a bug fix, 2-4
is a bit of refactoring in preparation for patch 5 which adds
generic (non devicetree specific) led_get() and devm_led_get() function
(which will also work with devicetree) and lookup table support to
allow platform code to add LED class-device <-> consumer-dev,function
lookups for non devicetree platforms.

Patch 6 adds generic privacy-LED support to the v4l2-core/v4l2-subdev.c
code automatically enabling the privacy-LED when s_stream(subdev, 1)
is called. So that we don't need to privacy-LED code to all the
camera sensor drivers separately (as requested by Sakari).

These are all new patches in version 3. Patches 7-11 are patches
to the platform specific INT3472 code to register privacy-LED class
devices + lookup table entries for privacy-LEDs described in
the special INT3472 ACPI nodes found on x86 devices with MIPI
cameras (+ prep work + some other INT3472 fixes).

Assuming the LED and media maintainers are happy with the approach
suggested here (if you are please give your Ack / Reviewed-by) we
need to talk about how to merge this since patches 6 and 7-11
depend on the LED subsystem changes. I think it would be best if
the LED subsystem can provide an immutable branch with patches 1-5
(on top of 6.2-rc1 once it is out) and then the media folks and I
can merge that branch and then apply the other patches on top.

This series has been tested on:

- Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
- Dell Latitude 9420, IPU 6, front: ov01a1s with privacy LED
- Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED
                              back: ov8865 with privacy LED (pled not yet supported)

Regards,

Hans


Hans de Goede (11):
  leds: led-class: Add missing put_device() to led_put()
  leds: led-class: Add __led_get() helper function
  leds: led-class: Add __of_led_get() helper
  leds: led-class: Add __devm_led_get() helper
  leds: led-class: Add generic [devm_]led_get()
  v4l: subdev: Make the v4l2-subdev core code enable/disable the privacy
    LED if present
  platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
  platform/x86: int3472/discrete: Create a LED class device for the
    privacy LED
  platform/x86: int3472/discrete: Move GPIO request to
    skl_int3472_register_clock()
  platform/x86: int3472/discrete: Ensure the clk/power enable pins are
    in output mode
  platform/x86: int3472/discrete: Get the polarity from the _DSM entry

 drivers/leds/led-class.c                      | 174 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-subdev.c         |  40 ++++
 drivers/platform/x86/intel/int3472/Makefile   |   2 +-
 .../x86/intel/int3472/clk_and_regulator.c     |  35 +++-
 drivers/platform/x86/intel/int3472/common.h   |  18 +-
 drivers/platform/x86/intel/int3472/discrete.c |  96 +++++-----
 drivers/platform/x86/intel/int3472/led.c      |  75 ++++++++
 include/linux/leds.h                          |  18 ++
 include/media/v4l2-subdev.h                   |   3 +
 9 files changed, 371 insertions(+), 90 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/led.c

-- 
2.38.1

