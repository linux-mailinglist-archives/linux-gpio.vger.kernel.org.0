Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1289658CB11
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Aug 2022 17:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243386AbiHHPPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Aug 2022 11:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237846AbiHHPPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Aug 2022 11:15:00 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F91813DEF;
        Mon,  8 Aug 2022 08:14:59 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id ff27so3988399qtb.11;
        Mon, 08 Aug 2022 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sqwHoZyI0nAW0SRApfHLS4TOoPnFzxQogijC4oarbkA=;
        b=RdrSCf5K3BtTSd58oj9HeiBNouwy808krp8rZRuwmnq2A07GHYmllmtR94OHaf581D
         MexaJRfQjFzsfYY4zdwOvr3ooaILaMtZTBAREA1XvV7FdSlGC3lP+FvhrfwHnFJZtAII
         9bWJ/9dDftb2uHyxoM/OelPTmZZaIdlnfx8+PFpPO8AJRWyk9fy8OMkF3/Iq5R2M9Kux
         BUq/ASFpcDw9d8EjJ35gTCuBQG6eb4vtHa+0jUjLvLPWifFKilVaAd/pbktcfuXuAMJV
         o0OTvECBzXd5Dx7RS7JhEuvV+Yfskjt3CPqgf128CAicOUhUhkFOx82P7Cf3PtpToEHA
         9cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sqwHoZyI0nAW0SRApfHLS4TOoPnFzxQogijC4oarbkA=;
        b=R+x2MYq8V4wwQS5Nw26AeZnbgnJ1rSLhEsHiscltryZ7ufg3bO0OLxNrI7k45XMpQx
         W234d6S7xe2jSioAWNDZhPXeU01islgi9pyutM9TwABoyqdq7IDBdt5zqAYgEJhMZ+xt
         0pEz33MLOrhbpfMdcgujn7K5l34Ciy7vEw9tgpg5w14MLQYQqryb6uKm9q/eJpYggdNW
         X5uwJTTVvnCXxM6dqv4jy36M+zpijA7rtRgxfI70ow83dlTfScskn4AHIff9Hc6FPXY7
         2HBOBmQE/1qLk6E+TqKAWbXz7KONprQCovwMGn1GeNquZ5W0xZzIIrHECr9uvj8v5te3
         IXZQ==
X-Gm-Message-State: ACgBeo2h8o2g94zWqBwWj5ZBK05UI6dFBtljFh9qzT+J5nt+KCDcGE+0
        xOtNuDQzXTYXtnk8LlkXNRxY92HLQbrMEw9owno=
X-Google-Smtp-Source: AA6agR46NwCxVsICGfaQQFSPMT2ROIgrhC9vPQSzg4+a1hYbMtgvOwdpFPKWeUUFIwYCseM0iNVrRLdFiyrHn2AW1gA=
X-Received: by 2002:a05:622a:14d2:b0:341:9fcb:79a6 with SMTP id
 u18-20020a05622a14d200b003419fcb79a6mr16085201qtx.195.1659971698194; Mon, 08
 Aug 2022 08:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHvQdo1KEM=Adp3Wd0ckokAs86mmemJbK14xzZuk=zVe0weTUA@mail.gmail.com>
 <CAHp75Vfyw+3TwoAskD7ok=NaXmBL7A-ZSSxkTJ0ehDVCchq3wg@mail.gmail.com>
In-Reply-To: <CAHp75Vfyw+3TwoAskD7ok=NaXmBL7A-ZSSxkTJ0ehDVCchq3wg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Aug 2022 17:14:21 +0200
Message-ID: <CAHp75VfeuMAzqn6xkJSVyqYmaUR2qSH32DEOZY1VDAd3dqDk8g@mail.gmail.com>
Subject: Re: am335x gpiochip numbering changed after 5.10
To:     Johannes Pointner <h4nn35.work@gmail.com>
Cc:     Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 8, 2022 at 5:12 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Aug 8, 2022 at 1:41 PM Johannes Pointner <h4nn35.work@gmail.com> wrote:
> >
> > Hello,
> >
> > I just tried to upgrade a am335x based board from 5.10 LTS to 5.15 LTS
> > and this broke an application for me because the gpiochip numbering
> > changed:
>
> Don't we have somewhere in the documentation that the GPIO chip device

s/device//

The GPIO chip device name is something different to what you see in
the below dumps.

> name should be nothing except name. It seems to me you are relying on
> the name to be part of ABI, but it's not. The ABI is the real device
> behind no matter what name the associated character device has. To
> prevent objection, it's the same as for network cards (old) naming
> scheme when eth0 and eth1 can be swapped at boot time.
>
> > <= 5.10:
> > gpio0 == gpiochip0
> > gpio1 == gpiochip32
> > gpio2 == gpiochip64
> > gpio3 == gpiochip96
> >
> > > 5.10
> > gpio0 == gpiochip96
> > gpio1 == gpiochip0
> > gpio2 == gpiochip32
> > gpio3 == gpiochip64
> >
> > This is the same for /dev/gpiochipX
>
> Sure.
>
> ...
>
> > Did I configure something wrong or do I have to adjust the devicetree
> > for the board somehow?
>
> No, you have to write the application based on `libgpiod` or so with
> proper handling of the GPIO chips. Note, that if you run `gpiodetect`
> you will see the device instance names for your GPIO chips (IIRC it's
> called 'label' in the Linux kernel inside APIs) which should be unique
> and that is what your application should rely on.

-- 
With Best Regards,
Andy Shevchenko
