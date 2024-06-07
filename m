Return-Path: <linux-gpio+bounces-7262-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C1900CDA
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 22:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757B81F21DBC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 20:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B9414E2F8;
	Fri,  7 Jun 2024 20:26:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3BE13D29E
	for <linux-gpio@vger.kernel.org>; Fri,  7 Jun 2024 20:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792008; cv=none; b=tU3L/SFEEbeIEqn4EkkQYK17LByuNPtWJsE5AcIB6Awv4IIJ2KMu2GODj09DvqdFwjw7FeoaFTkLXr5OJQiFHpg5ekFiaNKpHH1TXFBb1sKUpGYbsKz785ZJZzeLwbBj77LpCfZpiiW4intCZRQOTo5GKiMpEErDBg2A59O7uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792008; c=relaxed/simple;
	bh=9NBH7cVg/Lo+EKM4OkwGnXHDApulgI1fbqUG/pd2nP4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiHqST/6c2pnnCs1whvC0tK+49s8yoqDToYPGZRSFCC3tLhV3jzkYEUODWlAO0sG70qnBkgmIc8te47noSA4SIzput3vdBGIoMoAOfiBPrXHCF+mnrBdEvMsmoox9M6N/xd2uBarxQTvd0OUlYjr2VjlTqTkMzFr6Odwq1OkHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 3e4b01e6-250c-11ef-80e1-005056bdfda7;
	Fri, 07 Jun 2024 23:26:39 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 Jun 2024 23:26:38 +0300
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, naresh.solanki@9elements.com,
	andy.shevchenko@gmail.com, broonie@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: cy8c95x0: Use single I2C lock
Message-ID: <ZmNs_m5hnLqR6OtL@surfacebook.localdomain>
References: <20240521152602.1097764-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521152602.1097764-1-patrick.rudolph@9elements.com>

Tue, May 21, 2024 at 05:25:57PM +0200, Patrick Rudolph kirjoitti:
> Currently there are 3 locks being used when accessing the chip, one
> in the driver and one in each regmap. Reduce that to one driver only
> lock that protects all regmap and regcache accesses.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

(As discussed the conversion to cleanup.h may be done separately)

-- 
With Best Regards,
Andy Shevchenko



