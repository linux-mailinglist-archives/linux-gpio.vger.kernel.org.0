Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D83DFC20
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 05:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbfJVDLZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 23:11:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43660 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730662AbfJVDLZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 23:11:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id l24so4109993pgh.10
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 20:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PIlmvXzQARRZSFQcj9hlQ++qeOiYHuF/aGs6hLa1i4g=;
        b=gw5pYitu7VtFW8vNRWT/RXk3nHiCyZjqmVr0esL4JUt9xcYxfjVxwrbvbWNSRTO1gm
         arsRhXxudFCQ9dH+qXVK9dblii5OGKs1497U2gBTVSM3FnHfhKabGWSzVA3iJoUOpw8L
         /yNurWUNxTmQkTKzaamPJwcCUT5vb0bBC9OVYh8SnloWe5EEh2vahGJySrP6ZZ8l47eT
         jgHY3TaNPtLTeO5GlnMVXpNdkJ2khsvlJ24j3qysfQHZ5xfVnjxkpjdgLIjYsftSaIu1
         tagzwVJFgCwa9+9G0Q7jS1URMPi8lS4x4wcIQ67MNRVKrJsnAV9y1QpYbtB1SAaKxN/1
         Rlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PIlmvXzQARRZSFQcj9hlQ++qeOiYHuF/aGs6hLa1i4g=;
        b=In2eVDABAO7L75WOXvoIkucFWdB+0YU05/JnLGAsI5mY6moqK/Lezyf/ZfxlgZAX+w
         4heC0QY5QSpTEx37tcvBdqUnuUGnyLtGeenBxXacWj624YkzPCHWhu9ulwdtKSuUWzwW
         UAijUpjO0t1+r3fkDD9JRN/HUzJzQ9+JWulcmj5Ngy3IuqQYT8rZRVbSwjlyvWteJT/i
         aaL15/Osfhj/cstumi6bYeKlC9TJ8Mx0BqrFoxhSeSX2O4aMs3VZUA5X7WpskIgVM+qc
         5mP4qJkhLwIApEOXjdOJYLRKTGwDXkJG9/aBvwEaICfbOJf5QHcVfLsn30NRlOxf/qVv
         JCTg==
X-Gm-Message-State: APjAAAXc7dmo+798TGx1i0eStGdRn3GhlIPTl6V0xt/PugkHhWLpTY8K
        Kdn1wDujhh6Bbv/wf/Yx2LQ=
X-Google-Smtp-Source: APXvYqzgy7m5BMtqq4nwc/spVAK4pWq89Ei7FsdHZagpJyQ68ehBp1dDKiocL0lp0MaJ2vxUhVpivw==
X-Received: by 2002:a17:90a:d347:: with SMTP id i7mr1797310pjx.30.1571713883963;
        Mon, 21 Oct 2019 20:11:23 -0700 (PDT)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id m13sm16189310pgi.22.2019.10.21.20.11.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 20:11:23 -0700 (PDT)
Date:   Tue, 22 Oct 2019 11:11:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Subject: Re: [PATCH v2 5/6] gpiolib: disable bias on inputs when pull up/down
 are both set
Message-ID: <20191022031117.GA11438@sol>
References: <20191014130425.GC28012@sol>
 <CAMRc=Md75GmWhi+KBtVTeLJ=efB6cDr8dxsEbZ2A6vc4z6LAwA@mail.gmail.com>
 <20191015005849.GA7970@sol>
 <CAMRc=Mf-NVGFjLOgYwtmBvyZ5pu3E0NmGZ91t4aAYZLe8w8rJQ@mail.gmail.com>
 <20191016010104.GA8083@sol>
 <20191017050647.GA21551@sol>
 <CAMRc=Mdc4yVHP=LGgdujW8FbETadM1jFMeARBP-531Yoo-un-w@mail.gmail.com>
 <20191018101306.GB16347@sol>
 <CAMRc=Md8CH-YTcDGhF7ODZTLO0hvE47XhaHFsXEe4ebcM-28uQ@mail.gmail.com>
 <20191021231456.GA3374@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021231456.GA3374@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 22, 2019 at 07:14:56AM +0800, Kent Gibson wrote:
> 
> The updated C and CXX tests pass. The one problem I have is getting 
> the Python tests running - they can't import gpiomockup, though I've
> built and installed everything.  Not sure what I'm missing there.
> 

Sorted - the python bindings get installed into site-packages, but
Debian/Ubuntu doesn't look there, so needed to manually set my
PYTHONPATH. 
The extended Python tests are now passing against v3 as well.

Cheers,
Kent.
