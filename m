Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DCF613E53
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 20:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiJaTfD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 15:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiJaTfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 15:35:02 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57BC13DF1
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nDxYWCtghrxrph0I3dNOlyeYup/Mq2sFBuYqjAijQQ0=; b=z8pvQUmaHCUvWyJuon0yfDGUvv
        qw6AIOBJ8T0GOh3g0ZgVYdekhXIRnbL0qKUSFRdB2+gfKt/wwV10j/BrGSZ2ZJsA72yCwEaVuCd1f
        nR9DpEJbUSXyvwPDfooKqMZjm9Hq3sGZXU7q2pIetPThxGddSo2jPhB4TUfEIXq/5Kx8f/T8NHVgJ
        Q7pAqCrfblbfN8cMWC/mkV0df0NsGtuZ4ggBTC9/5BS2KbASk32cY4Ibnm75oKQasAKoSEWq2vKOF
        g8GuK5cyVkD/uAxL6LZO73MV0tx5tcdkHliZhI0m9DtVNI3vv8ks0CfI+v17XyLFHtwvnpA++IxZ5
        zydnnbkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35052)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1opaYY-0003Mc-VG; Mon, 31 Oct 2022 19:34:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1opaYW-0005hr-0d; Mon, 31 Oct 2022 19:34:44 +0000
Date:   Mon, 31 Oct 2022 19:34:43 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Lee Jones <lee@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
Message-ID: <Y2AjUz9eGa/GLY5s@shell.armlinux.org.uk>
References: <8f30a490-f970-6605-20cb-c2256daab9de@marcan.st>
 <Yxnv2mKkl1tW4PUp@google.com>
 <82088b05-2a0d-69cc-ba2c-d61c74c9d855@marcan.st>
 <YxrwLwVihe/s9wxN@google.com>
 <a92ca9ac-fbc8-a25f-4865-5bc7adb206e2@marcan.st>
 <Y1+LzpEvVj7xswqb@google.com>
 <dcd692aa-1525-4fc5-5198-37f803725c4f@marcan.st>
 <Y1+VdnmMUfIKTwWF@google.com>
 <4faa5e4c-b43b-12e4-2259-c2595bd55b97@marcan.st>
 <Y2AEgIfURNhCgimr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2AEgIfURNhCgimr@google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 31, 2022 at 05:23:12PM +0000, Lee Jones wrote:
> I see that you pass a bunch of function pointers from the RTKit
> implementation into the SMC.  Which in turn offers an exported
> (apple_smc_*) API.  In most of the frameworks I have knowledge of, the
> core provides the Ops structure and it's populated by the client
> device.

Sorry Lee, I don't get this point. From what I can see, the
apple_smc_backend_ops struct is owned by the core System Management
Controller code, and RTKit backend fills in an instance of these ops
and provides that to the core SMC code. The RTKit backend is just
how we walk to the System Management Controller. It is not a client.

I don't see this being any different to struct file_operations,
seq_operations, vm_operations_struct, block_Device_operations,
and so on and so forth.

Having read your response, I wonder if you're confused about what the
smc_core and smc_rtkit code actually are - because you seem to think
that smc_rtkit is a _client_ of the smc_core code. It isn't, as I
explain above, it's how we talk to the System Management Controller,
and smc_core provides a uniform interface to the client drivers such
as GPIO, RTC etc.

Essentially, we have:

Hardware   Backend    Core             Clients
                                 .---- RTC
                                / .--- GPIO
Mailbox -- RTKit -- SMC Core -- MFD -- HID
                                \ `--- Power
                                 `---- Reboot

RTKit is just _one_ possible backend, there are other backends that
can be used to interface to the underlying platform implementation to
talk to the SMC.

> I'm sure having that clear in my head will go some ways to put me in a
> position to advise you further.
> 
> > > Request the device-wide memory (and other shared resources) here.
> > 
> > That's what smc_rtkit.c does, but you seem not to want that code in mfd.
> 
> I'm not sure I explicitly said that.

On Fri, Sep 09, 2022 at 08:50:07AM +0100, Lee Jones wrote:
| If we were to design and build it up again from scratch, I'd suggest
| that the MFD part would be the core-driver / entry-point.  That driver
| should request and initialise shared resources and register the other
| devices, which is essentially the MFD's mantra.

This is exactly what smc_rtkit is doing, which as I've mentioned above
is the backend provider of access to the System Management Controller.
Backend-independent access to the System Management Controller is done
via smc_core which - at least to me - seems to be entirely correct,
and it seems entirely appropriate that this should be responsible for
creating the individual clients that make use of the System Management
Controller's facilities such as GPIO, RTC etc.

> "call into" was not a good choice of words here.  Simply, let the
> child devices go about their business and do whatever they were
> designed to do.

... by calling into the code which provides them with access to the
System Management Controller - that being through smc_core and
ultimately which ever backend is used to finally communicate with the
System Management Controller.

At this point, I'm wondering whether you're somehow expecting client
devices to map memory and read/write some registers. This is not that
kind of setup. The address space is entirely virtual, through a set
of four byte keys that indicate to the System Management Controller
which fine-grained resource one wants to access. That being an
individual GPIO line or some other parameter of the system.

The memory that you see smc_rtkit claim is for passing messages, none
of the clients have a right to directly access that memory - indeed,
doing so would be a total layering violation and really bad bit of
design.

So, I hope my response helps fill in some of the detail about what
this code is doing, how it works and how it's been designed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
