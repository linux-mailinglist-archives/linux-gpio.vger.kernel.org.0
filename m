Return-Path: <linux-gpio+bounces-24785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E543B310D9
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 09:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D76547A9891
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 07:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27B32EA478;
	Fri, 22 Aug 2025 07:55:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1261A9F83
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849300; cv=none; b=EQIcSa/ZdxAmF5Q03YpG96yK/t2Fk7tV0GOHUKOC/xO27xzO0krUpYHzo1WKDIMSYAtO+teNb4JpdsTpPckUQqWpF38+g7Hy41LCtKGskNeL62EAap/y/jmRQgo8aVe4Q2Hkq/feCkwgZOY/rgFt5d6Q9De3X3E65W87/Plo0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849300; c=relaxed/simple;
	bh=/K9b+FpYVFruJTpwrWT8Z+qPxfP4mmcu/Z/6+a11n8c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryqiy6Pl1qi2ZJOdystsfKAWjLpBlakW7cCP+u2hHErgNE8+mLmLh2jOy9FELhyiVpV3SPdfZJXHdB9TVZ1ygbVcSc1YervZGTn+HFm9vbgKdB+rF6r/r0YQ+tg80gOihusXtB7qTibHM75dlPpk3DEFLzkvXP8jhlFJTpUfL20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 2318b27c-7f2d-11f0-98ca-005056bdd08f;
	Fri, 22 Aug 2025 10:53:49 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Aug 2025 10:53:48 +0300
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com, Shyam-sundar.S-k@amd.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member
 directly
Message-ID: <aKgiDB29TxP5Kd9t@pixelbook>
References: <20250821144942.2463014-1-superm1@kernel.org>
 <CACRpkdbzsgbTMiZfBHgQBsdkfH=Qhr798XLReGB7WhXLsuFrDw@mail.gmail.com>
 <f672f4c4-0f11-49aa-81ee-d72096b80825@kernel.org>
 <CACRpkdZKJ7BX8goR_6ik-ksDssFLQ8xw7SL06PpN0ZRNNccqgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZKJ7BX8goR_6ik-ksDssFLQ8xw7SL06PpN0ZRNNccqgA@mail.gmail.com>

Fri, Aug 22, 2025 at 08:33:55AM +0200, Linus Walleij kirjoitti:
> On Fri, Aug 22, 2025 at 2:30 AM Mario Limonciello <superm1@kernel.org> wrote:
> > On 8/21/25 5:16 PM, Linus Walleij wrote:
> > > On Thu, Aug 21, 2025 at 4:49 PM Mario Limonciello (AMD)
> > > <superm1@kernel.org> wrote:
> > >
> > >> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
> > >> all use to it.
> > >>
> > >> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > >
> > > Hm where is this supposed to be applied...
> > > My tree?
> > >
> > > It doesn't currently apply to devel.
> > >
> > > Yours,
> > > Linus Walleij
> >
> > It was based off the commit that you picked up earlier this week.  It
> > changes lines in that based upon Andy's feedback.
> 
> Aha the single line pm_pr_debug() change. I applied that in
> fixes because it was just a oneliner and came with the other patch
> which was a fix.
> 
> But this multiline non-regression can't go into fixes.

True, but fixes may go to the next if they are needed for dependent changes.
That's why there are three ways how to handle this:
- merge fixes to devel (That's how Mark Brown does, for example)
- merge next -rcX to devel (That's how Greg KH does, for example)
- cherry-pick fixes to devel (That's how I had done, when I was PDx86 maintainer).

- (4th one) wait till next release and proceed as usual (sometimes done by some
  maintainers depending on the case at hand)

I believe we already had this discussion once or twice in the past for the
similar cases.

> I will move both of these over to -next since neither is
> a technical regression.

-- 
With Best Regards,
Andy Shevchenko



