Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428FA3D4F7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406769AbfFKSFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 14:05:20 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:46865 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406685AbfFKSFU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 14:05:20 -0400
Received: by mail-pl1-f170.google.com with SMTP id e5so5437585pls.13
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2019 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KsKxk7mWhnld6lqzDiFbfsJQ7V5kfiKkCUpMkhJ6QMo=;
        b=rV92SEE1OzIHFKSqPBy6qmkBfcN2E2Z6LmooCmRH88pmbcFGqJ087T5UIuf4Co9Ipj
         PFMEzNY6ZNcKljfUtkHdqWN9bP2CahKsUTGtxA5OzQgRLf6h/bA0FQsfpYt1DgeCn+4e
         VXxrg4rj9pAQZf/AapbM6I0FoMd0Xam/E7TPtjnJMQTzpeUZ4sBBlXECTP860jih9ei2
         KoIgdLKnUzDiE8xAVK/hYya3tVbdgkL/1YIwIvd90Bydyt9HmyQ38mHQZ4Dd2ecOa7bi
         GT1h/jnmOp8E2CVwzjZ0D69KwJykw/iCwhRpSDGNhNaBJQT3boyYyNwtzUehNJSDkDxH
         /cJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KsKxk7mWhnld6lqzDiFbfsJQ7V5kfiKkCUpMkhJ6QMo=;
        b=fDre7XaIb2zqnLyAEzluWZlDJPSCLsu6hdGjUM1YoX6fm1+0njxngPyfbtms4t2MsZ
         LAkWBct++NtkNCs6gxmC2xMPO3ef9DsNo6wqXoUvxMFgP4/jfkWZMIYrCuFWawLvWmm/
         bFAeuZbM/QQnIU2lZ5H2px0C2+OebqWG2joCHfnCMi1RoRTu01wR7UgQrL2YeFxhHzPU
         lAp6c9RtWDxNl4t83zt5fqZ2hc8EPG+kKAWR7AjK2wzo4w6q4hx48RD1/rbNA7XAUJn8
         bChLgOQe5WNfMZGU+XmPwlNwfAOvCONNsiGjU+x5H/uhLqoyHhu/0PUEt6DvocZYumOL
         dISg==
X-Gm-Message-State: APjAAAX01qy4nZMs1es9iAyBlP36ytpM72aCGV7TIzHjUxeMJiUvB+dm
        G5hVtDQO/07WK/sckjWkR44FJg==
X-Google-Smtp-Source: APXvYqwZZTF6tR/ssbbRzTwNqufP9IAlXnh1xiTE/tMVU/va6rYZJWy85UQ+dkAX6720o1ageMTxVg==
X-Received: by 2002:a17:902:26c:: with SMTP id 99mr79262961plc.215.1560276319186;
        Tue, 11 Jun 2019 11:05:19 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n21sm9068570pjo.0.2019.06.11.11.05.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 11:05:18 -0700 (PDT)
Date:   Tue, 11 Jun 2019 11:05:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: How to write "modern" pinctrl DT node
Message-ID: <20190611180516.GO4814@minitux>
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 11 Jun 09:12 PDT 2019, Marc Gonzalez wrote:

> Hello,
> 
> I'm working with a device (TSIF0) which apparently drives 4 pins:
> (Or maybe 5... it seems gpio40 might be associated with TSIF0 as well.)
> 
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi?h=LE.UM.1.3.r3.25#n2258
> 
> I'll copy the downstream DT nodes here for discussion:
> 
> 		tsif0_signals_active: tsif0_signals_active {

This seems like the "default", "non-sleep" state. So I think a better
name would be to make this:

	tsif0_default: tsif0-default 

(Note again, _ in label names, - in node names)

> 			tsif1_clk {

The namespace here is local to the tsif0-default state node, so there's
no need to repeat the "tsif" prefix here. Just name it "clk".

Also, what's up with tsif0 vs tsif1?

> 				pins = "gpio89"; /* TSIF0 CLK */

This comment doesn't add any value, if you give the label a good name
(i.e.  name it clk and you know that this represents the clock pin)

> 				function = "tsif1_clk";

Rather than having clk, en, data and error as separate functions we
should have made them just "tsif1", as there's no overlap. But this is
correct - see msm8998_functions[] (or the DT binding) for available
functions.

> 			};
> 			tsif1_en {
> 				pins = "gpio90"; /* TSIF0 Enable */
> 				function = "tsif1_en";
> 			};
> 			tsif1_data {
> 				pins = "gpio91"; /* TSIF0 DATA */
> 				function = "tsif1_data";
> 			};
> 			signals_cfg {

This is written with the mindset that pinmux and pinconf properties
should be kept separate, so here they specify the drive-strength and
bias for the above 3 pins.

I've come to prefer to have these properties added to the above nodes,
rather than having this split.

> 				pins = "gpio89", "gpio90", "gpio91";
> 				drive_strength = <2>;	/* 2 mA */

As Jonathan pointed out, - not _.

And in contrast to the previous downstream solution each property is of
standard units and self explaining, so no need for comments.

> 				bias-pull-down;		/* pull down */
> 			};
> 		};
> 
> 		/* sync signal is only used if configured to mode-2 */
> 		tsif0_sync_active: tsif0_sync_active {

This looks reasonable if this is a dynamic thing (if it's static it
should be one node), and you can in your tsif0 node do:

pinctrl-names = "default", "mode-2";
pinctrl-0 = <&tsif0_default>;
pinctrl-1 = <&tsif0_default>, <&tsif0_sync_active>;

The driver core will select "default" and your driver will have to use
the pinctrl api to switch to the state "mode-2".

> 			tsif1_sync {
> 				pins = "gpio9";	/* TSIF0 SYNC */
> 				function = "tsif1_sync";
> 				drive_strength = <2>;	/* 2 mA */
> 				bias-pull-down;		/* pull down */
> 			};
> 		};
> 
> 
> Can I rewrite the first node as:
> 
> 	tsif0_default {
> 		pins = "gpio89", "gpio90", "gpio91"; /* clk, enable, data */

If you feel the need to add a comment then use subnodes to denote which
is which instead.

> 		function = "is_this_just_a_label?"; /* Can I just leave it out? */

For each pins you need to select a matching function name, per the
mapping in msm8998_groups in the driver (or datasheet).

As there are no collisions between the various tsif functions we should
have just made them all "tsif1", but now you need to describe each pin
and its associated function individually - as the example above shows..

> 		drive-strength = <2>;
> 		bias-pull-down;
> 	}

Had we made the function name "tsif1" for all of them then you could
definitely do this.

> 
> Is this enough information to configure the 3 pins? Probably not...
> There must be some information hard-coded in drivers/pinctrl/qcom/pinctrl-msm8998.c
> 
> Can I merge pin 9 in the above node, since it has the same
> "hardware properties" (drive_strength and bias_direction) ?
> 

Had we made the tsif functions just "tsif1" then you could have done
this. But based on the comment about mode-2 it seems like you still
would like to keep this separate.

> 
[..]
> 
> 	PINGROUP(89, EAST, tsif1_clk, phase_flag10, NA, NA, NA, NA, NA, NA, NA),
> 	PINGROUP(90, EAST, tsif1_en, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, blsp1_spi, tgu_ch0, qdss_cti1_b, NA),
> 	PINGROUP(91, EAST, tsif1_data, sdc4_cmd, tgu_ch1, phase_flag1, qdss_cti1_b, NA, NA, NA, NA),
> 
> (It seems to me there is some redundancy in this driver?)
> 
> These last 3 lines seem to summarize how each pin is muxed?
> I.e. it's used as one function, exclusively?
> So a proper driver should be unloadable, to let other drivers
> claim the shared pins?
> 

The common example of this is for drivers to jump between a function and
the implicit "gpio" function when going in and our of sleep. A state is
described for the "default" (active) state with appropriate pinmux and
pinconf and a separate ("sleep") is used to e.g. pull the pins low while
in suspend.

I can't think of an example where you would dynamically switch between
the other functions; because note that for a given hardware design you
have e.g. your tsif block soldered onto those pins.


PS. I would suggest that you send a patch to the MSM8998 pinctrl driver
(and binding) where you squash tsifN_* to tsifN. It would break
backwards compatibility, but I think we can take that risk now before
someone starts to use it... And after that you can go with your proposed
squashed node.

Regards,
Bjorn
