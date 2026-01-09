Return-Path: <linux-gpio+bounces-30355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84389D0AA38
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0EEE304F12E
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BF335CBCD;
	Fri,  9 Jan 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6CDci0C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946C35BDBC;
	Fri,  9 Jan 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968948; cv=none; b=tr1Guilv26dOLHs9mrrhN8iAIsdvVaFJXQiQ/RtE5UJr8oFYMuD00VLviNtmrIOqued2memthPHUUJRCFds1DVwSOjyKlE3X8U77fXzy4hP70Dkg5wCERlEo/wzCO+LulIHFIkfsJms2HMTzhCLh3+eXzQqPHvZ36qqFfa1MXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968948; c=relaxed/simple;
	bh=g4cCfNGCRS5oUfOY6+euFiUIoH4A7g/hzkg2mwu6vQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9nR+Mtt++2YQj3G/TTHHw3GY5OiQHK2Av7vov80TQBpDXL1or4xebV2AdlP8TmS46XC1nnDh80VcIf1CJSuHTI+iC7lJzGPAa9/9nVZKpHZ6kXu/Y+wcZ6dW+jJIxR97x5HzGO2tWc8Xs+vw0fY2rBM/xYbJP/isgl8Z5AppHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6CDci0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CDEC4CEF1;
	Fri,  9 Jan 2026 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767968948;
	bh=g4cCfNGCRS5oUfOY6+euFiUIoH4A7g/hzkg2mwu6vQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6CDci0C9hhYEGkNbJ/Zq0Wb3Q+noO4850V4NSYOtn92PgSBaQwzLDBYabzlnSc2Z
	 +SOdOQI7ZOirQOXUfVrbn9jK/KqYT5HH+xw2eOCOUTni/5cYEaxNDd4xd587nn2uYo
	 DFdBP9hWT9yzkr8N/cpOYTJco7ycy32AAX0eQnDn8rdorOykBfiFGQJjyDWvR701Mq
	 eyx98xjlaYCVfXW238LZRwVuUQggRrtbwsved32Kfsp128ZN2YgNZlddA9/oa8aiKh
	 joSPZxuPNiytzvqi+in1RxzWHFIda+aI4Dybb55KoRI8jNVP4hBAKeXm6bwbLRHhTm
	 gI8lWWmgFRePg==
Date: Fri, 9 Jan 2026 08:29:07 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: linusw@kernel.org, brgl@kernel.org, saravanak@kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] of: Add a variant of of_device_is_compatible()
 that can be build time culled
Message-ID: <20260109142907.GA3059757-robh@kernel.org>
References: <20260107030731.1838823-1-daniel@thingy.jp>
 <20260107030731.1838823-2-daniel@thingy.jp>
 <20260108233818.GA1466897-robh@kernel.org>
 <CAFr9PXn2HzkSRnX4X-X1q2U+zLxwSP=TxvRwmA5eYxad7SbLzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXn2HzkSRnX4X-X1q2U+zLxwSP=TxvRwmA5eYxad7SbLzw@mail.gmail.com>

On Fri, Jan 09, 2026 at 11:51:52AM +0900, Daniel Palmer wrote:
> Hi Rob,
> 
> On Fri, 9 Jan 2026 at 08:38, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Jan 07, 2026 at 12:07:30PM +0900, Daniel Palmer wrote:
> > > In a lot of places we are using of_device_is_compatible() to check for quirks
> >
> > I'm assuming 'a lot' is not just 3 places? Got a rough estimate?
> >
> > This seems fine to me assuming there are more.
> 
> In core code (like the gpio core, and not in a specific driver) there
> are only a few places. I think around 10.
> There are more when we get into drivers that handle lots of variants
> of the same hardware and check the compatible string during probe.
> (There are ~700 calls to of_device_is_compatible() in drivers/, most
> of which seems to be quirks checking during probe).

Generally in drivers, it is preferred to use match data rather than 
of_device_is_compatible(). And if we're going in and touching 
of_device_is_compatible() in drivers, that's what we want to do. Using 
match data of course doesn't help your cause of reducing size. I suppose 
you could define a macro that includes a compatible in the match table 
or not. If the match data is function ptrs, then if those functions 
aren't referenced, they would be dropped by the compiler.

Rob

