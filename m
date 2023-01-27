Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8891167E8BF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 15:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbjA0O7D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 09:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjA0O7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 09:59:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BB24205;
        Fri, 27 Jan 2023 06:59:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56C5F61CC5;
        Fri, 27 Jan 2023 14:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1715EC433EF;
        Fri, 27 Jan 2023 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674831540;
        bh=ayLVSt/XTI3V4PQVpc6YfvwCxzBwSOgTMqF+wN9LB+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fiw+pxZNNjdwseMGGbQM7Dd5dicm2NNq2ehmgt89FZgr6W2PPL10CuyaW2e4lXzTm
         P2UaNLHk8PYGP0j/lItINt5UHnJMcNVShAtYjtNlK91STdY3X/uVYT2VUzhl86iMlN
         b8j1G5KrPZ71qOon/3bV0VdI02asAYHHwug5UYSD8d89X6H3EE4kNIcn8n2AV6RgBD
         UPdaevT+H2GCg3bI5eQCetUNQFaWGwUph3ZomRJxNECuJcK3+vQyfYyH9mW4fCRNjf
         czVlDM53M4B4iMP3DHu2vSU7nvku7k0xxOd45TgTtH1XlnLt7cLIDm9v9Lb4z067iP
         QjoX+AO1zNOsw==
Date:   Fri, 27 Jan 2023 14:58:54 +0000
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
Subject: Re: [PATCH v5 00/11] leds: lookup-table support + int3472/media
 privacy LED support
Message-ID: <Y9PmrnIOHI09uSju@google.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git ib-leds-led_get-6.3

for you to fetch changes up to abc3100fcba6827444ef4bdb17065ac3b6619dff:

  leds: led-class: Add generic [devm_]led_get() (2023-01-27 11:07:11 +0000)

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
