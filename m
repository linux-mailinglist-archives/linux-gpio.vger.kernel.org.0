Return-Path: <linux-gpio+bounces-6021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A96FC8BA0FF
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 21:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 927881C2144B
	for <lists+linux-gpio@lfdr.de>; Thu,  2 May 2024 19:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE7F17A931;
	Thu,  2 May 2024 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asfQzCEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307C1DDE9;
	Thu,  2 May 2024 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714677590; cv=none; b=SC1M3F+gLeZovBadxxV+f/mF0zs/bqgypJ3dMG70gzX3j13nKXaE2/MIrVahhifV6D3HyTjQLxX+BkXWrN+u3JGAfjqLTTKSiCohxBLmS6pFDIBkAlEj/Mr8AB16WCxYujknyZgs78AGL90A0y8pOS9TaLD/hvnjH5PdTAgy9Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714677590; c=relaxed/simple;
	bh=u22vKvidv17eFPEVNmpo66RTkGKfogYyTuhRcjIhFpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tmnrj9jBTJ4GxhF/3o8+P+L/JgkhiUYKMaclsO+cf1M5+HncN/WCANLlBqxQiNBl1YSaaGdHr9vUEf5JP2WJn5t7EDEgjub3KxJpZErIH1PuwtKQ8zUSIE2gEP92+Pe2MLeFQgC/9TJhN5NjE692l7epo+JuPbPlqOnPGklYf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asfQzCEy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21852C113CC;
	Thu,  2 May 2024 19:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714677589;
	bh=u22vKvidv17eFPEVNmpo66RTkGKfogYyTuhRcjIhFpc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=asfQzCEyrfTayfQW0Msa/qEva+Go2QcexoUCM+K/wudykgfLEJVkgG3gBj/YkMJVp
	 +W+J4lwTDWfjUKMB+ns7Gv0QM9tl/oj+kZa2UdJNJGYiCjM90AVanh0TPysTRVkVUg
	 UOJdprKNgwsz70WWXgfL1urXuV43uAwu8DFiPSxpmLAokpQyA2iGPE4PjJza3KnxGE
	 m6OAYzBOx3dh+QI4wio89sSk7ZYtpCNUlDsOJPavTu+VASkfTkAGnJINYOSeesp+MC
	 kZbW6KswrmGD4u9gsvsYK7o9DSQRh2aJNr5l0ttdJT6PIv1TXmvoyxF6x39/vs5xbS
	 wHiR+Kb07rHVQ==
Date: Thu, 2 May 2024 21:19:33 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v8 2/9] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20240502191933.p3wonhorrqyaxt5q@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-3-kabel@kernel.org>
 <b90daba1-3333-0ca5-fb09-c2157f12d594@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b90daba1-3333-0ca5-fb09-c2157f12d594@linux.intel.com>

Thanks, Ilpo, I've applied all your suggestions.

