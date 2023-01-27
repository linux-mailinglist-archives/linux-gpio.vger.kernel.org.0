Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CE267E279
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 12:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjA0LAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 06:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbjA0LAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 06:00:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8042319F0C;
        Fri, 27 Jan 2023 03:00:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37275B81F8F;
        Fri, 27 Jan 2023 11:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362D5C433D2;
        Fri, 27 Jan 2023 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674817218;
        bh=6S+BuAil8PeG+MgoXAkeDVR2XDhCpoQ6Eox9b820Klo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qAPjrrdXIvd3LAwl690hzKrvc2Vthbw2/hk0rBA50mhxSC72PxRfv62idjdzZaI74
         RubALvyXFysB7aDVLXW+VnNKqoEWdE3U1pAUfLdcXW+4CUnoVc2FtIz9FhTLri0KLW
         0Vwzqnw/SxYH1gu5EyyBIF//lxDDLosrYEer6ZZrd7Wb8t23GY2514rGLIsGmzXTL4
         A3Vs6ilRnjUB2GvLx42DpqX+d/t6X3pNEHLa1xjU5fSumjSKzH8HMqlCqnhxWmIh3y
         f7TSOvZgEgS8iYhRXwfGm19STmCuFwrmpLUFl2I9Sn7IYOlnPQya8FFgD9Ekumef4T
         JdrISyMfkhIig==
Date:   Fri, 27 Jan 2023 11:00:12 +0000
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
Subject: Re: [PATCH v5 01/11] leds: led-class: Add missing put_device() to
 led_put()
Message-ID: <Y9OuvL3BCm7uB/vN@google.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120114524.408368-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Jan 2023, Hans de Goede wrote:

> led_put() is used to "undo" a successful of_led_get() call,
> of_led_get() uses class_find_device_by_of_node() which returns
> a reference to the device which must be free-ed with put_device()
> when the caller is done with it.
> 
> Add a put_device() call to led_put() to free the reference returned
> by class_find_device_by_of_node().
> 
> And also add a put_device() in the error-exit case of try_module_get()
> failing.
> 
> Fixes: 699a8c7c4bd3 ("leds: Add of_led_get() and led_put()")
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-class.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
