Return-Path: <linux-gpio+bounces-4053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBC86ECAF
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 00:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A4F2B24F20
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Mar 2024 23:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED025EE99;
	Fri,  1 Mar 2024 23:08:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844665EE6A
	for <linux-gpio@vger.kernel.org>; Fri,  1 Mar 2024 23:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709334515; cv=none; b=JlhljvNpW1pU8NsgtV6YZ+0D65RqLUdmJyUv+Va8dzTW2bLiwzxHSdqF7l0RDDXOI62S62dL0cBaos6w9ascnToRNpiWivim0ZchVtN5UiVY0CB/ZQkt+IvetFBRme3qBat6vlnfODl9/QR2GiJgPOpUW8py8kQuIRhinmaCe3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709334515; c=relaxed/simple;
	bh=5hKvohIHYstWCrYhZL1XTtDeIDJc7DNo5RWhXadnmWo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew3Nhok+YIu1/UBpkKErC5MM0uACqrgFkR+jBKasiMkDRw634mQ/vca+skTBL/xlMmCWKehJAXzcz3K/iCt4WrCdERX7MOGagnfePkZWqikcWqeJTfUEiJM25uL6jWI9wUw/1+zXNMBapUJ1TSekhYqqpPbCttY9dSGqSrhwFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 75de60a3-d820-11ee-b972-005056bdfda7;
	Sat, 02 Mar 2024 01:07:23 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Sat, 2 Mar 2024 01:07:22 +0200
To: andy.shevchenko@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: nomadik: Finish conversion to use firmware
 node APIs
Message-ID: <ZeJfqnzAr0kf8TWZ@surfacebook.localdomain>
References: <20240301225819.193814-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301225819.193814-1-andy.shevchenko@gmail.com>

Sat, Mar 02, 2024 at 12:58:19AM +0200, andy.shevchenko@gmail.com kirjoitti:
> Previously driver got a few updates in order to replace OF APIs by
> respective firmware node, however it was not finished to the logical
> end, e.g., some APIs that has been used are still require OF node
> to be passed. Finish that job by converting leftovers to use firmware
> node APIs.

It misses changes in the pinctrl.

-- 
With Best Regards,
Andy Shevchenko



