Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4407144E925
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 15:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbhKLOtb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 09:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232403AbhKLOtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 09:49:31 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70261C061766
        for <linux-gpio@vger.kernel.org>; Fri, 12 Nov 2021 06:46:40 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id e3so2217969edu.4
        for <linux-gpio@vger.kernel.org>; Fri, 12 Nov 2021 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WeFvDrUcPGbcaBQPo6VmrhI9Z5gxUYwokkUPX3k4Mk0=;
        b=QBebM8rMQiV9mScH9ZUQO4Zpeo7TuM4UoJaHl8WwqfZzuh4JO3WyvIRsLh/6Hcpoi6
         rteynH1OLtBp2ixzP8B0TlSSL8a0NYnuGYgUffGV+lqFk5lkCH/XUjHRv3kQSP92+AxK
         jm5MMny5iH7S83FtWNDTzi/8MvrZorcbj7aJ9QFrrVRA/k3wvyo+fzNTNE5MUBGqVvP8
         qUCKPLcpcV9I+TRFv4hKpjSH6PsG9AE82ouvSSGPPr4sLKMQfMQATUjXZ1tF5kIKJg70
         bv3o7f6HW7q/wVZjclPVOSAxPbCOAugRtW9nZU9nQGbia5UXW5z4mrYoEjXo5HwrdOc8
         3LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WeFvDrUcPGbcaBQPo6VmrhI9Z5gxUYwokkUPX3k4Mk0=;
        b=Erqe3pfJi2Xn2KBy0ilwd7B1iy/N844pMnRdbu6umnvq9n5FS0L71C2s9SkhIiky7c
         CyyNZbxG7BxCx/Q7j5LVwrWVXVq/84spgMClpQ9OWPD3Y8r6eQJaK+Gk7UyzWR8ojsPg
         e+IzEXtc5h5SgkvZBv8z4f4QCtAJMjnkSnWfgISemdWKulMB+saAUDa1uFr8YrCGyKaa
         /RgkU6iuydyjplB5SXEDT29666fNsaYOA9R9GUv9YDYGLjGTdCJlMyEv6BOvVnhoe+qg
         S0Ep1vj+Pa246dHqGz7v0dntPaQmG/RFGHM1iR+hfBH66tBCjtb1lXc9bSNosiNM+YBB
         yRlQ==
X-Gm-Message-State: AOAM531e0gNwXvQeQ+reF6MvZm925WIC+jzavVc+68c2PgNm61hhQWYA
        QkAYjGXffTENgKlmP2ugXjz9dRxCej3YnXIvLyzIxw==
X-Google-Smtp-Source: ABdhPJwbAaJWd8bNqmv+zEgAxyuJ9xSV9pu4jexjV9AxwiLg6vC9YfkLVXdCMmB6gTe8Q7eultwG4oz/JkgGFBD1wGI=
X-Received: by 2002:a17:907:1deb:: with SMTP id og43mr19716880ejc.189.1636728399055;
 Fri, 12 Nov 2021 06:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20211104190030.20660-1-brgl@bgdev.pl>
In-Reply-To: <20211104190030.20660-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 12 Nov 2021 15:46:28 +0100
Message-ID: <CAMRc=MfA=i4xn+Xy4mCg17rCCQfGcp7QUrodYz0YNnxPPd-0Mw@mail.gmail.com>
Subject: Re: [GIT PULL] configfs-based GPIO simulator for v5.16
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Kent Gibson <warthog618@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 4, 2021 at 8:01 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Linus,
>
> A while ago I sent you a pull-request for the GPIO subsystem which, in addition
> to regular GPIO updates, contained a new GPIO simulator module based on
> configfs that we want to use to test the uAPI and its main user-space user -
> libgpiod. The PR included changes to configfs itself in the form of an
> implementation of the concept of committable items. The changes had been in
> development for several months and the maintainers had been largely
> unresponsive which made me send it directly to you eventually after gathering
> some reviews on the linux-gpio mailing list. You then Cc'ed Al who raised some
> concerns and the patches were pulled out.
>
> A couple months have passed with a few more iterations and I still can't get
> any meaningful reviews from the configfs maintainers (nor NAKs for that
> matter). I decided to give it another try and send it to you directly again.
>
> Since last time I've addressed issues raised by Al (to the best of my ability
> anyway) and made sure all references are counted correctly (including error
> paths) and all resources freed. This code has been tested a lot with
> a development version of libgpiod. The branch I've tagged spent some time in
> next too with a single issue reported and fixed.
>
> Please consider pulling.
>
> Best Regards,
> Bartosz Golaszewski
>

Hi Linus,

The merge window is closing soon, so I'd like to send out a gentle
ping and ask you if you have any comments on these patches and what
should my next steps be regarding them.

Best Regards,
Bartosz Golaszewski
