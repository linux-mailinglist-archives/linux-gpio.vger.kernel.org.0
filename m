Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4F521DF21
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 19:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729703AbgGMRrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 13:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbgGMRrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 13:47:52 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4511C061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 10:47:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id lx13so18247660ejb.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 10:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NAYGAJiN1ZYjSk2aXh/7Ifqmy+2+Cae3t1vPYJlsPH4=;
        b=VGvOX1nuEgb7h5k831oyvkyzDXz/woLPHwX4iVAQZ7h5gcf1eLCYAa4lk7JK8+DJnW
         /xwDg4Dvc3dJAH5Vl11HppYHMk9jyA/b7peTvJa8jRD7psu+NHtHi6j4m7Vxr137ypkc
         3EePfhwbIYRXQBYnEPcvkoNcdwauACv68A1UaINPKTtLfj+nHWyNnXJ0kZF5vYuGuuHk
         qCqW1CW5Sb3DZXZw+d/86NkInzsvVL5CoHTsNCSl33eusF/39xWrMogzxhCfdEA9BgAq
         Rxl/8YcIzdVgHGHog3P4xOqPIywCoK+s0rRWANvoXrJDmNddRT8wv7Ac+IZpot6fhKah
         sHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NAYGAJiN1ZYjSk2aXh/7Ifqmy+2+Cae3t1vPYJlsPH4=;
        b=lnGCA1FpVYPZQSAxjDj3KivDJqFUXfiG53rMTp+UdvG+s9idjBctUdv9tzWJAW3gm8
         zmmzlvWLaRiTTuty0yjHObtCbLkT/eyBPZbvCTdotnX16ObUPXGcCQucoWvQJ6Rh0iLb
         q0yeiFJmefVqk0PipNJguJvYx+gOz/eA4EIDxyCSi53ENvQFWyzEeRBGAAqDM4wrLI4J
         IpFK3aFktsiJLUllAQ4yR9CxLWVlHNpfkxUUQGsMH3sGH8w/6FrUZZJerN/NgXwcgI3z
         pT50PzbLshpk9s57dPCYWAfW2bSsqN5PONln3sVa/IsKtXpDUvbY03Nt+SKIf8KdWR/o
         u1VA==
X-Gm-Message-State: AOAM5302qnbB8B7vYNe8HvQ/Vr7rFMpCQ0WqagoEaA3nINWFT5O9pwAl
        50Vj/sfdclxYlJQU0rjBuW4mFsIOHn/iPw==
X-Google-Smtp-Source: ABdhPJwBQFgbqLG2n+beR63sv6dz9KgXWG0GGyx/HBqiz75rtndcHNAoShjZNAvE6D5+jbXB5Tg48w==
X-Received: by 2002:a17:906:6d56:: with SMTP id a22mr860824ejt.440.1594662470396;
        Mon, 13 Jul 2020 10:47:50 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id dn15sm10679094ejc.26.2020.07.13.10.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 10:47:49 -0700 (PDT)
Date:   Mon, 13 Jul 2020 19:47:47 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: gpio-omap: handle bias flag for gpio line
Message-ID: <20200713174747.GA1424108@x1>
References: <20200625002736.GA24954@x1>
 <CACRpkdYze_6cM0R=rr7RF8h5WO4GoCcz4=K1_XLt0PJNxCYtbw@mail.gmail.com>
 <20200712215630.GA1298162@x1>
 <20200713150220.GJ5849@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713150220.GJ5849@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 08:02:20AM -0700, Tony Lindgren wrote:
> Hi,
> 
> * Drew Fustini <drew@beagleboard.org> [200712 21:56]:
> > P2.03 header pin on PocketBeagle maps to gpiochip 0 line 23. It is PIN9
> > which value on boot: 0x37 (input [0x20] pull-up [0x10] gpio mode [0x7])
> > 
> > $ cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins |grep ^'pin 9' |head -1
> > pin 9 (PIN9) 44e10824 00000037 pinctrl-single
> > 
> > $ gpiomon -B pull-down 0 23
> 
> Nice it's getting quite close to a user usable feature :)
> 
> I think we really should have an easy way to use the dts configured
> GPIO line names here though. Can we make the dts configured GPIO
> line name show up in the pinctrl output directly?
> 
> This would allow grepping for the device specific GPIO line name
> directly in from the debugfs "pins" output.
> 
> But Ideally this should be done with the gpio sysfs interface though
> somehow rather than rely on pinctrl debugfs. The debugfs interface
> should be optional, and can change.
> 
> Regards,
> 
> Tony

There is gpio-ranges for pinctrl-single in debugfs:

debian@beaglebone:~$ sudo more /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/gpio-ranges
GPIO ranges handled:
0: gpio-0-31 GPIOS [0 - 7] PINS [82 - 89]
8: gpio-0-31 GPIOS [8 - 11] PINS [52 - 55]
12: gpio-0-31 GPIOS [12 - 15] PINS [94 - 97]
16: gpio-0-31 GPIOS [16 - 17] PINS [71 - 72]
18: gpio-0-31 GPIOS [18 - 18] PINS [135 - 135]
19: gpio-0-31 GPIOS [19 - 20] PINS [108 - 109]
21: gpio-0-31 GPIOS [21 - 21] PINS [73 - 73]
22: gpio-0-31 GPIOS [22 - 23] PINS [8 - 9]
26: gpio-0-31 GPIOS [26 - 27] PINS [10 - 11]
28: gpio-0-31 GPIOS [28 - 28] PINS [74 - 74]
29: gpio-0-31 GPIOS [29 - 29] PINS [81 - 81]
30: gpio-0-31 GPIOS [30 - 31] PINS [28 - 29]
0: gpio-32-63 GPIOS [32 - 39] PINS [0 - 7]
8: gpio-32-63 GPIOS [40 - 43] PINS [90 - 93]
12: gpio-32-63 GPIOS [44 - 59] PINS [12 - 27]
28: gpio-32-63 GPIOS [60 - 63] PINS [30 - 33]
0: gpio-64-95 GPIOS [64 - 81] PINS [34 - 51]
18: gpio-64-95 GPIOS [82 - 85] PINS [77 - 80]
22: gpio-64-95 GPIOS [86 - 95] PINS [56 - 65]
0: gpio-96-127 GPIOS [96 - 100] PINS [66 - 70]
5: gpio-96-127 GPIOS [101 - 102] PINS [98 - 99]
7: gpio-96-127 GPIOS [103 - 104] PINS [75 - 76]
13: gpio-96-127 GPIOS [109 - 109] PINS [141 - 141]
14: gpio-96-127 GPIOS [110 - 117] PINS [100 - 107]

Do you mean you would like to see the mapping added as a column in the pins file?

debian@beaglebone:~$ sudo cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins  |head
registered pins: 142
pin 0 (PIN0) 44e10800 00000027 pinctrl-single
pin 1 (PIN1) 44e10804 00000027 pinctrl-single
pin 2 (PIN2) 44e10808 00000027 pinctrl-single
pin 3 (PIN3) 44e1080c 00000027 pinctrl-single
pin 4 (PIN4) 44e10810 00000027 pinctrl-single
pin 5 (PIN5) 44e10814 00000027 pinctrl-single
pin 6 (PIN6) 44e10818 00000027 pinctrl-single
pin 7 (PIN7) 44e1081c 00000027 pinctrl-single
pin 8 (PIN8) 44e10820 00000027 pinctrl-single

So that could be:

debian@beaglebone:~$ sudo cat /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single/pins  |head
registered pins: 142
pin 0 (PIN0) 44e10800 00000027 pinctrl-single GPIO-32
pin 1 (PIN1) 44e10804 00000027 pinctrl-single GPIO-33
pin 2 (PIN2) 44e10808 00000027 pinctrl-single GPIO-34
pin 3 (PIN3) 44e1080c 00000027 pinctrl-single GPIO-35
pin 4 (PIN4) 44e10810 00000027 pinctrl-single GPIO-36
pin 5 (PIN5) 44e10814 00000027 pinctrl-single GPIO-37
pin 6 (PIN6) 44e10818 00000027 pinctrl-single GPIO-38
pin 7 (PIN7) 44e1081c 00000027 pinctrl-single GPIO-39
pin 8 (PIN8) 44e10820 00000027 pinctrl-single GPIO-22

Should I try to add that in pcs_pin_dbg_show()?

It currently prints:

        seq_printf(s, "%zx %08x %s ", pa, val, DRIVER_NAME);

so I could change that to include the GPIO number if mapping exists.


thanks,
drew
