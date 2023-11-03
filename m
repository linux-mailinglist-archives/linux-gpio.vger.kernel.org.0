Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B20D7E00A0
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 11:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347140AbjKCJbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 05:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346964AbjKCJbm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 05:31:42 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4771AD
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 02:31:36 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6d2de704f53so1098258a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699003895; x=1699608695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0CIibfkIfQitJ1kY5XWtQfKMO95o8Ql6TYvVfzoOvA=;
        b=AaDeCVbpouS8FtiASQ1bRSU9Rq16qCNyWTAggilBBTnK6FaSDaejuIKHFxg0R54yGr
         FLBcuhSuObyhEppoX/eqXaSb5CghrwuySItYMrLtuYEj+ER0/WarphbxRwO/MvWg5QPe
         Deb01hEtZczKToUOsbWZUQt+abuzLZtcs8vxGtJXnhenEAHuUVn0x9R9h6KPrr4yY7O2
         EBp3+YhsTxll9/w6as48IvT8xPy/TNpP0uDeOO18mt6dvGMp6d6nIlZRMT8N7aq1VmOD
         Wo+JkFma+7VdNRqSWAoOPa9vTm9Zc26qCkOXZrrzjKg9c9Qv8dVpNtysBua6krkIxkg3
         /mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699003895; x=1699608695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0CIibfkIfQitJ1kY5XWtQfKMO95o8Ql6TYvVfzoOvA=;
        b=c4xyHZPcjjLa9WWeJ6P4TdN3SZhlHgC+Lxy5tPWiXVSYN3UHuPBfdIowU5zOiQLG5j
         HmaEw2gKRuhHxsdFj4YyCHNnO58WtUG3sLUjvOjO09CDRZAEiPGBOYrdZavITAF/BLrD
         rEZ44X8nl2oSBLVqV8mM8UuQ9xDVVLuSEa22zemcfpR12chYXVX03Y6fuzeAvapS89Pt
         hrkhyo4D4pKw68cQCv0xQ24YY+saX5fFHKu4MkxzmJwYFWwnMDTAwf6NzPkBJCEIM6Nw
         pmne4zmdcT1aeHeWQ8ETGQ8YZr/ASFzb8DAK8BVIsHV/d8WV3NsScP0BvMZHHXT5ZPv9
         Dx1Q==
X-Gm-Message-State: AOJu0Yx8CwZXPPJOYB02d/9S8o8qHQFmF7UmVf2hx655OZtgfNAuwNG6
        QppNSa7rPLFXVkTefyDVmJ+Km8r8f1w+MLBSeWwLpQ==
X-Google-Smtp-Source: AGHT+IHwtiL91CtPvuVRalBnMyMJYh+WDe3vGoLh791FPKRLYaxL6Qt4v2paiJJfb64K+S3Am6pdW1oLK1RrGUMmGGY=
X-Received: by 2002:a05:6870:ab88:b0:1e9:896a:8055 with SMTP id
 gs8-20020a056870ab8800b001e9896a8055mr26956908oab.25.1699003895666; Fri, 03
 Nov 2023 02:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231025082707.821368-1-phil@gadgetoid.com> <20231025082707.821368-2-phil@gadgetoid.com>
 <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
 <ZTkS5V6kRevIZNfA@rigel> <CAMRc=McTz=X7+tMWa2hkrSvkCDt=3OF=GyFgT_U48LVmXQ2mOw@mail.gmail.com>
 <CA+kSVo9FVJwA4bCoGHWMbB9mysrLb2=icqMSj=hkkadetOEKfQ@mail.gmail.com> <CAMRc=Mc9OFCTfWxYwsOCLofV-wZfPaFo00GXRBCBaR4uKXO5AA@mail.gmail.com>
In-Reply-To: <CAMRc=Mc9OFCTfWxYwsOCLofV-wZfPaFo00GXRBCBaR4uKXO5AA@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Fri, 3 Nov 2023 09:31:24 +0000
Message-ID: <CA+kSVo_xAsY59_BQrrERQxe6hnhYG55aqg5JKxu8M=AyGejSRQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v9 1/1] bindings: python: optionally include
 module in sdist
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A quick aside, if modified to run on your system, does this script segfault=
?

```

import gpiod
from gpiod.line import Direction, Value

a =3D gpiod.request_lines("/dev/gpiochip0", consumer=3D"test", config=3D{
    23: gpiod.LineSettings(direction=3DDirection.OUTPUT,
output_value=3DValue.INACTIVE)
})

b =3D gpiod.request_lines("/dev/gpiochip0", consumer=3D"test", config=3D{
    24: gpiod.LineSettings(direction=3DDirection.OUTPUT,
output_value=3DValue.INACTIVE)
})

a.release()
b.release()
```


On Fri, 3 Nov 2023 at 09:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Nov 3, 2023 at 9:56=E2=80=AFAM Phil Howard <phil@gadgetoid.com> w=
rote:
> >
> > So, today's the day?
> >
> > What's the plan?
> >
>
> Yes! I'll apply this, release libgpiod v2.1, generate the python
> v2.1.0 release from it and upload it to pypi - this time to the gpiod
> package.
>
> Bart
>
> > On Thu, 26 Oct 2023 at 10:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > >
> > > On Wed, Oct 25, 2023 at 3:06=E2=80=AFPM Kent Gibson <warthog618@gmail=
.com> wrote:
> > > >
> > > > On Wed, Oct 25, 2023 at 02:50:57PM +0200, Bartosz Golaszewski wrote=
:
> > > > > On Wed, Oct 25, 2023 at 10:27=E2=80=AFAM Phil Howard <phil@gadget=
oid.com> wrote:
> > > > > >
> > > > >
> > > > > This now looks good to me. I'll leave it here until Friday and if
> > > > > there are no objections (Kent, would you mind reviewing this one?=
),
> > > >
> > > > I've got nothing to add.
> > > >
> > > > Cheers,
> > > > Kent.
> > > >
> > >
> > > Ok, I will actually delay it for a week until next Friday because I'l=
l
> > > be off Mon-Thu and I don't want to leave stuff broken if anything goe=
s
> > > wrong.
> > >
> > > Bart
> >
> >
> >
> > --
> > Philip Howard
> > Technology & Lifestyle Writer
> > gadgetoid.com
> >
> > Gadgetoid gadg-et-oid [gaj-it-oid]
> >
> >                                      -adjective
> >
> > 1. having the characteristics or form of a gadget; resembling a
> > mechanical contrivance or device.
