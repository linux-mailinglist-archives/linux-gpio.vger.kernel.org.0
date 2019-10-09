Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7D8D07B1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 08:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfJIGzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 02:55:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38966 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJIGzc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 02:55:32 -0400
Received: by mail-pg1-f195.google.com with SMTP id e1so788436pgj.6
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2019 23:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=b7eJRZDHxVoBGAGKlwj0z0FLtTVOSSjHKhBWWeuk0Oc=;
        b=lSufSjGpCavV9D5mEpHLrn19k8RVTTNMm00VutO3TTavonByIiTfj1YliqUCDErnAE
         rV5so1ezSP7JGY/iuMJrgJFJhTtwGkq1bV0G9x1/fr3vCTne9o+iQJcdy8H8WoVNkL+B
         WTWwur1+KZjXJB+wUCdTx/yWwlVtZZQu1+wNXV59uhHAp3crYVU0m6Haj39SyAvD6bwh
         cSVkOCzFjcN9yzbKBcYGf44r7KzfQWkLrcX0rJj7cY4pwuh4pLPPVcsyYwroxgnY7jMZ
         dkS4FGxlSdz7vVU0tIT75Z6mdYbbWFdSq9CSMVcD2iu3z31UR5mz/5lAihahxMJojWY5
         4Hcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=b7eJRZDHxVoBGAGKlwj0z0FLtTVOSSjHKhBWWeuk0Oc=;
        b=mv1a/YiFK68zIrR+lilBQ8bIx/ghZtxPbf2wl0vdTTh6Qx20B0mnO+U43s8Cy84VMW
         3zel6FctNg4ia88GKTR31pQmlxdN4KHKku7xwCAPLvOfOpFX0g3EBchYvRRljO279jea
         L/rj7xHFWoPGp/SPZVkqg2+nq7inPxTTFSllL2OqshQob9YMlhY4cf9uD55w+F5xEYKH
         fNCR4M+3gGGQfchYmXWH6TFGhQSHW5tiG5CanKEuDlRegw75jz0atO62w8ojs+s4pc64
         BNSQYg+quJslc/l5Cz60msHREoGS2pfW9Devg14g9hV+f7jNO6N85pAlNLOXF9gD2xtS
         mnsA==
X-Gm-Message-State: APjAAAUBPf7OSgoe2fGaiwBUR4Xgtbm9CA3c28BBIYB4obnKPNO4vbkh
        6yUeRzb7lLM8oSiWd/lM2/vEbWPBgNsejw==
X-Google-Smtp-Source: APXvYqxAV41Xm55hVSSQsP9wwDZat98XpnZ4SHXALjLqYp1wKAyM/ORxIAZSSyaOCTbiYJ8n3Vumgw==
X-Received: by 2002:a62:8209:: with SMTP id w9mr2186355pfd.5.1570604131227;
        Tue, 08 Oct 2019 23:55:31 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id k65sm2204344pga.94.2019.10.08.23.55.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 23:55:30 -0700 (PDT)
Date:   Wed, 9 Oct 2019 14:55:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Drew Fustini <drew@pdp7.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009065524.GA4061@sol>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191009002211.GA11168@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 08:22:11AM +0800, Kent Gibson wrote:
> On Wed, Oct 09, 2019 at 02:03:58AM +0200, Bartosz Golaszewski wrote:
> > śr., 9 paź 2019 o 01:56 Kent Gibson <warthog618@gmail.com> napisał(a):
> > 
> > But there's absolutely nothing wrong with writing code even if you're
> > not sure about the solution - it's even encouraged[1]. It's much
> > easier to discuss existing code than potential solutions.
> > 
> > [1] https://lkml.org/lkml/2000/8/25/132
> > 
> Exactly - show me your code.
> 
Safe to assume your code is in your topic/gpio-uapi-config branch?
I hope so, cos I've forked from that into github.com/warthog618/linux 
and have started working on it.

So far I've added pull up/down support to lineevent_create, and 
added default_values to the gpiohandle_config (for setting outputs).
Currently looking at implementing the actual set config, and sucking
on whether that is best done by refactoring bit out of
linehandle_create.

Will sort that into patches once it is in a fit state.
Feel free to poke me if I'm going off track.

Cheers,
Kent.
