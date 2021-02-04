Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA2C30F4C4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 15:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhBDOR1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 09:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbhBDOQn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 09:16:43 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA9CC061573
        for <linux-gpio@vger.kernel.org>; Thu,  4 Feb 2021 06:16:02 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p20so5530731ejb.6
        for <linux-gpio@vger.kernel.org>; Thu, 04 Feb 2021 06:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8JT1SCq4khkJTURr9/nrnr4TUn0J+jNjxDtJb0pJP4=;
        b=c8Ytk6wNAL/kaQkn5PL7iBcJ+tccPlNfc3R6YY2Q7q/4VgDELVbQtP99E3nX31LdVj
         QZyLN67iMGbRdvtJheOOpec2cd1C5qw39BV73EoBWCptneDvIvah1baUNiU0PWwXvWPu
         SG5okdjtMnNdIhEKWn7NFdhnMu8AsQt8eccJcjgmITgJtWs0Rcpu3CtE+7MqGPGUutta
         5qKB0bxAJRzDcvZ2zuChVRTnyAIrjvKwKhZ7oG4RyuhQpFTuv7TIEbJEYnujBVEGRlYh
         PVbddrZ6OFSRfSt+wIjyNDQ+fe9cyAId7J6NVjBkZLG70q+oQoCy3WsUtJKkDaPt7xoN
         DAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8JT1SCq4khkJTURr9/nrnr4TUn0J+jNjxDtJb0pJP4=;
        b=ljlVi6gW+6YXdCcgFb8DFJ+KACTgOqgTzOnil1myXV+oABdvqfZZDu+vRxezNiR2Ke
         fJ1N8xKKcY2MAyjaj4GTTmHxig3cOtjT8X/VIM4yOu3vkDmlGqrN34Tf6Rk2a6Y+N5iX
         fDfbbmbpHsd3QCz88o896Jwzphc4EmUcxqlUx9nc/gimrkbe4f/tk21xLGJSPiIcXGLs
         8O+I1MWjti+28qSyhTfbK7TfvxOAA+V/Ny67nhDQloAhtihF8LR9YCrS1xcikJ3R44ID
         RgYfEDanEPJx6dtDVqNR4pmhPepoKfMV0YKnWPTHvHpcDe/VAdYw6TQmeD6HeV2QmWrG
         nlBQ==
X-Gm-Message-State: AOAM531QVHTcXYbYnBS2xxsze31vMcHul5DDhxcpkxuAeWBez8QwumFW
        QcnjutM9jgVPi4Q+AJCq/quTb30xrge4pxle5+rCDw==
X-Google-Smtp-Source: ABdhPJzSqqfT+uHso09GfcfH9rNEFjJHgctcjlDUBrJddoXdaCqrqfMfWdzd1dzGOratk8WYVLf9SkTPP6DRbiG9X1Y=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr7752327eje.363.1612448161479;
 Thu, 04 Feb 2021 06:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20210204124357.3817-1-brgl@bgdev.pl> <YBv61eNnVksYq9mr@kroah.com>
In-Reply-To: <YBv61eNnVksYq9mr@kroah.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 4 Feb 2021 15:15:50 +0100
Message-ID: <CAMpxmJXcVOHbozzhQQW2GPg-6ivCWL3pQmyC-oU_YW5NX=gK3w@mail.gmail.com>
Subject: Re: [PATCH] gpio: uapi: use the preferred SPDX license identifier
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 4, 2021 at 2:47 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 04, 2021 at 01:43:57PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > GPL-2.0 license identifier is deprecated, let's use the preferred
> > identifier: GPL-2.0-only.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> > Hi Kent, Greg,
> >
> > I started working on making libgpiod licensing reuse-compliant and noticed
> > that the reuse-tool is telling me that the GPL-2.0 SPDX identifier in the
> > GPIO uapi header is deprecated. Since I'm required to copy the header
> > verbatim into libgpiod's repository, I think we need to fix that at source
> > first.
> >
> >  include/uapi/linux/gpio.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> > index e4eb0b8c5cf9..3e01ededbf36 100644
> > --- a/include/uapi/linux/gpio.h
> > +++ b/include/uapi/linux/gpio.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>
> No, there is no need to convert the kernel to the "latest" spdx level,
> when we started out there was no "-only" nonsense (hint no other license
> has that crud), and "GPL-2.0" is a totally valid summary of the license.
>
> So please don't go changing it all in-kernel, that way lies madness.
> Let's finish fixing up ALL kernel files before worrying about what SPDX
> "version" we are at.
>

But then, the reuse script is telling me:

    Unfortunately, your project is not compliant with version 3.0 of
the REUSE Specification :-(

because I'm using a deprecated license. :(

Bartosz
