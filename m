Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC82D245F90
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 10:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbgHQIXV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 04:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgHQIXM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 04:23:12 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7994C061388
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 01:23:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 184so13165317wmb.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJ+RfZURBcJ4woT+RW32u0j4ZvVLbimIwch5Y+9Qpdw=;
        b=xQSz60gExVHKvi6+wbxWhAHJt7NZp7piFbW17KiKM4s9DDD7NTlJUQFN9voZndVBdK
         xxU/xx48XfHwO3WZ+q1k5B0gvI2fzjYcRmkxwivKgS4IvsiX25O39C+mhVj1Gwt54PlR
         H0CWUu7sY1vDyDd4zowfdZl5txzLgFBF8nx7Gke4JxBH63zQTf1W15JSKRikdITzLsc9
         1Ur3I5iIFuhZKBj6upSzsLmPmDB2F5I8593NSQ0+OE57gChTYn9PLgWMT0PIv3K0727Q
         n8khgBr7EUxnhaBswHH+6coZZAqdRAmoSeiQUj949yMHk5SBMTzBwMwtGKPMVUkpcg29
         XNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nJ+RfZURBcJ4woT+RW32u0j4ZvVLbimIwch5Y+9Qpdw=;
        b=hGLQDBvr7N8PEkRmYL4hr0i10ch/rnhvvaKgwgfIrq1w5jSOFuRpVzBT1iLUWb7OGK
         AjdGLP/7Oxnm8oFmHgcqe6PifHxcL/NceqW/Id74nPW9Rh1VyLRShtMZQCHuEiHOXMWb
         xoUwqqfepx41Uw5GaSTIZ5mI62j1ycRT6rynz8d9aa7CrZ6Y5eJ3/W6HqrfGgY+Vk3aK
         d5DJaFuPVxlkZmzNTH+tx+pK9LkEZus963fGBDHrVfg5WEgEB9kj+U4hl9YM4AAy/OXl
         26aJGgdl85BYe2VsEc7m4lWgGXMxuIYY0t2bvLWfbyYYnDmSZZDO5+iTlfARB9F9kIxY
         gVQg==
X-Gm-Message-State: AOAM531Lu9WPwOsvIf1nW0Hnw6o4HOgT+vSebzKz7yDW9vdrDREg1quz
        je/2GYlqwaSBhcWkxP0EOu+u5uWEO567fQ==
X-Google-Smtp-Source: ABdhPJzNJ0wP6kVYOaGBCFspCJbeW+6wQW3hnl/dOpTcR5I6hLWbRGvNVtPzNLvSoMsC1l1+KzIcrQ==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr12851874wmj.167.1597652585398;
        Mon, 17 Aug 2020 01:23:05 -0700 (PDT)
Received: from p1g2 (2a01cb000f8e270038fe4c27b4fe9348.ipv6.abo.wanadoo.fr. [2a01:cb00:f8e:2700:38fe:4c27:b4fe:9348])
        by smtp.gmail.com with ESMTPSA id z8sm27947898wmf.42.2020.08.17.01.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:23:04 -0700 (PDT)
Date:   Mon, 17 Aug 2020 10:23:03 +0200
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 2/3] tools-common: fix build for Android
Message-ID: <20200817082303.GA91176@p1g2>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-3-gary.bisson@boundarydevices.com>
 <CAMRc=MdLXhcauwSeFKxeBbJUUTVTHCw3Pwkkxx3Emmao7MnXjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdLXhcauwSeFKxeBbJUUTVTHCw3Pwkkxx3Emmao7MnXjw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Sorry for the delay.

On Mon, Aug 10, 2020 at 09:15:18PM +0200, Bartosz Golaszewski wrote:
> On Mon, Jun 8, 2020 at 11:07 AM Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
> >
> > program_invocation_name doesn't exist in Android, getprogname() should
> > be used instead.
> >
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> > Hi,
> >
> > I couldn't an equivalent to program_invocation_short_name, so the
> > program is now using program_invocation_name all the time, hope it's ok.
> >
> > Regards,
> > Gary
> > ---
> >  tools/tools-common.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/tools-common.c b/tools/tools-common.c
> > index 12bde20..1d7fc2c 100644
> > --- a/tools/tools-common.c
> > +++ b/tools/tools-common.c
> > @@ -21,7 +21,11 @@
> >
> >  const char *get_progname(void)
> >  {
> > +#if defined __ANDROID__
> 
> I'd prefer to keep libgpiod Android-agnostic. Does prctl() exist in
> Android? It too can be used for that.

Yes I understand. prctl() can be used in Android so it would definitely
be a better option.

Regards,
Gary
