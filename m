Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC8C77CD27
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 15:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237336AbjHONIX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 09:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235130AbjHONID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 09:08:03 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE9DB0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 06:08:02 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bd0911c95dso4861384a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 06:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692104882; x=1692709682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNrPaM/FeB6AJxDwItyHoZJ9dPi7u4+7sDupNxPl8GE=;
        b=UWkoDQMCTw5VJYpvtdwR3R58Sdp+TZoZdLur78QdOr/WcAc9bvPbPSlMP+Y4ceZJih
         Iwi0RL+ngbQI11P88haMJ3cvjLA9099MTMsxwd/IzTUJtOGyoZ9S7VTqLyn9C4TgCWQO
         EqELNhrRopbxbtWSl0ISpeKyQPu/nDMkNgNPn7uhLNRIiZLikHLldsvIhgX8PN00HKu5
         eEK63xgL+n0D5URa6jLfWXKpEgrfwg6a6Uu4YT2yLTd5hPS/oVfuBz43N30kfXUBBglg
         luxto/R4MKYq87J/9NBQipu9VAnmLvpzF7yvzDVLBGrfrwqdMl9DFWi9kQ6xUILh26Lu
         9aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692104882; x=1692709682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNrPaM/FeB6AJxDwItyHoZJ9dPi7u4+7sDupNxPl8GE=;
        b=O01c8tShPG0z6IMCAIlfWI+/FqVrmqy5GGPvCi/1EWJlWJ3iXUWpItL4cOe4AwADn9
         WITRNPTuNEHiG4ZQLWeHRZHQwryUcSfabzfpFsI+sJMVMAabVgq20Yba1zspJXADF3w8
         Bmj7idCfr2RrpymZFBs1snq2mEueUG/U2hK8ex39H2/Mwn23A5qR3b1huXYCOYP20Q9t
         G0Robr731B9tH6A+6/kyTo46iA/u3JHAbBvMTVVcBTnEJtjPfZipJJg7Z3Y6qngIar4g
         tKhSuqzrFNnwyPD/VO8TiqzabthRL+0R7fD1hpva/qmjZ76U5PFquYRJ1dxP1nSOiB0X
         vcAg==
X-Gm-Message-State: AOJu0YwiCgxTBYyXIlMKqwz/bZAa2t9EjukanSnc0Z0Z3GO/Wc+enyaU
        m3XvdxcoNocAbos8/vWA5EHWzTyRdfvVSZdkGowm5Q==
X-Google-Smtp-Source: AGHT+IHir06hkVtEo/8UA5JIbMguLsDOXrYLBLxWciYx9iN4n2rp+ckcfqHR8rbAbDTNLluD2kAbBTuZTJF1XT0o20o=
X-Received: by 2002:a05:6830:10d2:b0:6b9:1ad8:18d8 with SMTP id
 z18-20020a05683010d200b006b91ad818d8mr11382043oto.27.1692104881948; Tue, 15
 Aug 2023 06:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230811193034.59124-1-brgl@bgdev.pl> <ZNtKQlnQxFediB0J@smile.fi.intel.com>
 <CACRpkdZ32gW3YgQKPbWTnoRwxjXkViendGMhrAxfyp+W4NbqkA@mail.gmail.com> <ZNt2KQMtpMdK9TyY@smile.fi.intel.com>
In-Reply-To: <ZNt2KQMtpMdK9TyY@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 15:07:50 +0200
Message-ID: <CACRpkdbij=8NMVodezEXG-rtiBzp1q_fecizYtda4HbDXheu8Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 15, 2023 at 2:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Aug 15, 2023 at 01:40:22PM +0200, Linus Walleij wrote:
> > On Tue, Aug 15, 2023 at 11:50=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Aug 11, 2023 at 09:30:34PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > After we remove a GPIO chip that still has some requested descripto=
rs,
> > > > gpiod_free_commit() will fail and we will never put the references =
to the
> > > > GPIO device and the owning module in gpiod_free().
> > > >
> > > > Rework this function to:
> > > > - not warn on desc =3D=3D NULL as this is a use-case on which most =
free
> > > >   functions silently return
> > > > - put the references to desc->gdev and desc->gdev->owner unconditio=
nally
> > > >   so that the release callback actually gets called when the remain=
ing
> > > >   references are dropped by external GPIO users
>
> ...
>
> > > > -     if (desc && desc->gdev && gpiod_free_commit(desc)) {
> > >
> > > The commit message doesn't explain disappearing of gdev check.
> > >
> > > > -             module_put(desc->gdev->owner);
> > > > -             gpio_device_put(desc->gdev);
> > > > -     } else {
> > > > +     /*
> > > > +      * We must not use VALIDATE_DESC_VOID() as the underlying gde=
v->chip
> > > > +      * may already be NULL but we still want to put the reference=
s.
> > > > +      */
> > > > +     if (!desc)
> > > > +             return;
> > > > +
> > > > +     if (!gpiod_free_commit(desc))
> > > >               WARN_ON(extra_checks);
> > > > -     }
> > > > +
> > > > +     module_put(desc->gdev->owner);
> > > > +     gpio_device_put(desc->gdev);
> > > >  }
> > >
> > > So, if gdev can be NULL, you will get an Oops with new code.
> >
> > I read it such that gdev->chip can be NULL, but not gdev,
> > and desc->gdev->owner is fine to reference?
>
> Basically the Q is
> "if desc is non-NULL, does it guarantee that gdev is non-NULL either?"

gdev->desc is assigned in one single spot, which is in
gpiochip_add_data_with_key():

       for (i =3D 0; i < gc->ngpio; i++)
                gdev->descs[i].gdev =3D gdev;

It is never assigned anywhere else, so I guess yes.

We may also ask if it is ever invalid (i.e. if desc->gdev can point to
junk).

A gdev turns to junk when its reference count goes down to zero
and gpiodev_release() is called effectively calling kfree() on the
struct gpio_device *.

But that can only happen as a result of module_put() getting
called, pulling the references down to zero. Which is what we
are discussing. The line after module_put(), desc->gdev
*could* be NULL.

But then we just call gpio_device_put(desc->gdev) which is
just a call to device_put(), which is NULL-tolerant.

Yours,
Linus Walleij
