Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C756A34D38F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 17:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhC2PRE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 11:17:04 -0400
Received: from smtprelay0209.hostedemail.com ([216.40.44.209]:40922 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230286AbhC2PQy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Mar 2021 11:16:54 -0400
X-Greylist: delayed 477 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Mar 2021 11:16:54 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id F17E51801CE35
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 15:08:56 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 47A6B180A5B1F;
        Mon, 29 Mar 2021 15:08:55 +0000 (UTC)
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA id 77FC918A608;
        Mon, 29 Mar 2021 15:08:53 +0000 (UTC)
Message-ID: <1ceb7dc5c2fa376470ab9274020fddf1c2f1584f.camel@perches.com>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from
 config
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 29 Mar 2021 08:08:52 -0700
In-Reply-To: <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 77FC918A608
X-Spam-Status: No, score=1.60
X-Stat-Signature: fdhzygs6faxkxwbfropctuqsjth8c68u
X-Rspamd-Server: rspamout04
X-HE-Tag: 1617030533-220374
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-03-29 at 14:59 +0300, Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> > 
> > The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> > 
> > Make the gpiolib allow drivers to return both so driver developers
> > can avoid one of the checkpatch complaints.
> 
> Internally we are fine to use the ENOTSUPP.
> Checkpatch false positives there.
> 
> I doubt we need this change. Rather checkpatch should rephrase this to
> point out that this is only applicable to _user-visible_ error path.
> Cc'ed Joe.

Adding CC for Jakub Kicinski who added that particular rule/test.

And the output message report of the rule is merely a suggestion indicating
a preference.  It's always up to an individual to accept/reject.

At best, perhaps wordsmithing the checkpatch message might be an OK option.

+# ENOTSUPP is not a standard error code and should be avoided in new patches.
+# Folks usually mean EOPNOTSUPP (also called ENOTSUP), when they type ENOTSUPP.
+# Similarly to ENOSYS warning a small number of false positives is expected.
+               if (!$file && $line =~ /\bENOTSUPP\b/) {
+                       if (WARN("ENOTSUPP",
+                                "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP\n" . $herecurr) &&
+                           $fix) {
+                               $fixed[$fixlinenr] =~ s/\bENOTSUPP\b/EOPNOTSUPP/;
+                       }
+               }
+


