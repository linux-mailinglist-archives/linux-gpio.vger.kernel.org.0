Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A137D0F46
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 14:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730858AbfJIM5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 08:57:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45112 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730765AbfJIM5e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 08:57:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so2824568wrm.12
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f/VAcxpvS57yBy3o59o2IUnx+LKfoYiWmZpCWTevC1c=;
        b=nou0rsIYx36EweAysfYmwfxs9hwoy2FN35idX0nJ4gHNRjBlFgIIhkVPHiKWuVbupN
         m2ULOgMAtqficAfw2a5I7TJT+DVTcT23uwTI8chfB7Q3pUYF6fCPa+AEFZvIbnOypLVc
         PRTCPixxx0iexn06khGicSJppmCEQJq+/jWlSAcBsak8r3Jvw+PPoUSSJNhXgFh3wKst
         qEIVHyxW3ER3Np1pe/XGD23QyP2SpRmZyPssS3Cvhq2ZXJdN1H0llijwWysceOynl2Lz
         fwSkZd+V52aOHpn2Ta5oPM6CzcpscYKHdvG0uq4dkEDqNnw+O13tw28KaG9LDn7+LtVe
         LpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=f/VAcxpvS57yBy3o59o2IUnx+LKfoYiWmZpCWTevC1c=;
        b=m2rjmTSo6wZ2ULfzFT2r8I5nEQQBkiNw5rW8Lo3nY/Z1b4SAv3lSmvvONTOf8+pZFW
         eOb7W5T7zmEt7+WKU3RVBiOaXu2nFMJICNj3vtBgSW8S8HohzX6bxEr/EH2YcSnfitL4
         ZK8Ap1HfCQd8onGtCncgVDoY3OgPGP+KNRF4ei0U3m+miFydQ+8EaRPZd5cLYZsQ/jzV
         C+kJl4nYrY9SgktvqhIWoxgIZA2rmqSPr1sp4YbvMaPzJrAQsaUXd2aebTR+LJLI4qfJ
         gZpe7mW7HFsNIimzRt9l4HsijH3S38NvrHjn2GjcrGt2QczHywxf484FUTpmh0vEuTq0
         f+qA==
X-Gm-Message-State: APjAAAU/Gfq3PMK2QoBMQst2Ge+zuEkDTpbbTGniiV75cTuYG41I/1xB
        CNg6pwpjswduvXFtJbXeBdA=
X-Google-Smtp-Source: APXvYqyW/X2EvbGMwC11HRMTA/vQ+9man//tQgMctwBYFvtdCx/QbRqPzZuopaOwQpPPyhRFXnDbQg==
X-Received: by 2002:a5d:4fcd:: with SMTP id h13mr214240wrw.307.1570625850345;
        Wed, 09 Oct 2019 05:57:30 -0700 (PDT)
Received: from x1 ([2001:16b8:5c80:ac01:2d69:222e:6eca:3415])
        by smtp.gmail.com with ESMTPSA id t6sm3643052wmf.8.2019.10.09.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 05:57:29 -0700 (PDT)
Date:   Wed, 9 Oct 2019 14:57:27 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009125727.GA10800@x1>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009065524.GA4061@sol>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed, Oct 09, 2019 at 02:55:24PM +0800, Kent Gibson wrote:
> Safe to assume your code is in your topic/gpio-uapi-config branch?
> I hope so, cos I've forked from that into github.com/warthog618/linux 
> and have started working on it.
> 
> So far I've added pull up/down support to lineevent_create, and 
> added default_values to the gpiohandle_config (for setting outputs).
> Currently looking at implementing the actual set config, and sucking
> on whether that is best done by refactoring bit out of
> linehandle_create.
> 
> Will sort that into patches once it is in a fit state.
> Feel free to poke me if I'm going off track.
> 
> Cheers,
> Kent.

Great to see that work on this capability is moving foward.  I also have
spare time so I'm eager to help however I can.

I had been working from the kernel.org torvalds/linux.git master to
create a patch and used 'git send-email' to post a patch.  It is
interesting that Bartosz and you have forks of linux where you created
topic branches.  I just added warthog618/linux as a remote so I can view
and try out your commits.

thanks,
drew
