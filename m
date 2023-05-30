Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2272971635A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 16:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbjE3ON6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 10:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232950AbjE3ON5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 10:13:57 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2F0185
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 07:13:22 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-45700c4b74dso2927103e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685455997; x=1688047997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stG9AK+nXUQ2oZZhGNaZsheBo7PZkbkzAIyZWylbZAk=;
        b=uMPh/Sg5daRZTKW/kc2LhKVJUUFwrhrmkBos6YYjuwjdWHJxNYw8eLXnVe2D26AIbY
         polKRC85q/S4PSDQck6ppsctNfeILDlE8oZelfV4C+WTDRZ37EBsqfvZvt9R7cAfo7v7
         ca2fUz7HC8YnxwWtCL2U+84J+GQU1BPxZHZP4lWAh0EUq2ERVDNhl7ZHlal+LRdiNUEq
         yWTgoBpZFXfP1lsS4iRi2D+EybamTdviD/3d+/RTRryWDQuPr9dRr4nlShVP9Q67Q8YU
         sQu/wvt/sUbB7slOBEo5AiekYy7CjU1N/rsu1+zA88ZuXNaPVojPvKLRPcPtzZP5aMkL
         k/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455997; x=1688047997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stG9AK+nXUQ2oZZhGNaZsheBo7PZkbkzAIyZWylbZAk=;
        b=Sd5a2dvrXUUmBjBQU589/zM2aVUM+A2ASqwhQI8/cRV6jbc+rTN7kYKFkbvHbzkcAu
         s2pVMNzIW9S7AxhIYwMN99ZPFTQP6GTaa0Uo9C9xbIQbxluTl/Xabow0AFevQG9RhyoB
         f85Ssjn06MZha+kHqNxBX+SU5sZYqJbOHUNdtUyzauAszI5dki+GYV0Ger+/Ue3JNYk6
         Y05CVN68TQUx8DrjmAoc5+rwoVrCoMneElVcphirTyYGcG6iwITL6FC2fgKKksBY3iur
         RVceHp9xi4VhgvYL/Jc4xg+a8NObT2EQV0hr/Coj1xOLVXuTppQgzanCT/2oadzeVX4v
         9ZWQ==
X-Gm-Message-State: AC+VfDxv6gGdKugpS4ddnmih4VRDBfU/fDbKGJvW+dYDCKcdtCqAyfQv
        5tv3PDUZ0TQV82GNO0fgJKi0FLcd5qeZewCJ1JkJBw==
X-Google-Smtp-Source: ACHHUZ5EhUttjUmCsHHqoVGWvDj82YfJHlTycktw46eZwl/U3yFjlySEDEd/DIU3Xn8TdZlg4M3sdwLn+OB3VfhSdBE=
X-Received: by 2002:a67:b405:0:b0:437:d987:87f3 with SMTP id
 x5-20020a67b405000000b00437d98787f3mr961068vsl.15.1685455997107; Tue, 30 May
 2023 07:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol> <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com> <ZHXKRtJOYSw42BAi@sol>
In-Reply-To: <ZHXKRtJOYSw42BAi@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 16:13:06 +0200
Message-ID: <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "Slater, Joseph" <joe.slater@windriver.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
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

On Tue, May 30, 2023 at 12:05=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Tue, May 30, 2023 at 11:51:05AM +0200, Bartosz Golaszewski wrote:
> > On Thu, May 25, 2023 at 11:54=E2=80=AFPM Slater, Joseph
> > <joe.slater@windriver.com> wrote:
> > >
> > >
> > > [Slater, Joseph] I'll get rid of the comment and try the test with a =
shorter toggle time.
> > > The series of 159 tests takes, maybe, 10-15 minutes for me, so I don'=
t think saving a
> > > second or two here would make much difference, though.
> > > Joe
> > >
> >
> > That can't be right, are you running it on a toaster? It takes 26
> > seconds on my regular lenovo thinkpad laptop which is still longer
> > than I'd like but quite acceptable for now (though I agree it would be
> > great to improve it).
> >
>
> Consider yourself blessed.
> I just got:
>
> real    2m25.956s
>
> on my test VM.
> Not sure exactly what the hold up is - it isn't using much CPU, or any
> other resources AFAICT.
> Compared to all the other test suites I run, this is far and away the
> slowest, especially since switching everything over to gpio-sim.

I agree it's too slow - be it 20 seconds or 2 minutes. But similarly
to you - it's very low on my TODO list as I only run it every once in
a while. I'd be happy to accept any patches improving the situation of
course.

Bart
