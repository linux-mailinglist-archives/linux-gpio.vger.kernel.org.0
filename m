Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0448E70D9D3
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 12:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbjEWKEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 06:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236509AbjEWKDq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 06:03:46 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3EB10F9
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 03:03:26 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-783ec566cb9so2338369241.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684836205; x=1687428205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zT+mgDlV2kvR+7AXEfcgokZitKqnJyd7IB0TDC2J/s=;
        b=P/+xQCTcXs4zLyDA3Vc2QDYZ2AF4QxRBkA2zR0SEU4rSvGJbZKKC0Fv17aII8F8azI
         pTkmCbCsfD/WMMhhKNSNnIQDYpKgoSAjNzaL1Es7Jk+q8LuiMF9SVo8KdAco9SHiMDte
         EiBNI96Es7P1kuFN97i1Yue1yCKc3+yJZ25/8GnB7QzqLf6TlRSJpXnmaajC0qkG2MMF
         rr+LZAYg+/CW+0XcWbaSS5xz140yFIICYKuqBtaGqdk1lQxvKv4/+/wNnJU3HAK/UDRE
         5zM/2a5IFG8UUi3OZodCqIMcr5pquAY3b07F49KImVsKkOCoGWouq8O8+Uu6xEPsNW5L
         Dm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684836205; x=1687428205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zT+mgDlV2kvR+7AXEfcgokZitKqnJyd7IB0TDC2J/s=;
        b=VLmHBV8I6T69rE8UNmhNvLl2RWNeRwhimsy+Lp5aOzExrLrLdK8uECsYjTvzNTHf8N
         dY/x8FbO18yaRItL6fPywDithYn1KrkqHR+Eb9JswJ/UBoyIQQRfEkqYK/Y2aO+QUFji
         NzyOtd73us3hf/M6nk7WEBvuqy+cxfINgNUwVjGugEbyGni+SA1EFvlFzfMfToSy0fzE
         La9Q3TGHNfToezYF92wAMhOAju1AtUdPtFoDIgBP64n0wJBK1UTqV7zE3Fz1iy1CI7Hd
         mrN8zpmtuqI1bAqVSxpeU/hsEY/v5PrejaCLKHuZVMpoSSkMi+d4J1dZ3gg6eaSYMwRU
         AdUw==
X-Gm-Message-State: AC+VfDwIn3Zs2fFwxbHpTIfHGhfE4Is48ThRigM/PoZteh546evIVaCw
        NGg9OVYshIyrJgvxb0IZwp4VPlAlpKQQ9JlOFeHteQ==
X-Google-Smtp-Source: ACHHUZ4/LsfOkwUZY7EQfQthFyZZjn3vH4GpBQ8hVtK+Fk3VgXSEtk9P5DYaau1fM8buZvHJky8Fasjb5Pk3Hr5GLfQ=
X-Received: by 2002:a05:6102:3c1:b0:439:e3c:8ef8 with SMTP id
 n1-20020a05610203c100b004390e3c8ef8mr3415987vsq.28.1684836205079; Tue, 23 May
 2023 03:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <3545766.4eto28bQOc@archbook> <ZGcGZwwRiy2jFfR0@sol>
 <46830564.8zq9ZvEiHi@archbook> <ZGeOLYZ1tEKfMOwn@sol>
In-Reply-To: <ZGeOLYZ1tEKfMOwn@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 12:03:14 +0200
Message-ID: <CAMRc=McTcK=fPPrkPSr2X5hhypr3aas_f2HJs4TivsJtPHqjeA@mail.gmail.com>
Subject: Re: [libgpiod] Python bindings don't allow to wait on events indefinitely
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
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

On Fri, May 19, 2023 at 4:56=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Fri, May 19, 2023 at 04:32:32PM +0200, Nicolas Frattaroli wrote:
> > On Freitag, 19. Mai 2023 07:17:27 CEST Kent Gibson wrote:
> > > On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrote:
> > > > Hello,
> > > >
> > > > in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
> > > > as passed to ppoll could ever be NULL. This means waiting indefinit=
ely
> > > > was impossible.
> > > >
> > > > I thought hey, maybe the new Python bindings in libgpiod 2.x fixed =
this,
> > > > but no, it has made it worse by explicitly setting timeout to 0 sec=
onds
> > > > if it's None[1]. Obviously, this behaviour can't be changed now, be=
cause
> > > > people depend on this API to return immediately now with None as th=
e
> > > > parameter, and changing it to wait indefinitely would no doubt brea=
k
> > > > actual programs.
> > > >
> > > > So I'm left wondering if there's a particular reason users of these
> > > > bindings shouldn't wait on events indefinitely or if that same mist=
ake
> > > > was just made twice in a row.
> > > >
> > > > Is there some way the API could be enhanced to support waiting for
> > > > events indefinitely without having to slap a While True with
> > > > an arbitrarily high timeout around every single invocation?
> > > >
> >
> > Hello Kent,
> >
> > > That does sound like a bug to me, but the rest of your mail isn't wor=
th
> > > responding to.
> >
> > I'm not quite sure what you mean. Was my tone this off? I apologise if
> > you took my displeasure with libgpiod's bindings as a personal attack,
> > it wasn't intended as such.
> >
>
> Not a personal attack on me, but offensive none the less.
> Assume you are the code owner and see how it parses to you.
>
> > > A more productive approach could be to submit a patch that describes =
the
> > > problem and suggests a fix, say:
> > >
> > >  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] =3D =
None) -> bool:
> > > -    if timeout is None:
> > > -        timeout =3D 0.0
> > > -
> > >
> > > and see where that goes.
> >
> > That would go nowhere, as this makes the API behave differently for cur=
rent
> > users calling the function without an argument, as I've mentioned.
> >
>
> By that logic any bug that has visible effects cannot be fixed - in case
> some user depends on those effects.
> And all bugs have visible effects.
>
> The function docs don't specify the behaviour when None is passed -
> despite None being the default.
>
> > One solution would be to pass float("inf") and then check for that, thi=
s
> > wouldn't break the API, merely extend it, but I'm not sure how good of
> > an idea that is to do if someone uses an older libgpiod that doesn't
> > have an explicit check for inf. I don't even know what passing inf does
> > right now, but it's probably worth looking into.
> >
>
> Please no.
>
> I would expect the API should stick to standard Python conventions,
> similar to select itself - " When the timeout argument is omitted the
> function blocks until at least one file descriptor is ready."
> so wait_edge_event() should block, as should wait_edge_event(None)
>
> > > to submit a patch
> >
> > Move the project back to a git forge and I will.
> >
>
> And there you go being confrontational again. GFY.
>
> Read the README - you submit patches to this list.
>
> And not my project, so not my call on where it is hosted.
> I'm just trying to help you out here, but I'm left wondering why.
>

I wouldn't call it a bug, more like unusual behavior as far as Python APIs =
go.

I never noticed it before because I typically use the file descriptor
directly and pass it to the polling function of choice.

In any case - the easiest way to fix this would be allowing the use of
a negative number to indicate that we should wait forever. Any issue
with that?

Bart
