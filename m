Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0807E016E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 11:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbjKCJHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 05:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbjKCJHD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 05:07:03 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DCB1BC
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 02:06:57 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-45d9b477f7bso102693137.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699002416; x=1699607216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuO5MTipnJKI8GrkYL4T1Zyb3V+jp0yyaHTy5B24TtM=;
        b=dYcwRwhZy6a2j6HbglgTZxNB4h14rZuU62EBixSyTuNd8oA/ebicvqVBewww50gXJ+
         5DBvR8GvWg1v6HCcTv14amcZ27hbYmqyvOqtVcMhnWC6GsFSr5zI2fobbt1FiH+8p4t5
         WW5TeFH83Cco+BnL4nJidGVfOPrSv7XnyLQSY/RwLzg4yNtKoJs+Ba1p76za2k+IQ9Jh
         7CeJfCyOIds4IQF+97tEB/GUTtvHz6fq4PVN1WI6CLYvImHCgUWHmte3vh9yJ9qJ2Lav
         JXF1N9A/LCECS7Og+dSivb0/muSvuJ4/viz6cWbPBhG16hV9E5UTbyhI453LlakQ0YuR
         V7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699002416; x=1699607216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuO5MTipnJKI8GrkYL4T1Zyb3V+jp0yyaHTy5B24TtM=;
        b=H8tc5yI59vRqOK7w9B0z6MDcEg22BHJSN0lzARTFHJgn7yoyRJmY60f69Hf6HhsZr9
         NGK1IFqZoG0U7AP01py/7dHm98j7zV6E0RMM/DcLwhVoyxnBjBNcKs9GglBabuAGJx8S
         bGuCYNA3diFToboz9HJd2WPe+fQteSfbwn1mUhIi4QEZ72eYsaX/vP1zq0j3xndO/kcO
         QRIVSSyeg+s0jAizdUA2EJHjPsvElhV44PNPJ7TVykrX60rgK4r5WeMRWqN+xdae7HGI
         E/bynA1svhotmP88dpwJoj5OmcLyYfCAcA/TZADHrHQEa6raUB1hXnxxLY4d6F7TQQ4O
         Lt6w==
X-Gm-Message-State: AOJu0YxIYic1c80mj4RS9+/+4d8mdp7AZtTQaehoQuWAv3athEBVyfhv
        /XQY+a/y+2aicXSdTnh3lcYRGg19iZAVyiQ7pZ8/oA==
X-Google-Smtp-Source: AGHT+IFf24AGHa7Otw2Km7P5mj4ML/LI68iG2TjEUa7yoe34OrBEcq8YR7LyI42kvsO05kS/Q0yISqw9LXrz8gDyoDg=
X-Received: by 2002:a67:cb8d:0:b0:45d:a27a:7e8c with SMTP id
 h13-20020a67cb8d000000b0045da27a7e8cmr206397vsl.23.1699002416350; Fri, 03 Nov
 2023 02:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231025082707.821368-1-phil@gadgetoid.com> <20231025082707.821368-2-phil@gadgetoid.com>
 <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
 <ZTkS5V6kRevIZNfA@rigel> <CAMRc=McTz=X7+tMWa2hkrSvkCDt=3OF=GyFgT_U48LVmXQ2mOw@mail.gmail.com>
 <CA+kSVo9FVJwA4bCoGHWMbB9mysrLb2=icqMSj=hkkadetOEKfQ@mail.gmail.com>
In-Reply-To: <CA+kSVo9FVJwA4bCoGHWMbB9mysrLb2=icqMSj=hkkadetOEKfQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Nov 2023 10:06:45 +0100
Message-ID: <CAMRc=Mc9OFCTfWxYwsOCLofV-wZfPaFo00GXRBCBaR4uKXO5AA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v9 1/1] bindings: python: optionally include
 module in sdist
To:     Phil Howard <phil@gadgetoid.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
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

On Fri, Nov 3, 2023 at 9:56=E2=80=AFAM Phil Howard <phil@gadgetoid.com> wro=
te:
>
> So, today's the day?
>
> What's the plan?
>

Yes! I'll apply this, release libgpiod v2.1, generate the python
v2.1.0 release from it and upload it to pypi - this time to the gpiod
package.

Bart

> On Thu, 26 Oct 2023 at 10:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Wed, Oct 25, 2023 at 3:06=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Oct 25, 2023 at 02:50:57PM +0200, Bartosz Golaszewski wrote:
> > > > On Wed, Oct 25, 2023 at 10:27=E2=80=AFAM Phil Howard <phil@gadgetoi=
d.com> wrote:
> > > > >
> > > >
> > > > This now looks good to me. I'll leave it here until Friday and if
> > > > there are no objections (Kent, would you mind reviewing this one?),
> > >
> > > I've got nothing to add.
> > >
> > > Cheers,
> > > Kent.
> > >
> >
> > Ok, I will actually delay it for a week until next Friday because I'll
> > be off Mon-Thu and I don't want to leave stuff broken if anything goes
> > wrong.
> >
> > Bart
>
>
>
> --
> Philip Howard
> Technology & Lifestyle Writer
> gadgetoid.com
>
> Gadgetoid gadg-et-oid [gaj-it-oid]
>
>                                      -adjective
>
> 1. having the characteristics or form of a gadget; resembling a
> mechanical contrivance or device.
