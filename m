Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42A9434D3C7
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 17:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbhC2P0K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 11:26:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:48469 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231346AbhC2PZx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 11:25:53 -0400
IronPort-SDR: OWG3aUqDZXmGmp0RhPPtLvjohN+t5qIajUeeRotdhuuQRLS1yALSpXptkf4BdwcViJ8y7r8kaH
 U9wWdlJHCPkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="255565714"
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="255565714"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 08:25:52 -0700
IronPort-SDR: rq1xC6B+ZNCfNwvKuTjI3Ukn5oSNFgV8aADsVbnNANwb9n0N8pt6HOBTo7QeKYM1Sj+NXdP4wx
 scvTUSMC6FqQ==
X-IronPort-AV: E=Sophos;i="5.81,288,1610438400"; 
   d="scan'208";a="606413062"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 08:25:49 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lQtly-00H3Yz-VK; Mon, 29 Mar 2021 18:25:46 +0300
Date:   Mon, 29 Mar 2021 18:25:46 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from
 config
Message-ID: <YGHxejGI2x4X3EEe@smile.fi.intel.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
 <1ceb7dc5c2fa376470ab9274020fddf1c2f1584f.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ceb7dc5c2fa376470ab9274020fddf1c2f1584f.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 08:08:52AM -0700, Joe Perches wrote:
> On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:
> > On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> > <matti.vaittinen@fi.rohmeurope.com> wrote:
> > > 
> > > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> > > 
> > > Make the gpiolib allow drivers to return both so driver developers
> > > can avoid one of the checkpatch complaints.
> > 
> > Internally we are fine to use the ENOTSUPP.
> > Checkpatch false positives there.
> > 
> > I doubt we need this change. Rather checkpatch should rephrase this to
> > point out that this is only applicable to _user-visible_ error path.
> > Cc'ed Joe.
> 
> Adding CC for Jakub Kicinski who added that particular rule/test.
> 
> And the output message report of the rule is merely a suggestion indicating
> a preference.  It's always up to an individual to accept/reject.
> 
> At best, perhaps wordsmithing the checkpatch message might be an OK option.

Thanks, Joe!

Jakub, what do you think?

-- 
With Best Regards,
Andy Shevchenko


