Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758F26EAA1D
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 14:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbjDUMPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 08:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbjDUMPw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 08:15:52 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8917D9E;
        Fri, 21 Apr 2023 05:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=/+HAMTLY1slOoSg5bxA5tskDuARnfGnh1XOqXBWDAu8=; b=Bdvzmpp3kCAYe3vDQWS00VV3zL
        6xhsBF7qYaPEy+/bVU/AN+i5/yTJsgbHiv0OEReCYnOXsneZ98CYKfmld7ZPc6H66MMuAoOcg74ls
        WplG7BrIvLhuEc41g2jU440hsniU8+lW6PPQE4pF1uMh7J+PgU43qCuQpfaQWNAr5FSQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pppfz-00AsiX-TT; Fri, 21 Apr 2023 14:15:43 +0200
Date:   Fri, 21 Apr 2023 14:15:43 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        olteanv@gmail.com, mengyuanlou@net-swift.com,
        'Jarkko Nikula' <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH net-next v3 2/8] i2c: designware: Add driver support for
 Wangxun 10Gb NIC
Message-ID: <4600d755-3bbf-4906-9f23-4e91cfc01c12@lunn.ch>
References: <20230419082739.295180-1-jiawenwu@trustnetic.com>
 <20230419082739.295180-3-jiawenwu@trustnetic.com>
 <ec095b8a-00af-4fb7-be11-f643ea75e924@lunn.ch>
 <03ef01d97372$f2ee26a0$d8ca73e0$@trustnetic.com>
 <72703dc2-0ee1-41b2-9618-2a3185869cbf@lunn.ch>
 <03f501d973f7$d0c889a0$72599ce0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03f501d973f7$d0c889a0$72599ce0$@trustnetic.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 21, 2023 at 10:20:17AM +0800, Jiawen Wu wrote:
> On Thursday, April 20, 2023 9:23 PM, Andrew Lunn wrote:
> > On Thu, Apr 20, 2023 at 06:29:11PM +0800, Jiawen Wu wrote:
> > > On Thursday, April 20, 2023 4:58 AM, Andrew Lunn wrote:
> > > > On Wed, Apr 19, 2023 at 04:27:33PM +0800, Jiawen Wu wrote:
> > > > > Wangxun 10Gb ethernet chip is connected to Designware I2C, to communicate
> > > > > with SFP.
> > > > >
> > > > > Add platform data to pass IOMEM base address, board flag and other
> > > > > parameters, since resource address was mapped on ethernet driver.
> > > > >
> > > > > The exists IP limitations are dealt as workarounds:
> > > > > - IP does not support interrupt mode, it works on polling mode.
> > > > > - I2C cannot read continuously, only one byte can at a time.
> > > >
> > > > Are you really sure about that?
> > > >
> > > > It is a major limitation for SFP devices. It means you cannot access
> > > > the diagnostics, since you need to perform an atomic 2 byte read.
> > > >
> > > > Or maybe i'm understanding you wrong.
> > > >
> > > >    Andrew
> > > >
> > >
> > > Maybe I'm a little confused about this. Every time I read a byte info, I have to
> > > write a 'read command'. It can normally get the information for SFP devices.
> > > But I'm not sure if this is regular I2C behavior.
> > 
> > I don't know this hardware, so i cannot say what a 'read command'
> > actually does. Can you put a bus pirate or similar sort of device on
> > the bus and look at the actual I2C signals. Is it performing one I2C
> > transaction per byte? If so, that is not good.

....

> You may have misunderstood. If you want to read a 16-bit message, the
> size of 'i2c_msg.len' is set to 2 in the array that 'flags = I2C_M_RD'.

The SFP driver uses a mixture of message lengths, due to SFP bugs. But
in general it will do 16 byte block reads, except for when it needs
smaller quantity of bytes.

However, your wording was:

> > > Every time I read a byte info, I have to write a 'read command'.

This suggests you are reading one byte at a time with each read
command. I just want to make sure that is not one I2C transaction per
byte.

     Andrew.
