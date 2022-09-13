Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 666F25B7C37
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 22:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiIMUaR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 16:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiIMUaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 16:30:15 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66806AA30
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 13:30:14 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id a20so7044968qtw.10
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 13:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=IrYH2Znyc6i2p/K0+CV/ZRunlEwhd/pDiycoB2aJ7zA=;
        b=RL0Gop3gHX3wZwobuD00qT5zq+2e4UPjYHiwRqEOvkTOqnqzmfbZfuaOKIOcHHXl//
         zIrDAvTaz/ta0baT9P7yquRB7hmJhwxVOFeOFGOvb4R2O1W9exTcd78cVP9t9+ZSzFVa
         Uh8sDtJxcBqSbmZKssjHR5gPcZep5Vo5bL+GzsnZu9xQxRAJJ/QKuGbVNaaVSvbf+OMF
         PXdheb6N6JXPxLZem58wxP7QYzjrR4hk6a8AaMHe5iQEPN6HN8KDw8izRfilf6mjCW1T
         ccRhBe77xu0eTZaEJaTs/dn7hbevIHSAkZ3dCm74sQT6OwUPe6eUKJ4Pu046f9KnR5tG
         1ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=IrYH2Znyc6i2p/K0+CV/ZRunlEwhd/pDiycoB2aJ7zA=;
        b=6IcpRwq/Js2KkvFixqkiEldN+zxkJjeqfP43V/c+V4j5bJN9/UoDU5uY0UwZfWYBUC
         fpobvQ7mExLld2+awpmt3bsdqdkgBf/FnekU+eCWSrpxQgeNjbi/hMQyAfqVzEoz8Nhc
         ymk3hcWwOfRiH7vf2AL1/N/okL6h2vzzdOmCaYQRQKzRxxQHVWZQNkZpx7aNuLFXFme2
         bFxl001aF7IXUUImqt9Fs5swORAL2h6hBIpDYC/9oRl/Ra0oalqSFD65EvRuoWnlsfSG
         zDAVDvgD7+P0mT/+V/bRP5S0CcKKDXNn3gaIgTl2izz+rZpSLg0X9wFewisdVkL83ua8
         bexA==
X-Gm-Message-State: ACgBeo2WfS3Zh5sbwBrTr/t0xyuis7wV7Um3Vrl3Z20nx8/n09qAud/I
        yAhxUMfXMc+vGgnSr4Xkj5I=
X-Google-Smtp-Source: AA6agR7qln2t7PJpctAJ4dtELlDqXDvOPr9Y1+FnUlYjc26b5LQ4FnpHdKZhGH6ej9STpK0iMvLPHQ==
X-Received: by 2002:a05:622a:347:b0:343:602e:d1eb with SMTP id r7-20020a05622a034700b00343602ed1ebmr30769478qtw.78.1663101013808;
        Tue, 13 Sep 2022 13:30:13 -0700 (PDT)
Received: from asus.cpetrescu.net (cpe-98-10-48-140.rochester.res.rr.com. [98.10.48.140])
        by smtp.gmail.com with ESMTPSA id g11-20020ac8580b000000b003438a8e842fsm275889qtg.44.2022.09.13.13.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 13:30:13 -0700 (PDT)
Message-ID: <e6e721b3756db8b7a4bfe902af53e3377e681187.camel@gmail.com>
Subject: Re: [PATCH] tools: Change asprintf return code check
From:   Catalin Petrescu <catalin.petrescu@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Date:   Tue, 13 Sep 2022 16:30:12 -0400
In-Reply-To: <CAMRc=Md47VUkZ47qoBpxSiHb6y5V2LsSkkO1ogvyY2KY4w4qyg@mail.gmail.com>
References: <e8bf314dd0edfd0709d71e85fb8d877c3722e33e.camel@gmail.com>
         <CAMRc=Md47VUkZ47qoBpxSiHb6y5V2LsSkkO1ogvyY2KY4w4qyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2022-09-13 at 16:47 +0200, Bartosz Golaszewski wrote:
> On Thu, Sep 8, 2022 at 4:03 PM Catalin Petrescu
> <catalin.petrescu@gmail.com> wrote:
> >=20
> > Hi there,
> >=20
> > I found a small error (IMHO) in libgpiod.
> > The issue is that asprintf may return -1 if it fails to allocate
> > memory, and if that happens, chip_open_by_number will pass a NULL
> > pointer to gpiod_chip_open.
> >=20
> > I hope this helps.
> >=20
> > Thanks,
> >=20
> > Catalin.
>=20
> Hey Catalin,
>=20
> Please next time send the patch inline using git's send-email
> command.
>=20
> You're right about the error code check but it should actually be ret
> < 0 as per asprintf's documentation.
>=20
> Bart

Hi Bart,

I'll use git send-email next time. I was not aware of its existence.
And I still need to figure out how to pass the gmail SMTP
authentication.

You're right, when asprintf returns zero, technically, that's not an
error.
My thought was that if asprintf ever returns zero, that means that the
path is a zero-length string.
So, the next call to gpiod_chip_open(path) will likely fail. But I
guess, the right thing to do is to let gpiod_chip_open() deal with it.

Thanks,

Catalin.


