Return-Path: <linux-gpio+bounces-24682-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBEEB2E601
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 22:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEB555E0C14
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 20:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798EF2701CE;
	Wed, 20 Aug 2025 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeHJaS6B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E2A24A054;
	Wed, 20 Aug 2025 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720236; cv=none; b=JgDa9WSsQTU0nfuj6tuK/xmUYrnQbdQJEZGnf46biPHI9074YuoK4sgo+5cAvmrYHhD6j1T5Iz4oVydUEwZnjw/ICqJ0gqLWPIQdEpk1qgFoYn1UpgWErl6JQZ4i/MaV1x33oLxGj60IcIcTwSbf00jHF6QNKyAt2U5Y2GRBuyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720236; c=relaxed/simple;
	bh=anNhsvCEDdZAFrVHuAW6Yq14ZRmsgEq59nDp1oTYxZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7uXyoQZqmrNEIgJt5nolvE62cqG+WmW8+JYgvZLyqqlvJBdj6ZtxyqSYzK//8TW3fbH10MMvMOmXGbzBDaRMEqd3XbP1zR20HTERiounp/IDi6rkuBT9Ry8d8ux8mVMW03Hgb2KJn3IRFa4un3TLHbtYhILBjc7LWLyF2J14s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeHJaS6B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07889C4CEE7;
	Wed, 20 Aug 2025 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755720235;
	bh=anNhsvCEDdZAFrVHuAW6Yq14ZRmsgEq59nDp1oTYxZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GeHJaS6B8aM9Udh1FibxBFg3+IsWGhQ5XurO6jabKMivoDhVotrmQPElYvdfiUnRX
	 y50h/H3ETrqUKhsSB7ipAOr8XJDPlcB5VXzl/QAVJESTe4+OUh1yTMQONS0d0lhS4O
	 FfSeEtEh0cI18x9kpZkpuGWBxQwqgvgqj4f16DSkyhzeiUTzzk5Hk8K0j6Rz1f6SMz
	 Bj0gzFyyqGDrFWgKRGtLJ9P1YpqNwB2cyokm+8YF26QOVw0KA9jgP+9jpkgUcRbLHT
	 Nb7lRBcXe+Y42ezBDMzF7S44Le8bE1CoFX5R+jbW+Fi4wRsDWQJ+ey89iYQb0lMT7G
	 seJ+tPSW9SU1Q==
Date: Wed, 20 Aug 2025 15:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com,
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
Message-ID: <20250820200354.GA602656-robh@kernel.org>
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <5713bb5b-3301-46bc-b30a-d2e4c58d1036@roeck-us.net>
 <2svr42ee7akwxwj5nizwe4a4hqdk4rslv7ivxraqg3jy6m3mxz@lfpn2nx4jdmm>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2svr42ee7akwxwj5nizwe4a4hqdk4rslv7ivxraqg3jy6m3mxz@lfpn2nx4jdmm>

On Thu, Aug 14, 2025 at 03:15:29PM +0100, Nuno Sá wrote:
> On Thu, Aug 14, 2025 at 05:54:26AM -0700, Guenter Roeck wrote:
> > On 8/14/25 03:52, Nuno Sá via B4 Relay wrote:
> > > The LTC4283 device features programmable current limit with foldback and
> > > independently adjustable inrush current to optimize the MOSFET safe
> > > operating area (SOA). The SOA timer limits MOSFET temperature rise for
> > > reliable protection against overstresses.
> > > 
> > > An I2C interface and onboard ADC allow monitoring of board current, voltage,
> > > power, energy, and fault status.
> > > 
> > > It also features 8 pins that can be configured as GPIO devices. But since
> > > the main usage for this device is monitoring, the GPIO part is optional
> > > while the HWMON is being made as required.
> > > 
> > > Also to note that the device has some similarities with the already
> > > supported ltc4282 hwmon driver but it is different enough to be in it's own
> > > driver (apart from being added as MFD). The register map is also fairly
> > > different.
> > > 
> > > Last time (for the ltc4282) I tried to add the gpio bits directly in the
> > > hwmon driver but Guenter did not really liked it and so this time I'm doing
> > > it as MFD.
> > > 
> > Nowadays I suggest that people use auxiliary drivers in such situations.
> 
> I see. But do you have any issue with it being MFD?

I do...

> I'm anyways tempted to the auxiliary device idea. The main usage for
> this device is HWMON and I dunno anyone would use it only as a GPIO
> controller. With the auxiliary device we would only need one bindings file
> and slightly better bindings for the pins functionality.

For this reason. The driver structure influencing the binding design is 
a problem, but I think MFD is more to blame on that.

Rob

