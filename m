Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776637B84F1
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 18:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243290AbjJDQY0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 12:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243323AbjJDQYZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 12:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB367C9
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696436618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JAu2ukysrElUN908/D/qlaYLYBXX+YKBm95B/XP139Q=;
        b=EC4Vcub7hY7X+f0y8nTC8B22gXN31QyBvoiew7VTFzGvu3EE8GnwEsAxUpXLJiSvMW64T3
        44LgDOd9wkyS1ik9A0RiXT02pUFjIAenRrjiBSRIs7SXauQ5MivAMmWoUqarkbaLmGfZBI
        CeIJfjJ3/nvInADp5BVB6f7E+ZwFskc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-IdgwnPq5PMWcAfBDGIKwCw-1; Wed, 04 Oct 2023 12:23:28 -0400
X-MC-Unique: IdgwnPq5PMWcAfBDGIKwCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08F831C0514C;
        Wed,  4 Oct 2023 16:23:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3415B40C2015;
        Wed,  4 Oct 2023 16:23:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [PATCH v3 0/5] platform/x86: int3472: don't use gpiod_toggle_active_low()
Date:   Wed,  4 Oct 2023 18:23:12 +0200
Message-ID: <20231004162317.163488-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

Here is v3 of Bartosz' and my "don't use gpiod_toggle_active_low()" series.

New in v3:
- Correctly preserve Bartosz as author for 2 of the patches
- Add Reviewed-by tags from Mika and Andy
- Fix wrong size of gpio lookup table allocation in new
  skl_int3472_gpiod_get_from_temp_lookup() helper. There must
  also be an empty terminating lookup, so 2 entries must be allocated.

New in v2:
- Rework to deal with ACPI path vs gpiod_lookup.key differences:
  acpi_get_handle(path) -> acpi_fetch_acpi_dev(handle) -> acpi_dev_name(adev)

Regards,

Hans


Bartosz Golaszewski (2):
  platform/x86: int3472: Add new
    skl_int3472_gpiod_get_from_temp_lookup() helper
  gpio: acpi: remove acpi_get_and_request_gpiod()

Hans de Goede (3):
  platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup() helper
  platform/x86: int3472: Stop using gpiod_toggle_active_low()
  platform/x86: int3472: Switch to devm_get_gpiod()

 drivers/gpio/gpiolib-acpi.c                   |  28 -----
 .../x86/intel/int3472/clk_and_regulator.c     |  54 ++--------
 drivers/platform/x86/intel/int3472/common.h   |   7 +-
 drivers/platform/x86/intel/int3472/discrete.c | 101 ++++++++++++++----
 drivers/platform/x86/intel/int3472/led.c      |  24 +----
 include/linux/gpio/consumer.h                 |   8 --
 6 files changed, 93 insertions(+), 129 deletions(-)

-- 
2.41.0

