Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C51A209C29
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 11:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390506AbgFYJon (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 05:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389894AbgFYJom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 05:44:42 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE4BC0613ED
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 02:44:42 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l6so4691693qkc.6
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2020 02:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1GMTwLCToGzRyMGTUAq/URVrCLuwQVDwo9wF5IivAvI=;
        b=XcX3a+0PMppzVzbIfVrB5X25sL/w2Riiq2f5PjW7W7l8yVcXDPLGOLDhFdyYmHVSMd
         JBII7/BrDlpkYvLYAFuEzG+aw8It6bXyxCrPKRNGRNQnnLQKVtbo+vcPTyaph0tu5wsC
         GOAmXyHNNjHlX2n44tFzHImcHsI59BB3vnPo+YBU9kaJ0OPh1ESxOmTmI4cd35+Nm2x1
         erynJMG0dwPGER2r8tcU3ySJXV7tVRGE00i5lgWpMoGY2soi/kzEFCqDyjQy93dYm0IX
         UPUAF20SFY0F1W0SPPUKeZr++gMKmCpUkQ4MATwjBlWW8FwnF0EH3cVAtX9jWANEKCxD
         X48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1GMTwLCToGzRyMGTUAq/URVrCLuwQVDwo9wF5IivAvI=;
        b=k3gSNeAWw4h4xOtjK3F2KXPKUcYEGy8wZ3zU/2NfmH2xR+TMuXcvyvS4H4nyQ+Awpn
         na23JsASUGj7PLranjktn8QQP/zMZnk9rF5tduj1jJ3IxkZPnm+9UgHRTVNCtw/HXTDi
         MivADfz3s8na039C1ovsCkTkTYfu8fnVj6nSzpaCm6jcaQ0IMjZWZBRWlk5nXIn6Gimb
         ulEDUX8pwVH7qfty8hZwdjI7VMWsG5hTeBM1OdNK+q2cy7d0a+X569e98A0xwRJu6mv5
         TjEBpJasUl1mEe/FT7uRA4mGBu//R+6To3Ac+kFTcl9uNnQSypzD4ezkHrZ4Lm3wmVRV
         C8dQ==
X-Gm-Message-State: AOAM533IGYEHuesGFBf2eaTgxKFhIIZ8/Bp06HmN9NlP2RsOVbrXnv29
        YpDJ5fyGQA2vdh2hwGFl5totG/w34AjT101Xq8uUVg==
X-Google-Smtp-Source: ABdhPJzAwW60txtzFlDEDE6uwmXZYkZkRAJbcV8CmEn67kg7LXc6pMf9VoVqFmP2GrezH2Ir+okYKI3dDZH4j8OOW70=
X-Received: by 2002:a37:aac4:: with SMTP id t187mr26574253qke.263.1593078281485;
 Thu, 25 Jun 2020 02:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-9-warthog618@gmail.com>
 <CAMpxmJVbiH9mh2c8aAS+GG9a76w9c0Nrrv-VDVhpo+wSyQ2NeQ@mail.gmail.com> <20200624140806.GA7569@sol>
In-Reply-To: <20200624140806.GA7569@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 25 Jun 2020 11:44:30 +0200
Message-ID: <CAMpxmJXbzFvR9h4fXvCwDMz4t6N16o2Y88K94aPwu6MFuCzqrg@mail.gmail.com>
Subject: Re: [PATCH 08/22] gpiolib: cdev: complete the irq/thread timestamp handshake
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Jun 24, 2020 at 04:00:42PM +0200, Bartosz Golaszewski wrote:
> > wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
> > >
> > > Reset the timestamp field to 0 after using it in lineevent_irq_thread=
.
> > >
> > > The timestamp is set by lineevent_irq_handler and is tested by
> > > lineevent_irq_thread to determine if it is called from a nested thead=
ed
> > > interrupt.
> > > lineevent_irq_thread is assuming that the nested, or otherwise, statu=
s
> > > of the IRQ is static, i.e. it is either always nested or never nested=
.
> > > This change removes that assumption, resetting the timestamp so it ca=
n
> > > be re-used to determine the nested state of subsequent interrupts.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > >
> >
> > This change makes sense to me but I'm having a hard time processing
> > the explanation. If we're requesting the interrupt and allocating the
> > lineevent state in the same function - how can we run into a situation
> > here the status of the irq would change like what you describe?
> >
>
> I'm not totally sure myself, as my understanding of how interrupts are
> shared in the kernel is pretty sketchy, but my concern is that if we
> are sharing the irq then whoever we are sharing with may release the irq
> and we go from nested to unnested.  Or vice versa.  Not sure if that is
> valid, but that was my concern, and it seemed like a minor change to
> cover it just in case.
>

It's my understanding that a shared interrupt must be explicitly
requested as shared by all previous users or request_irq() will fail.
In this case: we call request_threaded_irq() without the IRQF_SHARED
flag so it's never a shared interrupt. Even if someone previously
requested it as shared - our call will simply fail.

I still think that resetting the timestamp is fine because it's not
being set to 0 in hardirq context. We just need a different
explanation.

Bart
