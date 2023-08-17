Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF6D77F163
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 09:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348568AbjHQHlX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 03:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348631AbjHQHlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 03:41:20 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162A52D68
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 00:41:18 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so1966660241.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 00:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692258077; x=1692862877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9r3O4i6tomLTAdIVe1UKhoSaTbKeyjF0f89um1mCl8=;
        b=pHyxXUCABX6H+QXxNz5VxJABpQcdeMUmrTgoYAW3uOu6BkrfvNRXBFEQCp4OYQsaTA
         wZ5bEu/vLtt41TtGhjJEg4Om/C70lVHTsX8tWW0Vrkq9Ph7pg+yaY43iQ1YqlhVc5/8R
         VM8ww4ldDiYAJ44cL0pT5eojmzMvCyexKDYJy6FBDkZJI0zREueZtQ3pFHLw5ImW5FtR
         JcFR9UTyKwM0Qob2X+WEpWAaHiCltkG0QUdXi7KcIkL5RGZBrGYwQydIMgiSv3J/vbKu
         TC0xBCf+cBIUXDk6Piktilyh2TD4wyXFkKK1CyahIcbV55pAKsGn88uifFTLq5iZ8ZEN
         5pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692258077; x=1692862877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9r3O4i6tomLTAdIVe1UKhoSaTbKeyjF0f89um1mCl8=;
        b=hkUAE5e1GmE6FOM2JnQ6RkdZ64jUk8Gj7fJUCtUCEWhPrkiLtX5KczxeVHYtMwbA+0
         3aIepAwjSpAufMQ+eTlaOQGYzonwKozwOoFpp7gGFzLbYg4hrjmkxPWrAQNw9euc9V+x
         tRlVPL4PmHbCQlieC4Z6o/kdusw5koZ67r8lWVQ2/IWyIIHs9Z/RNWoS2K4YEby5trwE
         eQzX2/XvSitzM60NfcSWnePMh2CM/YYSpWXPkOyxm8iexU3aljoS1AMBtDS26Yd9pdaH
         ykeZsuOtEFvVPKgJB19WGvjFTaAg1cGWMRM6HOkaacA3te6ZI7G2NEwg+7Y0cRJgSy8w
         5ETg==
X-Gm-Message-State: AOJu0YymTIPFqKh6vxF9AbFpBUg00YCJfE6cYUD812RgxNC9s6tzv4Tu
        S6BFW2PlxOR/Vh9WsONrwOo1YsrcZxyp3A76jRfVwg==
X-Google-Smtp-Source: AGHT+IHNBqUCtrNQSr3V74uvRzR/HtZIM2+7YsSXHqauz6IoyG278m2Mf7QI8vwq0wjOZNnyRzFndDOTqyiV8w+yZww=
X-Received: by 2002:a67:f550:0:b0:445:91b:385d with SMTP id
 z16-20020a67f550000000b00445091b385dmr3522420vsn.12.1692258077169; Thu, 17
 Aug 2023 00:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230816122032.15548-1-brgl@bgdev.pl> <CACRpkdaTUi0r+nY12J8sLxmvfG2xRd+OMngcMiQkr5cqerevtA@mail.gmail.com>
 <ZN2k7gemanIpbyFh@sol> <CAMRc=MfwK6_m0N4cZqkpMX0Rka4WnWmtKTjq-cwbTR5+sjw9vw@mail.gmail.com>
 <ZN3OHqzT3grSdefP@sol>
In-Reply-To: <ZN3OHqzT3grSdefP@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 17 Aug 2023 09:41:06 +0200
Message-ID: <CAMRc=MfZ-5FKrtjrDTajHCu8n6q4dYyy-5R2AFDp2AKRem3YYw@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: cdev: bail out of poll() if the device goes down
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Thu, Aug 17, 2023 at 9:37=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Aug 17, 2023 at 09:27:37AM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 17, 2023 at 6:41=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Wed, Aug 16, 2023 at 11:41:06PM +0200, Linus Walleij wrote:
> > > > On Wed, Aug 16, 2023 at 2:20=E2=80=AFPM Bartosz Golaszewski <brgl@b=
gdev.pl> wrote:
> > > >
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > Wake up all three wake queues (the one associated with the charac=
ter
> > > > > device file, the one for V1 line events and the V2 line request o=
ne)
> > > > > when the underlying GPIO device is unregistered. This way we won'=
t get
> > > > > stuck in poll() after the chip is gone as user-space will be forc=
ed to
> > > > > go back into a new system call and will see that gdev->chip is NU=
LL.
> > > > >
> > > > > Bartosz Golaszewski (5):
> > > > >   gpio: cdev: ignore notifications other than line status changes
> > > > >   gpio: cdev: rename the notifier block and notify callback
> > > > >   gpio: cdev: wake up chardev poll() on device unbind
> > > > >   gpio: cdev: wake up linereq poll() on device unbind
> > > > >   gpio: cdev: wake up lineevent poll() on device unbind
> > > >
> > > > I see why this is needed and while the whole notification chain
> > > > is a bit clunky I really cannot think about anything better so:
> > > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > > >
> > >
> > > The issue I have is with the repurposing/reuse of the existing notifi=
er
> > > block that sends line changed events to the chardev.
> > > Correct me if I'm wrong, but now all line requests will receive those
> > > events as well.
> > > They have no business receiving those events, and it scales badly.
> > >
> > > My preference would be for a separate nb for the chip removal to keep
> > > those two classes of events distinct.
> > >
> >
> > I would normally agree if there was a risk of abuse of those
> > notifications by drivers but this is all private to gpiolib. And line
> > requests that receive line state notifications simply ignore them.
> > This isn't a bottleneck codepath IMO so where's the issue? We would be
> > using a second notifier head of 40 bytes to struct gpio_device for no
> > reason.
> >
>
> Yeah, this is a space/time trade-off, and you've gone with space over
> time.  I would select time over space.
> 40 bytes per device is negligable, and there is never a case where the
> line request wants to see a change event - it either relates to a
> different request, or it was triggered by the request itself.
> Is there an echo in here ;-)?
>

Ok, I'll rework it for v2.

Bart
