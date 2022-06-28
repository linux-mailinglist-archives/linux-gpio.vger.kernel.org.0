Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCFB55C5D4
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345654AbiF1M1T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 08:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiF1M1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 08:27:18 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B193425E80
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:27:17 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id l11so21870942ybu.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oRHUNfpFVHGzlFepog/imAGSgi6aseogxw2LraLTHTI=;
        b=kMS3kwTUJ5R9E68Apc0sC4qVHrWCaHd03NoS6lMckuWQTqPNFsQ/Qh/r3baWWeTa63
         N+dKTgLQtY5+ExZ+z7lP2ll1+4uLavKL0BhH+MJFJ1Ns43nyy4Op6/qtofoTqEKVddgI
         K0IZxMhi+36c605vQtwjXg7nSZCExJ271nHKWGbo/GWk3YvF7dklYanJ/KPWH7DhD3ea
         huIaIUJrOwciwqRsJOJw6NeV0g4f2dL07gdVAYB0IHEvjkGkr+GyNOiYHT0B1wtrsBZj
         YLL0OmoPatcT3sqj9VMkA7pKvMjp6x6/LPs+lfRIN17RdrQOfwJI3yNP8y8YoMpupgEE
         BZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oRHUNfpFVHGzlFepog/imAGSgi6aseogxw2LraLTHTI=;
        b=DS51HmJnpREH3Idvsip25zF6/izNL1I6GSTIK82HGK5Hfxj0upb0j3bMXO71zSNBkE
         HR6b16MaIC30NJRm4z8FB0rn5JVp55p1eBkjOgo9rjuO1vVAPh4zFje+KNjEtKB75YPk
         JezXILVyyYeanJo2O9abEN0heoG1i5YJJhxamdUHETe4mz1qQB4R++nbSycOKR4M7GWS
         0BaEDvi15Y2BLGZY0rrF9YZDcD9q6TnxmRUByvpx19zyhPwQBASF46+XnUsqwuK9tUyf
         n4DgxIFJaKZOuR09Agvy/rYK5033ntvdavUiqLLn8a5cCxwzvyQLArUSZ+Bb/XGazn5L
         KzbA==
X-Gm-Message-State: AJIora/YY2laW1eo8NpxwyikWDh02UX4v9PaC7pBIiP/5RZ3L/IV2t/I
        cwcbjaRhUKbjgZb6K5GPcDHEBlzDb8IBSeKx/cDDFQ==
X-Google-Smtp-Source: AGRyM1uFzAIsatX6wNT5EAteeWzk8GhTFgdTDGZDBkdrgmU7g4X00fh1+2sqYf0JUy75SkF/npruQhS7OLd4aZl0amI=
X-Received: by 2002:a25:d88d:0:b0:66c:999d:919c with SMTP id
 p135-20020a25d88d000000b0066c999d919cmr16062500ybg.514.1656419236961; Tue, 28
 Jun 2022 05:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220617051921.3801832-1-srinivas.neeli@xilinx.com>
 <CAHp75VfREw2F3bXDeS8O1jm0r1Ksj923jZDne9UE5vaHM+V17w@mail.gmail.com> <d780076d-ed24-f656-46b1-4d78cd0a17c1@amd.com>
In-Reply-To: <d780076d-ed24-f656-46b1-4d78cd0a17c1@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:27:05 +0200
Message-ID: <CACRpkdbkm0C=GUvafi-ZzoqCk6k5fbNQ76GtvRtn_izcKWrVPA@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-xilinx: Check return value of of_property_read_u32
To:     Michal Simek <michal.simek@amd.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        neelisrinivas18@gmail.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        srinivas.neeli@amd.com, Srinivas Goud <sgoud@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 20, 2022 at 8:26 AM Michal Simek <michal.simek@amd.com> wrote:
> On 6/17/22 18:02, Andy Shevchenko wrote:
> > On Fri, Jun 17, 2022 at 7:20 AM Srinivas Neeli
> > <srinivas.neeli@xilinx.com> wrote:
> >>
> >> In five different instances the return value of "of_property_read_u32"
> >> API was neither captured nor checked.
> >>
> >> Fixed it by capturing the return value and then checking for any error.
> >>
> >> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> >> Addresses-Coverity: "check_return"
> >
> > I think the best course of action here is to go and fix Coverity while
> > marking these as false positives.
> >
> > To the idea of castings -- this is not good style and (many?)
> > maintainers in kernel do not accept such "workaround" for fixing
> > broken tool.
>
> Let's wait for Linus what he will say about it.
> I can't see nothing wrong about declaring that I am intentionally ignoring
> return code.

I don't think this patch should be applied.

The problem with static analysis is that such tools have no feeling
for context at all, and in this case the context makes it pretty
clear why it is safe to ignore these return values.

But we need to adopt the tool to the code not adopt the code to
the tool.

Yours,
Linus Walleij
