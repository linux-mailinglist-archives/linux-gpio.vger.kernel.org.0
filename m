Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1E34E43F5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 17:11:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238953AbiCVQND (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 12:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236331AbiCVQND (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 12:13:03 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A0627CC2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:11:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id mz9-20020a17090b378900b001c657559290so3347731pjb.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KY6BosF3ljWMArk33Z10Xdl2b9M1FTBs8FKuLRL0+tY=;
        b=AjSNwOnlekdJLd9Ll5hXeB08jTk/m7w4ir35tytX5Bi79mUbABvEqlv8jcThQtj6nd
         Dtdp18N6GP3ARXukRpfpltq9Du5hty77QqLhRLCkPCZQXyBD0TYNENBTm17hsZ1SILeL
         FsK44UmuxIOsXwPMHGq2A0sFJkBUFRKLXUqxmEgoBu832R0Y4g/a/8gYLVpjnqBdfaeo
         0qRf5SbYsSpWVLnAtU2xJbiodzZUJgMw6fus22QKy7JVC1Rl42xlW19FhmEHMrQHIfqM
         fqwzPvLXKy8o09xouUh+pswUkSv3u6gWDpzDxa+ol8WE4ms+0hed6X6h7xstibvH85b3
         QlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KY6BosF3ljWMArk33Z10Xdl2b9M1FTBs8FKuLRL0+tY=;
        b=0tPNQvgxnAWTXyUjasy5h4OGzZU9fZwDiJsUMK5JCFCinaPgooo+Vw0wjeKHZ3sDPC
         CJfr5J+zVgKW5Cs+OxW8h/nqAvhSCoaAgdsThC2K2VyY3Ftz9iAm5BOqLWaoVpipeLKv
         8tf5fbibfMWmPaZXK9h3cIOWnrZG8cH9LXC0I0Tap0et7HlevGfv8380om9C6Si9jTv+
         43AFFcN1jUNci2jmr+Fk3J+BmWHBotRAFNHikZlmmccgeEqrbL6OwSodJ8XkKWkehThZ
         D4nVCCbVNxgzza2MlXlyE7zHh7rTQ8YAnP9li+dWPmswB15h6c1rjVL5LOAqWHhvCSKs
         YYyw==
X-Gm-Message-State: AOAM530CfSS+R9RaW7M9tDQRWVCJ6y8L0RTM+y5Ne8/vq201r8p1Pz8U
        yLyUlotCffzrEYYmwAyW+eKmI35LShL43g==
X-Google-Smtp-Source: ABdhPJxderlyiVptn23aNa40Ytd6N96kEunzFqQixyVAGkKCKHzwNphmohfamdGWcmlS2Ld5b9pzrQ==
X-Received: by 2002:a17:902:7e47:b0:151:7d11:3e9f with SMTP id a7-20020a1709027e4700b001517d113e9fmr18912632pln.162.1647965495321;
        Tue, 22 Mar 2022 09:11:35 -0700 (PDT)
Received: from sol ([124.148.64.37])
        by smtp.gmail.com with ESMTPSA id il7-20020a17090b164700b001c779d50699sm305359pjb.55.2022.03.22.09.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 09:11:34 -0700 (PDT)
Date:   Wed, 23 Mar 2022 00:11:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans Kurscheidt <lve0200@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: gpiod: Set pullup for Input Line
Message-ID: <20220322161130.GB131091@sol>
References: <97da941f-39da-4ded-0138-d1e71c4d3ecc@gmail.com>
 <CAHp75VcXxSxtvEdHxenAWoP31WnkoyDJ6WfDwPDEKDhT3AtUmg@mail.gmail.com>
 <8200d976-2b32-1215-e46c-0bb2837392b7@gmail.com>
 <CAHp75VcOHCE13oA4m43yAp5e2w=e6uOQhRNneonja6F+XhXmbA@mail.gmail.com>
 <20220322005911.GA6650@sol>
 <1a7fd31a-221e-7b23-b95f-d71e440b3ff0@gmail.com>
 <154df196-d9d2-63dc-b5e4-b314933db4b2@gmail.com>
 <CAHp75Vf_H8cD839CgmkH=9Z5_Gf_y15+=N+B-0jDU6xTuQnGAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vf_H8cD839CgmkH=9Z5_Gf_y15+=N+B-0jDU6xTuQnGAQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 10:50:30AM +0200, Andy Shevchenko wrote:
> On Tue, Mar 22, 2022 at 10:39 AM Hans Kurscheidt <lve0200@gmail.com> wrote:
> > Am 22.03.2022 um 09:36 schrieb Hans Kurscheidt:
> > > Am 22.03.2022 um 01:59 schrieb Kent Gibson:
> 
> ...
> 
> > > Still 1 more question. I understand the sense of a Pull-up in Input
> > > mode, but reading the code, I see that the Bias option exists as well
> > > for gpioset (Output). What is the sense of this, and what does it do?
> 
> I guess we started providing OPEN SOURCE / DRAIN in libgpiod v2.0
> (Bart or Kent may correct me), but you should get an idea why it may
> be useful.
> 

No - open drain/source is not new - it has been there since cdev was added
AFAIAA.
The v2 ABI, which libgpiod v2 will support, adds debounce, event sequence
numbers, events from multiple lines in one request, and a few other
things, but the drive options have always been there - even before the
bias options were added.

> On top of that, the pin can be reconfigured from input to output and
> vice versa at run-time. So, keeping a bias setting will allow not to
> think about it when pin direction is switched, although I agree this
> may not be a clean case to use.
> 

Agreed - I would set both the direction and bias in such a case.

Cheers,
Kent.
