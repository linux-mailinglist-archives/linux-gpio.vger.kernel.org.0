Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285E167E2A1
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 12:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbjA0LHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 06:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjA0LHE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 06:07:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF04F525E;
        Fri, 27 Jan 2023 03:07:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95710B82043;
        Fri, 27 Jan 2023 11:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5727AC433D2;
        Fri, 27 Jan 2023 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674817621;
        bh=pghe53KkDgw2XrVEa8gLykj9fmqliWBoevdN+FbWALg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nRm7guJL4IwXEbqCw2c2+OPi6KxAHtOvmD5dHJzxuVBptIeP+Akb8D+/NhkcxRcIa
         53Q4YMjCBzREZh12psqfZtTuQ8CwNVRFoSsdWoUbEeB6VGLva+hwDUs4mrbBO4eLm4
         HlJnrzFPjTRg89g/NRUGUk0ewspV6ZmpvDJZoWs01GeajEIsnX9JTMFARaF7pLTxNW
         9bLt78naDZ/3yhhHW1GZOuI1ueF2jwL98sKlsVSYBU8caKxNAHS2fiV7tH030Pn6I9
         q66kazWu2DG4roVZxe8qscr1MumZqg2oHPNfmxbwG7xyKhNhLFwiojE0f3f2R/FMvP
         Gt61cAUEH+Sdw==
Date:   Fri, 27 Jan 2023 11:06:54 +0000
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
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 03/11] leds: led-class: Add __devm_led_get() helper
Message-ID: <Y9OwTmBokDxDCy3i@google.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120114524.408368-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Jan 2023, Hans de Goede wrote:

> Add a __devm_led_get() helper which registers a passed in led_classdev
> with devm for unregistration.
> 
> This is a preparation patch for adding a generic (non devicetree specific)
> devm_led_get() function.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-class.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
