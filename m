Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B2C77CBDD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 13:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjHOLk6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 07:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236784AbjHOLkj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 07:40:39 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E482810E0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 04:40:34 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-584034c706dso58556977b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692099634; x=1692704434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HkKsN+jQZixL38MtamURXHoSGZeo/BaiGrIFFQCD/I=;
        b=VIntN0rOelRTHi9gfaeqTNS7zMPJAedltNFHdqzNwcDrJ+KhpKKQK+K9MnwnTsm00T
         LmRxTp3Rlzq5ewy9qlVg72MquroN3wRK4j8qAnaGLsecqtTlmlmnDVocA/hRRRc+/VUK
         zZvvSXfu0hAwUl0vvO1qGDD02wKwlALkIQ2yosMgEm5LhUI33+w5QFudOEjELI/13IHX
         J/d2uQoSG+nscEqa/vFMQICnMUuj4lntKW071pTjLi9C5hAQFzv9QcrquweDfmpugiqo
         yH5jEXKlZuTwx9IZJ2ZQjIC/CYGaj8nxFzpdu5GFJxKgOXt7GgtvfUZDHCP7MCX1i2jM
         WS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692099634; x=1692704434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HkKsN+jQZixL38MtamURXHoSGZeo/BaiGrIFFQCD/I=;
        b=gLNnuIErggSqGXRmixOsoKpVjtgwjpu4eOSzeHXQmkFVEGPYvzxRfCZZIR3+hs4mUa
         HJUvf6KojeQ29KJyw2qQ81kXQTZQ4b/VF8DA2R5ZND9rEV49++aBEMNAX9Cpd5lXVRau
         39VxuNYImRU4tCXcT/YNEkj9xAuJjjUyEetc0lKKkgezv5Kn5JfTI2vy0Q0EamGHP/BF
         MvveQrv1DSoJ0L61ihWinSanUq8DLkrS80QPnU8fuuo9/6NFaDmrvm8rEo7vlq1UyE8O
         YUqp5ZjP7cQ3fpwPJe+Tp+USAUNQinpr5WQkS4z/uCXZsAzpwymmWfcE2rIHHJyjDkxd
         OlyQ==
X-Gm-Message-State: AOJu0YxrBtvpXhqm2ngNIAYfZ00Wrom2AUHB29xIpv0YJh2qjnPO3uNb
        Xzc2qM6PJSCxkdygsqo4MeEmIuyBTo6jCIt4/DRdrQ==
X-Google-Smtp-Source: AGHT+IG95mC9+DsTmYlz+MGs4bkmxHO1ToFJljp6aW22BhGOBOFz2fTexJKVPhez06WdfB+/O0GOvd71pw25hEBuV4M=
X-Received: by 2002:a25:d886:0:b0:d44:a90b:ba56 with SMTP id
 p128-20020a25d886000000b00d44a90bba56mr13928179ybg.29.1692099634170; Tue, 15
 Aug 2023 04:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230811193034.59124-1-brgl@bgdev.pl> <ZNtKQlnQxFediB0J@smile.fi.intel.com>
In-Reply-To: <ZNtKQlnQxFediB0J@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 13:40:22 +0200
Message-ID: <CACRpkdZ32gW3YgQKPbWTnoRwxjXkViendGMhrAxfyp+W4NbqkA@mail.gmail.com>
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

On Tue, Aug 15, 2023 at 11:50=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Aug 11, 2023 at 09:30:34PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > After we remove a GPIO chip that still has some requested descriptors,
> > gpiod_free_commit() will fail and we will never put the references to t=
he
> > GPIO device and the owning module in gpiod_free().
> >
> > Rework this function to:
> > - not warn on desc =3D=3D NULL as this is a use-case on which most free
> >   functions silently return
> > - put the references to desc->gdev and desc->gdev->owner unconditionall=
y
> >   so that the release callback actually gets called when the remaining
> >   references are dropped by external GPIO users
>
> ...
>
> > -     if (desc && desc->gdev && gpiod_free_commit(desc)) {
>
> The commit message doesn't explain disappearing of gdev check.
>
> > -             module_put(desc->gdev->owner);
> > -             gpio_device_put(desc->gdev);
> > -     } else {
> > +     /*
> > +      * We must not use VALIDATE_DESC_VOID() as the underlying gdev->c=
hip
> > +      * may already be NULL but we still want to put the references.
> > +      */
> > +     if (!desc)
> > +             return;
> > +
> > +     if (!gpiod_free_commit(desc))
> >               WARN_ON(extra_checks);
> > -     }
> > +
> > +     module_put(desc->gdev->owner);
> > +     gpio_device_put(desc->gdev);
> >  }
>
> So, if gdev can be NULL, you will get an Oops with new code.

I read it such that gdev->chip can be NULL, but not gdev,
and desc->gdev->owner is fine to reference?

Yours,
Linus Walleij
