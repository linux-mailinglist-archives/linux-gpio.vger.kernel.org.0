Return-Path: <linux-gpio+bounces-7325-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2149026AD
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 18:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07DDAB20FE4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9D3143C43;
	Mon, 10 Jun 2024 16:26:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A782495
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718036780; cv=none; b=HfcBqLbjv67hSlMGEAgKSgigZBx5ykyS01vKYq2Ain/PkJiiOLblxdOF7/ESGd+VUn1LPH1oKostl2NByzjqdAByO2bKV8Z0Dnn4sKIm6si4rG0Z/13orLtBlaxBH2LXK1avIi89bkfqb0yc6Bj9yAbKsM8lKw2I/dukQ+72TYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718036780; c=relaxed/simple;
	bh=Kwx+EJLRwe6soqlnYy6YwfclcluOBYoiKcgcm4phmCU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lemyM3Cgi67odJCb2Hedy48p1I19ETTgerY1qxCIaM8kPCFip0fC0Awuzz/6BUIh426R9/9r07lNxVBJj9+qcezv16X7yWgtqKWkBHxMakVIlEmohInUlIJDnyyWxN2HAJI3gueNpCGJmfvqziCpiOkh3IJj0/NdITzk3jQXHho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 292e310c-2746-11ef-80e9-005056bdfda7;
	Mon, 10 Jun 2024 19:26:16 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jun 2024 19:26:16 +0300
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/3] gpio: sim: driver improvements
Message-ID: <ZmcpKFulXNq-9Wuk@surfacebook.localdomain>
References: <20240610140548.35358-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610140548.35358-1-brgl@bgdev.pl>

Mon, Jun 10, 2024 at 04:05:45PM +0200, Bartosz Golaszewski kirjoitti:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Andy had some suggestions in his review of the gpio-virtuser that also
> apply to gpio-sim so let's use them.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>                                                                                                        

-- 
With Best Regards,
Andy Shevchenko



