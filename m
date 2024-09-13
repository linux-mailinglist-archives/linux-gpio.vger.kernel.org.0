Return-Path: <linux-gpio+bounces-10057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CDE977E2D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 13:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3EE1C246B8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 11:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49E51D86E6;
	Fri, 13 Sep 2024 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M0G79r/u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0BC1D7997;
	Fri, 13 Sep 2024 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726225556; cv=none; b=SxQKi25PMwAs4FpnMaQtaOvQml37KA4Lqo3x8ffHxbWX9yonzUACQtVNXO9tBCghQ2zpjL8jP+yg2k5sfyG/hgFEl4yfnWyMTDTCuHVHy0sJ+2gCBr5aPhKFvnkWWKf2/Wskyvw4PT02UmH39TgQuNHWrtuynvZSiEJXMStycMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726225556; c=relaxed/simple;
	bh=ACcQXKRjYnzAP9JEJdRpudHJbSASZscpZmCW3A6UtZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpP7sFvMkeXnv/1Sjeknpn1VLca3/bdIJa+Ihn98xDx/mjJzau+oRlYdqfYw0tYKnyDwh3eIDzAyyPgABvggetPMIXZ0Pc90w7w35McC0bINccD4waPXJ5U4FW52Vxy7675hxGZF/NK5liDvOG0rqfo8AUwOGZ9IT/70Gv7YSGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M0G79r/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31883C4CEC6;
	Fri, 13 Sep 2024 11:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726225555;
	bh=ACcQXKRjYnzAP9JEJdRpudHJbSASZscpZmCW3A6UtZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0G79r/uNZANRyyW6W60nsqjJ0bg9jmFJxwW5E78GvLSs+Todp5EqFGUryr54Rpwe
	 SbacZWY/tt+4jtCULxv0qyMxfYb+sRGM+WBLYheYmSe1HxAG8TCBGlvgXR2pFqUS+4
	 y6E13jpMNk6RY7D143XrmxgSMlRgH6MXmSpgAKnY=
Date: Fri, 13 Sep 2024 13:05:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO
 driver
Message-ID: <2024091327-revered-depletion-7388@gregkh>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
 <20240913082937.444367-5-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913082937.444367-5-andrei.stefanescu@oss.nxp.com>

On Fri, Sep 13, 2024 at 11:29:35AM +0300, Andrei Stefanescu wrote:
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

For obvious reasons, we can't take patches without any changelog text,
even for simple stuff.

thanks,

greg k-h

