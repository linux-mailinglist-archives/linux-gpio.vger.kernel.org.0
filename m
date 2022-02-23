Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794604C1436
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 14:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbiBWNci (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 08:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiBWNch (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 08:32:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 837BDAB460
        for <linux-gpio@vger.kernel.org>; Wed, 23 Feb 2022 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645623129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9cRYg4PGSV79E94LwQ8YvSUOHhEjgaIqzNC1kDZLq9w=;
        b=YToR51ogsFICpdhWZRHDOBF+iCX/Q3tVuGuM4KR0Jz1Uyjkv5VUDokW12toI9zqOvNtf5g
        S5iMF0jFBPECvtMoXNjBxwKJwhEywO1zoAOBl5P9DzKu3JUNwGE4hTFB21qB52P/cJ7Uu7
        c9vQWqnPDfRRlcATZ+q/d/XPJ+CT5wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-1Li8Wm0sNwm2iI5jTTkZ1A-1; Wed, 23 Feb 2022 08:32:08 -0500
X-MC-Unique: 1Li8Wm0sNwm2iI5jTTkZ1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6D9B5123;
        Wed, 23 Feb 2022 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E4BD2832A4;
        Wed, 23 Feb 2022 13:32:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 0/5] pinctrl/baytrail platform/x86: SUS6 mux / Lenovo Yoga Tablet 2 support
Date:   Wed, 23 Feb 2022 14:31:48 +0100
Message-Id: <20220223133153.730337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This series consists of 2 parts:

Patch 1   : pinctrl: baytrail: Add pinconf group + function for the pmu_clk
Patch 2-5 : platform/x86: x86-android-tablets: Add Lenovo Yoga Tab2 support

Patch 5 has a runtime dependency on patch 1, but this is only  runtime and
there are some other patches in flight to other subsystems which are also
needed for the Lenovo Yoga Tab2 support.

As such I believe that patch 1 can be merged independently through the
pinctrl-intel tree and then I'll merge patches 2-5 through the pdx86 tree.

The only reason for sending this out as a series is because patch 5
uses the new pmu_clk pinconf added by patch 1.

Regards,

Hans


Hans de Goede (5):
  pinctrl: baytrail: Add pinconf group + function for the pmu_clk
  platform/x86: x86-android-tablets: Fix EBUSY error when requesting
    IOAPIC IRQs
  platform/x86: x86-android-tablets: Add Lenovo Yoga Tablet 2 830 / 1050
    data
  platform/x86: x86-android-tablets: Workaround Lenovo Yoga Tablet 2
    830/1050 poweroff hang
  platform/x86: x86-android-tablets: Lenovo Yoga Tablet 2 830/1050 sound
    support

 drivers/pinctrl/intel/pinctrl-baytrail.c   |   9 +
 drivers/platform/x86/x86-android-tablets.c | 280 +++++++++++++++++++++
 2 files changed, 289 insertions(+)

-- 
2.35.1

