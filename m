Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB6567E29C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 12:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjA0LGh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 06:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjA0LGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 06:06:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEA9525E;
        Fri, 27 Jan 2023 03:06:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 986CA61AFE;
        Fri, 27 Jan 2023 11:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E8EC433D2;
        Fri, 27 Jan 2023 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674817595;
        bh=0n4k69gzLP/7pKaZRSHgYuBk4q5o9r2C4G6tEO5Q6Rk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XC3wTVuqsNG/P6hFXDQBZ7M5r/vOu0schvPbMTB8nQ1KhMwTb5iByz2H4qBsT/Ru2
         KHOl2S4xr8Gkjg7w6vhDLlVCwJFhrNbKfkuF8SDTrSnttlob34xpVfgVEQpUEiSDTi
         CuZF/i8d2z2+gcjbx/LhMutUfxz4thGH7UO7ftB0qTVCkB/LSL3GkH173Q5yJuT7R2
         c3ZoIjk37I6n6KYAtrb4+R85omEFXRIaEVJeYeUQD+CfZ97HBQhiHIhVG+GTb3ZoOm
         OOYXJ7wRw7YYToBwvyywVBv5ITeacgHDTer+FLDOLeafbd1HMUoul/zl9/Ra9+qK1P
         47m8QINWCKGxQ==
Date:   Fri, 27 Jan 2023 11:06:27 +0000
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
Subject: Re: [PATCH v5 02/11] leds: led-class: Add led_module_get() helper
Message-ID: <Y9OwM6utyPISJovY@google.com>
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <20230120114524.408368-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120114524.408368-3-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Jan 2023, Hans de Goede wrote:

> Split out part of of_led_get() into a generic led_module_get() helper
> function.
> 
> This is a preparation patch for adding a generic (non devicetree specific)
> led_get() function.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Rename helper from __led_get() to led_module_get()
> ---
>  drivers/leds/led-class.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
