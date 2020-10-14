Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A897728DBBB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgJNIhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgJNIhT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:37:19 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326E5C051111
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:37:18 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d6so1366873plo.13
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TlAa4bOkKbUpY6AvtmLJ+1mVw//iEd5l7fc2FR1hKNs=;
        b=g/65RpJWV2VJzEw1gnG8DTJSw24buyX2QG2EZ9AwkGyATQ+IJSFFpspwVXzN7sjiS4
         F0u8/xZKjwMi9O7LVQp7Xt3MAOjLEE9Ex42tlUBp+sqSr5SzvXmahhRqKNVC8CzLsbMc
         c1euimc3wymRi65FE7u9xn84aYyKRN8nptn7mR/5oBCd0NnmXyVlmkqbpBqeYkujdNsd
         bLy+T+GoTnUVpgOT77T92Bn2QFsuWZrpfW55J22xOT1HaYpENWi2UxLjiT+0JCG9ktDi
         SWP4HeLogh9dEX95NZ5aI9iMwHiOHX7mhvlF+BlwpKl8T7CxKcCCL5wmyA8L7LSUQTTQ
         67cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TlAa4bOkKbUpY6AvtmLJ+1mVw//iEd5l7fc2FR1hKNs=;
        b=CaKLwYJg+4WdlI018K1kzoildplCsB00CiPXhauDPQEnwguTokXdYjWcD/7P5ccpxo
         NfxxhEle3SzwKSKhBpii68kY+WW3LBdHcAb/b2sD3K5qTQ9c5QY5pquQj5uCxChTaNnG
         4/KP1Su3loR+oaZg+qDE2muKUbqXP4Ju+XcAJrcmXb6KghkHquILpL7Dv2lgVfTV+Sgt
         tJAbUBc0WsdsNBtYsy1ONZIwPws8cqikbKs0CW0N134CWKf4Li/vwj0t7ufZPqxzldWs
         piX9bLXrDk+ajV9zZ0iRU+6To0Q8YZDHq0terhiDpuNv0Mec82//yLnFW/YHG36Ueak2
         MhIA==
X-Gm-Message-State: AOAM530FiJoYZ4uO5IYxItUBjgrOPuYYT6ODRCb6SPzzGxSXF4Mt7zXX
        5eorcBKpGBjaMU2OpdhycF8=
X-Google-Smtp-Source: ABdhPJwGjoDrukbglnpd0Fuhvbl0PR7y/epvoP4dtaqK4HEOAC2TRKEO1adX+oTrfmK2axrLf9xXbA==
X-Received: by 2002:a17:90a:7089:: with SMTP id g9mr2524455pjk.4.1602664637639;
        Wed, 14 Oct 2020 01:37:17 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id d129sm2381794pfc.161.2020.10.14.01.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 01:37:16 -0700 (PDT)
Date:   Wed, 14 Oct 2020 16:37:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 0/2] tests: improve wait_multiple coverage
Message-ID: <20201014083712.GA92960@sol>
References: <20201014034758.19427-1-warthog618@gmail.com>
 <CAMpxmJX0E+awshoBJykp2C1ZOK-oCgSDTE2xmeKKZdYW0m4q8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJX0E+awshoBJykp2C1ZOK-oCgSDTE2xmeKKZdYW0m4q8Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 09:50:08AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > A couple of patches for the v2 branch that improve the coverage of the
> > wait_multiple test case.
> >
> > The first creates a mismatch between the chip offsets and bulk offsets
> > to highlight the problem with my initial implementation of
> > gpiod_line_event_wait_bulk() for uAPI v2.
> >
> > The second adds a check on the event.offset field added for uAPI v2.
> >
> > Kent Gibson (2):
> >   tests: create mismatch between chip and bulk offsets in wait_multiple
> >   tests: add check of event offset to wait_multiple
> >
> >  tests/tests-event.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > --
> > 2.28.0
> >
> 
> I suppose that, if we don't want to do the backward compatible port
> for now, these can be ignored?
> 

It wouldn't hurt to have them either way - in my book it never hurts
to increase test coverage.

Cheers,
Kent.
