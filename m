Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15826CD8A4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 13:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjC2Lmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 07:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjC2Lmw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 07:42:52 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFAE10F
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 04:42:51 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F183C3F22E
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1680090168;
        bh=zs++jaTzVHpeO/4v5K2R1togHPkJNK1XzCiBbuxQK9M=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Eh4LGBLm62OtZzeimyPVzDKVdIR98m+oOzoF34tCbPXZbu61aNYTZhdLNk52j70ZG
         zgcdS1jhl75sZPr1Gr7r5H3hH5uYD4LuQTCbVMd72/ht/QJoDqULm3zi4V/d9e6FTC
         vZgUeXNylb6558NKe2ESAo28Yv6r+JvRttHODtr84KBas15i+jcuk67/LD+Tzb+Ta8
         I7Lo1dJqR8SX4N9dC5oOqJpsfxC1ZCDNFimtn/nh8KWttidK41TKI8BIOVK/2VUF8w
         CmwrxQRbHKg9LxLGfl9hks4X/ebXhlkAd4f0tPqK1Ovc3v1+rcZy8rA7z3XvZrihxE
         7UHsyakfCXlPw==
Received: by mail-wm1-f70.google.com with SMTP id n19-20020a05600c3b9300b003ef63ef4519so6430328wms.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 04:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680090168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs++jaTzVHpeO/4v5K2R1togHPkJNK1XzCiBbuxQK9M=;
        b=tZrPQdHtCY2lxMi+tUh2KeivGZDH9GIZWNSjn4ZrVj0WbTNjZ38Sv5ID0eJHA99wBo
         yaJBRguRJl/OqalVlUW664vS1t0Wn680UpS+KSMNrjb1yHFnojJLYIm8EQ6HQgSvo9yc
         cKa0PXjRtvYFsbFCjDmuwRDMldCJZHfx44fRdEb1U26h9NyAYE2LcOna2Qv8kguqEdiV
         Cfqlha8awH3BXz4rG2dnN96YZVh2hGo+LkWdkDHz0qq6KspZlioc7KZJdk2byuf3OGJj
         QzdfAl4BiOG5jBeLTYdVIRaVYKmqtCBPNIvB3uHQIV2hOk8g45G77qz0kCoC6cag3Ngx
         4Ykw==
X-Gm-Message-State: AO0yUKWovbJK0UP14n70YtCu+X+/4O/wVx9WeXcs2GF7US/Z6rYQJ3LL
        go6pF2y2Qh7gDdKs017fwa8YsetyHvPA6DszpQ2WIYjXtcf/qI4C+jiJ6fOf93QtdQWgtQEhoJd
        7Se5I6zAe/7JMlANllzBtVsFVSPNy1p29YW73NbhtpKzkZjt9yDsNT3Qel4OfNq6tfQ==
X-Received: by 2002:a05:600c:21ce:b0:3ef:370:5359 with SMTP id x14-20020a05600c21ce00b003ef03705359mr4145197wmj.5.1680090168187;
        Wed, 29 Mar 2023 04:42:48 -0700 (PDT)
X-Google-Smtp-Source: AK7set8lCNlG4t7qhUD+T/Xt9mNlIdQy0EoUSfiWIgH6fIgIaV3xLxayiQatDKYm3eGoG0YsbtmqOne+7uMaIb7IXbo=
X-Received: by 2002:a05:600c:21ce:b0:3ef:370:5359 with SMTP id
 x14-20020a05600c21ce00b003ef03705359mr4145191wmj.5.1680090167847; Wed, 29 Mar
 2023 04:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zEjCsqpAffGqJPJrsLJLeyrJJDch_-Qctb1Zxi+j5JU9Wg9A@mail.gmail.com>
 <20220714031036.GA74086@sol> <158fba21-8d5a-ac56-ae02-2694ea9ae388@canonical.com>
 <ZCQir3oDPBGLfQfs@sol>
In-Reply-To: <ZCQir3oDPBGLfQfs@sol>
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date:   Wed, 29 Mar 2023 12:42:11 +0100
Message-ID: <CADWks+b-DRtvO6u7sYrJj+msBCnjOuZy0pa+F6rama0-DtNaLw@mail.gmail.com>
Subject: Re: libgpiod API v2 release
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Wed, 29 Mar 2023 at 12:36, Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Mar 29, 2023 at 12:03:31PM +0100, Dimitri John Ledkov wrote:
> > Hi,
> >
> > On 14/07/2022 04:10, Kent Gibson wrote:
> > > On Tue, Jul 12, 2022 at 09:48:45AM +0200, Alexandre Ghiti wrote:
> > > > Hi,
> > > >
> > > > Ubuntu kernels do not enable GPIO_CDEV_V1 as it is deprecated, but =
the
> > > > libgpiod package that we ship is still based on the latest version
> > > > 1.6.3 which does not implement the API v2. So I'd like to update
> > > > libgpiod, do you have any recommendations about what branch/sha1 I
> > > > should use? Do you plan to make a release that implements the API v=
2?
> > > >
> > >
> > > Firstly, libgpiod is Bart's library so he is the authority, but this
> > > is my understanding...
> > >
> > > TLDR: You should keep GPIO_CDEV_V1 enabled.
> > >
> > > v1 is deprecated from a development perspective, so all new feature
> > > development will occur on v2, and new applications should target v2.
> > > Existing apps targetting v1, be that directly or via libgpiod v1.6.3,
> > > will require GPIO_CDEV_V1 until they migrate to v2.
> > > The mainline kernel will continue to support v1 while userspace
> > > transitions.
> > >
> > > libgpiod v2 is in active development, and should reach its first rele=
ase
> > > shortly.
> > > Note that it is NOT a plugin replacement for v1. It has a different A=
PI,
> > > for similar reasons to why we had to switch in the kernel, so apps wi=
ll
> > > need to be actively migrated.
> > >
> > > I wouldn't suggest making any effort to package libgpiod v2 until Bar=
t
> > > makes an official release.
> > >
> > > Cheers,
> > > Kent.
> > >
> >
> > libgpiod v2 is out now at least upstream, even if it is not yet package=
d in most distributions. But this brings newly identified loss of functiona=
lity that seems to be impossible to resolve so far.
> >
>
> You are confusing uAPI v1 with the long deprecated sysfs API.
> uAPI v2 is a functional superset of v1 - anything that can be done with
> v1 can also be done with v2, and the ioctl approach is the same.
>
> But replacing "v1 API" with "sysfs API" and the following makes more
> sense...

Yes I am, apologies.

>
> > With the v1 API, it was possible to do fine-grained access and mediatio=
n control via LSM. Specifically privileged process would export pins, and t=
hen use LSM controls to allow rw access to individual pin path in sysfs to =
otherwise unpriviledged or confined applications. This is used a lot on Ubu=
ntu Core with snapd and apparmor, to mediate confined applications (such th=
at only one application at time has access to a particular pin, and to ensu=
re they only have access to pins they need).
> >
> > It doesn't seem to be possible to do such mediation with v2 api, as I d=
on't see any LSM hooks inside the gpiochip ioctl implementation, and the ch=
aracter device is for the full chip, not individual pins. Similarly, mediat=
ing ioctl calls requires a lot of gpio ioctl specific knowledge (i.e. intro=
specting gpio_v2_line_values masks and what not).
> >
> > Thus right now, I cannot migrate to v2 api, as I would loose confinemen=
t capabilities. And there is external pressure to stop using "DEPRECATED" c=
onfig option in the kernel that "will be removed after 2020" as per comment=
s and Linux documentation.
> >
> > What is the LSM plan for v2 API, if any?
> >
>
> Here we go again.  sysfs has been deprecated since 2015, and yet you are
> only now looking to migrate away from it.
> Please specify exactly how much notice you require not to feel "pressured=
".

I guess lack of knowledge about gpio-aggregator was the missing piece,
rather than any particular timelines.

>
> > Ideally, it would be nice to have lsm hook to check/filter operations o=
n allowed pin numbers.
> >
> > Or for example, can we add ability to create filtered char device that =
self-limits itself to particular lines only, within a particular chip? As t=
hen the usual LSM could mitigate access to that, without specific gpio ioct=
l knowledge / introspection. (e.g. /dev/gpio/my-gpio-pins that only allows =
access to gpiochip0 lines 0..100)
> >
>
> Use the GPIO aggregator[1] to create a chip confined to the pins of inter=
est?
> Then you can use LSM, or whatever, to control access to the chip?
>

This looks exactly what Ubuntu Core / snapd wants, thus I will
investigate implementing that.

> Cheers,
> Kent.
>
> [1] https://www.kernel.org/doc/html/latest/admin-guide/gpio/gpio-aggregat=
or.html
>


--=20
okurrr,

Dimitri
