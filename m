Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F28D63EB17
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 09:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiLAI3Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 03:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiLAI3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 03:29:23 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50514C16
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 00:29:20 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id j9so481981vkk.13
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5aXxabjxfpWWlF7moDeWgXun9KipdKjdh653edP+wY=;
        b=WVJzZFiasqQsL93GmfCg1LMSzZynGzjL6nLBKBch8MCPxE/vZbcWzEKPplRdLZuZef
         tC8cZ7ReuYDUv8SML89PD0SU1A4UYkA56Mz+O9+jZ/JCdX+udiZ24i4y+IY7uhuQ+Mqm
         yx6fIC6Iq+dYnTqdS5MlnSHELHhuSSZEPt8sOJyiHxsxXsElpkSq9qFuvBNUK1Jz2CVa
         rdjHKLDz5s+BbpCpLmwLaN35+ZsvfyOsSZoV4Josk94m7w0UoSlcU1EoLUtNl8+VJM+5
         iBsmT+wflZyzZpADjtYKUNfqVGvhnkZLuXeS38pnBWa+sEwv1/viiFoM9fIFoTfryQDr
         HlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5aXxabjxfpWWlF7moDeWgXun9KipdKjdh653edP+wY=;
        b=NRdlRKkmGTE1A4VgmYss9o1annTxWKWek4pdMAzwgaPHD+gykmbo4HqH0xY/KssoJQ
         cRttJFXDGg17cuFYyboQBQnDxt7CWY16YlZ4OpHOwdHHn8h59hZa8nmu7cuFRrTMUiSU
         dzJVNnynauxZTCRUCNm9kA7Ea9K5iTkUwpfbuuqkGxRd1rJcb1/0zHnUFxQa+5lwRDyq
         gqnHvWI1Cc6hLfKoEcAyXo8v3tYQ7ssqFAv709OFLLnE+cHJ4OKTfXvKeRJAcfqebxE1
         G6Z19xb076avz2ZxL8Grk8PMsNfYBYA4GcdZghNMTmHIwttU72Q8+DYAQMvQ+X0Zwm+5
         hpjg==
X-Gm-Message-State: ANoB5plR8zh0eWec6Pxs+dVG94y8N5ZQHScMm2g1xIlSXFa4CMmZL++Y
        QR2pSZx21h+nn1VZm4IknGGUmD4kGjPHXIIb+R6hmg==
X-Google-Smtp-Source: AA0mqf5LcJUY/T96kCfKpA7qMC0ecoNbLScHEmFR1hoLPNoCB2aOobuBCr9PEwA+9JX5THmdiPe6PhvV9Z+iaIQfkS0=
X-Received: by 2002:a1f:54c1:0:b0:3b7:65cc:8ebc with SMTP id
 i184-20020a1f54c1000000b003b765cc8ebcmr32153127vkb.5.1669883359437; Thu, 01
 Dec 2022 00:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20221130124231.1054001-1-brgl@bgdev.pl> <20221130124231.1054001-8-brgl@bgdev.pl>
 <Y4djKAW2Y1RQb98Z@smile.fi.intel.com> <CAMRc=MfUo2dq6qCiP4q0K0W2b=fBWdb9Jo3b6b=u9DQDQNArDw@mail.gmail.com>
 <20221201022012.cc24ljwdmu6zuuak@vireshk-i7>
In-Reply-To: <20221201022012.cc24ljwdmu6zuuak@vireshk-i7>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Dec 2022 09:29:08 +0100
Message-ID: <CAMRc=MfNK9u87Q17cjbpRcF3Y0Wxnka7mhPWVBV=crrvgppBCA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 07/11] bindings: rust: make reuse happy
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 1, 2022 at 3:20 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 30-11-22, 17:20, Bartosz Golaszewski wrote:
> > On Wed, Nov 30, 2022 at 3:05 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Wed, Nov 30, 2022 at 01:42:27PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > Add missing license text files and use the CC0-1.0 license for the
> > > > rust-specific .gitignore file.
> > >
> > > ...
> > >
> > > > diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
> > > > index 95054d9..6fe7bde 100644
> > > > --- a/bindings/rust/.gitignore
> > > > +++ b/bindings/rust/.gitignore
> > > > @@ -1,4 +1,6 @@
> > >
> > > > -# Added by cargo
> > >
> > > Seems like automatically generated, which means that next time something comes
> > > here may well screw up the below.
> > >
> >
> > I think the comment refers to the *ignored* files *added* by cargo,
> > not saying that .gitignore was added by cargo.
>
> Yes. Cargo, by itself, updated the root folder's .gitignore I think and I had to
> copy/paste stuff here.
>

OMG cargo cares about the VCS of the project it builds? Good to know I guess.

Bart
