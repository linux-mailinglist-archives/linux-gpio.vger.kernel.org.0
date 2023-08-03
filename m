Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF49476F0EE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 19:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbjHCRyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 13:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjHCRyK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 13:54:10 -0400
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855D810B;
        Thu,  3 Aug 2023 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:Mime-Version:
        References:In-Reply-To:Message-Id:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=vLgARTlyjbNGHDyn3Y334/21maDS9pB32/FVqFe4D7c=; b=CeyW8WwrfML0AMayYgmxySJPaP
        4uaIVuOaRuPbviAOwFGxLPJkLUQ5epOe7TRAos4OLhYy6h3V32akcHBST5/1f6OgTRrBGMaeDthPP
        QJhHc5ApKOajOCL+ur6+bEUTUK4t0EkXahzY5lpi+SGt8VXTq0LRRspHUeMTmXG6KFVA=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:53090 helo=pettiford)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1qRcWQ-0002nV-1W; Thu, 03 Aug 2023 13:54:02 -0400
Date:   Thu, 3 Aug 2023 13:54:01 -0400
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     Hugo Villeneuve <hugo@hugovil.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jirislaby@kernel.org, jringle@gridpoint.com,
        isaac.true@canonical.com, jesse.sung@canonical.com,
        tomasz.mon@camlingroup.com, l.perczak@camlintechnologies.com,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        stable@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Lech Perczak <lech.perczak@camlingroup.com>
Message-Id: <20230803135401.3a11bfb7c2985c1a90a2521b@hugovil.com>
In-Reply-To: <20230731144115.14733f0e01f586a7efb91370@hugovil.com>
References: <20230721161840.1393996-1-hugo@hugovil.com>
        <20230721161840.1393996-7-hugo@hugovil.com>
        <CAL_JsqJpdhtnZ8FcM7kGWnM+iuDs1fWiCVgf413evbw-o8TZGQ@mail.gmail.com>
        <20230722104724.ef0c5896c239e721794b9fe9@hugovil.com>
        <2023072240-supremacy-shallot-a77f@gregkh>
        <20230724115428.d191186852c0bd0ee0d78398@hugovil.com>
        <CAL_JsqL8rjwONd6UAitKik0U44BKSD6m8zbachgfq0R9oHBW8w@mail.gmail.com>
        <20230731124600.39eb8d5c132f9338c2897543@hugovil.com>
        <CAL_JsqLaF70hNQndXpJfmH1TMGNbA7myQG0GK9fjyKOs63z-3w@mail.gmail.com>
        <20230731144115.14733f0e01f586a7efb91370@hugovil.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [RESEND PATCH v8 06/10] serial: sc16is7xx: fix regression with
 GPIO configuration
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 Jul 2023 14:41:15 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> On Mon, 31 Jul 2023 12:04:45 -0600
> Rob Herring <robh+dt@kernel.org> wrote:
> 
> > On Mon, Jul 31, 2023 at 10:46 AM Hugo Villeneuve <hugo@hugovil.com> wrote:
> > >
> > > On Mon, 31 Jul 2023 09:31:53 -0600
> > > Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > > On Mon, Jul 24, 2023 at 9:54 AM Hugo Villeneuve <hugo@hugovil.com> wrote:
> > > > >
> > > > > On Sat, 22 Jul 2023 17:15:26 +0200
> > > > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > > On Sat, Jul 22, 2023 at 10:47:24AM -0400, Hugo Villeneuve wrote:
> > > > > > > On Fri, 21 Jul 2023 13:24:19 -0600
> > > > > > > Rob Herring <robh+dt@kernel.org> wrote:
> > > > > > >
> > > > > > > > On Fri, Jul 21, 2023 at 10:19 AM Hugo Villeneuve <hugo@hugovil.com> wrote:
> > > > > > > > >
> > > > > > > > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > > > > > >
> > > > > > > > > Commit 679875d1d880 ("sc16is7xx: Separate GPIOs from modem control lines")
> > > > > > > > > and commit 21144bab4f11 ("sc16is7xx: Handle modem status lines")
> > > > > > > > > changed the function of the GPIOs pins to act as modem control
> > > > > > > > > lines without any possibility of selecting GPIO function.
> > > > > > > >
> > > > > > > > Requiring a new DT property is not fixing a kernel regression. You
> > > > > > > > should be returning the kernel to original behavior and then have a
> > > > > > > > new DT property for new behavior.
> > > > > > >
> > > > > > > Hi Rob,
> > > > > > > please read the entire patch history starting from V1
> > > > > > >  and you will understand why this course of action was
> > > > > > >  not selected.
> > > > > >
> > > > > > That's not going to happen, sorry, you need to explain it here, in this
> > > > > > patch series, why a specific action is being taken over another one, as
> > > > > > no one has time to go dig through past history, sorry.
> > > > >
> > > > > Hi Rob,
> > > > > I initially submitted a patch to revert the kernel to original
> > > > > behavior, but it created more problems because the patch was
> > > > > unfortunately split in two separate patches, and mixed with other non
> > > > > closely-related changes. It was also noted to me that reverting to the
> > > > > old behavior would break things for some users.
> > > > >
> > > > > It was suggested to me by a more experienced kernel developer to
> > > > > "suggest a fix, instead of hurrying a revert":
> > > > >
> > > > >     https://lkml.org/lkml/2023/5/17/758
> > > >
> > > > Do I have to go read this to decipher the justification and reasoning?
> > > > When Greg says "in this patch series", he means in the commit messages
> > > > of the patches. You send v9 already and it doesn't have that. The
> > > > patchset needs to stand on its own summarizing any relevant prior
> > > > discussions.
> > > >
> > > > I never suggested doing a revert.
> > >
> > > Hi Rob,
> > > I am sorry, but this is exactly what I "deciphered" from your
> > > original email.
> > >
> > > I am trying very hard to understand exactly what you mean, but it is
> > > not that obvious for me. If something is not clear in my commit message,
> > > I will try to improve it. But before, let's try to focus on making sure
> > > I understand more clearly what you want exactly.
> > >
> > > > Obviously, someone still wants the
> > > > new feature.
> > >
> > > I assume that you refer to the "new feature" as what was added in
> > > the commit 679875d1d880 ("sc16is7xx: Separate GPIOs from modem control
> > > lines")?
> > 
> > Shrug. It's one of the 2 commits mentioned, I don't know which one
> > exactly. Whichever one changed default behavior from use GPIOs to use
> > modem ctrl lines.
> > 
> > Reading it again, I *think* this patch is correct. Default behavior is
> > restored to use GPIOs. The DT property is needed to enable modem ctrl
> > lines.
> 
> Hi,
> this is correct.
> 
> 
> > What's not okay is just saying, these platforms may or may not need an update:
> > 
> >     arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
> >     mips/boot/dts/ingenic/cu1830-neo.dts
> >     mips/boot/dts/ingenic/cu1000-neo.dts
> 
> Yes, my bad. I initially mentioned them and hoped to get some
> feedback, which I never got, and I kind of forgot about it.
> 
> > You need to figure that out. Have you checked with maintainers of
> > these boards? When were they added and by who? At the same time or by
> > the same person would be a good indication the platform uses modem
> > ctrl lines. Or were these platforms in use before adding modem ctrl
> > support? Then they probably use GPIOs or nothing.
> > 
> > If there are platforms which would regress if the modem ctrl feature
> > was just reverted, which ones are those?
> 
> Ok, let me do some checks and get back to you on this.

Hi Rob,
for this board:
    arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts

it uses a SC16IS740, which doesn't have any GPIOs nor modem
control lines, so no DT changes required.

For these two Ingenic boards:
    mips/boot/dts/ingenic/cu1830-neo.dts
    mips/boot/dts/ingenic/cu1000-neo.dts

They use a SC16IS752, which has shared modem control lines and GPIOs.
Unfortunately, the maintainers have not (yet) responded to my
inquiries. Also, I tried to search for schematics or block diagrams on
the net but couldn't find anything.

These platforms were in use before the patch to add the modem control
lines was added. Then like you said they probably use these shared
lines as GPIOs or nothing, so no DT changes would be required.

Hugo.
