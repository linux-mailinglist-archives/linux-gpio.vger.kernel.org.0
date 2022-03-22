Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F724E3BD6
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 10:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbiCVJk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 05:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbiCVJk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 05:40:26 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D28A1A813
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 02:38:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id j13-20020a05600c1c0d00b0038c8f94aac2so1104409wms.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bvQ++mDKS5bLk9gNJj2nPv/ruWpDEv/tDaaR6uBtOcw=;
        b=Qb2nquoWqUMyALFrzISOYMqH8574B/lJRsWZd04go/Cym0an+G9BpGFoKdp0dCTWLm
         RtmFnJ71cPjd6VJ8ZYmM+NWLA2UEym8P1z+R/T+T1AudaPWm0kF8ufwOoE22mBOSZJlP
         aA6994j39CaoQ2jUdgLZpUveAnrXJ8mEm7XHTAgkwsKvuYQfWByxlDLZZOHBQdefmZ3y
         XPBqga9/YYxy2a5eSPjCUnkveOVf1kMFAU9Zt6+sftl0/wThFUN19ni/8mdksYsL+kpT
         roQF1rEpy9MuErrOLVFE5Itijf/92PL1rvV9IjhpNZPzhDc9O6Pc1Np3ELR1Sl3alO++
         aJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bvQ++mDKS5bLk9gNJj2nPv/ruWpDEv/tDaaR6uBtOcw=;
        b=gb9b+NDlHktQ759ZwtMiotGT/iJrKbGo2mooTWMY2NsOcUcLoM1B3anMEsFhmdL6I2
         PrvGULxxF9VZMKWvccBHMiJO3URAFduVP0tNY38nhFZele2uN4kHXHQuTi/bMVAtSFO2
         YjsxJSrHq4TcUA0DxAhGca5zO6JAKzeWOHhGEVPLuTVJcJQy8tnw/RFX4YpBG+f44nhe
         rx9nZ+8EICJBVQaqSlIf+po0+U4pewxs0cgVGcf6bzyQgSmLoLc50QdicGo+NDxRo/qx
         iQkfrYxSzqyy7Tx6QWkvUox6IFPSysfEiESHk3kt491C2rHZnrCJt0Q/Nqq14gFAb8lh
         wFng==
X-Gm-Message-State: AOAM533H81NFZuuiUCr9F20ySmvS/fYqJsOtGeGHW3srE59AiklhQd+B
        hHWfk2Fd/LdCXC83yFzhlbIOOGKTiTudZkFc
X-Google-Smtp-Source: ABdhPJy6LgAVXF5gQB9UNe7jeBMg7LyO8ac+1kxU8dr/87Y6cjP3iyMX/nB5dtkZ9yrEV8YVo7BdRg==
X-Received: by 2002:a05:6000:1e1e:b0:204:203:73ba with SMTP id bj30-20020a0560001e1e00b00204020373bamr11266036wrb.445.1647941937455;
        Tue, 22 Mar 2022 02:38:57 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id 10-20020a5d47aa000000b00204012e4373sm9197111wrb.101.2022.03.22.02.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 02:38:56 -0700 (PDT)
Message-ID: <2884d1a0-4e4e-142f-0d3d-02d5e5e46466@gmail.com>
Date:   Tue, 22 Mar 2022 10:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiod: Set pullup for Input Line
Content-Language: fr
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
 <20220322005911.GA6650@sol> <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
 <154df196-d9d2-63dc-b5e4-b314933db4b2@gmail.com>
 <CAHp75Vf_H8cD839CgmkH=9Z5_Gf_y15+=N+B-0jDU6xTuQnGAQ@mail.gmail.com>
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <CAHp75Vf_H8cD839CgmkH=9Z5_Gf_y15+=N+B-0jDU6xTuQnGAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Am 22.03.2022 um 09:50 schrieb Andy Shevchenko:
> On Tue, Mar 22, 2022 at 10:39 AM Hans Kurscheidt <lve0200@gmail.com> wrote:
>> Am 22.03.2022 um 09:36 schrieb Hans Kurscheidt:
>>> Am 22.03.2022 um 01:59 schrieb Kent Gibson:
> ...
>
>>> Still 1 more question. I understand the sense of a Pull-up in Input
>>> mode, but reading the code, I see that the Bias option exists as well
>>> for gpioset (Output). What is the sense of this, and what does it do?
> I guess we started providing OPEN SOURCE / DRAIN in libgpiod v2.0
> (Bart or Kent may correct me), but you should get an idea why it may
> be useful.
>
> On top of that, the pin can be reconfigured from input to output and
> vice versa at run-time. So, keeping a bias setting will allow not to
> think about it when pin direction is switched, although I agree this
> may not be a clean case to use.

Hi Andy,

Open Source/Drain is completely different from Pull_UP/DOWN! Open 
source/drain defines, which active element (transistor) is attached to 
the line, while pull_up/down defines, which passive element (resistor) 
is attached to the line. In some sense one could say, what pull_up/down 
is for input, open drain/source is the corresponding thing for output, 
but they are realized by different means. IMHO, "bias" (pull-up/down) 
should be an option for gpioget, while "drive" makes only sense for 
gpioset, because I understand them as mutually excluding, but may be, 
I'm overseeing something.

Unfortunately, this leads me to yet another question: Bias defines 
"as-is" and "pull-up/down" as options. Just to be sure, that would imply 
that one has to set the bias option to pull_up/down for the first call 
to gpioget and that subsequent readings from the input pin should/can 
run w/out the bias option, hence "as-is", or do you recommend to have 
the bias option specified for each read from the pin?

