Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D142167EC3A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 18:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235046AbjA0ROf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 12:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbjA0ROd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 12:14:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB07013B;
        Fri, 27 Jan 2023 09:14:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7540061D54;
        Fri, 27 Jan 2023 17:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC12C433D2;
        Fri, 27 Jan 2023 17:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674839671;
        bh=p+a8OGgpraBX/ZldFFkNUfzskgq3bl7Tj0rZRDJNZJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=berjOZ3TccsQkIfHgvIL0zQEb0Ssaqus6sAl5rbnnuRnm14SxX9c1Mit0ojW406Yb
         UIxv/ZH/hDnCKKg8kBC8Mx8B5ukJCYp1LO0yxuzQDKFOapeTnpyux6lvDZnkwDE2W3
         OwpVS0g79aJbgDNA0K6/d1QDCwapYpe/rSujf1lpZIvf/AepY4esepfP+eQC+b+ilx
         qRfJTWiC+xql7ikM+3NDV5US5A94ZVWlmUv7GXOHvsuWGlUk0KH7p+ZrArYc/cJ4NW
         xNFB3K4nlIs0Olvp0Bo7Y8ZdFMiVcCqrM/vcTuqNs1tdQxI0Xy2oMLdAC7f8UJyed3
         uG/YLBq7FUd2A==
Date:   Fri, 27 Jan 2023 17:14:24 +0000
From:   Lee Jones <lee@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: [GIT PULL] Immutable branch from LEDs due for the v6.3 merge window
Message-ID: <Y9QGcA+9nlmOOy2d@google.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120114524.408368-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enjoy!

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/ib-leds-led_get-v6.3

for you to fetch changes up to abc3100fcba6827444ef4bdb17065ac3b6619dff:

  leds: led-class: Add generic [devm_]led_get() (2023-01-27 11:07:11 +0000)

----------------------------------------------------------------
Immutable branch from LEDs due for the v6.3 merge window

----------------------------------------------------------------
Hans de Goede (4):
      leds: led-class: Add missing put_device() to led_put()
      leds: led-class: Add led_module_get() helper
      leds: led-class: Add __devm_led_get() helper
      leds: led-class: Add generic [devm_]led_get()

 drivers/leds/led-class.c | 138 ++++++++++++++++++++++++++++++++++++++++-------
 include/linux/leds.h     |  21 ++++++++
 2 files changed, 139 insertions(+), 20 deletions(-)

-- 
Lee Jones [李琼斯]
