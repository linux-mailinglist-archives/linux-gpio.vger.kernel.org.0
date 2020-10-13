Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF0F28CA47
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 10:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390627AbgJMIaT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 04:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390540AbgJMIaS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 04:30:18 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD96C0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:30:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ds1so1702520pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2020 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2CNfxTZj7uJF8oA/gvHwnILwInfm4W1ZonffBoVYTmw=;
        b=fng+RR/e6zE6/uLrn8NVKUM6wjFbTNFzBTjlo6C6Ol1eb8gvTlbCkiWdZ4Zp0HQU2R
         lYFDOmJoZBwuPfkoGYCeemWHxx85ZJS/alz9z2zAl3BWZO5saeVe5MBvuLKWclDIV1Im
         A6ljc1KzDhCq/CRnWOMsnDvCCp8hJlHcoqbb3Krw2MwqdtAvZM/0T5+G0I1XIKR8jNi6
         GWQ4bgIfG1nJPgGKEYaZ+Qen2nSIIjkRg6wj06G3/fDUravVIgv2wzI1DP/L+enJ6IMs
         YdEvLVB1ADGdnLp5fqxGWDnjcciOlql1Y2zsAEgigGdz8OxAeG1uKLR8OaF5xopoihQM
         xFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2CNfxTZj7uJF8oA/gvHwnILwInfm4W1ZonffBoVYTmw=;
        b=SPqy9XDadWhGWI+IgrdR41u7u2A0T5YJYoFdOZ3qSSpjJiE7LxUkIKlMx6pGS/YAO1
         bC98L+T39TZVqlXarFOjvvnv7qhGMVY4f3+K2+HId1oWxrzy9Meb1l9Rqg5uDpVukwiq
         DABFf8sSZ1HLIcqD7zlX+fgETLaWF1fqmlmL3ocFR663U8BNIuGUS9AUeWKuec03e/OH
         Qzh0C3YiVKP4z1F9KdjCaQv1tzOBSoPTm3C5+PQp6PQP+O32635yNAJdrT0rmdUisQlX
         bWLfUPkDVNxYm6EsNSmZHxxmSjmc/PRREiiclgB8C8RSoEWAfSO79r13l7iQdcQsyYV4
         frpA==
X-Gm-Message-State: AOAM532JzbP+IWv9Ck80SotA0KjuY70GsNH0y3yQLToIbJ7yJb20ri2w
        cUe11a7gCwHinhMvhs3sFFQ9EFjKscwyyg==
X-Google-Smtp-Source: ABdhPJw+qN7fmOxnsGkU0HJ4fZq6OXx2SnHzVC4O+qsZsqTc8nNVn1hxf5Za4uoijN6MUGlsKHJKaw==
X-Received: by 2002:a17:90a:3486:: with SMTP id p6mr25471058pjb.23.1602577818358;
        Tue, 13 Oct 2020 01:30:18 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id na9sm18019487pjb.45.2020.10.13.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:30:17 -0700 (PDT)
Date:   Tue, 13 Oct 2020 16:30:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
Message-ID: <20201013083013.GA3119809@sol>
References: <20201002063148.32667-1-warthog618@gmail.com>
 <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md51g2-3PvQV_BA-qFJ=iDHqQELyMLx18yLR2LDQOCNHw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 09:08:44AM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 2, 2020 at 8:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Port existing implementation from GPIO uAPI v1 to v2.
> > The libgpiod external interface remains unchanged, only the internal
> > implementation switches from uAPI v1 to v2.
> >
> > This is a minimal port - uAPI v2 features are only used where it
> > simplifies the implementation, specifically multiple events on a bulk can
> > now be handled directly by the kernel in a single v2 line request rather
> > than being emulated by multiple v1 event requests.
> >
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > ---
> 
> Hi Kent!
> 
> I just noticed that this broke the tests in Python and C++ bindings.
> Something to do with the RISING and FALLING edge values and how
> they're translated in the bindings, it seems. Let me know if you'd
> have time to take a look at it and see if it's something obvious.
> Otherwise I'll investigate that tomorrow.
> 

Hmmm, that's odd - I'll take a look at it shortly.

Cheers,
Kent.
