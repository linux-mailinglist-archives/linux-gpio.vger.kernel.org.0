Return-Path: <linux-gpio+bounces-6276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837E8C0FA0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 14:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97FE01C22181
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 12:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7B414BF8D;
	Thu,  9 May 2024 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmJnbjrE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F258131724;
	Thu,  9 May 2024 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715257598; cv=none; b=GOeqnkcs6tOmK3i27LPe/BAPS8MkS5VMUCdVKjISAE3VXNvaRxiWOCqv0cJoKa8mb11XgUlXNQ66Uq4YEOQm7h8umiRC6aZFy+kSwQzYPmsjW20j2lBgOKnzwYhqlvcBRT69OogSTKGwzWImcenlLIz0hBQ41SmYaeECFKAhxAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715257598; c=relaxed/simple;
	bh=muhLaR/99OohMazNTK3EQ6x8cOUF9aDaLDgAy9OKcnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNymEGVD2WZeTZVWog9vRF7eYt6qbKeMIyrWcM0S1MvHOvxXxH3e+aiEpmIiqQuuaAFb/MV1Zzd1AmlzerSGb/V3tbg0smQSct0v0q98BmvCIKfzrkS32iDAJOdO1oW5NN7iaLL9w3QYKJosHg9ADmgBCWTh10Cnqcty1bXYrpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmJnbjrE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2964C116B1;
	Thu,  9 May 2024 12:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715257598;
	bh=muhLaR/99OohMazNTK3EQ6x8cOUF9aDaLDgAy9OKcnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmJnbjrEYJyK+T9V3AkzDCD8reMggyIyDpOGh93DB3EZkpRXPqj7aAaOWdSqQ5w/L
	 YNEbf/Z5fa7OAGgLeejIvByuaYEMJrIq6aWXIXyyPQ6nrEIg5R0LHrYa//E/wIBP/j
	 IEz3b+I1yG4lagxa9xL3i0G38xY2lwM/u9oOA+OFMN2Sxg6dbk4OyVh636daaLduYS
	 N8U+FfTFuoHHAhEk3Ziw7DZfjXkFMdWwQZe3u1x9laGlytrtcJNshV26iKqS89Qps2
	 cYsBuFmVwjykBlskqISRp8RjP0BStukDIykVjWQDnO9Kxg2GQKAnwchHK8KPp6FH5B
	 HbTnJHd4gIX0A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s52rC-000000004wl-0Rll;
	Thu, 09 May 2024 14:26:42 +0200
Date: Thu, 9 May 2024 14:26:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZjzBAvgFt4UnPapk@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
 <8d2ea17c-f91e-4e14-a239-e5e999f6ac50@linaro.org>
 <ZjyQFrqHT2HBOWY6@hovoldconsulting.com>
 <1df61b7c-29c4-4537-a0b6-75785606eeae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1df61b7c-29c4-4537-a0b6-75785606eeae@kernel.org>

On Thu, May 09, 2024 at 12:48:18PM +0200, Krzysztof Kozlowski wrote:
> On 09/05/2024 10:57, Johan Hovold wrote:
> > On Tue, May 07, 2024 at 08:14:43PM +0200, Krzysztof Kozlowski wrote:
> >> On 07/05/2024 19:22, Andy Shevchenko wrote:

> >> Yeah, please use ID table, since this is a driver (unless I missed
> >> something). Module alias does not scale, leads to stale and duplicated
> >> entries, so should not be used as substitute of ID table. Alias is
> >> suitable for different cases.
> > 
> > There's no scalability issue here. If the driver uses driver name
> > matching then there will always be exactly one alias needed.
> 
> And then we add one more ID with driver data and how does it scale?

That's what I wrote in the part of my reply that you left out. If a
driver is going to be used for multiple devices, then a module id table
makes sense, but there is no need to go around adding redundant tables
just for the sake of it when a simple alias will do.

Johan

