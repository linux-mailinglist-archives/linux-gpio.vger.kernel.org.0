Return-Path: <linux-gpio+bounces-27490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB9BFDC40
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 20:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D923E19C80B8
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 18:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50B42E9ED1;
	Wed, 22 Oct 2025 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQUmVje4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2873F8460;
	Wed, 22 Oct 2025 18:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761156273; cv=none; b=GRZNKMw7XYxjWUzwYYSxefnmGH2CXHwq1M7WScrTEdzGS8f/C70RC7K3/3ZaQfUX0IZ2Yiod9afWh6D5qtnia1uchmgfROSThq3bo2um/lXpBlM0MbZVyZEdgv0vDq2BoO2SxKf7ar/G4jdLEEI52IrFanAQA5eSA/WjkEF6iX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761156273; c=relaxed/simple;
	bh=LX84Ld6O6Uc5VIZ8xp7cMpdz1V/yl1HsOQOPlaYWJeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0/2PP3RqNr+KKRjzt/RuE0S4V8nSDnppUbma02L9VsUFFaSv2Qe2KEXR9j3f3HDRL9ElWFym3QqsTA1W7VPIQkwOBqY03U7XfE26sfddlzMgDB2ZwgoUiX/sNOenBzCjt8mZOfq2NA2kR6YmHqYwcVS0CYMBUTIKap7avP88bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQUmVje4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761156271; x=1792692271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LX84Ld6O6Uc5VIZ8xp7cMpdz1V/yl1HsOQOPlaYWJeQ=;
  b=hQUmVje4FutHhmEWgwtJ4ZkH+30Ln4HptJSgMYVwOeJKlvutcKBiRzL7
   zN6cf5tFcCAuFxzQJG8lveaa7hCHTr+8DUnP+nPNeK3M4MsSypWmoi/AI
   9ISdT+oU9i3db5VTiHSEEca/oMH0nf4VmpJSgEJJW5XegVCPWFYbKSTHw
   7p607vaWjLPuW4VpgUSj1cUyy1oEuVwHiq9GPUM2ZYo9Nj419TijPMQ2s
   5sLqC6PNAKnlI89EXP20Yvb+XBpqFEnHR5VRAIfPWWTD71o6CTbPzlKPA
   lBpOry1WZaJ9tQ7n7AfkpQD0zQf7BZTEfhF/7vgZQSu351xAmmD5Zcrv+
   Q==;
X-CSE-ConnectionGUID: g2b0eVLmRUus/PTbHexNPA==
X-CSE-MsgGUID: cujWg+EjRKSzm3GeORaJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73984419"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="73984419"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:04:30 -0700
X-CSE-ConnectionGUID: hQfoa2/xR6+4lGjcBV8xAQ==
X-CSE-MsgGUID: ZsI4OgiDTWux522dWpJ23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184332231"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.83])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:04:25 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1vBdC9-00000001lJ5-3WrO;
	Wed, 22 Oct 2025 21:04:21 +0300
Date: Wed, 22 Oct 2025 21:04:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: Re: [PATCH v2 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
Message-ID: <aPkcpTWfTb0HOF51@smile.fi.intel.com>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-gpio-shared-v2-4-d34aa1fbdf06@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 22, 2025 at 03:10:43PM +0200, Bartosz Golaszewski wrote:
> 
> Add a virtual GPIO proxy driver which arbitrates access to a single
> shared GPIO by multiple users. It works together with the core shared
> GPIO support from GPIOLIB and functions by acquiring a reference to a
> shared GPIO descriptor exposed by gpiolib-shared and making sure that
> the state of the GPIO stays consistent.
> 
> In general: if there's only one user at the moment: allow it to do
> anything as if this was a normal GPIO (in essence: just propagate calls
> to the underlying real hardware driver). If there are more users: don't
> allow to change the direction set by the initial user, allow to change
> configuration options but warn about possible conflicts and finally:
> treat the output-high value as a reference counted, logical "GPIO
> enabled" setting, meaning: the GPIO value is set to high when the first
> user requests it to be high and back to low once the last user stops
> "voting" for high.

I have two Q:s about the design:
1) why can't the value be counted on the struct gpio_desc level?
2) can gpio-aggregator facilities be reused (to some extent)?

...

> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>

+ types.h

> +#include "gpiolib-shared.h"

...

> +out:
> +	if (shared_desc->highcnt)
> +		dev_dbg(proxy->dev,
> +			"Voted for value '%s', effective value is 'high', number of votes for 'high': %u\n",
> +			value ? "high" : "low", shared_desc->highcnt);
> +	else
> +		dev_dbg(proxy->dev, "Voted for value 'low', effective value is 'low'\n");

You can unify and maybe save a few bytes here and there by doing something like
this:

	const char *tmp; // name is a placeholder

	tmp = str_high_low(shared_desc->highcnt);
	dev_dbg(proxy->dev,
		"Voted for value '%s', effective value is '%s', number of votes for '%s': %u\n",
		str_high_low(value), tmp, tmp, shared_desc->highcnt);

...

> +		dev_dbg(proxy->dev,
> +			"Only one user of this shared GPIO, allowing to set direction to output with value '%s'\n",
> +			value ? "high" : "low");

str_high_low() ?

> +		ret = gpiod_direction_output(desc, value);
> +		if (ret)
> +			return ret;
> +
> +		if (value) {
> +			proxy->voted_high = true;
> +			shared_desc->highcnt = 1;
> +		} else {
> +			proxy->voted_high = false;
> +			shared_desc->highcnt = 0;
> +		}
> +
> +		return 0;
> +	}

-- 
With Best Regards,
Andy Shevchenko



