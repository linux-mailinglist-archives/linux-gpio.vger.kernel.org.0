Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DAB246066
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 10:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgHQIil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 04:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgHQIij (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 04:38:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4161FC061388
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 01:38:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t14so13181317wmi.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tRGq/w3kASMY3mTOdvX3R6nCl9s8n+L3OiUMlFWe/zU=;
        b=Sde8+AO/89S3TIYA1LzKDj39Ikst6CwB/70mAZ5QgpagQwjIE/ybK/xvaoU39zVwOP
         uBbOcmXkDXF0DF1v4FBALrWtRen7sRUCQyRNOAlQAywd2Ky2yiCNjgpF9SSvwA3QZ/Z4
         zRK3njrnjmtpUMD9z+aAR6ZNpPcpT5DB222DyzPpP1Us3TZu6cupzY22WTNItEbVLqnK
         H/e3+yxLRQ58MDUiYcbaPUKfdoeSVsKw7U35Ms8iiwFUKE9q+UZFXmpTVgJUwRJx8vY1
         oUMxK3wWETD73vIJgwYeYznav6CzjYC52F6vPYHN3lmwQuxxby5ppBlSn2gYOwoChJdR
         rHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tRGq/w3kASMY3mTOdvX3R6nCl9s8n+L3OiUMlFWe/zU=;
        b=m2sEnOw6SRGSLlKT7EohNKv5cAZNCpofDrp42FzNPda96gkCIjFb+uv1JjM/QrNtEv
         IeXBk4Mptg05AAmnTiV7rGuDLSQ/TLm0lyg8GKeAFbi/fBNQIyu+kjppp1fpxdDMq0AJ
         kY6vkn93+wwPtgt7Gty9Abt0UL2L6RXPAeJaKFZ1zFta9K/EM6C+etYA0aH/rZZ5ZQ8W
         ul9MuHv+/etAx5uRRuSpHL8HN7QwjjrzMBCYzbf+JkpX2o+BamsS6bgdR/mCYnYRtquI
         raMFtGrc5/0UgpSLw8C5OAPFi1+w1TTwJBoDGYAnLucDpvx8VN0y4LALXGaG3vjTa5kC
         FTtA==
X-Gm-Message-State: AOAM530n+HA9IKrpOPtezn9U0kkx4zPz7kSTsNIhBAhm3SYjmpOF9/V6
        eLtbiOYRPPjnxdsuWooO46qz97Wgi+7Miw==
X-Google-Smtp-Source: ABdhPJzPwN0WricV52EvcrIiTTsY1ZJIuFGhtg4GBFvdccevlWczSGUoSdEbRUBQKRBHA6RYXXgbjA==
X-Received: by 2002:a1c:4c0e:: with SMTP id z14mr13495074wmf.54.1597653517717;
        Mon, 17 Aug 2020 01:38:37 -0700 (PDT)
Received: from p1g2 (2a01cb000f8e270038fe4c27b4fe9348.ipv6.abo.wanadoo.fr. [2a01:cb00:f8e:2700:38fe:4c27:b4fe:9348])
        by smtp.gmail.com with ESMTPSA id i4sm30419277wrw.26.2020.08.17.01.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:38:37 -0700 (PDT)
Date:   Mon, 17 Aug 2020 10:38:35 +0200
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 3/3] Android.bp: initial addition
Message-ID: <20200817083835.GB91176@p1g2>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-4-gary.bisson@boundarydevices.com>
 <CAMRc=MdaMKEW2n32eYD7q1R6V4GWGakk2xmUWmejncLD-x+pYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdaMKEW2n32eYD7q1R6V4GWGakk2xmUWmejncLD-x+pYQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, Aug 10, 2020 at 09:51:07PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
> >
> > - Defines both shared and static versions of libgpiod
> > - Defines all the libs/tools as vendor (installed in /vendor)
> >
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> > Hi,
> >
> > One thing that isn't ideal here is to set GPIOD_VERSION_STR manually,
> > that will require to keep track of it for all versions.
> >
> > Not sure if there's a better way to provide that value to Android.bp.
> >
> 
> I don't know Android very well but if its build system can launch
> autotools, then maybe you could autotoolify this file by providing
> Android.bp.in and letting autotools expand this macro?

No unfortunately that is not how the AOSP build system works (or at
least I'm not aware of it).
AFAIK all the open-source projects used in AOSP (see external/ folder)
have a separate Android.bp alongside the autotools files.

Here are a few examples of Android.bp files added by Google to
well-known projects:
- curl [1]
- iputils [2]
- strace [3]

In the case above it is up to Google to maintain that file as only
hosted on their servers (not merged upstream).
But some other projects are ok merging it which makes it easier (at
least for me) like can-utils [4].

> > Regards,
> > Gary
> > ---
> >  Android.bp | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Android.bp
> >
> > diff --git a/Android.bp b/Android.bp
> > new file mode 100644
> > index 0000000..6c437df
> > --- /dev/null
> > +++ b/Android.bp
> > @@ -0,0 +1,95 @@
> > +cc_library_shared {
> > +    name: "libgpiod",
> > +    vendor: true,
> > +    srcs: [
> > +        "lib/core.c",
> > +        "lib/ctxless.c",
> > +        "lib/helpers.c",
> > +        "lib/iter.c",
> > +        "lib/misc.c",
> > +    ],
> > +    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
> > +    export_include_dirs: ["include"],
> > +    local_include_dirs: ["include"],
> > +}
> > +
> > +cc_library_static {
> > +    name: "libgpiod_static",
> > +    vendor: true,
> > +    srcs: [
> > +        "lib/core.c",
> > +        "lib/ctxless.c",
> > +        "lib/helpers.c",
> > +        "lib/iter.c",
> > +        "lib/misc.c",
> > +    ],
> > +    cflags: ["-Werror", "-Wno-macro-redefined", "-DGPIOD_VERSION_STR=\"1.6-devel\""],
> > +    export_include_dirs: ["include"],
> > +    local_include_dirs: ["include"],
> > +}
> > +
> > +cc_binary {
> > +    name: "gpiodetect",
> > +    vendor: true,
> > +    srcs: [
> > +        "tools/tools-common.c",
> > +        "tools/gpiodetect.c",
> > +    ],
> > +    shared_libs: ["libgpiod"],
> > +    cflags: ["-Werror"],
> > +}
> > +
> > +cc_binary {
> > +    name: "gpiofind",
> > +    vendor: true,
> > +    srcs: [
> > +        "tools/tools-common.c",
> > +        "tools/gpiofind.c",
> > +    ],
> > +    shared_libs: ["libgpiod"],
> > +    cflags: ["-Werror"],
> > +}
> > +
> > +cc_binary {
> > +    name: "gpioget",
> > +    vendor: true,
> > +    srcs: [
> > +        "tools/tools-common.c",
> > +        "tools/gpioget.c",
> > +    ],
> > +    shared_libs: ["libgpiod"],
> > +    cflags: ["-Werror"],
> > +}
> > +
> > +cc_binary {
> > +    name: "gpioinfo",
> > +    vendor: true,
> > +    srcs: [
> > +        "tools/tools-common.c",
> > +        "tools/gpioinfo.c",
> > +    ],
> > +    shared_libs: ["libgpiod"],
> > +    cflags: ["-Werror"],
> > +}
> > +
> > +cc_binary {
> > +    name: "gpiomon",
> > +    vendor: true,
> > +    srcs: [
> > +        "tools/tools-common.c",
> > +        "tools/gpiomon.c",
> > +    ],
> > +    shared_libs: ["libgpiod"],
> > +    cflags: ["-Werror"],
> > +}
> > +
> > +cc_binary {
> > +    name: "gpioset",
> > +    vendor: true,
> > +    srcs: [
> > +        "tools/tools-common.c",
> > +        "tools/gpioset.c",
> > +    ],
> > +    shared_libs: ["libgpiod"],
> > +    cflags: ["-Werror"],
> > +}
> > --
> > 2.26.2
> >
> 
> Can I somehow test this build file on linux? We'll surely be expanding
> libgpiod in the future so I need to be able to update this file.

I'm not sure what's the easiest way to get you a build env.
In my case I use the full AOSP tree [5][6] which might not be ideal for
you as it involves pulling 40G+ of data.
For me the commands were:
$ source build/envsetup.sh
$ lunch aosp_arm-eng
$ mmm external/libgpiod

Maybe someone else has a way to setup a Soong build without pulling
everything.

Let me know if you have any questions.

Regards,
Gary

[1] https://android.googlesource.com/platform/external/curl/+/refs/heads/master/Android.bp
[2] https://android.googlesource.com/platform/external/iputils/+/refs/heads/master/Android.bp
[3] https://android.googlesource.com/platform/external/strace/+/refs/heads/master/Android.bp
[4] https://github.com/linux-can/can-utils/blob/master/Android.mk
[5] https://source.android.com/setup/build/downloading
[6] https://source.android.com/setup/build/building
