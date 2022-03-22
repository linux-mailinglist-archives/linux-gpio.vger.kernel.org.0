Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935034E43F8
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 17:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238962AbiCVQNh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 12:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235213AbiCVQNh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 12:13:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACA9131DFC
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:12:09 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w8so15845536pll.10
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B+sIl3bT1eNG0Oly9nCOu+5aB9xJz/hdmqRXf8J2ja4=;
        b=B7tWLjDXHUGG4tjf0FqJrFjaJQwITsf4lWnd4ZgvPHXtu1fCJW5Ag4jUgDsKtr/a/j
         Hj2FufnB4KOL05Nw1xTVpKbT2x/Aq8RZKS1ZTsv4KFm1vW08Ifxt6gN+21HB5fYNvgTL
         6fiBZ+ETy9KaYe0kiBzi+KCeWWWhqeocUlPKMitJ/QMgblpyeLQzq9lIY5PC53Nc6rNR
         bSfmgf77oGP3VD/vDwtNAbXqSLlm5w9yrC/8IFORXXx4slm0KNolaIt8AjePUmKSz6mH
         GKp+5wLzwYDGFxmkpsHgcjw/nfjMEnJVd4sphqC3+b3eGTWczukS0N8cvSRZMDKdUPFl
         JjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B+sIl3bT1eNG0Oly9nCOu+5aB9xJz/hdmqRXf8J2ja4=;
        b=ZBTQW9az22I43IUOoyEscWfYWrjqUiJ7H2Sl6dvJAJvZId7bCxkMm3nOXAvsetpIbc
         zHYvEgFeizjNqntYdyXkJT/5YHr3K1sYUZCnr358KQhffG6KYEuURja6lMy+UDaGe3Vm
         ZJ8Ty62rm5SnKRedfyI3b3aM6OZi6MttoxzRu13w2Gzqn3Z/9IXYqb6fx/rHPScsufBa
         O3YXwPWTC9nvpvBSXbPyWnLiAJy4L0g6dp8/FRW3qPJvSc6OSBPAV8ceUDCPjfeza+tl
         k5fSXoUJBGLqpPL1Heq+7t3dCRZ6AIfiKSdqS9wt+ogt4fo1Qz83e/jIRH/9hH+NNTuf
         eczg==
X-Gm-Message-State: AOAM531n4beDFUG9ag1j7docqsc023W+auC2HCg+xVaibjvJ4s6xuIve
        4wyDsCiaw1OA0ceX9wWDcoYnFFXU8r0WpQ==
X-Google-Smtp-Source: ABdhPJww6oceU34adw8jMc+Q0nWXrSg8eN/05wzcKpwwyui0rvhKGepgvXZjSuwdI7MFtr8um6U+6g==
X-Received: by 2002:a17:903:40cf:b0:154:6a5f:95c5 with SMTP id t15-20020a17090340cf00b001546a5f95c5mr8571842pld.100.1647965529119;
        Tue, 22 Mar 2022 09:12:09 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id o17-20020a056a0015d100b004fab5b95699sm3882832pfu.71.2022.03.22.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 09:12:08 -0700 (PDT)
Date:   Wed, 23 Mar 2022 00:12:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: gpiod: Set pullup for Input Line
Message-ID: <20220322161204.GC131091@sol>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
 <20220322005911.GA6650@sol>
 <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
 <154df196-d9d2-63dc-b5e4-b314933db4b2@gmail.com>
 <CAHp75Vf_H8cD839CgmkH=9Z5_Gf_y15+=N+B-0jDU6xTuQnGAQ@mail.gmail.com>
 <2884d1a0-4e4e-142f-0d3d-02d5e5e46466@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2884d1a0-4e4e-142f-0d3d-02d5e5e46466@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 10:39:00AM +0100, Hans Kurscheidt wrote:
> 
> Am 22.03.2022 um 09:50 schrieb Andy Shevchenko:
> > On Tue, Mar 22, 2022 at 10:39 AM Hans Kurscheidt <lve0200@gmail.com> wrote:
> > > Am 22.03.2022 um 09:36 schrieb Hans Kurscheidt:
> > > > Am 22.03.2022 um 01:59 schrieb Kent Gibson:
> > ...
> > 
> > > > Still 1 more question. I understand the sense of a Pull-up in Input
> > > > mode, but reading the code, I see that the Bias option exists as well
> > > > for gpioset (Output). What is the sense of this, and what does it do?
> > I guess we started providing OPEN SOURCE / DRAIN in libgpiod v2.0
> > (Bart or Kent may correct me), but you should get an idea why it may
> > be useful.
> > 
> > On top of that, the pin can be reconfigured from input to output and
> > vice versa at run-time. So, keeping a bias setting will allow not to
> > think about it when pin direction is switched, although I agree this
> > may not be a clean case to use.
> 
> Hi Andy,
> 
> Open Source/Drain is completely different from Pull_UP/DOWN! Open
> source/drain defines, which active element (transistor) is attached to the
> line, while pull_up/down defines, which passive element (resistor) is
> attached to the line. In some sense one could say, what pull_up/down is for
> input, open drain/source is the corresponding thing for output, but they are
> realized by different means. IMHO, "bias" (pull-up/down) should be an option
> for gpioget, while "drive" makes only sense for gpioset, because I
> understand them as mutually excluding, but may be, I'm overseeing something.
> 

You understand that with open drain/source there is one state where the
line is not driven by the chip, but goes high impedance and is driven
by the external circuit?  
And the bias can be considered to be part of the external circuit?
If so, not sure what your issue is here.  You agree that drive and bias are
totally independent, but take issue at being able to set them
independently in gpioset?  What am I missing?

And there IS a bias option for gpioget - as it makes sense there as
well.  And gpiomon as well.

> Unfortunately, this leads me to yet another question: Bias defines "as-is"
> and "pull-up/down" as options. Just to be sure, that would imply that one
> has to set the bias option to pull_up/down for the first call to gpioget and
> that subsequent readings from the input pin should/can run w/out the bias
> option, hence "as-is", or do you recommend to have the bias option specified
> for each read from the pin?
> 

The "as-is" is an unfortunate side-effect of bias being a late addition
to the API, though it could be argued that it is useful in its own
right, as Andy mentioned.
Its main purpose is for backwards compatibility and is the default for that
reason.

If you need a bias then set it as needed.  I would use options consistently,
not have different options on subsequent calls.

I would also recommend using edge events, such as those provided by
gpiomon, rather than polling with gpioget, but that depends on the complexity
of your use case.

Cheers,
Kent.
