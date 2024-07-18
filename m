Return-Path: <linux-gpio+bounces-8259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08662934748
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 06:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA10D1F22693
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 04:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D521140858;
	Thu, 18 Jul 2024 04:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="peqbxW73"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5F8186A;
	Thu, 18 Jul 2024 04:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721278350; cv=none; b=M3BCN4M0wXvlb8Ie8atG4LN2fFq65J0dQY18n6PtLdVI/DAytT65JifO4leKGymGwquVPYKxnEr94afyJYqPlq4DobzSVN7lD00ewxVoZk6/tkgWpIhU7uDg0p1eitg/D/9LradKIXJF6W1JuneLpg1thCv1omE90TqPrG0DRF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721278350; c=relaxed/simple;
	bh=s368tI5CPiH9pEP9jMeZNglGzdT2C3WZveBxMhcIUqk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJVaGPz0kMeETJmwSb8At1DeWjv8HRyd13nr/sGzZe1EGwhf6lUlYTv4OaGROwycSwCSfmFCQX5tpOjP3rQVED/a4QdSIKYRUsmV+jc7pekVMJ30krOpxJBha12an3LnMcUetl2K+x2JT2nEi2RBEbHfT9Fp6AnPkqqfCsYB0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=peqbxW73; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I4qP4L098898;
	Wed, 17 Jul 2024 23:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721278345;
	bh=mo9dRZZiGvRNMB1kwTjVWX2V67SN/rYbpw2pMNfdHxI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=peqbxW73mnX49D0hQDN0DDsYleUg7auyfACVwMNvI3yrJmGBP3w4HXvq/d6Cpp2j3
	 ZeVyCY6YLVMRwC1p6/P8pdtZFlHqtaHDow8d12ahURdHig/C79F2vyLFoQXXCKeHj8
	 yLyVKCp5r7ZNLdWIK6s+nH77i7AGHkIX3eCdIpEo=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I4qPsn059917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jul 2024 23:52:25 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Jul 2024 23:52:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Jul 2024 23:52:25 -0500
Received: from localhost (dhruva.dhcp.ti.com [172.24.227.68])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I4qOhr081011;
	Wed, 17 Jul 2024 23:52:24 -0500
Date: Thu, 18 Jul 2024 10:22:23 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Kevin Hilman <khilman@baylibre.com>
CC: <linux-gpio@vger.kernel.org>, Keerthy <j-keerthy@ti.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpiolib: expose for_each_gpio_desc() to drivers
Message-ID: <20240718045223.va6ympxzc7kv3k47@dhruva>
References: <20240718000935.2573288-1-khilman@baylibre.com>
 <20240718000935.2573288-2-khilman@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240718000935.2573288-2-khilman@baylibre.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On Jul 17, 2024 at 17:09:32 -0700, Kevin Hilman wrote:
> The for_each_gpio_desc() iterator is a convenient helper and is also
> useful for GPIO controller drivers.  Move this helper from the
> internal gpiolib.h to driver.h.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva

