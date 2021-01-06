Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEF62EBA6C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 08:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAFHWd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 02:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbhAFHWd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 02:22:33 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F02C06134C
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 23:21:51 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id dk8so3546263edb.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 23:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2VvqxUWjCj8I5WnyRc/aOqPLxOdDhMCyo6uZfOXFy6E=;
        b=AjxqYlk+Girx31JG3fQvkPWUOmsd3AHlLNgsT449id5a+BNZ2LFZgopBFaMAigDEsT
         BJv1vwb6aEdc/A8g6tL0DTM4bo1xw5RMpiubPHFqJfqA+a5tWC2jL1687LyqbRN/9KXG
         5qsnjKz43JQ0uOJ8IkIE5bm0d6nS9tTKjJba0XcyAimqaaEX02ijuGRZr/XeAk8Vzj00
         X+wrdSAACtdnGLRuY593r/IbtUrjJDXWIFX/gSG6uPtYMk3/mQxqJRlcMs3tFMOf+FyL
         FVJwrEmRHqO5bTS9h9IrP5Gv3K+5Ktuw2TPzcsJQ5WspF1qNCRRyWzjrQ3zvurHHFYim
         M5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2VvqxUWjCj8I5WnyRc/aOqPLxOdDhMCyo6uZfOXFy6E=;
        b=kXWTrvxVpGS1eTCKkFCB1XzNS+oVpQo+JvKSYalXsoygsk/ZAB7o31c05LabaQ8OB1
         HW+6H64zpaYKUY+fiB/VfyWTu3SOAhpc41MwKD69J9iouUMv62bXVTmj82emY7hEgZZs
         FWMQFp0PUU/RQs7gcXieEMDWTD/6am3ybnPWU3Yzm/DbyXZTZ7EwntY0pVvPWmyAdwav
         X66Tr+FIKnuqV30fPabIggx7rMceB39LShXEzLgkmwWsCN0BeIYI6Qq4u/VCVZ4yNX+6
         Ks4SzMCVgxA8HKAsvaGKpkKy/boxfZvpu/JkxY+iehXIWIyfUxcj3fZSCb6C5kgCuL7u
         NwHA==
X-Gm-Message-State: AOAM530bz0Qsunq+zs/pC3Hf2ckFfBgAp6OlwodaB8e3wybxXPPgAmgn
        SOeEUj9aLIsPIzyfOAqjB83DTLCBpFQLxTB9/N2MSQ==
X-Google-Smtp-Source: ABdhPJwptN0w75T8vaupIVYFE+kC1tlALYn+1cTtotFIKWBDhVBEc6N0CCKSxyy6lHHN/HIRVaGopJIyhNnSD9G3KK4=
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr3037542eds.134.1609917710672;
 Tue, 05 Jan 2021 23:21:50 -0800 (PST)
MIME-Version: 1.0
References: <X/RzBqyV4hCdmrBy@kelvin.aketzu.net>
In-Reply-To: <X/RzBqyV4hCdmrBy@kelvin.aketzu.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 6 Jan 2021 08:21:40 +0100
Message-ID: <CAMRc=MdJJ2rR5FWGtcE77uxA4u_eDGJqpa4OQ642QO3nrSRhBA@mail.gmail.com>
Subject: Re: [libgpiod] AC_FUNC_MALLOC cross-compile failure
To:     Anssi Kolehmainen <anssi@aketzu.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 5, 2021 at 3:16 PM Anssi Kolehmainen <anssi@aketzu.net> wrote:
>
> When libgpiod is cross-compiled it will use rpl_malloc instead malloc which then
> causes linking failure at later stage.
>
> This happens because AC_FUNC_MALLOC wants to execute malloc() in a live system
> and thus cannot be run at cross-compilation time. libgpiod should just do
> AC_CHECK_FUNC instead.
>
> diff --git a/configure.ac b/configure.ac
> index ddb9dc2..5f41c4a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -82,7 +82,7 @@ AC_DEFUN([HEADER_NOT_FOUND_CXX],
>
>   # This is always checked (library needs this)
>   AC_HEADER_STDC
> -AC_FUNC_MALLOC
> +AC_CHECK_FUNC([malloc], [], [FUNC_NOT_FOUND_LIB([malloc])])
>   AC_CHECK_FUNC([ioctl], [], [FUNC_NOT_FOUND_LIB([ioctl])])
>   AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
>   AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])

What is the target branch here? It doesn't apply neither to master nor
to v1.6.x. Can you also add the Signed-off-by tag please?

Bartosz
