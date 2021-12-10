Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1F046F9A5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 04:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236417AbhLJDmW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 22:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbhLJDmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 22:42:22 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0308C0617A1
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 19:38:47 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id g18so7291868pfk.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 19:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KWKRXlPipFtxSUDYr/shm3cQl0RCzKqpPoKG0kUOzaY=;
        b=AV7rSZibG0tCQrl9GhxisCoDaHwDe0kJ3U8n8i0V7ri6cSJMxtpgQybgLFsTnP2bCJ
         wnhkHgKXizoF81RTpTe5ZJzZ9BvCVtdnKhpVyH25U2FotZxKMvrNbrfscWtZKP5+Vgya
         MFIXpabjkIY3ZRZKq0DK1MLIoiyIr7AOGdktIEhNRyWUneAb9OJEWBDtdcEWa1GPsMkv
         gQE+Mwwa1a9exyjyn+NixbpHBXddQmk71srFQ8HU26XXx3pInJYaiwocTtzv1XXJph0M
         5Ec9CuIC0akJwQETbHnlXGmdCkHLxE8Lq1P/IETx55CebElpXPs8piuGelbejxc7ydZ4
         SlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KWKRXlPipFtxSUDYr/shm3cQl0RCzKqpPoKG0kUOzaY=;
        b=zQP29CBXXzWLBhpAHuP8lPcsiab1YP5JlJmwFWk5IbW1DoPP5VFP7aNC1huTqHm5vk
         ZkJHrvohUlWq6utiSwOksP/o7vqNI0bOqJEoDcl44GzktSKf3JYHbM1vrHroOVW+XkXW
         /pTvMWznlJYf9klak7qJr7DBQe8vwrmSYCI2b+3qSy2z+BbbK1C7xB3fYygR719nq0LK
         Nt1I/C1ZXTnYJW1ebkQyLwLVTXyisTOejMdMA5soLOFyFJ6jQIgPa7/kWjzUBoCthLCF
         0bp4Xv6h11KicgLCO0czElujaFRalWROleSxkzC26uNK4peY1oqCrCQxB5vUWnx0bhnv
         cTGw==
X-Gm-Message-State: AOAM533Li3euXV5zpyGCiOCpmFAsKv1SeLv0GtI/rvJk/nuWinBUslvm
        ROiBpBAP9JsfqGTz34NR5WXeFQ==
X-Google-Smtp-Source: ABdhPJxY08YogfYXlyucU5zPY8UfrpTtKWvP6qw0UcmCg1cF+j3OIIXMScJa5TmoHAQbZoEfK2/Cfg==
X-Received: by 2002:a63:7103:: with SMTP id m3mr19558485pgc.376.1639107527431;
        Thu, 09 Dec 2021 19:38:47 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id v63sm937043pgv.71.2021.12.09.19.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 19:38:46 -0800 (PST)
Date:   Fri, 10 Dec 2021 09:08:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] libgpiod: Fix build failure with musl
Message-ID: <20211210033842.j4h5glg34prjn4ha@vireshk-i7>
References: <4a8c598db0a78421b074f19eb2157d89f3198440.1639047500.git.viresh.kumar@linaro.org>
 <CAHp75VdwQjcrQLHh49WV5e95KCsyqVyoFO=VeNfK4LC0mEZvNw@mail.gmail.com>
 <CAMRc=McUV3-Afhd3yipDfvcEQijqDxf3cXr9egdKAgPt0nv5RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McUV3-Afhd3yipDfvcEQijqDxf3cXr9egdKAgPt0nv5RA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-12-21, 19:32, Bartosz Golaszewski wrote:
> On Thu, Dec 9, 2021 at 4:17 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Dec 9, 2021 at 5:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Musl defines the _IO*() macros in the files included via <sys/ioctl.h>
> > > and hence we get redefinition errors during build as <linux/ioctl.h>,
> > > included via <uapi/gpio.h>, defines them again.
> > >
> > > Fix this by undefining the macros between both the includes, document it
> > > all in musl-compat.h as well.
> >
> > Is it only me who wonders why it should be fixed here?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> 
> No, I'm wondering the same. I see these musl compat issues being
> "fixed" in half the embedded linux projects. Looks to me musl
> introduces these issues, doesn't it? Any reason for it? Can it be
> fixed in the library?

Not sure if I can go fix musl here :)

Btw, another thing that will work better is if we do this:

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index eaaea3d8e6b4..ebf6b5312cc0 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -12,8 +12,8 @@
 #define _UAPI_GPIO_H_

 #include <linux/const.h>
-#include <linux/ioctl.h>
 #include <linux/types.h>
+#include <sys/ioctl.h>

 /*
  * The maximum size of name and label arrays.



That will fix it properly as well, no undef issues on any library
then. Some of the files in uapi already do this.

-- 
viresh
