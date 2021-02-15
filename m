Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1E431BE3F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 17:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbhBOQD6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 11:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhBOPt1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 10:49:27 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0917BC06178C
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 07:48:47 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id w1so11819332ejf.11
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p0u4wGLrMFOGXx7ZSIOFz7UpWVHqOCG0C18CzKHGYfw=;
        b=mfXCIRhBpkPHWc3lUEHP4YWXHZVdTjCE88cDSUZvYg0DMiWUn+gCILsIDEKxY5oGTZ
         aO5tNkU7RMVd6XrwVTncmxDBLQJ4JAMpTi/ARGV4K43+93xc0r+TzNOlhk3Nh0O4USrt
         uOJGSfDIJ7juVZAGp885PgSblKWK4BsZRkE18+wLctpeyLIXAO5E8JSeM0SrHsVv9RCQ
         GIEsfz+r9ZQu+Lm+n8cL5JXPgKpwit6C+xpaQzz9yN5Il+L/RB2nEsqfB4G1IfptIYGY
         9UR2Ofose9jmhD3zcJDmLa0jDvf8Y29BagDbUVomvsFYKATppNcw8iBc4X/Np1vc4Xiu
         sm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p0u4wGLrMFOGXx7ZSIOFz7UpWVHqOCG0C18CzKHGYfw=;
        b=TwrgIYvX2WEUCRuGy9STJ1UgXa8AtdxbviLC7/kLyh3OeEB9zH2/j/idFA9CMXW7sl
         HgqeIrcD3+Tv27N4A2ttqqVdBwS1WiMfWetzo7HFg74xlnkCYhoH55boDVneGyiuGmOH
         pWQSH+YrxVKGC/Ib7u2VgT64OV+RCRm7BnEFIm/kubDweuZ5Uk7q6nb/pcunJC/BKXbB
         +IHTdFJvjAC5b9H8pHWvjGeNImByNfgr84kLPVC5Z7Okw09K3mwKOMWIbVoSYlDaDqbp
         mwxrdsnZzu0WWRu3GkOCDxhU4Il9D7MjlVml1XJYP35WIc3A0NRIpelyKw9FnN9xI8E+
         bPMA==
X-Gm-Message-State: AOAM532EMcD26XqCMVWFV8ZwqbXI6n+nh2k+GVgxnyycsEy3LQMLLXhj
        1RA6QiKgO7onGIRxVtslGVqoOEa7uIDHLcqIJXHkqA==
X-Google-Smtp-Source: ABdhPJygMY110InBxI64Azbg3pDQJmwvPqvO4NjZvShoHr1+w4AylBc5r68M+wRPeJ70xsujQFEVtY+JAZ2KIbYlZ3U=
X-Received: by 2002:a17:906:4dd8:: with SMTP id f24mr2736601ejw.14.1613404125758;
 Mon, 15 Feb 2021 07:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20210215124831.60707-1-warthog618@gmail.com>
In-Reply-To: <20210215124831.60707-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Feb 2021 16:48:34 +0100
Message-ID: <CAMRc=Mc8Dt12j0ymYdjOkCdvCB4X_UGq+7n4NvAwZKwVJp5mMg@mail.gmail.com>
Subject: Re: [lingpiod][PATCH] bindings: python: fix uninitialized
 default_vals being passed to gpiod_LineBulk_request()
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pedro Botella <pbotella@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 1:51 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> If "default_vals" is not provided in the kwds then default_vals are
> passed uninitialized to gpiod_line_request_bulk(), so rename the
> existing default_vals to vals and introduce a new default_vals that
> points to vals, or NULL if no defaults have been passed.
>
> Fixes: 96c524c4951c (bindings: implement python bindings)
> Reported-by: Pedro Botella <pbotella@gmail.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/python/gpiodmodule.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
> index fee4c32..832787d 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -1327,12 +1327,13 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
>                                   NULL };
>
>         int rv, type = gpiod_LINE_REQ_DIR_AS_IS, flags = 0,
> -           default_vals[GPIOD_LINE_BULK_MAX_LINES], val;
> +           vals[GPIOD_LINE_BULK_MAX_LINES], val;
>         PyObject *def_vals_obj = NULL, *iter, *next;
>         struct gpiod_line_request_config conf;
>         struct gpiod_line_bulk bulk;
>         Py_ssize_t num_def_vals;
>         char *consumer = NULL;
> +       const int *default_vals = NULL;
>         Py_ssize_t i;
>
>         if (gpiod_LineBulkOwnerIsClosed(self))
> @@ -1348,7 +1349,7 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
>         gpiod_MakeRequestConfig(&conf, consumer, type, flags);
>
>         if (def_vals_obj) {
> -               memset(default_vals, 0, sizeof(default_vals));
> +               memset(vals, 0, sizeof(vals));
>
>                 num_def_vals = PyObject_Size(def_vals_obj);
>                 if (num_def_vals != self->num_lines) {
> @@ -1375,8 +1376,9 @@ static PyObject *gpiod_LineBulk_request(gpiod_LineBulkObject *self,
>                                 return NULL;
>                         }
>
> -                       default_vals[i] = !!val;
> +                       vals[i] = !!val;
>                 }
> +               default_vals = vals;
>         }
>
>         Py_BEGIN_ALLOW_THREADS;
> --
> 2.30.0
>

Applied, thanks!

Bartosz
