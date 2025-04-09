Return-Path: <linux-gpio+bounces-18549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F543A820FE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DF157B0E00
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BBA25C71C;
	Wed,  9 Apr 2025 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="VVrwu/tW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2C529D0B;
	Wed,  9 Apr 2025 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190801; cv=none; b=jQxmOpYcCDdL4rXcoMkrnawlla4wMulPXVRPCy41gGw9D8U0WTBjbnNGbmBLabCZxBfSqLYQn3fpPUElUA8ADRT5nz+oizT9xuyvhb0uDqUuN7WKP2uU9HhG1zkMIVRoFDn5OOu+RtoTBlSQknfmsbMyDM9NRWEvXMRy0xcHuPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190801; c=relaxed/simple;
	bh=i6Un4LBrv7+umUVjVMx0RfOQwqJo1mgsjWpVn24kD1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pu+HKN9OFDST9unFq/EtfX2E+RmcWQzppL8W3YXBQ4btUHUT1zd8G9QhHxQPmT7s16wpzoJyVp1d/R4Cuk/Qysccja6DPGP6YOss4lr0a88mYIbkMOPFgSpF1MYlPANhqb+Yfi1waalhxzZITP/MDSktya4C4SVFKOwK3qKBAKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=VVrwu/tW; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from solitude (unknown [172.20.6.77])
	by mail.nic.cz (Postfix) with ESMTPS id CC6531C1262;
	Wed,  9 Apr 2025 11:17:28 +0200 (CEST)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1744190248; bh=i6Un4LBrv7+umUVjVMx0RfOQwqJo1mgsjWpVn24kD1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=VVrwu/tWDhfFMGpRzlFpShahG82/37rTB1DPaqBIli+GcT54xRbJXOP9Rt21GKd/Y
	 lKUBraLBQAk3uiGNVsaCZ92XK40tw615cKFExlZ1PCJPDsy8CVitAqqIGNYo2mPRtW
	 Lq49aH/pXBCrhnWEF7ZZDBIs3ouLFRSJa2Wjvd+w=
Date: Wed, 9 Apr 2025 11:17:28 +0200
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] platform: cznic: use new GPIO line value setter callbacks
Message-ID: <7r44ci6ojbkc2gsvaj5ekgd76sictqek3xmhhebicugm43rbt5@micbmk7ndzm3>
References: <20250408-gpiochip-set-rv-platform-cznic-v1-1-c3d4e724433f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gpiochip-set-rv-platform-cznic-v1-1-c3d4e724433f@linaro.org>
X-Rspamd-Action: no action
X-Rspamd-Server: mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: CC6531C1262
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[172.20.6.77];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[]

On Tue, Apr 08, 2025 at 09:19:19AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

> -static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> -				    unsigned long *bits)
> +static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +				   unsigned long *bits)
>  {
>  	unsigned long ctl = 0, ctl_mask = 0, ext_ctl = 0, ext_ctl_mask = 0;
>  	struct omnia_mcu *mcu = gpiochip_get_data(gc);
>  	unsigned int i;
> +	int ret;

In this driver the name `err' is used everywhere for this kind of
variable (when it contains error code or zero for success).
`ret' is only used if the variable can also contain positive return
value.

Bartosz, I will send updated version, if that is okay with you?

Marek

