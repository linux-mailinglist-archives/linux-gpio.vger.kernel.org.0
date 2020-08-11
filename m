Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA6824149B
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 03:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgHKBj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 21:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbgHKBj4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 21:39:56 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F0AC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 18:39:56 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id e4so1043517pjd.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2020 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Oj7tvfMCaxqmLgbGckaFLgUiGMeNV7l3ZLwSEOp/ggs=;
        b=NphJRfzzzjDm0VkJHUFlvcpo8RLj7vz629DtmYv7st9QYlLQ3izZjM8173e1qN1Vlw
         K/z8zUA5ajOcfRGNEUFP9FhDyyPc4uEt415frm610qgqeWxiA0R3TOf9xtIIPMj93NBl
         wOli4P9/10RNlZspJn86Fv46n+eNCkRAnLxyFqSp1fgmnpN4pB5frj03mmlXBRb9FXwp
         M4M2khqzMrnAPR/DRrI6/qJGvX4N1WTAp+61hZx4E+pwlFKSHth8uH5mvHCeTocb4Zab
         0KAgEavBoI/lJsso6KQ1nSlYd+XCcYKaXGjMo88g/m6Fkf4nh6O60cYyVEeu/eadGLfx
         fXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Oj7tvfMCaxqmLgbGckaFLgUiGMeNV7l3ZLwSEOp/ggs=;
        b=lS5AFenzWp9PhnUsqG4whQqzZZvWuzxJyWV5gPL1lzO3a94/2pXfpEDlO4F0GK7ZN2
         E2fJZldMdjBOuV2ycrPmMP/SX4okNuANSxcY0ObBud5lhy1Oh0unDF8n9sn9ohTSvdFN
         +k98XfflpCNIAvPGlih9jMCzYhKrF0I5bSS4a+txo+FJOjYNYH5HNEo3XxoAjoGLzlly
         q2vMqk/78EM6p6pR8Clda580m1vJqA4F1FPmvAnDNEnQNIUOlWGkTdXnBuecRMFpCT+U
         nLROt/T4SRCj4BqsNpWO5j2wjQsWxUBoVMmXLrgjcN183z/2fS/m0qSUBkWyi1suFiMP
         5eAQ==
X-Gm-Message-State: AOAM531LVbrJM26E975KUSE3rWKdP/H8iK0dm2bIYv2bkP9+xtkR5qtM
        eK8H2svEu5B+DUU6twoOFmIjbnoB
X-Google-Smtp-Source: ABdhPJyfwlqZWgzH9DT5zbsisHqfVAtLJ49Rvr81x20/f8RJI/Q0RLcjZ+fMku8ljSp4AWe8AlLi9A==
X-Received: by 2002:a17:90a:5b:: with SMTP id 27mr1950890pjb.188.1597109995446;
        Mon, 10 Aug 2020 18:39:55 -0700 (PDT)
Received: from sol (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id x28sm23672063pfj.73.2020.08.10.18.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 18:39:54 -0700 (PDT)
Date:   Tue, 11 Aug 2020 09:39:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Stein <alexander.stein@mailbox.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 0/5] Documentation improvements
Message-ID: <20200811013950.GA25507@sol>
References: <20200808095944.188479-1-alexander.stein@mailbox.org>
 <CAMRc=MeVKBHgU6u5gVjzaysQuwrudo3Zun+AHDb74pGXzkB4dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeVKBHgU6u5gVjzaysQuwrudo3Zun+AHDb74pGXzkB4dg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 10, 2020 at 06:49:21PM +0200, Bartosz Golaszewski wrote:
> On Sat, Aug 8, 2020 at 12:06 PM Alexander Stein
> <alexander.stein@mailbox.org> wrote:
> >
> > Hey,
> > this changeset improves the document generation by reducing warnings
> > as well as supporting building doc out of tree now.
> >
> > Alexander Stein (5):
> >   doc: Fix doxygen warnings
> >   doc: Use autotoolized Doxyfile
> >   doc: Fix doxygen warning
> >   doc: Remove obsolete PERL_PATH
> >   doc: Add @file to headers
> >
> >  .gitignore              |  1 +
> >  Doxyfile => Doxyfile.in |  8 ++++----
> >  Makefile.am             |  4 +---
> >  bindings/cxx/gpiod.hpp  |  6 +++++-
> >  configure.ac            |  1 +
> >  include/gpiod.h         | 30 +++++++++++++++++-------------
> >  6 files changed, 29 insertions(+), 21 deletions(-)
> >  rename Doxyfile => Doxyfile.in (93%)
> >
> > --
> > 2.28.0
> >
> 
> Thanks for sending those! I guess I don't see any of the warnings you
> mention because doxygen on my laptop is too old (1.8.13)?
> 

For reference, I get some of the warnings addressed with doxygen 1.8.17
in my setup.
I don't get the a4wide (patch 3) so that might be new in 1.8.18, or
otherwise dependent on setup??

Either way, it would be useful for the patch to mention what version
of doxygen is being targetted so everyone is on the same page.

Cheers,
Kent.

