Return-Path: <linux-gpio+bounces-21513-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A81AD8919
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17AE189DA7D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 10:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492DA2D4B66;
	Fri, 13 Jun 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmM6BQWZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED692D321E;
	Fri, 13 Jun 2025 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809696; cv=none; b=r81fLR0jTFPBA0hjMw8ZcL4C/ZPG3qGY/pGc3/nBNpRV3o6JXEKWYBsNgXwsNPLJVhb2TsfvJJxlnDskmA1C787rKkJqQH20Czvy7HOZKQ6+Z1T15SmsvLfhHDLnceHwJitXy3jbraCBAbH6KOYybp4fQnucSHL7DRjd18/HpQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809696; c=relaxed/simple;
	bh=gByBTNxwvW1EiKdeCpLmynGhuaVyyIF/uFiIPh6OLck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WKLqGseD1UfCxom6nAsuOQhCZQdMrW5DLz3I5ukQY++Smx/XruZWFQejN/L4eJdU9icc0rKr3jRY9HTkHmx28e/iPT/8lVDNA/aGpJG0Ba0VLpBR4XAScWfzAT/9CIdDUHq4+45YICtM6TLpANp0WrCRB0pw0OHvqFRl0h9CXI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmM6BQWZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749809694; x=1781345694;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=gByBTNxwvW1EiKdeCpLmynGhuaVyyIF/uFiIPh6OLck=;
  b=gmM6BQWZnMShDce3BNgD0skGbsQ09pIdekBWId1+7mGMOVSrAh56OSiU
   ffUFuS/NQAPGyt7YST43dk3M33SFo+K/rdq5SEh+V4+baPudy8v6shgNS
   dgOdFq9s0MVPX1++b+fiGWMyaR8S+aFr2YgvHRN6+FzDfHFzJ+f9Jlpw9
   mNXyZBTBDvjHVsM4AE1atQdAC3HJSQS6XWkyT+DD+qcPCbQBo8i2dB0Nt
   x2QCWhq++hK3dSzs6UCcQzimVfnibt/7pP3vSmAtE01YnTMKl5miG9GlK
   JIBWwop+t1PnzMflXtJJcrYMt0mxZEH1Fj09o5FVWSGMG+C0ChYHgScCk
   g==;
X-CSE-ConnectionGUID: nuqMDpBjRnC+ciGgVdxIfA==
X-CSE-MsgGUID: Fo034qf2Ta+aeQvxWmvZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69595193"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="69595193"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:54 -0700
X-CSE-ConnectionGUID: e7H7TKf/QFyiMIali7GIyA==
X-CSE-MsgGUID: wR+kdvDFRqi/SlGSh5wtGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="178690144"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 03:14:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250612074835.13800-1-brgl@bgdev.pl>
References: <20250612074835.13800-1-brgl@bgdev.pl>
Subject: Re: [PATCH v2] platform/x86: silicom: remove unnecessary GPIO line
 direction check
Message-Id: <174980968591.26331.10662658251864445664.b4-ty@linux.intel.com>
Date: Fri, 13 Jun 2025 13:14:45 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 12 Jun 2025 09:48:35 +0200, Bartosz Golaszewski wrote:

> As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
> lines"), the GPIO core makes sure values cannot be set on input lines.
> Remove the unnecessary check.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: silicom: remove unnecessary GPIO line direction check
      commit: 5a7c909a53875e9c0c64cdf8e52b5716d8a74523

--
 i.


