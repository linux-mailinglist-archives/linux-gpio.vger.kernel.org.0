Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBA2294E21
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 15:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440330AbgJUN5r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 09:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411515AbgJUN5q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Oct 2020 09:57:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514E5C0613CE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 06:57:46 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g12so3158110wrp.10
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2020 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SY8V+79JXlXqJyldTLUiAn0kO7JaEPy6MXjS7IZqXPE=;
        b=GQ4hHePqE3Gws0jHetVTLn4FsZUPPoogAJ+0OeBw30HIBqj20pJcHeuHy91Q8xUwH/
         lZN43FPEyBJ1YjETE1KxmMvOxCPPONp4vqo2xyw3jqRFdRPwBirB9o/APPeZsHuF1S5o
         sNzOKiky7XDT0C/99+9u7PR4mWt9OwLalRzw2P6+9MENcSabRKirv8nTVUiWLN0CSybT
         G5JawKsmN1gfZd9fLuH2DV6uD3444dB54LCfmiU3bLSFNOejMXUgIu5xmIeK0zqvWd1F
         b4qqOuc/HHVLB8xC0oFdcISlDQ0CdvJIj6wTTodOVURI+tVvPLpKD2zL61Ev8EZeMDs4
         fYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SY8V+79JXlXqJyldTLUiAn0kO7JaEPy6MXjS7IZqXPE=;
        b=CEudv9r4MkGM4Pl28tKBAN/kowUlAX5AUJD+zv/TE8z3JlBS+pCIbLCJUhJ7a3MykK
         YYQDFjL2T5WlWKKhwJSU/dt7rY8v9EFW+Wq91v626TjBeM4aryk0kvTNvX3vSkpCUPix
         HS8WMsKBgAES1bHny926Yaa1+ds//fdmrwj22vEBlsIhzrqHuAZhAvOLq303E9qXn3Zz
         N9igibSnM9EDjnlKe3tF3+epjY4q7O21FTdXH9DKPuaZwf13JVtG/nVC3ZglL3gxjxHO
         FsKH5RZAbGg1a0h04eS2YfG2IbiM8JEWGkIvJvsujaARoxC+Y7Pij2n4gNR+06kzh4RO
         XcQw==
X-Gm-Message-State: AOAM532IiS5SW0/lcmbQO/SC52eroQBhwXQOgY4qW0cgh1jSqpcVqs25
        BJUD++LAxotaD2jFWluiaBiVRRuRFNzC6parNSg=
X-Google-Smtp-Source: ABdhPJy9VVWE+PhdemvTGfCuo8clpXfbIVWWxXzOCob3nUJJc43VALTsBWYwEZd1B3lf7UR76D77YiH67nI6pycTLrw=
X-Received: by 2002:a5d:4a06:: with SMTP id m6mr4832810wrq.209.1603288665076;
 Wed, 21 Oct 2020 06:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201015083805.GA10354@laureti-dev> <CAMRc=Md=ZeKLS-SKKgmq+V9VCt+7xdjNiwz89Ms-vOeTcwZBOw@mail.gmail.com>
 <20201015093526.GA10891@laureti-dev> <CAMRc=McpnnK9NydujR=YRuy0ZBLhQqz3SSZ5eeisjqhMPUbMhA@mail.gmail.com>
 <20201015105718.GA11027@laureti-dev> <CAMRc=MdWi94uzYb6OprmVoGnfmSHUCevqAPPgXOPHQNVrj0jfQ@mail.gmail.com>
 <20201015121312.GA7166@laureti-dev> <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
In-Reply-To: <CAMRc=McApWaCy8kUWurjZByN9vKqw8kZBwNVBtVXXf6-b3PsLg@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Wed, 21 Oct 2020 16:57:34 +0300
Message-ID: <CAFhCfDa7Yy2a9-ddk0nZmNidar_-H_ONTU93Cb+YatcEGy3NbQ@mail.gmail.com>
Subject: Re: [libgpiod] cxx bindings: time_point vs duration
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Folks,

Me again.  I'm a bit late on this discussion, but wanted to raise a
couple of points on what's been discussed here.

> As far as I can see, the chip class uses the pimpl pattern, so a chip
> practically is a reference counted pointer to the actual gpiod_chip.

This has absolutely nothing to do with the PImpl pattern.  The
Pointer-to-Implementation pattern is about separating class interface
from implementation, in order to partially alleviate the absolute
nightmare of managing ABI compatibility for shared libraries which
expose a C++ interface.

One of the questions I was going to raise on a separate thread,
Bartosz and Kent, was if you care about ABI compatibility for major
versions of the libgpiod API?  This is because, currently, almost all
changes to the C++ binding will result in an ABI breakage.

Exposing public C++ interfaces from shared libraries is never really a
good idea, even if ABI compatibility is properly managed and
considered at the forefront of each development cycle.  Granted, this
is more troublesome on that other major mainstream OS, but you still
face plenty of issues with this on GNU / Linux too.

If so desired, I can start another thread on this topic.

> I don't thing nanosecond resolution is
> guarantueed, but maybe this is good enough and you can just use
> steady_clock? That would certainly be most welcome by consuming client
> code.

You are correct - nanosecond resolution is not guaranteed.  It is
completely up to the standard library implementation.  Which is why I,
personally, would steer away from making the proposed change to struct
line_event .  The timestamp resolution is currently well defined in
the existing implementation and changing this may not be desirable for
users.  If you really want a std::time_point, then you can construct
one from a std::duration object.  See
https://en.cppreference.com/w/cpp/chrono/time_point/time_point.

Jack
