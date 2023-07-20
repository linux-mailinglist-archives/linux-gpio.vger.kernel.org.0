Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBD875B1E5
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 17:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjGTPBY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 11:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjGTPBX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 11:01:23 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843721BC8
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 08:01:21 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48137084a84so367895e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689865280; x=1690470080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUxYUSaOnaW/0CvKTbrMZ0sN9tEXUUetFnsk27TsSFw=;
        b=Ebe2IK6eQQs7azzUqnuGYYq9lysOuDhmt8jnPIXoJdPvRaBKoH4kx7CqO5K1MTdYRA
         MRt12qVGiOyD24jZHvqV2fFxlVEtC8GOwkfyu3mq1a7bDE3bo+vWbWXdbjvkXgSA/0sH
         FWsJ4oIf6scT191I+rBFOU6E8neHynnfdjslYvLzNCygBoga3vwysfJmxSpERiQ+8uI5
         0Jc0hDSkboD59x8RzqikLE1Zltr3QMA6pr0Y38v4+LpygjrmjrelugiY0KqSw//59m/8
         xvDnU9bjJal8JTTDR6ldcvkceOFZsYuZ9l248RiUIRWUk8bBP9Su2StY4vhaUEKw8RQ4
         0KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865280; x=1690470080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUxYUSaOnaW/0CvKTbrMZ0sN9tEXUUetFnsk27TsSFw=;
        b=jwN1rVZrAfxLIdtzSdenS6ZUJt/8ZePiR2M0J7A2naCf8F+OzxXK8y90DNaHgaO26h
         yfuy08j5OaAFBAHRJvqFIgP41oGXEWIGdavQ8xBpawpo8gCulxpjVUOa0N+7U9KlmbS4
         bK8+O/Ct9rFy4NweyAMu5F2ySoKz5TpK72qm9NtzNxJQFRBrfsPHxKiMWuB+laM1S7rX
         0AAeXTqWcW8dQCUVpCaBVjUpGudoCzWXy+UQAT8EZ8xi/kbJSoUHUPXJ6fHP9aLev6Fu
         Xcd7ruSgX97z8BUBiM1hRVFvoegBUnXmdcBVmHXn6NtGu1IRIeUESZ907O9dbmINkoyj
         1IyQ==
X-Gm-Message-State: ABy/qLbFX94lP4RkJ0NdUNdn4T5vbxLgmYCCcmykpuyv4L+SVm4bnuaW
        aAqsVQY+RnI66th7cVPxzuDa6GeQEaZZ1M+I7BRFpw==
X-Google-Smtp-Source: APBJJlEuewFhpzqUaGG+ZdHif2Q6LI4khPuf/MiuIbv6GiCi54roDJbKC9eEOJJ2uIYMABLNjJu78x5llsiQVpVDkD0=
X-Received: by 2002:a1f:43d2:0:b0:481:2dec:c27 with SMTP id
 q201-20020a1f43d2000000b004812dec0c27mr5897371vka.1.1689865280457; Thu, 20
 Jul 2023 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <ZLipqIJE1Mo4oK00@sol> <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol> <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol> <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
 <ZLj7an9hR7qy3foM@sol> <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
 <ZLkD6zFp2kLsO4fA@sol> <CAMRc=Md34kYQ4B8NQo2c+seJTN_24he7J5bwRD8sPy-xJyqkXw@mail.gmail.com>
 <ZLk4kVrT45dTNSNM@sol>
In-Reply-To: <ZLk4kVrT45dTNSNM@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 17:01:09 +0200
Message-ID: <CAMRc=Meu9X-1hE=tPzCUfo1QeyHSR=qxWzN++FKTHnzn=1HrBQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Thu, Jul 20, 2023 at 3:37=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Jul 20, 2023 at 02:30:45PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jul 20, 2023 at 11:52=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:
> > >
> > >
> > > The case I was thinking of was wanting to release a line, and if you
> > > don't know which request you will have to walk the request objects.
> > >
> >
> > You cannot release a single line if it's part of a wider request though=
.
> >
>
> Of course. Unless we were to extend the uAPI to allow that.
>
> > > And what of lines that are requested directly by apps other than the
> > > gpio-manager?
> > >
> >
> > You can tell they're used but cannot request them just like with any
> > other user of the cdev.
> >
>
> This is going to be a pain point - the concept of "used" is getting
> muddy.
>
> Say two processes want to get a line.
> So both need to request it before they can get it?
> Or only one does the request and both can get?

I think I badly worded the previous answer. The GPIO manager has no
notion of a user. It just receives a message from the bus. It's the
daemon that filters the users (e.g. only users in "gpio" group can
request and set/get GPIOs). So the answer is: one user can in fact
request a line, it stays requested by the manager and then another
user can set it or even release it as long as it's got the permissions
to do so. This is similar to how sysfs works.

>
> The latter case is painful to use.
> The former requires request being idempotent or at least to return an
> error that distiguishes a line already held by gpio-manager and a line
> already held but not by gpio-manager.
>

This should be fine. The manager knows if it's the one controlling a
line. It's just a matter of distinct error codes.

> > > > >
> > > > > Where do edge events fit in there?
> > > > >
> > > >
> > > > It's a signal exposed by the io.gpiod1.Line interface.
> > >
> > > But separate from the PropertiesChanged?
> > >
> >
> > Yes. PropertiesChanged is emitted on changes in properties (direction,
> > edge, all reported by gpionotify) while EdgeEvent is for edges
> > exclusively.
> >
> > >
> > > I am also wondering if the tools can be extended with the option to
> > > perform their ops using the gpio-manager, particularly get/set/mon th=
at
> > > currently require exclusive access.
> > >
> >
> > There's a client app already functional in my WiP branch. Think nmcli
> > for NetworkManager. It doesn't link against libgpiod - only uses the
> > DBus API.
> >
>
> Sure - doesn't mean other tools can't use the DBus API too.
> My thinking was existing users of GPIO tools could just add
> an option, say -D, to their scripts to switch over to gpio-manager.
>

The functionality of the DBus API doesn't have a full overlap with
using the library. I don't see why we would want to do this. It would
introduce a lot of overhead for no reason. I think a separate client
that doesn't use any libgpiod APIs at all is what's needed.

> > You can do something like this (not all of this is implemented yet):
> >
> > $ # Wait for a chip with a particular label to appear
> > $ gpiocli wait --chip=3D"foobar" --timeout=3D10s
> > $ # Request a line for edge events
> > $ gpiocli request --input --rising-edge --falling-edge foo
> > request0
>
> Will that support multiple lines, possibly spanning multiple chips?

Multiple lines, sure. Spanning multiple chips: I don't think so. Why
would we need this?

>
> > $ # List available requests
> > $ gpiocli requests
> > request0 (gpiochip0) offsets: [4]
>
> But that will only return the requests made by gpio-manager, right?

Yes.

Bart

>
> > $ # Wait for edge events:
> > $ gpiocli monitor foo
> > Offset: 4 RISING EDGE Timestamp: 3425234234
> > $ # Release the request
> > $ gpiocli release request0
> >
> > This way the user can easily use bash scripts, command line or even
> > any DBus library out there while we still use the character device in
> > the daemon and ditch sysfs.
> >
>
> Agreed.  As covered earlier, access control needs to be fleshed out, but
> other than that I don't see any obvious deal breakers.
>
> Cheers,
> Kent.
