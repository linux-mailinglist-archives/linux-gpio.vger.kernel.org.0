Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BF7241126
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 21:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgHJTvU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 15:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728235AbgHJTvT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 15:51:19 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D139C061756
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 12:51:19 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id t4so8629641iln.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 12:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gv91MsQ86zdldV5CcMUdj+tPVUTJALruKF2GYKCV4c8=;
        b=bELSmVyILJ7oWmb0YGAJg48Cc1G9zGiPIiG+igp3LYtT4DI5JJF9VbeyGB16JfjfI4
         +I6hsH60zwwZPNpZkkfN72aIE0k+LFm4jiMRhv/wHQU9UHtjFbFkXBebqBrtYkGCEywE
         MShM4KaTHDck7E9YqdL9r3eh6B6ZWRZx4IFYFaa18jDrQ8YDV7piq0GTiNPdC4ZJXkLX
         zbqRI0Yxd/bl3f11QZrd8zIMfxx6zH27ONB7kGrXmLQl882nseM+Xgj8oP0fM7JmxEQZ
         CP8jR1dOkZU/ZQEOrib2zajJ2iU22P2UNiw+C/VPpbu2gML4sqwQcdtBFVKhBRFBrYwz
         w7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gv91MsQ86zdldV5CcMUdj+tPVUTJALruKF2GYKCV4c8=;
        b=FK99IxJGTIO6r1mlQivnlI3mBPTm5cX627BlJajznSlXOLQcwSA9CaHGOCmMKYxgOx
         xB7csxlBE0W13CQg338mBMORuciTlPlwDNT6O+ifRC7UL8Z9V9XVCfOX1M4UVQPSOB3n
         60XvFqKKl1IJ+M8LdEYym1QfkxxwzxtmIrVFqo8OQ2hsXa7CA23RlGn3Sh4HAcVhfKBS
         96l9ZEO9Os5elUdbrpDg52gv+O9BGSbmKHQyFCejlSDmieSGPa4kOau2Itdy6Fqbpy+W
         TK6oF4vsL8PwwPCVg/XYqSLL+R4CUKLh1YMySlBPHtCgCVGSmFNAuxWVsNXrN9y9yYu2
         G9EA==
X-Gm-Message-State: AOAM531nS0AHLMKN1sHDlT3lg93WF/iy10EfCkxvlWebbzoVHfZ5tJiT
        uIL//ZLur41PRJFwsY8v1AE77HXJN8p9c+EaKQ/KWFd1
X-Google-Smtp-Source: ABdhPJxcBNGA5sTrH6qMGSrxGzutv7mw0eepDO7mVrCbd5mAy6rK4CA4nKrNQMS6k6oIludLj+8YWr+DlAnZgaDHBUA=
X-Received: by 2002:a92:9118:: with SMTP id t24mr18593891ild.220.1597089078419;
 Mon, 10 Aug 2020 12:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com> <20200608090652.805516-4-gary.bisson@boundarydevices.com>
In-Reply-To: <20200608090652.805516-4-gary.bisson@boundarydevices.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Aug 2020 21:51:07 +0200
Message-ID: <CAMRc=MdaMKEW2n32eYD7q1R6V4GWGakk2xmUWmejncLD-x+pYQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] Android.bp: initial addition
To:     Gary Bisson <gary.bisson@boundarydevices.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> - Defines both shared and static versions of libgpiod
> - Defines all the libs/tools as vendor (installed in /vendor)
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi,
>
> One thing that isn't ideal here is to set GPIOD_VERSION_STR manually,
> that will require to keep track of it for all versions.
>
> Not sure if there's a better way to provide that value to Android.bp.
>

I don't know Android very well but if its build system can launch
autotools, then maybe you could autotoolify this file by providing
Android.bp.in and letting autotools expand this macro?

> Regards,
> Gary
> ---
>  Android.bp | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Android.bp
>
> diff --git a/Android.bp b/Android.bp
> new file mode 100644
> index 0000000..6c437df
> --- /dev/null
> +++ b/Android.bp
> @@ -0,0 +1,95 @@
> +cc_library_shared {
> +    name: "libgpiod",
> +    vendor: true,
> +    srcs: [
> +        "lib/core.c",
> +        "lib/ctxless.c",
> +        "lib/helpers.c",
> +        "lib/iter.c",
> +        "lib/misc.c",
> +    ],
> +    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
> +    export_include_dirs: ["include"],
> +    local_include_dirs: ["include"],
> +}
> +
> +cc_library_static {
> +    name: "libgpiod_static",
> +    vendor: true,
> +    srcs: [
> +        "lib/core.c",
> +        "lib/ctxless.c",
> +        "lib/helpers.c",
> +        "lib/iter.c",
> +        "lib/misc.c",
> +    ],
> +    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
> +    export_include_dirs: ["include"],
> +    local_include_dirs: ["include"],
> +}
> +
> +cc_binary {
> +    name: "gpiodetect",
> +    vendor: true,
> +    srcs: [
> +        "tools/tools-common.c",
> +        "tools/gpiodetect.c",
> +    ],
> +    shared_libs: ["libgpiod"],
> +    cflags: ["-Werror"],
> +}
> +
> +cc_binary {
> +    name: "gpiofind",
> +    vendor: true,
> +    srcs: [
> +        "tools/tools-common.c",
> +        "tools/gpiofind.c",
> +    ],
> +    shared_libs: ["libgpiod"],
> +    cflags: ["-Werror"],
> +}
> +
> +cc_binary {
> +    name: "gpioget",
> +    vendor: true,
> +    srcs: [
> +        "tools/tools-common.c",
> +        "tools/gpioget.c",
> +    ],
> +    shared_libs: ["libgpiod"],
> +    cflags: ["-Werror"],
> +}
> +
> +cc_binary {
> +    name: "gpioinfo",
> +    vendor: true,
> +    srcs: [
> +        "tools/tools-common.c",
> +        "tools/gpioinfo.c",
> +    ],
> +    shared_libs: ["libgpiod"],
> +    cflags: ["-Werror"],
> +}
> +
> +cc_binary {
> +    name: "gpiomon",
> +    vendor: true,
> +    srcs: [
> +        "tools/tools-common.c",
> +        "tools/gpiomon.c",
> +    ],
> +    shared_libs: ["libgpiod"],
> +    cflags: ["-Werror"],
> +}
> +
> +cc_binary {
> +    name: "gpioset",
> +    vendor: true,
> +    srcs: [
> +        "tools/tools-common.c",
> +        "tools/gpioset.c",
> +    ],
> +    shared_libs: ["libgpiod"],
> +    cflags: ["-Werror"],
> +}
> --
> 2.26.2
>

Can I somehow test this build file on linux? We'll surely be expanding
libgpiod in the future so I need to be able to update this file.

Bartosz
