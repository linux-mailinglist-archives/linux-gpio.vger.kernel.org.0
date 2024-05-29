Return-Path: <linux-gpio+bounces-6866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF28D3BC0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B401F25DF8
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F7518410C;
	Wed, 29 May 2024 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeTsBLNJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C07C8DE;
	Wed, 29 May 2024 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998674; cv=none; b=PwiUqykJEYzLb7l3URoInBV4eJ/YsLBoI8WZ6RkUzXE0Fc2EPVtrCqqtyuKt5vYnVQztM9SEsjqlqFQqPxF2ByvEoesCTnhq0AKfKZ2RiN78l2d3yj9BI5WJ+uRnxdKYw+e2fXY6VRr99uNsrCFKWeiv5/6bzWbx7GDCcZhRFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998674; c=relaxed/simple;
	bh=/EwIIXcKHGDW2AxegyIxUaFBTLYn3SLVszyabwPuc7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0PsEV7DMUJdev7pKZUvIAquD+Yhw6QfSzs0d48yEwdvHNesktCWkGGvqf7xBR68QpKGYtNF5jTD+cEPWczOqGmoeWZghVHkFm2QsLAx2mCLkIoITfU8Sm2uOeBRZDIvnArwQXp91Q67AgyLm7YEWpn2HkSD0pEMwIiSu9DTMMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeTsBLNJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC97FC113CC;
	Wed, 29 May 2024 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716998673;
	bh=/EwIIXcKHGDW2AxegyIxUaFBTLYn3SLVszyabwPuc7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeTsBLNJlZ6RfKwKub6VxjJVm24VDMg0I+DAF8xec7yGSA6HeXUBvEwKNwkRrtBo3
	 Z88dNiMtRZLwujOID2J5vfC9BM2+hEJrG+Vezj6K307PDiBybDPBauBRmx9llXIh6C
	 Tq8MB53S+GIYy8mBWn6sbzhNjkOA4x9v+UkIN/Dg8TmT8IsZKq9C75tbMDGcKTyh/L
	 CMXGAFjG7NwxGnuwn5J7JDwwoidZljXi0x67Oz6BnahBS4K7oSP2KCkIvfAdYT8w23
	 FzYNpEj5v3X5gFH+BtzFbZvJgj7akBWf/bEp7dWrIxjAAuan+KkodCi6ao00UOuPOQ
	 /xsey53jh72ZQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCLmz-000000004KZ-0YvL;
	Wed, 29 May 2024 18:04:33 +0200
Date: Wed, 29 May 2024 18:04:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: andersson@kernel.org, andy.shevchenko@gmail.com, broonie@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	johan+linaro@kernel.org, konrad.dybcio@linaro.org,
	krzk+dt@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
	linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_c_skakit@quicinc.com, quic_gurus@quicinc.com, robh@kernel.org,
	swboyd@chromium.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZldSEZKusSVIHZJ3@hovoldconsulting.com>
References: <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <20240514134317.691887-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514134317.691887-1-quic_skakitap@quicinc.com>

On Tue, May 14, 2024 at 07:13:17PM +0530, Satya Priya Kakitapalli wrote:
> > On Tue, May 07, 2024 at 01:48:30PM +0200, Konrad Dybcio wrote:
> > > On 5/6/24 17:08, Johan Hovold wrote:
> > > > From: Satya Priya <quic_c_skakit@quicinc.com>
> > > > 
> > > > Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containing
> > > > seven LDO regulators. Add a PM8008 regulator driver to support PMIC
> > > > regulator management via the regulator framework.
> > > > 
> > > > Note that this driver, originally submitted by Satya Priya [1], has been
> > > > reworked to match the new devicetree binding which no longer describes
> > > > each regulator as a separate device.

> > > > [1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com
> > > > 
> > > > Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> 
> This is my old email which is discontinued, please use <quic_skakitap@quicinc.com>

I've cleaned up and reworked the driver for v2 and changed the
authorship to myself in the process, but I'll make sure to CC your new
address when submitting.

You should add an alias as Konrad suggested as you apparently have
commits that use your old address.

> > > > Cc: Stephen Boyd <swboyd@chromium.org>
> > > > [ johan: rework probe to match new binding, amend commit message and
> > > >           Kconfig entry]
> > > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > > ---
> > > 
> > > I'm a bit lukewarm on calling this qcom-pm8008-regulator.. But then
> > > qcom-i2c-regulator or qpnp-i2c-regulator may bite due to being overly
> > > generic.. Would you know whether this code will also be used for e.g.
> > > PM8010?
> > 
> > Yes, for any sufficiently similar PMICs, including SPMI ones. So
> > 'qpnp-regulator' would be a generic name, but only Qualcomm knows what
> > PMICs they have and how they are related -- the rest of us is left doing
> > tedious code forensics to try to make some sense of this.
> > 
> > So just like for compatible strings, letting the first supported PMIC
> > name the driver makes sense as we don't know when we'll want to add a
> > second one for another set of devices (and we don't want to call that
> > one 'qpnp-regulator-2'). On the other hand, these names are now mostly
> > internal and can more easily be renamed later.
> 
> There is a PMIC called PM8010 which also is implemented over I2C,
> which could use the same pm8008 regulator driver.
> Hence it is better to use device_id instead of a MODULE_ALIAS().

Right, I've had PM8010 in mind all along, but it's hard to tell whether
it will be using the same (sub)driver until code is submitted since you
guys (Qualcomm) don't publish any documentation.

I've changed the regulator (and GPIO) drivers to use platform device id
matching for now either way.

Johan

