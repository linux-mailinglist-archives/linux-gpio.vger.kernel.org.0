Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7E129737A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 18:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750318AbgJWQW6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 12:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750317AbgJWQW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 12:22:57 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511CBC0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 09:22:56 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id u19so2467563ion.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 09:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j5r8SO3/yJQ44KIHTGF7hVFnjiIw1hGHHZCiv/siwMk=;
        b=P9u2s+HcOpXnvx/3AJjhduE2V6U0jMQZrCFu5ayFidcrpen9+mwAjLMeLEF9jQ3OKf
         G1jZg9b2/1DXczspzPne2mlTAKRcZ/w99TyopO+May8WVgWrcHWt2XVSEOuGHWeMeTr9
         8eCOQWDJGtFNA8DLO6ue4uNqdNI9cIiX5QSCBo1vxkOfxMApkyroOx/OwsYh69CmsIHG
         GzTBG3dlCuv1LMrrC6Wou/pxTxfn+CDDNoSeLiiai823banhkhi6kJeZ6dprJTzA1GF4
         7EECJtrT0oncdvMf7YDuiDc+UJg1/mZ2ziE9/hykTJMStrwqkJhICnoage0KeJLhjeeb
         y9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j5r8SO3/yJQ44KIHTGF7hVFnjiIw1hGHHZCiv/siwMk=;
        b=dcDRIEjuY3CJcTKf1VgekGQ7WI204mUIVa9vVJo503MbelOWio+RJBcWIyC0rPmsbU
         d5un3ke2J7qtZdMKBOtxynG3A1ZdFUm2hQVhmt5OZGXbejnBvE6kJb3+PxF2G3pufPCP
         mJafig3lbhdKD16lPSSy8m3azuSm008/8XADxwPkT+weL/0IT3H5xS1D17ReCmnvuWxD
         MI+wl0+I7QY05zTN4MAjycuPEe+vd4bw5TTUL3FFwdZMGXAepnbrYBWFdL3EDn7kFzEF
         XzeOLclGUOKuOPnY9YILSo4fSpLQCQNcnK1RUKYyJe/BGMUsHDSTCxYEO1AGWH+2vr6h
         FJvg==
X-Gm-Message-State: AOAM533zIXzKEWcovyAYLs2iUL6yp+BHLP8kUOrClyHi0180nS8YVTSM
        V/1GMaF9swX6AjiXYngxzIDPNtayhbTceHM0AQDzUw==
X-Google-Smtp-Source: ABdhPJyzyRCFIG5OOj3ktjlAqgO0a1T3iY6PYrO5hKRZlMneotgR5aYoWktfVkqMK7/NmsDttlwJDxaiAufq/wnwwIU=
X-Received: by 2002:a05:6602:2b90:: with SMTP id r16mr2242707iov.31.1603470175605;
 Fri, 23 Oct 2020 09:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
 <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
 <20201022063935.GA23978@laureti-dev> <CAFhCfDY5JS4WB=0OFdjYGeuRobuMPKkjeir29M6EOSe9zVufVw@mail.gmail.com>
 <CAMRc=Mfs7CSS_3BU6geAyDq0bNA9Q6eQvw_-iJCttGKimbZHjg@mail.gmail.com>
 <CAFhCfDb9pbPMAj-7zqVWWMfprnFQEaozx-CV7VP25kP437diCw@mail.gmail.com>
 <CAMRc=McJUHQf2ziM1PObm34PwzXGbdY31YepJQduDD+QqMvH2g@mail.gmail.com> <CAFhCfDbgNZyTOVubevcoBHpZj4QZ+wEKXbuP354dtWfstgHmig@mail.gmail.com>
In-Reply-To: <CAFhCfDbgNZyTOVubevcoBHpZj4QZ+wEKXbuP354dtWfstgHmig@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Oct 2020 18:22:44 +0200
Message-ID: <CAMRc=Mct4fb=vix+H-R7aRxY05OarAN=5fog99e5d+966k4EAw@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 22, 2020 at 2:22 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> > Why would that be a shame? We have the chance to rework the API of the
> > entire package, I want to give ourselves some time to get it right
> > before we carve anything in stone for an indefinite period of time.
> > There's no rush, really.
>
> You're right. :)
>
> I will start the talk with you next week regarding ABI compatibility.
> I'll give you a rundown of the issues, the potential solutions and we
> will discuss the usage of libgpiod and the C++ bindings.
>

Hi Jack!

I started reading on my own and I think I now have a slightly better
idea about C++ and its ABI. I also see what a mess the original
libgpiod bindings are in terms of ABI compatibility but fear not!
Right now (v2.0) is the time to make it better! :)

At a personal level I'm not too concerned about the ABI compatibility
of C++ bindings - I much more care about the API. This is because
libgpiod is aimed mostly at bespoke embedded distros (yocto,
buildroot, openwrt etc.) I understand however that it's an important
issue for distros.

I didn't know any better at the time of writing libgpiodcxx so I just
put all private members in the main header, exposing them to the users
of the library. I'm not sure why I didn't realize that C++ classes are
basically C structs (and exposing them amounts to exposing struct in a
C header) but I just didn't know any better.

I assume that you'll either propose to use the Pimpl pattern or a
header-only library. I noticed that Pimpl is what Qt5 uses while
header-only is more of a boost thing. If so - the timing is great as
I'm open to either solution for libgpiod v2.0.

Best regards,
Bartosz Golaszewski
