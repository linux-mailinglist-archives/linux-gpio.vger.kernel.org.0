Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180FA34D63A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 19:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhC2RrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 13:47:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230298AbhC2Rqu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 13:46:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA1F56192E;
        Mon, 29 Mar 2021 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617040010;
        bh=hFsIuqdNEm7bApfHZANY05w0cyfllwS7fRcgazdqxuk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tqijS85JKL5wU3IwLk9aSl12pvJ3r1NEP2/tNswDK3Ai2GJUD1tpUMQxPaD8HlCeh
         W6MIjurh5VU6Ue2uCglMsFqs6ltUDJyPLjnOnth22E+IgKHErySaluHdKW4t34PSqe
         qUfPisRlh5YV70y9NNgN4EHGaUtrGwxcsjtnw4OLuaaROLcOHV3vOO3lz0mfRtMPAv
         PjchE9qcOmH+nj/3kUdj/sDkpaXEgbUpd+UxzM65+p4Hp2TIyJYKV8eu6NANgOCLMA
         FL+UvM5HLDiXSkut2uhwfQoIDS6TmSukvimgOCeDoDvwMpoWkPFg0mMcna66Nr07Un
         DG3Cu9Mr5mkZw==
Date:   Mon, 29 Mar 2021 10:46:49 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Joe Perches <joe@perches.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from
 config
Message-ID: <20210329104649.6e2ca6c7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YGHxejGI2x4X3EEe@smile.fi.intel.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
        <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
        <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
        <1ceb7dc5c2fa376470ab9274020fddf1c2f1584f.camel@perches.com>
        <YGHxejGI2x4X3EEe@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 29 Mar 2021 18:25:46 +0300 Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 08:08:52AM -0700, Joe Perches wrote:
> > On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:  
> > > On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> > > <matti.vaittinen@fi.rohmeurope.com> wrote:  
> > > > 
> > > > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.  
> > > > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP  
> > > > 
> > > > Make the gpiolib allow drivers to return both so driver developers
> > > > can avoid one of the checkpatch complaints.  
> > > 
> > > Internally we are fine to use the ENOTSUPP.
> > > Checkpatch false positives there.
> > > 
> > > I doubt we need this change. Rather checkpatch should rephrase this to
> > > point out that this is only applicable to _user-visible_ error path.
> > > Cc'ed Joe.  
> > 
> > Adding CC for Jakub Kicinski who added that particular rule/test.
> > 
> > And the output message report of the rule is merely a suggestion indicating
> > a preference.  It's always up to an individual to accept/reject.
> > 
> > At best, perhaps wordsmithing the checkpatch message might be an OK option.  
> 
> Thanks, Joe!
> 
> Jakub, what do you think?

Agreed, weaving into the message that ENOTSUPP is okay internally
sounds good. Perhaps we should append "if error may be returned to 
user space"?
