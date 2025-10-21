Return-Path: <linux-gpio+bounces-27407-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A26BF7854
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 17:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C85BA18938C6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 15:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DBB3446C8;
	Tue, 21 Oct 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwc1EMi8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29031340A62;
	Tue, 21 Oct 2025 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761062195; cv=none; b=eXVdzoEfv65fAoyi2qHodJpsstf5pX8R3LMESkpHyxs9g58PSQslpKVRr2iQJCjxreQBVyRo3DvmT33EmrrhCh0aV/vUkWHHy/8WhCJjCfEJ2V+wRJbQ2efYscpRk+Kpawrd1Gcso7AbffIwbT+UqSZKJ2LKH1F0DSydX1RWrwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761062195; c=relaxed/simple;
	bh=jq4JC8Ux1vFQg5wDBSPB01/bGxMh9cnLPXkN0FYtWFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=minOEYxm6CsKtzWnwyQgfkzbK3otwFj+FxDCrkHKnYh4z8psaVJJPiC8D5A7tCZtkrMLVDmbJVwBPb+0Ur1PWQYq+P1trz840i9M/ALMTlEB7UUKoeT9EMyMuSZCnA+dd2K9fwLtF/rMphOvzsWJKKg9WRE6IcD3pVnq3YuKPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwc1EMi8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761062194; x=1792598194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jq4JC8Ux1vFQg5wDBSPB01/bGxMh9cnLPXkN0FYtWFo=;
  b=lwc1EMi8LKYndvhjk7OqSPK8mLDb5qcgMjYSj8ODdGScOocBE5JIX6jx
   Nq+EdyNBt49SU5VQEX02p8DabwI70vlSVrl5kSJlsdHPhtCeKuXG6Jfhv
   BgwbFHZP9Fz/yqf0Vs4J7RtjQAWkyOlA5ANY5fEYOZ6GIj4x2Roa/6nXC
   c+cmMM9o4nldVjcP9qAqIhiIr8IpEkS1jY2UB6MY4Ik/l7oo818x0eUip
   cq0Hke0R23/qs3tIsJZfJLNYtt2GWT5Lxv1IQvIm/epoJHPEvCW6nywTU
   T/tNm1iGIhpMHPYkq1msmOH0yQcsyKnW5K9A/6Bu4FOJZNbGBSm3jOVs9
   A==;
X-CSE-ConnectionGUID: cXPxoEQDRqy59YxaQeSWNg==
X-CSE-MsgGUID: sknLNDdhSoeIHmfTZVpZsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63288034"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63288034"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:56:24 -0700
X-CSE-ConnectionGUID: ZJo85j7gSq2uWsrYv4yW5A==
X-CSE-MsgGUID: K1YUBjw8Sr6lspBiL2Hzbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="188736412"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.148])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:56:17 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBEib-00000001XFh-1JOW;
	Tue, 21 Oct 2025 18:56:13 +0300
Date: Tue, 21 Oct 2025 18:56:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <aPetHXE0zuWANRNd@smile.fi.intel.com>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 21, 2025 at 02:06:30PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 3:53 AM Manivannan Sadhasivam <mani@kernel.org> wrote:

...

> > > That only happens if the driver uses the reset API. If you go with the
> > > GPIOLIB then none of this matters. I definitely don't want to change
> > > the existing DT sources either but I want to find out if the code in
> > > this series is suitable (with some modifications) for supporting the
> > > PERST# line or if the logic behind it is more complex and possibly
> > > requires separate, more fine-grained handling.
> >
> > All PCI controllers relied on '{reset/perst}-gpios' property for handling the
> > PERST# signal. Now if we change it to a reset line, then the drivers have to
> > first detect it as a reset line and use the reset APIs, if not fallback to gpiod
> > APIs (for DT backwards compatibility), which will add unncessary churn IMO.

Can't the reset check be added into a common place once for all the PCI controllers?
Also one can make a helper that does all necessary checks and if required falls back
to the GPIO.

int pcie_controller_get_perst(... dev, const chat *con_id /* fallback */);

(name is from top of my mind without following any patterns).


> Ok so some platforms define perst-gpios while others use reset-gpios,
> I see now. Yeah, it's better to go with explicit GPIOs then.
> 
> > But if there is no way the GPIO subsystem is going to support shared GPIOs, then
> > we have to live with it.
> 
> Well, there is going to be. We already de-facto have it but it doesn't
> work very well and is fragile (I'm talking about the non-exclusive
> flag). I very much intend to bring this upstream.
> 
> My question wrt PCI PERST# was whether this is useful for it because
> IIRC all endpoints sharing the signal will assert it (or rather their
> pwrctl drivers will) and then only deassert it once all endpoints are
> powered up. This would translate to the pwrctl driver doing the
> following for each endpoint:
> 
> perst = gpiod_get(dev, "perst");
> gpiod_set_value_cansleep(perst, 1);
> 
> Do the power up.
> 
> gpiod_set_value_cansleep(perst, 0);
> 
> And with the implementation this series proposes it would mean that
> the perst signal will go high after the first endpoint pwrctl driver
> sets it to high and only go down once the last driver sets it to low.
> The only thing I'm not sure about is the synchronization between the
> endpoints - how do we wait for all of them to be powered-up before
> calling the last gpiod_set_value()?

The refcount inside GPIO descriptor? Then gpiod_set_value() will do the magic.

-- 
With Best Regards,
Andy Shevchenko



