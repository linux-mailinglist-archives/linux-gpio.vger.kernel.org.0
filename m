Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2467AFB97
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 09:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjI0HB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 03:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjI0HB0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 03:01:26 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C95E5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 00:01:25 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7abbe1067d1so2574470241.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 00:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695798084; x=1696402884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bu46Nnc5KiWOqP0iBU5OgSADQzvEFoHS7NZgYb78GE=;
        b=iYetDO6FIHX9BY/YomwCZYRI7v2zaWfonRVnvLhBb9EV7D1AqCRxzjj2fia43L1rvT
         aDpczhw1jRbkVIdpIsrJVdoCKyavSxACt0NcwmYt+Yi0wXE9+z0+7eUBh+MlVzFdQOuE
         0dffzueDkywu/UQjDmWRAFKInKzrF3yLUt0YMPAqK2OtWultcfGePnf1l3ZQIQ/DUUou
         ZDSqvxBISRraYaEBc/BUTHYJ+gQeXFULRjrEbNcj2C9fQvdIPju+22GJwdTrJ2o/OxOJ
         KRnm7RVWQ9PlxNBwVNEI9uc6X2jf0ni3n1LttSsI2NG8lOcu/PFHimMxYB7Ua6WOnNd1
         amRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695798084; x=1696402884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bu46Nnc5KiWOqP0iBU5OgSADQzvEFoHS7NZgYb78GE=;
        b=eOl2mfVimMXNUOivYOHRjyCiFsAH7pYZX4Lj0GkOyogqopGdjGRnsapCb7u9a+n8+C
         GmBg/z/KHhyH3mz/gIO5KNJJUvWtXVlRdzWXniaOHGrQvhUzIVOQmbdGv8/gsZNDAEl7
         1qWtM18C3yGSAWuc12SeONXxFDGuTePQnaRvtbtZRJ6kvRgUdlBuaVYE/VxZc7Up5Ne1
         ou9dJdNR+MAlZ7gpTlYRfiyzlRHEBprGAM6jxaVnMiiOFxw65nmOYxntt0gkbQDYth5W
         9I+zmlUBIK8Jzw6fc4FFfq08B1DTjcucEMMf1T1chIBgxtn2IbuCbGL+aviY7FwTc0jX
         FdIQ==
X-Gm-Message-State: AOJu0YwqMgVbA0sVhsMhHoQ2hBJibGAU2/jvmOp8eC3vKUSCOGqZRrGH
        u44khvdqNYcpD9JTneDajkbMJuqd9ZLGdP4xgEMrMw==
X-Google-Smtp-Source: AGHT+IEsrVpVYrIqwlm3PLb8sGk3S8YZ/Uy/pN5ne1loIRWFmPa2c94oyGEq8VELO8JqjndDjY174GednvN4dOW+kUQ=
X-Received: by 2002:a05:6102:119:b0:44d:4b8d:31e5 with SMTP id
 z25-20020a056102011900b0044d4b8d31e5mr925106vsq.35.1695798084516; Wed, 27 Sep
 2023 00:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230920085639.152441-1-brgl@bgdev.pl> <CACRpkdYtbGqmMqN7FNhjYJGG+e0jWQmozf9kpNHiUBJvd2c=7Q@mail.gmail.com>
 <CAMRc=McrXEQbwcsK3yrfROujezjMd1L4EcJj7GNTCE5L6zD1gw@mail.gmail.com>
 <CACRpkdYNA1rkG5wJ0+rAT9g4EyzfbN5VP2a9vuMMk_RD6bMLFA@mail.gmail.com>
 <CAMRc=MeaAG5w_JzgSNs-EC5HY=2izC4W1FHZ54trEW_PvA8Yfg@mail.gmail.com> <CAMRc=McuKNg5r7m6OPtwYc3er7i6JB2JN=H6QVJU_G9BVtnuAA@mail.gmail.com>
In-Reply-To: <CAMRc=McuKNg5r7m6OPtwYc3er7i6JB2JN=H6QVJU_G9BVtnuAA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 09:01:13 +0200
Message-ID: <CAMRc=Md6=UNVt-HygYoaqwXXDdjrqsPvbyOrQcThjHOWAzLQ9w@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: extend the critical sections of lookup tables
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 25, 2023 at 4:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Sep 20, 2023 at 2:51=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > On Wed, 20 Sep 2023 12:58:58 +0200, Linus Walleij <linus.walleij@linaro=
.org> said:
> > > On Wed, Sep 20, 2023 at 11:33=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
> > >> On Wed, 20 Sep 2023 11:12:58 +0200, Linus Walleij
> > >> <linus.walleij@linaro.org> said:
> > >> > On Wed, Sep 20, 2023 at 10:56=E2=80=AFAM Bartosz Golaszewski <brgl=
@bgdev.pl> wrote:
> > >
> > >> > Can we rename this function gpiod_find_lookup_table_locked()
> > >> > as per precedents in the kernel, to indicate that it needs to be
> > >> > called with a lock held?
> > >> >
> > >>
> > >> I think you mean gpiod_find_lookup_table_unlocked() as with this cha=
nge it
> > >> will no longer take the lock?
> > >
> > > I think the pattern is the one I indicated: *_locked() means the func=
tion
> > > is to be called with the appropriate lock held, cf
> > > arch/arm64/kvm/hyp/nvhe/mm.c
> > >
> > > pkvm_create_mappings() takes a lock and then calls
> > > pkvm_create_mappings_locked() which even asserts that
> > > the lock is held.
> > >
> >
> > Ha! I always though the pattern is to call the functions that *DON'T* t=
ake
> > the lock _unlocked(). This is what I used in gpiolib-cdev.c or gpio-sim=
.c.
> >
> > I guess both conventions make sense in some way.
> >
> > Bart
>
> I don't think I will be doing it just now. We don't use this
> convention elsewhere in drivers/gpio/ and we'll have a lot of locking
> reworked soon anyway. We may get to it when that is done.
>
> Bart

If there are no objections, I'd like to queue it this week.

Bart
