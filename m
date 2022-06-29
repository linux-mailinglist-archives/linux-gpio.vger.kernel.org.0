Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C12655FDBF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 12:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbiF2KsF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 06:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiF2KsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 06:48:04 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6D23E5CF
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:48:03 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c4so13727679plc.8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kpPBoW89jivDTU3P1qN6do8XBF3oipFLpsFbYDrEKak=;
        b=jVpseK4NV5nOqBibnGggrzV+Za6zY4VBk3AdHfm/wQte1SI/CZpm13UUdX4Gsjw0po
         arL1Esgcl8fSZGWmCWf9jnckehSz5YDcZ5IdNEQg+MpB7HzXid0BONhz8mF1okNBmrUi
         GIeMbH6tNCWFjmc+Zvq3yHceGqJ7IaVa2Gtd3MZ3LBMeAtsm0Am/jQePPseEpJOL2dUi
         Y6/WIir7852JBjMq2c3Kl45AD3DqQqZEZyaYg/tgGH3sa3TPTeWpby4nCVYXafgOeWev
         fwFrxypELElH2KwrbDMib4B/lpT/Fcd5zggOU3bikt2JElRxRkFUyddtjWcICLLrICNZ
         tJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kpPBoW89jivDTU3P1qN6do8XBF3oipFLpsFbYDrEKak=;
        b=W7DhXUmtdLZ0xsDBhPRRBhYE1ZmGbKJczn59scGkwG1Uqd6Sop7SAN1U1qog5hC+Dx
         9ejAFCwY0r5s9j11kUtKmNPfrT0fUyoxYmzP9j+oqa80PkYGNwz4/ffzlwscVt5uJrvA
         q0pN2XWMhinO4cfHuGoAFOvD7A3gtp2E0TEOnoqBF5bz82A0I7nAeKkeO3kxqHgswglT
         luLzpvM+QNj+Iw2qyot+oOJt1nOtrbajXgYGWlO9NnLBbauNvpLVFQQubt8slbXer07f
         4h6CnWp8kSyhGiG3OuRNmoCy3UcmCnGtXpAs0KqSiysYNyRC4SVhzw3Wd7N2809cB1ad
         3ZFA==
X-Gm-Message-State: AJIora8Xi76FeeD8cuL6+X/hKbD4XSL/yiA+RKeewwnPTPIIjdfZrAhu
        +BFpRafx2trZyjrySqS6zPbHqabRDQ4=
X-Google-Smtp-Source: AGRyM1sbWw5Db9RDk5p3hnQCLtD9krS5ELfW78xubQh1Z6MsOtuVjrfxvnjfFbyXWtjjcsEF5psCLA==
X-Received: by 2002:a17:902:e5cd:b0:16a:6f96:eb9 with SMTP id u13-20020a170902e5cd00b0016a6f960eb9mr8852431plf.69.1656499682595;
        Wed, 29 Jun 2022 03:48:02 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id l6-20020a170903120600b0016a0bf0ce32sm1800816plh.70.2022.06.29.03.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 03:48:02 -0700 (PDT)
Date:   Wed, 29 Jun 2022 18:47:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?utf-8?B?SmnFmcOt?= Prchal <jiri.prchal@aksignal.cz>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] feature request: output state read and sustain
Message-ID: <20220629104757.GA29289@sol>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
> On Wed, Jun 29, 2022 at 11:27 AM Jiří Prchal <jiri.prchal@aksignal.cz> wrote:
> > On 29. 06. 22 9:23, Kent Gibson wrote:
> > > On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
> 
> > >> using new libgpiod / chardev driver, is there any way to get state of
> > >> output? I mean one process sets it for example to 1 and another process
> > >> reads this output state for example to show that on web page.
> 
> I'm not sure it's guaranteed to read output back. Some (b0rken?) GPIO
> chips may not allow this on H/W level and when reading they always
> will get the value of Input Buffer (now imagine if the line is
> configured as Output with Input being disconnected from the physical
> pin).
> 

Agreed.  Userspace should know the value they set the output to, and so
have no need to read it back.  GPIO is not NVM.

The only time it makes sense to me to go to the hardware for output
values is for open-drain outputs, but as you say, even then it would
depend in the hardware and driver supporting it. And for those cases it
might be better to explicitly emulate open-drain and switch the line to
an input when not being actively drive.

> > >> I have to say that old sysfs interface was more user friendly...
> 
> And much more buggy and PITA.
> 
> > > "new" being anything since Linux 4.8 ;-)?
> > > And strictly speaking it isn't a driver - libgpiod and the GPIO subsystem
> > > provide an interface to the chip driver.  More on that later.
> > >
> > > Only the process holding the line has access to the current value.
> > > If you need that value elsewhere then it has to be published by that
> > > process - it is not available through the GPIO API itself.
> > > There is nothing preventing that process publishing the value
> > > in whatever way is appropriate to your application.
> > > e.g. write it to a file that can be read by your webapp, just as it
> > > would from sysfs.
> > >
> > > Less restrictive access models are frequently "more user friendly", but
> > > have other issues. e.g. some misbehaving process just reset your
> > > modem for you.
> > >
> > > And sysfs has other great features like being slow and being complete
> > > rubbish for events on input lines.
> > >
> > >> And at second: it would be better to NOT "the state of a GPIO line
> > >> controlled over the character device reverts to default when the last
> > >> process referencing the file descriptor representing the device file exits."
> > >> "Set and forget" behavior is more natural to what some gpios are used. For
> > >> example resetting external modems, need set 1 for short time, then to 0 and
> > >> leave it for long long time until next reset is needed. It's non sense to
> > >> keep running some process only to keep output at 0.
> > >
> > > Agreed, that might be more natural, but that behaviour is not by choice,
> > > it is a consequence of the kernel internals.  In short, if the GPIO
> > > subsystem does not hold the chip then the driver is free to do what it
> > > likes to it.
> > > So when you release a line all bets are off.
> > > It may stay where you left it, but it may not - it may even switch to an
> > > input - it depends on the driver.
> > Does it mean that without changing this particular line it could be changed? For example by setting another line in chip?
> 
> No, it's only about the line in question.
> 
> > > If it works for you that's great, but without major kernel changes
> > > libgpiod has no better option than to provide the caveat as the "set and
> > > forget" behaviour is something that it cannot guarantee.
> > Than is only way to write my own user space driver simulating sysfs? Or what is the right way of this scenario:
> > start proces -> gpioset =1 -> sleep -> gpioset =0 -> do other things
> > when the proces dies systemd will start it again
> 
> Do not use shell. Use proper programming language that may give you an
> easier way of handling this, i.e. _context_. Shell tools are
> _context-less_ and here is the problem you are trying to solve, but
> from the wrong end.
> 

Actually my proposed gpioset for v2 will support running interactively
so it can maintain context and be driven from shell - for cases where
basic scripting will suffice.

Cheers,
Kent.
