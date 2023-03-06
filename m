Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F6A6AD1B2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 23:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjCFWgB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 17:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjCFWgB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 17:36:01 -0500
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD462D56
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 14:35:59 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 422b8478-bc6f-11ed-b3cf-005056bd6ce9;
        Tue, 07 Mar 2023 00:35:56 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Tue, 7 Mar 2023 00:35:55 +0200
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.3-1
Message-ID: <ZAZqy+LFkZuj+T4P@surfacebook>
References: <ZAYCRPsKR8Je6LOW@black.fi.intel.com>
 <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY3pCu6gZ-kA8uHAcCBpx_0AKwVLp+UyYO0dnWdt+fZKw@mail.gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Mar 06, 2023 at 10:50:40PM +0100, Linus Walleij kirjoitti:
> On Mon, Mar 6, 2023 at 4:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Hi Linux GPIO maintainers et al.,
> >
> > Combined series to clean up headers in the GPIO library and drivers.
> > Along with it, drop a few unused legacy APIs.
> >
> > This tag is immutable, enjoy!
> 
> Thanks for coordinating and getting this sorted and tested Andy, perfect
> job as always!

You're welcome!

> > intel-gpio for v6.3-1
> 
> But I think you mean it for v6.4?

Well, techically speaking it didn't make v6.3-rc1 due to cross-dependencies.
Starting from it it may be applied to v6.3 or to v6.4.

Up to you and Bart, but I prefer not to rebrand the tag, if it's an option.

-- 
With Best Regards,
Andy Shevchenko


