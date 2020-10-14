Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBD028DBEF
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 10:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgJNIq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 04:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730075AbgJNIq2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Oct 2020 04:46:28 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA612C051111
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:46:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d23so1394504pll.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2020 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PctVaKz2A/L0tI6C0un337pXKY7RwQ514FElWfCJ3wQ=;
        b=lf6KWftp0Ipj2pIGNwrPtzBj5Q2e331+iE+cJlLIuVT7Vrda8mwSpP2LgQ2iVijCIP
         zMmWyT717eLa9w1TORyWXXGZE9uwerOqNZmnI8L6ROJyhnFDNaduAcyV6RtVoH5n6k9V
         7tGKjSZWbdhJufkcmeolTKFq90te7OUR2l3u3NMH+zQXto8vwG5in36hyqqVWvN/Y/G9
         FVjjEsPa2zQHFe8wgdzyW9KFOxAhTf8/HghOdbptwG1F0+7ELRO0lkbw8JYqfd2c45Eu
         F2OHwkBCp41AX70NaFga4OAR+5w1Dn5GiFG3rj0NV9avjxWhVETcpbSYPhix5utLUjgi
         jBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PctVaKz2A/L0tI6C0un337pXKY7RwQ514FElWfCJ3wQ=;
        b=KVHyA8dliiU7YIFz3WkzFg2EprbzLZtcnum6vvfzQXVSS7RoY/3qRvnHyhFl0ppkzM
         TBGEtHQVtZwkugs9X15S4BR8DBke3R39wvCoDFuL/zsl0kYvYaW29ycziST4F5G2ewIv
         cNXtyg/lMvDrj51op5R4lksNgKJN3j8AFcNi29Ye+ANtwKoddd663++lhkow7w6NF0hS
         ECKLl2xkhLRrZ+3FLj9BchyyZHIoApJCMXfkTaAHWj3FPKgnKE6jNbez0fn30knAp884
         mJGNfNKiQS8nyfE1ibAOuQldWRq0vQ3gOWwQBaOVDKGhEqcR3WUUJbc3zwc14oNx0kw0
         4fUg==
X-Gm-Message-State: AOAM530GeAdF77Vmg3QSTVQBuUuuPVIEUSbKhKn3zJ4xpHxzi7iZ8eDT
        2EfE0/88XxN4DqxQcbKeGbRdBpN2Y2ZpHA==
X-Google-Smtp-Source: ABdhPJzeAAod6u2S/Bl6WRapKlhcO/uGyGRei1lxWMPEclQ7qrhE73JzhFzAIJ++0/sNkLVdWMGF1Q==
X-Received: by 2002:a17:90a:cb86:: with SMTP id a6mr2381951pju.161.1602665188189;
        Wed, 14 Oct 2020 01:46:28 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id e196sm2403544pfh.128.2020.10.14.01.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 01:46:27 -0700 (PDT)
Date:   Wed, 14 Oct 2020 16:46:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 0/2] tests: improve wait_multiple coverage
Message-ID: <20201014084623.GA93440@sol>
References: <20201014034758.19427-1-warthog618@gmail.com>
 <CAMpxmJX0E+awshoBJykp2C1ZOK-oCgSDTE2xmeKKZdYW0m4q8Q@mail.gmail.com>
 <20201014083712.GA92960@sol>
 <CAMpxmJWXCeMcooJov2rL8Lk8u15G2njvkQ_UDg_f3365dWMTag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWXCeMcooJov2rL8Lk8u15G2njvkQ_UDg_f3365dWMTag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 10:39:49AM +0200, Bartosz Golaszewski wrote:
> On Wed, Oct 14, 2020 at 10:37 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Oct 14, 2020 at 09:50:08AM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Oct 14, 2020 at 5:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > A couple of patches for the v2 branch that improve the coverage of the
> > > > wait_multiple test case.
> > > >
> > > > The first creates a mismatch between the chip offsets and bulk offsets
> > > > to highlight the problem with my initial implementation of
> > > > gpiod_line_event_wait_bulk() for uAPI v2.
> > > >
> > > > The second adds a check on the event.offset field added for uAPI v2.
> > > >
> > > > Kent Gibson (2):
> > > >   tests: create mismatch between chip and bulk offsets in wait_multiple
> > > >   tests: add check of event offset to wait_multiple
> > > >
> > > >  tests/tests-event.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > --
> > > > 2.28.0
> > > >
> > >
> > > I suppose that, if we don't want to do the backward compatible port
> > > for now, these can be ignored?
> > >
> >
> > It wouldn't hurt to have them either way - in my book it never hurts
> > to increase test coverage.
> >
> > Cheers,
> > Kent.
> 
> Ok I thought they only apply to your v2 port but I see they'll work in
> master too.
> 

Yes and No, i.e. the first is general, the second is requires the offset
field in the event, and so only works for a uAPI v2 port.

Kent.
