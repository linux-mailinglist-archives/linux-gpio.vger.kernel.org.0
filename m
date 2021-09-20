Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C421F41176D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 16:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240720AbhITOsi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 10:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhITOsi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Sep 2021 10:48:38 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EB0C061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:47:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id j13so62361527edv.13
        for <linux-gpio@vger.kernel.org>; Mon, 20 Sep 2021 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7j6srl8/3xZKjxyWacXYbIEtIpxDFLQTimtSKuIoENk=;
        b=kyGncLMMgPtE20GLkmXsc7UM/MZ+9OoYC1mCd9RZR+H+DKNUxthdAI7YIy3UULS1Ij
         RqADjFkwY9wAsiTq4h9+xay+CQAlTOGDQtk3oRJquzoyaOnaMNFf4rix0wNw1Es8UOps
         jhrwsRuhAWYe27amG5pRPOSVWFXCAkFAPwK8VjN5yOA8r/+DCRP8CAze6Rx4QzcAjC2B
         QejLx5s+wgd/hLJCIv/htrVjd5sftxiyPvhvAoVU2752q4QY+L4kz3KxLnjTrN6ekXzl
         e3yLACHESS3bKkQlGfYnxSBoI9QG0GDexBJfZUcGe7yyKb3l9vd4q5R4ly8U2I5qUsDU
         iyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7j6srl8/3xZKjxyWacXYbIEtIpxDFLQTimtSKuIoENk=;
        b=BZ63LWl2I1hjH5pTHPfZS0f0ZVKH0vBrq87kinO0B3+FNQ0SruM+sLRKx91zL2hHGi
         i+rzcGPBbcZe70vPCQSU/aLWLYtSTom/RAwMgAMCgqF43yjTlBYO5WiVDG1ZljkYSkMZ
         2xQA4AISfHHqQfxExOATArcM78HuACfE6Oo9BQrz/KEL4pFuiUjI37q4dJRNGlwRIWCn
         gn7ycqjfPRY2niwnp2ySaO3TYnhh3OGu0W5mIWq9h//Jeenuu++bNQKdkVCohp9J7jAO
         6lWeq/e3fC0o99QxMuYb1Gn2xUeFG4OLRT4n84J1uGjo0Uhk/BphXVL9IloWS60HBVAh
         gFnA==
X-Gm-Message-State: AOAM533xNklc5V3N+TO/uTk2TO+nVOrRW1arMDlcEZjdkNLCjCJk0wpl
        RVD18vVwulVl7czwomgcUhBEeCfLBhGGYiLIkEuUow==
X-Google-Smtp-Source: ABdhPJyaEw/eUpjG3ulFa2EQFG6rh8w6JkYCqdetDbXc7XjD9luokV7sIfFz/prDMKhitjYaTvW0+QO2SjCHFP2FZ9E=
X-Received: by 2002:aa7:c9cd:: with SMTP id i13mr30083192edt.178.1632149169591;
 Mon, 20 Sep 2021 07:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210920140509.5177-1-brgl@bgdev.pl> <20210920140509.5177-3-brgl@bgdev.pl>
 <20210920140938.GA24424@lst.de> <CAMuHMdXoZdhSydMpbW8B6oQJNnpYpTxmhHrV5CJNTUP7T1KsoA@mail.gmail.com>
 <20210920143046.GA26163@lst.de>
In-Reply-To: <20210920143046.GA26163@lst.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Sep 2021 16:45:59 +0200
Message-ID: <CAMRc=McQoD=cUHLu6TMyW85fdtXOm4x38tHVnEGjkVfcfX0mfA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] configfs: use BIT() for internal flags
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 4:30 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Sep 20, 2021 at 04:29:30PM +0200, Geert Uytterhoeven wrote:
> > Hi Christoph,
> >
> > On Mon, Sep 20, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
> > > On Mon, Sep 20, 2021 at 04:05:03PM +0200, Bartosz Golaszewski wrote:
> > > > For better readability and maintenance: use the BIT() macro for flag
> > > > definitions.
> > >
> > > NAK.  BIT() is the stupidest macro in the kernel and shall not be used
> > > ever.  And I'm pretty sure we had this discussion a few times.
> >
> > Care to explain why it is a stupid macro?
>
> Please look at the previous thread.  I'm tired of this discussion.

Hi Geert!

The only previous answer from Christoph is this:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2399968.html

Bart
