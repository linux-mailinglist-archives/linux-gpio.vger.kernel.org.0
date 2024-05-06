Return-Path: <linux-gpio+bounces-6165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E48BD568
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 21:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB03E1F23E72
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220CA15956B;
	Mon,  6 May 2024 19:26:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D01159563
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715023569; cv=none; b=ErJUuLc2svhx6pSi5s4JHMZ9OX1I7Q/7mgrhZmgG6TXNW/S7CoVC9WjVk5j8A0WYoLeDVJZJfY3vNl9AfdKItAzL/GrgE7LH+9GBt2QOgAWRd+xLou2AutG1JsOoWXxPtQCe6llHbHpJk46Q7h18kqwGiGA5rOD0Ma/L6BrA3Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715023569; c=relaxed/simple;
	bh=5NvJh0n1w6lBWPnK2SnxtXvu5LZHpQLhtLGSSaX2Mk4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OF+ua+wlXkN4tHHERReM4tkRzELV8Ff03baMCN/5nYjvg4t0KTPPenwrL08wpHWTnYg64uDFPdZkMkMivisqclKbpogddQCkV+/dHTU+wxv2t0MeGRRqQ/llefngwvCdwH9hllvlBFBHyiTbv2zACiB4zP8TLygsXdtaGRPRDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 7b050ce9-0bde-11ef-abf4-005056bdd08f;
	Mon, 06 May 2024 22:26:05 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 22:26:04 +0300
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] pinctrl: zynqmp: Support muxing individual pins
Message-ID: <ZjkuzKEt2aiHIwg_@surfacebook.localdomain>
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <20240503162217.1999467-3-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503162217.1999467-3-sean.anderson@linux.dev>

Fri, May 03, 2024 at 12:22:17PM -0400, Sean Anderson kirjoitti:
> While muxing groups of pins at once can be convenient for large
> interfaces, it can also be rigid. This is because the group is set to
> all pins which support a particular function, even though not all pins
> may be used. For example, the sdhci0 function may be used with a 8-bit
> eMMC, 4-bit SD card, or even a 1-bit SD card. In these cases, the extra
> pins may be repurposed for other uses, but this is not currently
> allowed.
> 
> Add a new group for each pin which can be muxed. These groups are part
> of each function the pin can be muxed to. We treat group selectors
> beyond the number of groups as "pin" groups. To set this up, we
> initialize groups before functions, and then create a bitmap of used
> pins for each function. These used pins are appended to the function's
> list of groups.

...

> +			for (pin = 0; pin < groups[resp[i]].npins; pin++)
> +				set_bit(groups[resp[i]].pins[pin], used_pins);

Why atomic bit operation?

...

> +	fgroups = devm_kcalloc(dev, func->ngroups + npins, sizeof(*fgroups),

size_add() from overflow.h.

> +			       GFP_KERNEL);
> +	if (!fgroups)
> +		return -ENOMEM;

...

> +	for (i = 0; i < func->ngroups; i++) {
> +		fgroups[i] = devm_kasprintf(dev, GFP_KERNEL, "%s_%d_grp",
> +					    func->name, i);
> +		if (!fgroups[i])
> +			return -ENOMEM;
> +	}

Hmm... Can this benefit from devm_kasprintf_strarray()?

-- 
With Best Regards,
Andy Shevchenko



