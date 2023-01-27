Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5A267E2B2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 12:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbjA0LId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 06:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbjA0LIb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 06:08:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CB8206A2;
        Fri, 27 Jan 2023 03:08:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 45B62B8207C;
        Fri, 27 Jan 2023 11:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CDAC433A1;
        Fri, 27 Jan 2023 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674817704;
        bh=LEk5tYcopisk6LFE5R2WpdBlpwyByKD2XTmBkBzMUFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYFY5iMFp8QJcNeIBAUNnQnHmD4/OhxH07o8Z8q6TjMAKVIMb1NJfcbSOt55Jgz74
         2UubmN1o2Dwh2vLmxFfzJ0KUiEVULawjq/zhtFjluElzFQ1JR0LfcuvnxlVo017KA+
         pIiRQlhC63VZ59QyDo2sl4k3qDIcp217UF+9P5HG0T3Q9FJS+jlHqiBwNRkGGjS0WS
         jyr1A/dPC0rNhaoi8npjouOikDNvgHONqlEchkxXDYr678r+bY69q3Q2KWLLfLWGLU
         /pbrY5B7PKHHqj47jsdn8aiCImcBt7k71ImVU7lMywMlmi/Bj2bf6KmVHY1Uq68sTD
         t1e/kllxFsoZA==
Date:   Fri, 27 Jan 2023 11:08:17 +0000
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
Message-ID: <Y9Owocyg9eJaJ9Zv@google.com>
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

On Fri, 20 Jan 2023, Hans de Goede wrote:

> Hi All,
> 
> Here is version 5 of my series to adjust the INT3472 code's handling of
> the privacy LED on x86 laptops with MIPI camera(s) so that it will also
> work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
> (so that we cannot just tie the LED state to the clk-enable state).
> 
> Changes in v5:
> - Rename lookup-table names to match those from the gpio and reset lookups:
>   s/led_name/provider/
>   s/consumer_dev_name/dev_id/
>   s/consumer_function/con_id/
> - Add static inline wrappers for the v4l2_async debugfs init/exit funcs,
>   to fix build errors when CONFIG_V4L2_ASYNC is not enabled
> 
> Changes in v4:
> - Rename new __led_get() helper to led_module_get()
> - Drop of/devicetree support from "led-class: Add generic [devm_]led_get()"
> - Add RFC patch to re-add of/devicetree support to show that the new
>   led_get() can easily be extended with dt support when the need for this
>   arises (proof-of-concept dt code, not intended for merging)
> - New patch to built async and fwnode code into videodev.ko,
>   to avoid issues with some of the new LED code getting builtin vs
>   other parts possibly being in a module
> - Move the led_get() call to v4l2_async_register_subdev_sensor()
> - Move the led_disable_sysfs() call to be done at led_get() time
> - Address some other minor review comments
> 
> Changes in v3:
> - Due to popular request by multiple people this new version now models
>   the privacy LED as a LED class device. This requires being able to
>   "tie" the LED class device to a specific camera sensor (some devices
>   have multiple sensors + privacy-LEDs).
> 
> Patches 1-5 are LED subsystem patches for this. 1 is a bug fix, 2-4 add
> the new [devm_]led_get() functions. Patch 5 is the RFC patch adding dt
> support to led_get() and is not intended for merging.
> 
> Patch 6 + 7 add generic privacy-LED support to the v4l2-core/v4l2-subdev.c
> code automatically enabling the privacy-LED when s_stream(subdev, 1)
> is called. So that we don't need to add privacy-LED code to all the
> camera sensor drivers separately (as requested by Sakari).
> 
> Patches 8-11 are patches to the platform specific INT3472 code to register
> privacy-LED class devices + lookup table entries for privacy-LEDs described
> in the special INT3472 ACPI nodes found on x86 devices with MIPI cameras.
> 
> Assuming at least the LED maintainers are happy with the approach suggested
> here, the first step to merging this would be to merge patches 1-4 and then
> provide an immutable branch with those to merge for the other subsystems
> since the other changes depend on these.

LEDs pull request to follow.

-- 
Lee Jones [李琼斯]
