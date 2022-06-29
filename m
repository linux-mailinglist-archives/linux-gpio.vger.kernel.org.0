Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86F455FE72
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiF2LZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 07:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiF2LZZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 07:25:25 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B8B36328
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:25:24 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so15710292pjv.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gVY6u58EznpOpzvOx/UArCDuJf9Rpm2Z/0RdvG/ZYqE=;
        b=aQIOWP9dDYn7viGCtNA5bv7GV/nkMDiM2pIshF5asL/GrclG2HS3CilQGBqdS+BuC7
         pU29KPhrw5SML3Ru0EX6dDJK6iFbiJftI84G3BhTnDfF8FQUkFqegqy9aqczWjom9JuR
         8qyK6rXvymiy3rE6b/Ra+PYYI9BKqxzVUWwzuz1P1WF5O+aWxLzhmg2JUqFa3815FBJu
         HIYW0U2Qxl2ecDcTQuqx9TwedDHuQB+/N8PoEFwxUb5T6IMQ2vi55X0tmi4v9I/3hNkE
         GuwJfB+gB5GsYQLixVzEQzkoRcQFMQA3vFhBUOSmxFYRK8h7RAz6eisFXgHSGr6XNvhW
         TahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gVY6u58EznpOpzvOx/UArCDuJf9Rpm2Z/0RdvG/ZYqE=;
        b=DLp0oTeXpJtNvv/ZQrjgj5gLqHr0+zp100T+wfo9sGLpQB4wZjYVWgF977hjl2MMyf
         bvMsfrGj64yk+JPMhSRnc0MnmjmC+zReqLzYm6ji1ZA8GxC+MwKXmfGhjoQ3Edu913U5
         gEy2xmfZWZ4NaJTY9iaVYDuQTVq5aOLEsq6vt5iQT3Lx6AUqJXc5fM69I6vxJosHgpww
         SPj4D4ZK1VbHbb22uwcDMrSia24mPa695Eq/h7Vwo59tggJAC9U8bS6cQ5T8jdFhgwa0
         wSjr6UFh3tzu/1k1fNOCJDR/mBhynnQDOVcTwU8KDn6M2nHwPMb7Y2EGAS15wfg/gp/t
         Y0DA==
X-Gm-Message-State: AJIora+312Wt0WmMsYqypFb1jI/+sAcTHOu9JwtsI3bFr0ro+me36Aue
        3zSBnoKx91WRbBcMfcZOSUWAllE5zfw=
X-Google-Smtp-Source: AGRyM1vPnNa9879bJU4MX4D73z44PgpBMQVlMG1XCUM3/6Eb+1XTlj14KCMvGYKDroK1oSN3extrTA==
X-Received: by 2002:a17:902:d2d1:b0:16a:1dd9:4d3d with SMTP id n17-20020a170902d2d100b0016a1dd94d3dmr10003056plc.18.1656501924312;
        Wed, 29 Jun 2022 04:25:24 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id u27-20020a62d45b000000b0050dc7628148sm11267647pfl.34.2022.06.29.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 04:25:23 -0700 (PDT)
Date:   Wed, 29 Jun 2022 19:25:19 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] feature request: output state read and sustain
Message-ID: <20220629112519.GA30910@sol>
References: <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol>
 <b8d63150-cd1d-692a-9470-d75278135350@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8d63150-cd1d-692a-9470-d75278135350@aksignal.cz>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 01:17:54PM +0200, Jiří Prchal wrote:
> 
> 
> On 29. 06. 22 12:47, Kent Gibson wrote:
> > On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> > > On Wed, Jun 29, 2022 at 11:27 AM Jiří Prchal <jiri.prchal@aksignal.cz> wrote:
> > > > On 29. 06. 22 9:23, Kent Gibson wrote:
> > > > > On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
> > > 
> > > > > > using new libgpiod / chardev driver, is there any way to get state of
> > > > > > output? I mean one process sets it for example to 1 and another process
> > > > > > reads this output state for example to show that on web page.
> > > 
> > > I'm not sure it's guaranteed to read output back. Some (b0rken?) GPIO
> > > chips may not allow this on H/W level and when reading they always
> > > will get the value of Input Buffer (now imagine if the line is
> > > configured as Output with Input being disconnected from the physical
> > > pin).
> > > 
> > 
> > Agreed.  Userspace should know the value they set the output to, and so
> > have no need to read it back.  GPIO is not NVM.
> Not NVM, bat RAM and it keeps their data untill reset, after reset it has specific value (usually 0)
> I haven't seen HW without possibility of reading back output register, but I don't say there couldn't be such one.
> 

No, no it is not RAM.

And I have seen hardware where you can't read back the output.
And so has Andy apparently.
That is the problem - there is lots of hardware out there and we are
trying to provide a consistent interface to inconsistent hardware.

Cheers,
Kent.
