Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D4264E7F1
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 08:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiLPHxc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 02:53:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiLPHxb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 02:53:31 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7543520986;
        Thu, 15 Dec 2022 23:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671177209; x=1702713209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mVf90vkvftpBiysw9C0Dc2AcYSl9/0RcwIwJTzdXaQM=;
  b=PSsLFioj8Ywe+zoMpqqaUX4P5jbmzHLhBOoEUyoij5nz5396+rDiwtOR
   4gv5wDh5E4CXciShwqKYWvKPgmdC+F0yXnC53XMGX7LhWfzy/cH3DPARF
   TUmI9P+vohxncFDeomn+Gjzm3BBPpvRvGuEs3xmVj9zDhCpMo+W11mDNl
   24CToGp1mDWbD/AkNp3C39eHP+UM9Dg4/UUXjOVC4z/Lqi+8hsFmi9fXn
   aBAj5dwN3Q1RQFnKuf+Blp4ptIU1IN+PCVc5ipCtIs+FRZasG0R2cNhrd
   XyAQs3eN/TwE3NqCB+jIm3v7Hcle7zjQINxXj/1adnqnPbQwQa7UpFmnb
   A==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; 
   d="scan'208";a="27989401"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2022 08:53:27 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Dec 2022 08:53:27 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Dec 2022 08:53:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671177207; x=1702713207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mVf90vkvftpBiysw9C0Dc2AcYSl9/0RcwIwJTzdXaQM=;
  b=P3JSa4dol3JkN4CHLuqK+a5wZW+ZqnGHCatblHYSGtU/E9ilW6DymDLV
   1p3ckHDsrr14GOO98chBlWzWXJU58eWmBlZKj0qZOGF6EQJ+5D+bSf7nf
   jk3yT4FChcR+j3MJ20pFk3ptcDYyLeWL/5GaxoRfHg8IlCEeQrck2TcA/
   GBGpYr6JD70oieYiDxe784HsMUE0Q9tE/SdUIX5G3HYG13ocazA50EZRr
   rclXyPQGfpP0LEVdhUUrl93pxk/v0s9vDd3oL4E/b9WI0iWz6XQvl1sjn
   janWOAN8OH0mDy3VC3cLK4hdS9NVrwapJtAF/V5TkE25xJ6oa5lqEgeNh
   A==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; 
   d="scan'208";a="27989399"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Dec 2022 08:53:27 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4D672280071;
        Fri, 16 Dec 2022 08:53:27 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Subject: Re: [RFC PATCH v2 0/3] gpio: Add gpio-delay support
Date:   Fri, 16 Dec 2022 08:53:23 +0100
Message-ID: <5103034.0VBMTVartN@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAL_JsqLjA5AKJuNCDwBVsAoBmxBdcqf_LBHBwF9ObckUEr=epw@mail.gmail.com>
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com> <Y5uRBPsa4YCsAbj2@pendragon.ideasonboard.com> <CAL_JsqLjA5AKJuNCDwBVsAoBmxBdcqf_LBHBwF9ObckUEr=epw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,

thanks for your comments.

Am Donnerstag, 15. Dezember 2022, 23:44:19 CET schrieb Rob Herring:
> On Thu, Dec 15, 2022 at 3:26 PM Laurent Pinchart
> 
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Thu, Dec 15, 2022 at 12:21:33PM -0600, Rob Herring wrote:
> > > On Thu, Dec 15, 2022 at 7:16 AM Linus Walleij wrote:
> > > > On Wed, Dec 14, 2022 at 10:53 AM Alexander Stein wrote:
> > > > > thanks for the feedback I've received. This is the reworked RFC for
> > > > > adressing a platform specific ramp-up/ramp-down delay on GPIO
> > > > > outputs.
> > > > > Now the delays are neither specified as gpio-controller nor
> > > > > consumer-specific properties.
> > > > > 
> > > > > v2 is a different approach than v1 in that it adds a new driver
> > > > > which will
> > > > > simply forward setting the GPIO output of specified GPIOs in OF
> > > > > node.
> > > > > The ramp-up/ramp-down delay can now be actually defined on consumer
> > > > > side,
> > > > > see Patch 1 or 3 for examples.
> > > > 
> > > > I really like this approach, it looks better than I imagined.
> > > 
> > > It seems over-engineered to me. So far no comments on my 3 suggestions
> > > either...> 
> > I like the idea of handling this on the consumer's side, possibly with
> > standard foo-gpios-ramp-{up,down}-delay-us (name to be bikeshedded)
> > properties as you mentioned in the review of v1.

Rob mentioned 4 possible delays: pre and post ramp up and down.
Is there a need for a pre ramp delay, ever? If there is need to wait until a 
GPIO can be switched this seems highly device specific to me.
Also reading back the requested output level on the GPIO is not possible in 
every case. Looking at the example in Patch 1 you can only read back the state 
of VCC_A, but the actual delay happens on VCC_B.

It might seem over-engineered, but I'm getting more and more inclined to this 
v2 approach. Having an explicit delay node, its obvious there is some 
dedicated circuit inducing this delay. But it is not caused by the GPIO 
controller nor by the consumer (LVDS Bridge in this case), but something 
passive in between.

Considering the hypothetical case there is a configurable IC instead, inducing 
this delay as well. The DT setup would look similar, but having a "regular" 
device instead of "gpio-delay" virtual device.

> > > One is to just use some GPIO flag bits. Say 4-bits of GPIO flags
> > > encoded as power of 2 ramp delay. We have to pick the units. For
> > > example, 100us*2^N, which gives you 200us-3.2s of delay.
> > 
> > This could probably work too.
> > 
> > > Anything less is short enough to just hard code in a driver.
> > 
> > In which driver though ? The whole point is that we should avoid
> > handling this in particular drivers.
> 
> Okay, make the range 100us-1.63s and the minimum delay is 100us. Or
> 50us-819ms? What's a small enough minimum that no one will care about
> the extra delay?

Is there a definite answer to this at all? Realtime (RT_PREMPT) people might 
have a different answer to these ranges. But I'm not really fond of using a 
bitmask in GPIO flags.

> One thing we don't want is DT authors putting a device's delay needs
> in here. Then we'll get coupling to the OS implementation or double
> delays.

Can you actually avoid that? There is no difference of behavior in software if 
you have
a) waiting/locking/... time once device is enabled, with an immediate ramp up
b) ramp up time until device is enabled, but it can be used immediately

In both cases you enable the GPIO and you have to wait for some specific time. 
But the reasoning for waiting are different. You can "solve" both cases on two 
ways:
1. device specific, configurable/hard-coded enable delays
2. general GPIO switch delays (this series)

I'm not sure if a property 'foo-gpios-ramp-us' on the consumer side is prone 
to hide the fact this delay is not actually related to the consumer.

Maybe it's even better to specify the delay in the "gpio-delay" consumer node.
Resulting in an example like this:

gpio_delay: gpio-delay {
	compatible = "gpio-delay";
	#gpio-cells = <1>;
	gpio-controller;
	gpios = <&gpio0 3 GPIO_ACTIVE_LOW>,
	        <&gpio3 1 GPIO_ACTIVE_HIGH>;
	gpios-ramp-us = <56000 0>, <130000 30000>;
};

consumer {
	enable-gpios = <&gpio_delay 0>;
};

Best regards,
Alexander

> Something like this should be clear:
> 
> #define GPIO_THIS_IS_ONLY_THE_SIGNAL_RC_RAMP_TIME_100us
> 
> ;)
> 
> Rob




