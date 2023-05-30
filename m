Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30AA7716D3A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 21:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjE3TK0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 15:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbjE3TKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 15:10:25 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E60B102
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 12:10:24 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-456f19307f6so1494738e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685473823; x=1688065823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCHS8zkLdUVfdPCY5WRC1nCkdSWWiHrteQ+KXpZLz3o=;
        b=kxtGpRMLcuov04O9EeEpSTZzRlQZ2RitCjdLtFJCNVoaN/BeaMGcSiJrL7ippDj3D6
         j9LU+wrvSTpE/J88Uzue0zxvBiyJKA4hP6jamBLf93PNAksTzBw0f6SF0wH0shG88az+
         DSqseFssCioXhhDNQEVXSz0rCyl/J0qGgDKeR69p+/MG8+hKJw854Iw9+FNvxKeWDRkq
         hN++2oa57xc5VvKffg/BSmcz9ZQLEc+Q6S/ATX7Ea95wzAUbxgIn63VcMex4bjJuKvMT
         46o95dHU2QIIOw4kf4R3niz75+6bHlRUIPSBx81qqkj1YmXE4Ks53L0d4Mm010njrAYt
         U9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685473823; x=1688065823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCHS8zkLdUVfdPCY5WRC1nCkdSWWiHrteQ+KXpZLz3o=;
        b=WOB5BAzpqRPZcbCC5Vu4YvVWqubKKzRu1cN9o+gOgVD/S7jllwCA4kYsFzmx9B4sXj
         2cWCUexiM0TpfDIwI6ovMOZaKpx8NW41jnwcPSORnQ3QXTsr8cSs2aA/LmTrjlRxDi+I
         rqz2a7EDPGkZDZUeWuqusVu6rei7/oZ+OvsQxm+Gz11Pt49N7q2WDeQtE/p20z+5ATko
         BtT3RZ7JIqPBExiZEmMpdgVQdj50F2KYf2Uv+/wBAejkAzSEU7h/i+1IcXaKqBmcOf5q
         nt7tBzjueMOIwaYPYBonu2r2TI3K1O1X3j1DjowVpasKoOxt0Ve4lHLZVCo1jRgyvgyk
         2RDQ==
X-Gm-Message-State: AC+VfDzklaxYNuwdRtNSnYvFTmAiBB4ejunKJx/CMN939U2fSYmqWxgn
        a5MkyzpkME/f0bKDqjTvBr3L7qHQXAUaiXGtI4UEk3GkyIoSy7R0
X-Google-Smtp-Source: ACHHUZ7sjZuhZLRv1TgtNhUg0dTneRuCgZARJ7cpp8JHZ3ASaYO5d862TtIpnT+F05LTEYsoKwXEu20Hqb0S3HkoCdQ=
X-Received: by 2002:a1f:6008:0:b0:457:28:b2f3 with SMTP id u8-20020a1f6008000000b004570028b2f3mr1229819vkb.2.1685473823235;
 Tue, 30 May 2023 12:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
 <ZHXB83x85Qchv1XJ@sol> <ZHXcLvUNvw75Z-3W@surfacebook> <ZHX1bEThvg8Cq8zD@sol>
In-Reply-To: <ZHX1bEThvg8Cq8zD@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 May 2023 21:10:12 +0200
Message-ID: <CAMRc=Mc8Wnv_vTizO_UMkKenqr8n2g44x_KAURV7EQhD5ZQXwg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
To:     Kent Gibson <warthog618@gmail.com>
Cc:     andy.shevchenko@gmail.com, Gabriel Matni <gabriel.matni@exfo.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
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

On Tue, May 30, 2023 at 3:09=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Tue, May 30, 2023 at 02:21:18PM +0300, andy.shevchenko@gmail.com wrote=
:
> > Tue, May 30, 2023 at 05:29:23PM +0800, Kent Gibson kirjoitti:
> > > On Mon, May 29, 2023 at 08:20:44PM +0000, Gabriel Matni wrote:
> > > > From: Gabriel Matni <gabriel.matni@exfo.com>
> >
> > ...
> >
> > > My preferred solution is to run gpiomon as a coproc and have the
> > > controlling script perform the timeout. e.g.
> > >
> > > #!/bin/env bash
> >
> > Oh, this is too bad.
> >
> > > coproc gpiomon "$@"
> > > while :
> > > do
> > >         read -t5 -u ${COPROC[0]} event || break
> > >         echo $event
> > > done
> > > kill $COPROC_PID
> >
> > I'm wondering what coproc is and why it requires bash.
> >
>
> And I'm wondering why your mail got to the list, but not to me directly,
> despite being directly addressed.  It isn't even in my junk folder.
> And it was gmail to gmail.  Now that is weird.
>
> Anyway, coproc is a feature of many shells, such as bash, zsh, ksh.
> I don't think or ash or dash have coproc, but then you cn always use name=
d
> pipes to similar effect.  It would be similar to the simple gpioset
> daemon I posted the other day, just in reverse.
>
> I did say that coproc was my preferred solution, not that it is the only
> one.
>
> > What I want to have and keep that working is that all our tools can be =
run in
> > Busybox environment (embedded application). That's why I'm against seei=
ng bash
> > in any form of the tooling.
> >
>
> It isn't IN the tooling.  It is in the shell that calls the tooling.
> The tool test suite does require bash, but that is due to the framework w=
e
> use, not coproc.
>
> I take it you would be in favour of an idle timeout option then?
>
> I'm puzzled why no one has ever asked for it before, if it is something
> that is in demand.
>
> Cheers,
> Kent.

I do see value in this option. I'm not buying the argument about
losing events - the same can be said in reverse - before we even
request a line, we can lose events too.

Gabriel: please address the issues pointed out by Kent if you still
want to add this.

Bart
