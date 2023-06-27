Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D64D73FB53
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jun 2023 13:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjF0Lra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jun 2023 07:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjF0Lr3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jun 2023 07:47:29 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB5BF4
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jun 2023 04:47:28 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-791b8500a21so1123315241.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jun 2023 04:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687866447; x=1690458447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jb69VzvuiNXGuyYEDdj75WrAIwBneAlG3cVR4iAIDo=;
        b=x5tBEBlLN90IiDChEwLolJyBlswwxYzTM5iBkWGIBi8JLPk/fevmsfGnAlHWmGopgF
         gnuyugp1XsdWtjeWiwbvDfRvB7aogLW6Xl3TWt8pKnuXbesl4WgtK06G4JnmvESrWjsa
         Mo5H7Gc7oW4sVQI+myttVmLThDZ070Glr4TGkQmt5egtjvO8FgpwXo6IdTRqOXucIJcp
         /QxE+3O0ud/y6uFfa15E8yCfbypNcXSOgtGK1M6EeEMtcofO/OkBFIoPQlz/TivbyHPg
         HQaHDCLVbFoY53pSf7Bgbr2DIGIXWAa/2fn3hlQdbNcIJXvu1dVxld8mkVSr3QHYnF5F
         F3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687866447; x=1690458447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jb69VzvuiNXGuyYEDdj75WrAIwBneAlG3cVR4iAIDo=;
        b=MR1MrcYbEOv4r0B4crvcd0VqowUqgfqRj3TdLf+Jwq18RjhGBhGh71JvmGay+lZbVu
         XkK5SvrfgS9a1LQmOFSsuYIByUSrDV/ktsjrCOj/nJCIpc6KcixYuvaMvBtldtBhcSww
         Flv1le1nrijxd/AjcYGkaQpTYZkpBzQmFEPmB5JgAx63bG/1+9le755UAGNd5focTcz3
         WW51445/lvzykL07Nbbae9aHqcHasyLbCo3dXyXahrjvEfvuAFxuiC94a2k8G0TqOUBW
         cW2sl2fcGVNq5XZmXMY1AtCCZkljteAdh3CzXMRkR3ZUPD+XoUnPP9UxTIPgHPD7+Fki
         tyoA==
X-Gm-Message-State: AC+VfDxCBR6kmmZa8OvJtKUC0tlmMvzyhxlGupDUPuDHAmHQHg6b+Zh5
        Q9SDuLhqAf8loWG5r47xB8ZrbAJZauy3di3vROoj6UhXvEBZgDOB
X-Google-Smtp-Source: ACHHUZ7AC91ntRak1vhDXqiVBt9TNQ9rq8sMr48JAcjfehZCIklNUVsHUkgyO30n9ui9NTOKXWbGIApzscMmVJux3Wk=
X-Received: by 2002:a05:6102:527:b0:440:d3f0:b516 with SMTP id
 m7-20020a056102052700b00440d3f0b516mr6782847vsa.25.1687866447077; Tue, 27 Jun
 2023 04:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <TYCP286MB1188B6A0379F7928C63288DF8A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
 <ZJk87rWsDj7pWJIP@sol> <CAMRc=McGOV+A8ROXRinUkWG0POTe37RWphRHDW6sy7UMU-e2UA@mail.gmail.com>
 <ZJo+wBMsyHvu/7Mj@sol>
In-Reply-To: <ZJo+wBMsyHvu/7Mj@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 27 Jun 2023 13:47:16 +0200
Message-ID: <CAMRc=MeyEuZpDXsZHVGdrivZbYjHr1YDiYAbu4A0--Xy9rKVUw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-cdev: Fix potential &lr->wait.lock deadlock issue
To:     Kent Gibson <warthog618@gmail.com>
Cc:     YE Chengfeng <cyeaa@connect.ust.hk>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "andy@kernel.org" <andy@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 27, 2023 at 3:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Jun 26, 2023 at 05:50:47PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Jun 26, 2023 at 9:23=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > >
> > > spin_lock_bh() should be sufficient, given that edge_irq_thread() is =
run
> > > in a softirq?  That is faster and would allow the hard irq handlers t=
o
> > > still run, and timestamp the event, but inhibit the edge_irq_thread()
> > > from being called on that CPU until the lock is released.
> > > (hmmm, gpio_desc_to_lineinfo() also uses spin_lock_irqsave() but it i=
s
> > > never called from hard irq context, so there is a good chance I'm mis=
sing
> > > something here??)
> > > More on spin_lock choice below.
> >
> > Again: this is incorrect - edge_irq_thread() doesn't execute in
> > softirq context which can be verified by calling in_softirq() from it.
> >
>
> Ok, that matches what I had initially thought.  Wading through the kernel
> doc got me thinking the secondary handler was run as a softirq.
> But it is a threaded irq used here, so the thread handler runs in a
> kernel thread, as does the debounce_work_func() and hte thread handler
> process_hw_ts_thread().
> That's a relief.
>
> While we are on the subject of spin_locks, why does
> gpio_desc_to_lineinfo() use spin_lock_irqsave()?
> I assume the _irq is necessary as the desc could be updated at interrupt
> level, but AFAICT gpio_desc_to_lineinfo() is only ever called from proces=
s
> context, so why not just spin_lock_irq()?
>
> Cheers,
> Kent.

Didn't we use an atomic notifier before for some reason? Then it got
changed to blocking but the lock stayed like this? It does look like
spin_lock_irq() would be fine here. On the other hand - if something
isn't broken... :)

Bart
