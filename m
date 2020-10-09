Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793AE2883CB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 09:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731740AbgJIHkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 03:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgJIHkl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 03:40:41 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4184FC0613D2
        for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2020 00:40:41 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id b2so8365587ilr.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2020 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7RNQN+ZmnOPv7Dvwn7Hk2vrEqpHKymnhL3PZsU/xD4Q=;
        b=zS5RBGfQapR618g7CLpLtPkw8fV/QuheCtcG5FH1SkH7rJDI10MtWCtp+JIpFqWwft
         M7vQ+pSLALU7FmGtsz8mlIp1dYtSEMjSC5SBhDzsliMyzX8CrskyV2tSAwPZyith1+WE
         /Skpt4rkvS7dzbcxBpSGSPsKklUpcdlxR0Y5BzztQZHDgPtPk8BEw++CwzfKuHrM87GE
         xHq9kLwbu5D9pvERg3kI4CR9DzbEYxBgkoLUc7yzOqQRxYGJ9p6R9e9ocOkaRf5vP0nI
         Gdzjm647e1HJpkhibDZK7jC0PhjHtA6Qzm0fbhsLZ9PsXeGdN8sf6wCQHbysP04gbH38
         HpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7RNQN+ZmnOPv7Dvwn7Hk2vrEqpHKymnhL3PZsU/xD4Q=;
        b=MeDDrcnl/kABn0i43DAPQxo2lofhYMi982w5Uv0N+giJLesW9HLfQeTnnnKTWbWsj0
         ZKmUinPD8XyVumqgCSE3oLUFNUHX0ic2eB7mE8La52ixA0VzAUmYXD4pWZmUHruiIza4
         YYEGXjULwf9GwDrLWARPQYFBkDqKtWwCpToTDAogeCOOsESD8HL76Ciu/AoJRwfIR+fS
         X8e8WJeqwjfALgYEgsppw83lgVSC8qo+DP9vsnVqNNIVU4HcGfqrz3MC2EpUPn/UChLz
         sdMEi43MAz02rWkzhbBAT5Xr9tjbq09kH9lraItc3xxYoy11eKYW4kWuEXTqFGYc2Y4S
         GW8g==
X-Gm-Message-State: AOAM5309ObFDvWIlKsN9Dcwjj35htm6/WGfMFBGCs80DVOnzF8AQ02bS
        THTXx+31Koy2kMMRI8NrLTftnlzlnuQ4VRjN+DlGo1WXSQo=
X-Google-Smtp-Source: ABdhPJwHJ1JTrdfe6f9hmkgZG2t0y40WZO1VDhH1t1sdXP42T0ezDhaL5I3MuaZiGBuN4X9UTNLWqmwK6x0BFgthuI8=
X-Received: by 2002:a92:1952:: with SMTP id e18mr9130831ilm.189.1602229240549;
 Fri, 09 Oct 2020 00:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <38eff7ebd01efd34df3037ba485d61ff7291fb5e.1602004585.git.jbenc@upir.cz>
In-Reply-To: <38eff7ebd01efd34df3037ba485d61ff7291fb5e.1602004585.git.jbenc@upir.cz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 9 Oct 2020 09:40:29 +0200
Message-ID: <CAMRc=McNs+cPmqkcGCAJgfQ_Ozy4Dc4b9GUDc2wthmj2WYaRwg@mail.gmail.com>
Subject: Re: [PATCH libgpiod] bindings: python: fix Line.request() crashing
To:     Jiri Benc <jbenc@upir.cz>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 6, 2020 at 7:26 PM Jiri Benc <jbenc@upir.cz> wrote:
>
> On an attempt to call the 'request' method of a Line object, the program
> crashes with this exception:
>
> > SystemError: ../Objects/dictobject.c:2606: bad argument to internal function
> >
> > The above exception was the direct cause of the following exception:
> >
> > Traceback (most recent call last):
> >   File "<stdin>", line 1, in <module>
> > SystemError: <class 'gpiod.LineBulk'> returned a result with an error set
>
> The problem is that keyword args are NULL (rather than an empty dict) if
> they are not present. However, PyDict_Size sets an exception if it gets
> NULL.
>
> Fixes: 02a3d0a2ab5e ("bindings: python: fix segfault when calling Line.request()")
> Signed-off-by: Jiri Benc <jbenc@upir.cz>
> ---
>  bindings/python/gpiodmodule.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
> index b3ae2bfebb8a..fee4c32406fa 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -472,7 +472,7 @@ static PyObject *gpiod_Line_request(gpiod_LineObject *self,
>         gpiod_LineBulkObject *bulk_obj;
>         int rv;
>
> -       if (PyDict_Size(kwds) > 0) {
> +       if (kwds && PyDict_Size(kwds) > 0) {
>                 def_val = PyDict_GetItemString(kwds, "default_val");
>                 def_vals = PyDict_GetItemString(kwds, "default_vals");
>         } else {
> --
> 2.18.1
>

Hi Jiri!

Thanks for the fixes. Could you send me a chunk of code that triggers
this error so I can make a test-case for it?

Bartosz
