Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB152883DD
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 09:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732288AbgJIHr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 03:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732286AbgJIHr1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 03:47:27 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8017C0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2020 00:47:26 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id c5so8347385ilr.9
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2020 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgGVH5OFcfxhmN6KYF9jT8pWW66RCO27mwORxAvnSxc=;
        b=hrnqnkH5Tr5wzp/TZOd1oUqZJ4y0embeIshlLMgvN1GnbPYZBbkhWASaEF7Xx/8ci3
         OT5I8yRRSRuftHpUXc3FJmTima2dbMhviXROE95hqrU9HHik77ov3t5008Enh9SzcKQO
         FSR6bxKfDq0BX8VOWy6k8oYrEAQb8tNrdfTt0+2+HtIKl/IsKofGUY4nGHDLvmXPsDeH
         mcFs6L6FzMnZhvS9042Fh/gdlcsHmIIS7Fphw5K8evK9t9/SkMg7dvwoJ8WSZF6tIQ5m
         AvGZUHFjMAJW0UcIt6tAip4d55wi2IK0Oo5ZnNGgNFKYsmTW/lcH3furtKSBdLrcCOXn
         1GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgGVH5OFcfxhmN6KYF9jT8pWW66RCO27mwORxAvnSxc=;
        b=TMw2gE89HQVFJxXq5jSNMhfd5KZrz7agnFjwBqf9sgUmrv/BJk8qDnWDPUU+vtDkJY
         PtFj0mSj5DnA4GE8CrRF0RB79/IBkIyi24LLZjiCc0RYWuexKwBEhcB78MuTGdy3RHix
         cEnpru1HRYJpmMUSedLkSzsGtX7sJ3yN0B7fFQdJQfdm45+wgonKjIhKioxqDS04Y6m3
         hrIu+dokpIAAe0mg0+tyjogIQt+X6ACQW0QNfBTdn3xz0k2122RBHoKnzCDYtLKZUNIG
         6y50wbIZvK/TsnLFiD7tnPczZMBdEOuh4694wSAH4GIOHoTkOTKPcX20bZe31BjbUfwW
         f+gw==
X-Gm-Message-State: AOAM531Nbv7cmNkalYcDFlF7ZEz+9X9Sr1YbE+M9Heml0a7i8DANA3ia
        7jO8hozxyqvmIir7zD4XCy9Y80/CEREehaw9Wjv5UhvX4O4=
X-Google-Smtp-Source: ABdhPJwapcYJ+xC5iMOogqbhRbUKi0CP5U6/ABhKvj1TtOuHR0odvqjd8kzzY2RsCJBrKr+leoP8EfDf5zWN55l99yc=
X-Received: by 2002:a92:ca92:: with SMTP id t18mr9738802ilo.287.1602229646268;
 Fri, 09 Oct 2020 00:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <bfe529765a0f1d428c7ce2c222dd3a17aba2e058.1602004154.git.jbenc@upir.cz>
In-Reply-To: <bfe529765a0f1d428c7ce2c222dd3a17aba2e058.1602004154.git.jbenc@upir.cz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Oct 2020 09:47:15 +0200
Message-ID: <CAMRc=Mfy+15p13oj41oGFb0nySUgJQhmZiZ430ShzQDy9R2UtQ@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: python: fix incorrect object size
To:     Jiri Benc <jbenc@upir.cz>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 6, 2020 at 7:21 PM Jiri Benc <jbenc@upir.cz> wrote:
>
> tp_basicsize is the size of the allocated object, not of the class.
>
> Fixes: 96c524c4951c ("bindings: implement python bindings")
> Signed-off-by: Jiri Benc <jbenc@upir.cz>
> ---
>  bindings/python/gpiodmodule.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
> index e5db26b88954..b3ae2bfebb8a 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -1874,7 +1874,7 @@ PyDoc_STRVAR(gpiod_LineBulkType_doc,
>  static PyTypeObject gpiod_LineBulkType = {
>         PyVarObject_HEAD_INIT(NULL, 0)
>         .tp_name = "gpiod.LineBulk",
> -       .tp_basicsize = sizeof(gpiod_LineBulkType),
> +       .tp_basicsize = sizeof(gpiod_LineBulkObject),
>         .tp_flags = Py_TPFLAGS_DEFAULT,
>         .tp_doc = gpiod_LineBulkType_doc,
>         .tp_new = PyType_GenericNew,
> --
> 2.18.1
>

Applied to master and backported to v1.6.x and v1.4.x, thanks!

Bartosz
