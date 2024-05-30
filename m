Return-Path: <linux-gpio+bounces-6930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492E8D4873
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF2B282B5E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AC66F300;
	Thu, 30 May 2024 09:27:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDAF183962
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717061219; cv=none; b=hWoA8yWYGCGZzs+ODJm3QXlfvUtczh1Qci5s8gQjPjBBUqyYoB8KTg5tvP/b19x/X8BOAOQrMjyVdJXsRuRmA1Of/p+XnZdazrAoTAX2Jv7xik77ew4MndC+aaMQW2/j3leXunDhHeLpbUR/s0/StP1JDuS0ulycvh0WiMWbrS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717061219; c=relaxed/simple;
	bh=TBaX7vs8tuzXYNNm49/SPeYDoAXeXr+3vgwskd3zd64=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4UnnVBLGiU1XOresq4eT1RL7erg/noYjeHqIHAOw0Otq0nnvXsGnMGYjbBjYyLbV/WJg/dZnnocsHYUC1LhvAIkocuqYHNt/xR5icKnl7OpRg7S0bV3ce0LhHSXHijJrL9VKROYqSFY0J6pPmYNISZTKp0gYXWACsAkfdGv8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id c2069fa9-1e66-11ef-8e2e-005056bdf889;
	Thu, 30 May 2024 12:26:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 12:26:56 +0300
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use
 for_each_child_of_node_scoped()
Message-ID: <ZlhGYFM6iVlGjZk-@surfacebook.localdomain>
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>

Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> Use the scoped variant of for_each_child_of_node() to simplify the code.

I do not see the point of this patch. This makes code actually more
complicated, and I'm not sure the code generation is the same and not worse.

-- 
With Best Regards,
Andy Shevchenko



