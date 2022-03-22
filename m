Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6F34E3B2E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 09:51:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbiCVIxL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 04:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiCVIxJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 04:53:09 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A087DAB0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 01:51:42 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bi12so34747014ejb.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 01:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sE0fB4m4xmfE8B6aoLFVCQYFw7VHEfXcYRfZu22Novc=;
        b=j8BDZjIbXW1XV1n4LCH/Mqxk66x3oAl0iSlDYEwtmeVKiPx89p+r+yUVjyOGgJVr/z
         t1YSrlUlGtRi+XurP3v5fNoj73AcJd4u/OhVZq//JlnygltgNF/MgMugBBP/Q6DBPzHP
         Am+AKL+Zx4TU5lvshCk9EhusT7VLKo+x1zuwbDz03NR5F6YukhWoatq+BHJztH4KtRNt
         ZnsViMEXbOnFfugRRTk/xLYOI0bhKx2oKUt/myLsOaWQIzUxXVG+i8ZQNpqgTflYF9Uu
         isEiPr6+2nGiWOWL2GRirMrLBfrWplmm044jHKxogbHigqRIzM+YjQR2WJyBcDtdXoOl
         ZwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sE0fB4m4xmfE8B6aoLFVCQYFw7VHEfXcYRfZu22Novc=;
        b=gQiNx5LVXaWChrFIS3CwMMk4mTndY0fh5johTIYLE3AuCixiWtIQfhbfEcKoVC9kBw
         MI2haC6IuBt5WwcA5PiPIYQB8RQsxejlPXK7NdaYBF+sIlEPQPpYj/Ev/C1vU94HmRMc
         wyEyXA9y0BqGG3w60nbFDajC+h7oYe64OjwbkepwBx5UHslCPRkCsCqgNeAhSTyJVIx2
         5ZiO78sDixy8hJSfrvuHVi4v82cj5BfoLMS5u2ROe5ll9Qw/Ovnycmhq1EQ6bcjuYP9M
         V2XJ44Cs6HcAbbsWrV/XXjSV2pfU46mqJQdc606RzqyVcHrsLSs0iTI5hqMPTWD6EZGj
         yF2A==
X-Gm-Message-State: AOAM531KpHLA8bh9Qd5vp16JXnPqIzEv0jfKA3mnMRN3l7fnmVCjLPxf
        Jp5SGTzWKvVfYpGpeuB5ktrLqilFp2SFbrPCBcr9LdMgYQM=
X-Google-Smtp-Source: ABdhPJxK01BEKI2WyCxYGwQmPkzVLoURfj/52EQggpmXxY1xdiIryTWHCbQPwh2cE+G3H1Ng9GeuBsa+4qcBW0omT5U=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr24486276ejt.639.1647939100731; Tue, 22
 Mar 2022 01:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com> <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
 <20220322005911.GA6650@sol> <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com> <154df196-d9d2-63dc-b5e4-b314933db4b2@gmail.com>
In-Reply-To: <154df196-d9d2-63dc-b5e4-b314933db4b2@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Mar 2022 10:50:30 +0200
Message-ID: <CAHp75Vf_H8cD839CgmkH=9Z5_Gf_y15+=N+B-0jDU6xTuQnGAQ@mail.gmail.com>
Subject: Re: gpiod: Set pullup for Input Line
To:     Hans Kurscheidt <lve0200@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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

On Tue, Mar 22, 2022 at 10:39 AM Hans Kurscheidt <lve0200@gmail.com> wrote:
> Am 22.03.2022 um 09:36 schrieb Hans Kurscheidt:
> > Am 22.03.2022 um 01:59 schrieb Kent Gibson:

...

> > Still 1 more question. I understand the sense of a Pull-up in Input
> > mode, but reading the code, I see that the Bias option exists as well
> > for gpioset (Output). What is the sense of this, and what does it do?

I guess we started providing OPEN SOURCE / DRAIN in libgpiod v2.0
(Bart or Kent may correct me), but you should get an idea why it may
be useful.

On top of that, the pin can be reconfigured from input to output and
vice versa at run-time. So, keeping a bias setting will allow not to
think about it when pin direction is switched, although I agree this
may not be a clean case to use.

-- 
With Best Regards,
Andy Shevchenko
