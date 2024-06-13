Return-Path: <linux-gpio+bounces-7421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC990698C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 12:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CA921C22B7A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FB21411D3;
	Thu, 13 Jun 2024 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wjFovTTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9FB13E3E4;
	Thu, 13 Jun 2024 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272969; cv=none; b=C4F3Vr2i61kmiGc97oLniheU0lpn8a/9YnGQrZoSeThwjzB77pQh+VZTrTBMD1UxjRHG7SM+HpcLbFGvJV/xPYUd1qxEZ3hln+iYe3YmUUC8voMLBQrrwBhwLQzmz1DFlG6R0pprkqXOarSaOR6Rh4zR6/n63rLLgQsuRsxIV9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272969; c=relaxed/simple;
	bh=dmAgdhlc7Gnm/ltgQqlFO1EFzEj4GRIQgQbICwLzST8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqOr3n32TJ/yJjooS4zJ0XQ5Y1ArVlExp0wByOuIfH5kTZ+19SX1Cn9uLsq270rwgw43q4VVm3tkkz5hEJAQ9213DNk/1hjVy7NHbaxBM+KzdXG2+2+u9id1Oy0zNBsqe6SzLNdbktR1EZjAY796RogCKpgfgdOpJpXKU8TrepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wjFovTTG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3FEC2BBFC;
	Thu, 13 Jun 2024 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718272969;
	bh=dmAgdhlc7Gnm/ltgQqlFO1EFzEj4GRIQgQbICwLzST8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wjFovTTGE/hRHbavqCKGnoyUSGeQb1ZTJt/Q59XK+5haCIQevZ6/10MMsdrA4o1tE
	 jVqPLsckgVY1v7kQscD5dgE6gTB/IhSMCSTUuO3yqWiNg3YKNxUhl/8RzaWZpr0+Gl
	 cR1tc/Ddi4d21UQnhzo/7EtBG+ELHZoyin6CYcPQ=
Date: Thu, 13 Jun 2024 12:02:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v8 1/2] drivers: export to_ext_attr()
Message-ID: <2024061330-clarinet-favorable-02da@gregkh>
References: <20240613092830.15761-1-brgl@bgdev.pl>
 <20240613092830.15761-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613092830.15761-2-brgl@bgdev.pl>

On Thu, Jun 13, 2024 at 11:28:29AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Make to_ext_attr() available to code that wants to reuse struct
> dev_ext_attribute. While at it: make it into a static inline function.

Please don't use this, why is it needed?

thanks,

greg k-h

