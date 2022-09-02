Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D315AB4C8
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 17:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbiIBPOh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Sep 2022 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbiIBPOL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Sep 2022 11:14:11 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AC8DA3F3
        for <linux-gpio@vger.kernel.org>; Fri,  2 Sep 2022 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AO8KeFGumuDOkycAFRx7cX+B9R2KpEIhnAOpRbm75m8=; b=zTcjenlKl0V1uJJsEZtvWxtTfP
        FO1MKH34JkqWzIfWIjCrecm6E4G6F3qipp0RzVfRPVCMfBuhsuB3Zeq+gGB9YzXFOhv8qiX2nlhuz
        21Is4EWsFDrgQ6TfzU5wjUTMaFZ7pno7R2fih2iebRCkf1YSKGwe4msO73S4XcxvSr8CA9UnZys4X
        H1/LpdF4eI4AC0i5KUsd45kZUrGIreX3+RcxjUDrpf+vgKou9O0NbU9p/MrOqCt6zgAaD/jmX3l7X
        qms36iYXKRPuNFHhP1wX3Td0ZyM1SJXFhJoEgxjFdhc4uNrfL0MrM6F6SUAmbBPCH5Yj72w2xdibS
        jHKC1IOQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34066)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oU7vO-0007bt-E9; Fri, 02 Sep 2022 15:45:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oU7vK-0004Vp-9A; Fri, 02 Sep 2022 15:45:34 +0100
Date:   Fri, 2 Sep 2022 15:45:34 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Message-ID: <YxIXDrP7XN5r1hCs@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <FEE9F7AE-B324-4426-AB26-17BDF30CFC91@cutebit.org>
 <CAHp75Vd8-mOuJvr=PRKjVKbz0SM9hPe39rEcraOMJFYtrwHjng@mail.gmail.com>
 <3B649A66-8116-432D-B88A-B5CE493EF930@cutebit.org>
 <CAHp75VeB3_sZ2vsSxMSsLeJSkyemDh9iOPHXJCN1mhodA13LNQ@mail.gmail.com>
 <E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org>
 <CAHp75VdstDxcZ96d3XD=k8_q2oP3UvoL+QV-27BxWFyALWJ_QQ@mail.gmail.com>
 <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85AE2F3E-6A1D-4AA0-9205-3E3DE5C6D79F@cutebit.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 02, 2022 at 03:37:27PM +0200, Martin Povišer wrote:
> 
> > On 2. 9. 2022, at 15:33, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > 
> > On Fri, Sep 2, 2022 at 2:12 PM Martin Povišer <povik@cutebit.org> wrote:
> >>> On 2. 9. 2022, at 12:23, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >>> On Fri, Sep 2, 2022 at 12:47 PM Martin Povišer <povik@cutebit.org> wrote:
> >>>>> On 2. 9. 2022, at 8:31, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >>>>> On Fri, Sep 2, 2022 at 12:52 AM Martin Povišer <povik@cutebit.org> wrote:
> > 
> > ...
> > 
> >>>>> I don't see why we need that. The %.4s (0x%08x) is repeating that with
> >>>>> the existing codebase. (I do understand why v4l2/drm have it). Ideally
> >>>>> the first should use %4pE, but it might not be suitable in some cases.
> >>>> 
> >>>> Just from a superficial understanding of things: %p4ch on little-endian
> >>>> will print in a reversed order to %.4s. As I see it the handling of
> >>>> endianness is the value proposition of the new specifiers.
> >>> 
> >>> So, what prevents you from adding this to %pE?
> >>> The preferred way is not adding a specifier for a single user with a
> >>> particular case, esp. when it's covered by the existing ones.
> >> 
> >> Adding the endianness conversion into %pE as, ehm, an ‘escaping flag’?
> >> If you think that would be accepted...
> >> 
> >> I guess this was added on the assumption that keys like this will
> >> be a common occurrence in interaction with Apple firmware. Though
> >> greping the ‘asahi’ staging tree for ‘%p4ch’ I only see it in the
> >> SMC code (9 times):
> >> 
> >> ./drivers/power/reset/macsmc-reboot.c
> >> ./drivers/platform/apple/smc_core.c
> >> ./drivers/gpio/gpio-macsmc.c
> > 
> >>>> %p4ch - interpret as an u32, print the character in most significant byte first
> >>> 
> >>> %.4s + be32_to_cpu()
> >> 
> >> Well, AIUI instead of
> >> 
> >>  printk(“%p4ch = ...\n”, &key);
> >> 
> >> you need to do
> >> 
> >>  u32 key_be = cpu_to_be32(key);
> >>  printk(“%.4s = ...\n”, &key_be);
> >> 
> >> in at least 9 places now, the number of which will probably grow.
> >> Just to make the case for *some* printk helper.
> > 
> > Wouldn't this be one line
> > 
> >  printk(“%.4s = ...\n”, &cpu_to_be32(key));
> > 
> > ?
> 
> That would compile? I thought that’s not valid C, taking an
> address of function’s return value.

It isn't legal C.

int foo(int bar);

int blah(int *v);

int test(int v)
{
        return blah(&foo(v));
}

t.c: In function ‘test’:
t.c:7:14: error: lvalue required as unary ‘&’ operand

And just to make sure that it's not just my test that is wrong, and
there's something magical about cpu_to_be32()...

In file included from include/linux/device.h:15,
                 from drivers/gpio/gpio-macsmc.c:11:
drivers/gpio/gpio-macsmc.c: In function 'macsmc_gpio_probe':
drivers/gpio/gpio-macsmc.c:356:49: error: lvalue required as unary '&' operand
  356 |  dev_info(smcgp->dev, "First GPIO key: %.4s\n", &cpu_to_be32(key));
      |                                                 ^
include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
  110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
      |                       ^~~~~~~~~~~
drivers/gpio/gpio-macsmc.c:356:2: note: in expansion of macro 'dev_info'
  356 |  dev_info(smcgp->dev, "First GPIO key: %.4s\n", &cpu_to_be32(key));
      |  ^~~~~~~~
make[3]: *** [scripts/Makefile.build:249: drivers/gpio/gpio-macsmc.o] Error 1
make[2]: *** [scripts/Makefile.build:466: drivers/gpio] Error 2
make[1]: *** [Makefile:1843: drivers] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:219: __sub-make] Error 2

So, sorry Andy, but this suggestion does not appear to be legal C.

This also applies to your suggestion in the other sub-thread of:

         ret = hex2bin(&result, (char *)&cpu_to_le16(key), 1);

As we've now discovered that this is not legal C, can we back up *both*
discussions and start again on these points.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
