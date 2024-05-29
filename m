Return-Path: <linux-gpio+bounces-6836-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9A8D3673
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45922855DA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD986143864;
	Wed, 29 May 2024 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jFPiF6S+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34145363;
	Wed, 29 May 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985916; cv=none; b=oz02FoO6odItkD9sI6mMHJhzym/KR3WCdOERGTrDNDGOIY5jc7ammzx4WHUbRUE/IIyGsWmDmWL5bOUIeq1iShbIkQG5pNZnIz74fMOamIW4AfkvIjkC2LJe8+L8TBYPF2Fx+wCS2WICnyCRfsvsTLf8GAmOiKoNEqmwFlq7hwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985916; c=relaxed/simple;
	bh=2n/XTFTDPEUvw06aTQ9cHuTaiBzd5tPbKQQAhhvR7Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5ZUoQPBKsQRkhya+r7u4QAYtF983kdYZet/YD1VlmE9MFUH7Qq/unrMtNviEpH4/yMwae/EqOC87+Du4VoPZyHIRPsgEKN/sxdt2v6DAEY2TSnHAxLy9D2VAGksK/y3e2BsztnY9SS6NPux6vsYWfxHzcHNEGSyqLZ4oe7JCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jFPiF6S+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KdzT0+9n90R5cE9IxWh+perLJKy26d5okLkraXgd2qg=; b=jFPiF6S+xcx5ohKu1DeV7AXByF
	H3aIgLOl+mSwshsCbm4G9T7brqTw1saDLo1t8G7e8+pD9sS9ppiKEmIuqDN20kGeoPctg5X+wxPZD
	aQzhkhxiAf/jWkr8qHdcdDg3cP79WMfkqQp7QdF7TNzIFJStFSF8uH4lsMmM4gWkOLNI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCIT7-00GFlP-Nx; Wed, 29 May 2024 14:31:49 +0200
Date: Wed, 29 May 2024 14:31:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 4/8] gpio: tqmx86: introduce _tqmx86_gpio_update_bits()
 helper
Message-ID: <37e3dff1-e901-4dfb-8f69-16947cb9fdf4@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <0a21e3f14742e9adcf29361f7f2867199cd0dd4a.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <28f4d8aa-917d-4666-b59d-bed3ebfab2e2@lunn.ch>
 <9e4cfa2afe16c6b4dd5db425d8248592daa737c2.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e4cfa2afe16c6b4dd5db425d8248592daa737c2.camel@ew.tq-group.com>

> My intention was to mark functions that need to be called while holding the spinlock with a _
> prefix. Should I just remove the prefix and add a comment instead?

Yes.

You could also add sparse markup of the locks, or add an
assert_spin_locked(lock);

	Andrew

