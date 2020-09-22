Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710E7273E07
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 11:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgIVJF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 05:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIVJF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 05:05:26 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AEDC061755;
        Tue, 22 Sep 2020 02:05:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z18so11856882pfg.0;
        Tue, 22 Sep 2020 02:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mPsvEGWz9X5eyL4+lVDR6ZPM4UaqFBAtKVbt5mUKCOU=;
        b=rm0AuDs9bkPE2pca7xXKwIw4LAdqI0HURlLBlRiAPXpAlNg+NTxa1n1wwwoVvDVGJG
         L1huU+wuhXZXppfAax+PJOj51f+3PAnX23tG0Q5//4DUOatRDIiMvQwWPJ+C+LlsrgJh
         aelDCLZqLHpbuAZHsWfN5u1F/15PQV67pl1dI+DlF/aU1qgFdHct+rTCQYgqhpJSzfA8
         gMpRK22qV4/ETl0F+fZCFzT8HtHCpnHy4MHfccjCSIhqTVLKcIRTgvesYDDf8nkSEOCy
         a9bOvLhCD5xPklepyxvDZ0xf9CkdoDMT2YQ1EKJq1L4PvIXPEarM9HBLkPHX8LgrNBb2
         1WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mPsvEGWz9X5eyL4+lVDR6ZPM4UaqFBAtKVbt5mUKCOU=;
        b=hQIjvsxc1fSJXycy78ElDGJjRQzqyJ9PyeOJre2K4qKnnfM5TUIUmIxyYrpkiUit1e
         iUMbRW2fdLU81Ht11SG7iVR0eZQMR1COZqL3jxs79vyuikr8As5SN8Gnsqu9uuRQkaM1
         vRTp6jRIo7eCQn57kRZamNuFlzizmKnhZvWJ2GawAHYLLzP43fecu3U0hOogOqfBP4sN
         0HTeKm3KMATdBM0e9v3qSaKStD6EWegl4Czqk17boU0y8aFTYTED40GG0FG26wxUqc+e
         Ujd1daekYmY9tMpjoIf0dc97nGTNul0ktEiFmiVK4lxn37s1LPU6ahdZTG1kaf7koKrB
         PYzA==
X-Gm-Message-State: AOAM5317amW+yczepbZnZmgmWC7zfHWCRi9xjxSAvKv+JrvTRBmqqn5b
        Hc3h5wOVZsPsMXbSFEEcDHc=
X-Google-Smtp-Source: ABdhPJxiZbCLf5v4hNKdJuQ425SV+nu3/VQhf1o4I6t4H4Of57LVPP4MzCMhFtH83Y9AjgqIGvBy/w==
X-Received: by 2002:a05:6a00:1506:b029:142:2501:3971 with SMTP id q6-20020a056a001506b029014225013971mr3340207pfu.54.1600765525518;
        Tue, 22 Sep 2020 02:05:25 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id c1sm14375118pfi.136.2020.09.22.02.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:05:24 -0700 (PDT)
Date:   Tue, 22 Sep 2020 17:05:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v9 13/20] gpio: uapi: document uAPI v1 as deprecated
Message-ID: <20200922090518.GA493023@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-14-warthog618@gmail.com>
 <CAK8P3a2S3YLgy001xB-xWib9kYkkQKgFmEEP1MGYFhvd2HZAXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2S3YLgy001xB-xWib9kYkkQKgFmEEP1MGYFhvd2HZAXQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 09:49:11AM +0200, Arnd Bergmann wrote:
> On Tue, Sep 22, 2020 at 4:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >  /*
> >   *  ABI v1
> > + *
> > + * This version of the ABI is deprecated and will be removed in the future.
> > + * Use the latest version of the ABI, defined above, instead.
> >   */
> 
> How intentional is the wording here? It seems unrealistic that the v1 ABI
> would be removed any time soon if there are existing users and applications
> cannot yet rely on v2 to be present in all kernels, so it sounds like a hollow
> threat.
> 

Andy had a similar comment regarding the build option, which I updated,
but missed updating it here.  The updated sentence ends at deprecated.
I will update these to match in the next rev.

> At the same time I can see that telling users it will be removed can lead to
> them moving on to the new version more quickly, so maybe a hollow threat
> is in fact appropriate here ;-)
> 

That was the idea - though even the sysfs interface is still there
and doesn't seem to be going anywhere in a hurry.

Cheers,
Kent.
