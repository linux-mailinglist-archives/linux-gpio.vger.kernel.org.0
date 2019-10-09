Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48E3D10AE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 15:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfJIN5o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 09:57:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33134 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfJIN5n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 09:57:43 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so4835702wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5MkBUHt35dAYeHDMj1xA37dbSwLw4k2NyH7uPtocXwk=;
        b=VmZjtFXex3NEiNkmlRSVMGQzq884Wel8bU1DpqdU+YYGFa0l1SfF/qk2ixd2UBNabF
         Stm7UEyRf0LB/ROWfe64oHqInl/PZVViLxeZJpdQ8oHllgxZ2P+Ecwt2EABZgQ3Q/PQW
         wvPeSL3qcuugFzaG767tHF20Je1M6grjPFxUgyxmTdTPvqhn9oT6lQAh1U5PdKA3Yi7s
         C8QHnlZ9iu8X8Qwy+NWvj3VolwAoCvPL14HE4pjK6BQyH7fpzxYkeEVxjQVtAafkzMsQ
         RtPzo4paIGlTsiv9sXw4/zXusD229iIWpo9lf/GlYge6UJ7f9Mcst45353NDDdLNWxiH
         32/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5MkBUHt35dAYeHDMj1xA37dbSwLw4k2NyH7uPtocXwk=;
        b=gcQnQzwbkt2xZp/TFvEI0QxQMZaeopmm4767+kAjiU3XI4uM4Zjzu2eB908EhFvARC
         uYpAGAWucidxLUJ13xxxFw4Jd+mPGfS0WNWxYY53THH+5gWO95qQ4pSY8bTYUuSYvOp4
         j9fEkEsA97p+IrTDFmwxfVTNK1BW1HfMjQfpFjTWHp+cLSR//mxTJVHI0UkM4t0UWm/N
         EuvDbD4s/dGPT97dA43EjbkHt+YbbCbW8dbGi9MK0wEGiwb7pfwrlcJ963qLP5VbSj1w
         SyQGmm30gruPng6y0c57ANS4ls18KN+8aJOHlXpNFq/0KDcR3NrO1l/b6yFkJcBk8dqh
         1w5w==
X-Gm-Message-State: APjAAAWgr8QEZ2p0h3w81s6pzWhAkYvs/KoJZYOciJbSkrgG1EVKGTiz
        mcGjKdk3SLta2D2eBW1b37c=
X-Google-Smtp-Source: APXvYqxgEdMyfMbFDAhNThGX34hyjA/BqaNE/87MmJD5w8i5jBFkFuqoLgqd40XRWg/fotNDPQiC6A==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr2524966wmc.24.1570629461291;
        Wed, 09 Oct 2019 06:57:41 -0700 (PDT)
Received: from x1 ([2001:16b8:5c80:ac01:2d69:222e:6eca:3415])
        by smtp.gmail.com with ESMTPSA id x2sm2743838wrn.81.2019.10.09.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 06:57:40 -0700 (PDT)
Date:   Wed, 9 Oct 2019 15:57:38 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009135738.GA20539@x1>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008232120.GA9225@sol>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 07:21:20AM +0800, Kent Gibson wrote:
> And while we're talking, does the gpio-mockup support pull up/down
> being set from the kernel side?

I was curious where this refers to the kernel or libgpiod?

I see there is:
libgpiod/tests/mockup/gpio-mockup.c

and:
linux/drivers/gpio/gpio-mockup.c

thanks,
drew
