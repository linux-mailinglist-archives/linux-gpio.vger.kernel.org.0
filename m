Return-Path: <linux-gpio+bounces-119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B69E7EBB04
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 02:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7AF9281394
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 01:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DA439F;
	Wed, 15 Nov 2023 01:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD8D639
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 01:51:46 +0000 (UTC)
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CE0D5
	for <linux-gpio@vger.kernel.org>; Tue, 14 Nov 2023 17:51:44 -0800 (PST)
Received: from localhost (88-113-24-34.elisa-laajakaista.fi [88.113.24.34])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 8641ad29-8359-11ee-abf4-005056bdd08f;
	Wed, 15 Nov 2023 03:51:42 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Wed, 15 Nov 2023 03:51:42 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, manugautam@google.com,
	aniketmaurya@google.com
Subject: Re: [RFC PATCH] PM: runtime: Apply pinctrl settings if defined
Message-ID: <ZVQkLqDB3KtOlIpK@surfacebook.localdomain>
References: <20231110102054.1393570-1-joychakr@google.com>
 <CACRpkdZ9RHcHh4o5g62ywK0eQHpLZuGUF0Ud6jogk9Sfqe4krA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ9RHcHh4o5g62ywK0eQHpLZuGUF0Ud6jogk9Sfqe4krA@mail.gmail.com>

Tue, Nov 14, 2023 at 02:01:48PM +0100, Linus Walleij kirjoitti:
> On Fri, Nov 10, 2023 at 11:21 AM Joy Chakraborty <joychakr@google.com> wrote:
> 
> > Apply pinctrl state from  runtime framework device state transtion.
> >
> > Pinctrl states if defined in DT are bookmarked in device structures
> > but they need to be explicitly applied from device driver callbacks
> > which is boiler plate code and also not present in many drivers.
> >
> > If there is a specific order of setting pinctrl state with other driver
> > actions then the device driver can choose to do it from its pm callbacks,
> > in such a case this call will be a no-op from the pinctrl core framework
> > since the desired pinctrl state would already be set.
> >
> > We could also add a Kconfig knob to enable/disable this, but I do not
> > see a need to.

Besides questionable code style (inline functions in the C file)...

> It has a certain beauty to it does it not!
> 
> The reason it wasn't done like this from the start was, if I recall correctly,
> that in some cases a device needs to do the pin control state switching
> in a special sequence with other operations, that can not be reordered,
> i.e.:
> 
> 1. The pin control state change is not context-free.
> 
> 2. The order of events, i.e. context, does not necessarily match the
>      order that Linux subsystems happen to do things.
> 
> When looking through the kernel tree I don't see that people use
> the sleep state and idle state much, so we could very well go
> with this, and then expect people that need special-casing to name
> their states differently.
> 
> What do people thing about that?

...I think the patch is incomplete(?) due to misterious ways of PM runtime
calls. For example, in some cases we force runtime PM during system suspend
which may have an undesired effect of the switching pin control states
(hence glitches or some real issues with the hardware, up to hanging the
system). Some pins may be critical to work with and shuffling their states
in an unappropriate time can lead to a disaster.

So, I would consider this change okay if and only if it will have a detailed
research for all existing users to prove there will be no changes in the whole
set of possible scenarious (of system sleep / resume, runtime, runtime with a
custom ->prepare callback and so on).

-- 
With Best Regards,
Andy Shevchenko



