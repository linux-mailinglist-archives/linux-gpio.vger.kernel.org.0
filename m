Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069A267B096
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 12:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbjAYLGo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 06:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235336AbjAYLGn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 06:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982472D73
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 03:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674644754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=PxjQ4ych7lYX4Yia9fEDkS0OwdEqP3bxUUf7l2sqqpk=;
        b=hEatboKTr5QwDGbVJ3EtQchWWvmauHGtrxgzzcaWKheXiKafuHQsR5JQoye11TavaHwd2F
        zGLaeVi+RouxVCupgHjcGL63iR567XSaTDVVV6wQFn4X4uHTIt7j8fXJgZptP3WGoRa2Q8
        ghXw78IjeFcbng+8p6fYFygKS21SIXw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-jgxeA-22OPG33S3Z97Gyqg-1; Wed, 25 Jan 2023 06:05:50 -0500
X-MC-Unique: jgxeA-22OPG33S3Z97Gyqg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 033431C05AE7;
        Wed, 25 Jan 2023 11:05:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.104])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 920DC492B00;
        Wed, 25 Jan 2023 11:05:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-gpio@vger.kernel.org
Subject: [PATCH v2 resend 0/2] gpio: tps68470: 2 bugfixes
Date:   Wed, 25 Jan 2023 12:05:45 +0100
Message-Id: <20230125110547.18093-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

My previous gpio-tps68470 patch series, which tried to model the LED
outputs as GPIOs, included these 2 bugfixes. The patch to model the
LED outputs as GPIOs has been nacked (*), but these 2 bugfixes are
still valid and it would be good if we can get them merged.

Regards,

Hans

*) A new series from Kate, modelling these as LED class devices is pending


Hans de Goede (2):
  gpio: tps68470: Fix tps68470_gpio_get() reading from the wrong
    register
  gpio: tps68470: Make tps68470_gpio_output() always set the initial
    value

 drivers/gpio/gpio-tps68470.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.39.0

