Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4DA674F25
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 09:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjATIJZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 03:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjATIJW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 03:09:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4191A8534B;
        Fri, 20 Jan 2023 00:09:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1432B82079;
        Fri, 20 Jan 2023 08:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1FCC4339C;
        Fri, 20 Jan 2023 08:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674202158;
        bh=KH0OHgFWAlMLEWamKLwkcAUS3Cf3miV/YcqK/yvTjt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TGC3seA27YcuIqW7l7QdWoRSC4YaMRFpcDPOJ0rcjTLGHU2iugFpiRiF3cL4brEhf
         DGHxbmWdhDikvRvIIjRCjMZ7UiJYPuPHHtKVCD+HaLhhNJAw30tVZSnqtYvSW2rcMg
         MwcsZMvihl/0whuinRk9DqdHXpdGT4w1cmP+Dq3FV/1ibuqVgSx5Fgu7JIzPYhL/cO
         eG/KljOSBWVIjGixI2gV68V8sCMsluDvmbvPzlQMu4X/ruZ1RBNdOIEqIxZzEUK5Hb
         SJczFH90f2TKkOh8Eyq/R0ciISYUiTz504OSZAIJZPF3o/ytXD1H02r5j/Ki5dNebq
         Kb6S7tm63BK0w==
Date:   Fri, 20 Jan 2023 08:09:11 +0000
From:   Lee Jones <lee@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v4 04/11] leds: led-class: Add generic [devm_]led_get()
Message-ID: <Y8pMJ1XRprFABBFs@google.com>
References: <20230119130053.111344-1-hdegoede@redhat.com>
 <20230119130053.111344-5-hdegoede@redhat.com>
 <CACRpkdYuHmAwYR24xEz01ub1_mMhqYN65WuoLHCS=094b6AM2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYuHmAwYR24xEz01ub1_mMhqYN65WuoLHCS=094b6AM2w@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Jan 2023, Linus Walleij wrote:

> On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> > Add a generic [devm_]led_get() method which can be used on both devicetree
> > and non devicetree platforms to get a LED classdev associated with
> > a specific function on a specific device, e.g. the privacy LED associated
> > with a specific camera sensor.
> >
> > Note unlike of_led_get() this takes a string describing the function
> > rather then an index. This is done because e.g. camera sensors might
> > have a privacy LED, or a flash LED, or both and using an index
> > approach leaves it unclear what the function of index 0 is if there is
> > only 1 LED.
> >
> > This uses a lookup-table mechanism for non devicetree platforms.
> > This allows the platform code to map specific LED class_dev-s to a specific
> > device,function combinations this way.
> >
> > For devicetree platforms getting the LED by function-name could be made
> > to work using the standard devicetree pattern of adding a -names string
> > array to map names to the indexes.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Changes in v4:
> > - Split out support for led_get() devicetree name-based lookup support
> >   into a separate RFC patch as there currently are no user for this
> > - Use kstrdup_const() / kfree_const() for the led_name
> 
> This is how I would implement it so:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks Linus, this is all really helpful.

-- 
Lee Jones [李琼斯]
