Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B820D7E0201
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 12:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346546AbjKCKdR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 06:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345322AbjKCKdP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 06:33:15 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14ADF1BF
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 03:33:10 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-457c19ebb3aso797725137.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 03:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699007589; x=1699612389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb7mSWCBGIPUennzUTu2/fCRALqJ8xVkXl+PkSRYwV0=;
        b=gVYUAqXncuvvmgARkOg/kJVfmudT+So7M8gw/qCTCA2TEtPjnkEFCjCv4MMwXKB5jG
         AjZD9zyBgkSlQyDsYY6F4ZYR98M7fdffVY78aJgfwhQ77UJHQIhgRAXiy8HO1Fae+6Zj
         W0ABEkW2heBGWCrGMu07KBMcvQsD6AUvs+HI916/D09z78vKOovysHfn17rh/+NpBdkW
         n6wYEExUkyx5iC9N5WfFbH4P0ACyfZvKTX1HBpGUCEdchZ92bEuzMlklijmEiAURmVND
         pmDsz70jxrhiTVTTXuPUm5L22fzv66DDYxnYqTkMbJt3Hii/D9S7uOUqYo5lnmHLR226
         dxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007589; x=1699612389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jb7mSWCBGIPUennzUTu2/fCRALqJ8xVkXl+PkSRYwV0=;
        b=ElZ2V/OI4kJUUtOe39KZ3+h05+HGtrVPtUsx4DU+E+AClUhcwxK/tb4itEHJuzTi+c
         oJkWzvOUTVvos5RJgKGYoReQyFNmxjNdM6+Xs2Ugrn5vhspNKNfd2mKH3fCbOuYbjW+G
         eP3FIQtNzrYgz0SyTq9rdJugDjSQK/SL9miejkH6nf87doWDoN1cZmSgbr8hHLiln5vX
         W7vFdIM4UbFfPUR0TBHLXnT087Qma0w6w/epWtzI4J0IWbCkkMF8K45AbfokHYWTv97u
         qiz0bH6gUE/lRtJ5YHWodahnA891ALivHp/ivUmWm/ws3Ul3XhWXoyDNMXBiHVkKg9oE
         sZ3g==
X-Gm-Message-State: AOJu0Yxbsov6OSp2bJ8ajTdkdPyz5fnHAuusDtcc+X9WBhMNqd5CITLL
        qbKway7ZoqKLo1sFvep5ZgTqKW458pGvOI9fkVenui2Pd97LWbZ8
X-Google-Smtp-Source: AGHT+IGZEPIjXGT1GQaQP8P2p5qpT1FjZOpAAjAvec/zlNppk5SXXcKe3ndOQUoIad6hKrpQQW/uv5cMyjUcrOA83BU=
X-Received: by 2002:a67:e1d3:0:b0:45d:9a4d:dc1d with SMTP id
 p19-20020a67e1d3000000b0045d9a4ddc1dmr516193vsl.8.1699007589137; Fri, 03 Nov
 2023 03:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231025082707.821368-1-phil@gadgetoid.com> <20231025082707.821368-2-phil@gadgetoid.com>
 <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
 <ZTkS5V6kRevIZNfA@rigel> <CAMRc=McTz=X7+tMWa2hkrSvkCDt=3OF=GyFgT_U48LVmXQ2mOw@mail.gmail.com>
 <CA+kSVo9FVJwA4bCoGHWMbB9mysrLb2=icqMSj=hkkadetOEKfQ@mail.gmail.com>
 <CAMRc=Mc9OFCTfWxYwsOCLofV-wZfPaFo00GXRBCBaR4uKXO5AA@mail.gmail.com> <CA+kSVo_xAsY59_BQrrERQxe6hnhYG55aqg5JKxu8M=AyGejSRQ@mail.gmail.com>
In-Reply-To: <CA+kSVo_xAsY59_BQrrERQxe6hnhYG55aqg5JKxu8M=AyGejSRQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Nov 2023 11:32:58 +0100
Message-ID: <CAMRc=Mf28a_ypTnceq-U1s3UACO9o5=gzsxozZTwHxqW3OtnxA@mail.gmail.com>
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 3, 2023 at 10:31=E2=80=AFAM Phil Howard <phil@gadgetoid.com> wr=
ote:
>
> A quick aside, if modified to run on your system, does this script segfau=
lt?
>
> ```
>
> import gpiod
> from gpiod.line import Direction, Value
>
> a =3D gpiod.request_lines("/dev/gpiochip0", consumer=3D"test", config=3D{
>     23: gpiod.LineSettings(direction=3DDirection.OUTPUT,
> output_value=3DValue.INACTIVE)
> })
>
> b =3D gpiod.request_lines("/dev/gpiochip0", consumer=3D"test", config=3D{
>     24: gpiod.LineSettings(direction=3DDirection.OUTPUT,
> output_value=3DValue.INACTIVE)
> })
>
> a.release()
> b.release()
> ```

Nope, works fine. What is the stack trace?

Bartosz

>
>
> On Fri, 3 Nov 2023 at 09:06, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Fri, Nov 3, 2023 at 9:56=E2=80=AFAM Phil Howard <phil@gadgetoid.com>=
 wrote:
> > >
> > > So, today's the day?
> > >
> > > What's the plan?
> > >
> >
> > Yes! I'll apply this, release libgpiod v2.1, generate the python
> > v2.1.0 release from it and upload it to pypi - this time to the gpiod
> > package.
> >
> > Bart
> >
> > > On Thu, 26 Oct 2023 at 10:29, Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > > >
> > > > On Wed, Oct 25, 2023 at 3:06=E2=80=AFPM Kent Gibson <warthog618@gma=
il.com> wrote:
> > > > >
> > > > > On Wed, Oct 25, 2023 at 02:50:57PM +0200, Bartosz Golaszewski wro=
te:
> > > > > > On Wed, Oct 25, 2023 at 10:27=E2=80=AFAM Phil Howard <phil@gadg=
etoid.com> wrote:
> > > > > > >
> > > > > >
> > > > > > This now looks good to me. I'll leave it here until Friday and =
if
> > > > > > there are no objections (Kent, would you mind reviewing this on=
e?),
> > > > >
> > > > > I've got nothing to add.
> > > > >
> > > > > Cheers,
> > > > > Kent.
> > > > >
> > > >
> > > > Ok, I will actually delay it for a week until next Friday because I=
'll
> > > > be off Mon-Thu and I don't want to leave stuff broken if anything g=
oes
> > > > wrong.
> > > >
> > > > Bart
> > >
> > >
> > >
> > > --
> > > Philip Howard
> > > Technology & Lifestyle Writer
> > > gadgetoid.com
> > >
> > > Gadgetoid gadg-et-oid [gaj-it-oid]
> > >
> > >                                      -adjective
> > >
> > > 1. having the characteristics or form of a gadget; resembling a
> > > mechanical contrivance or device.
