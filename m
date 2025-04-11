Return-Path: <linux-gpio+bounces-18691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59706A85D04
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 14:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF1B91B887F3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 12:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40AA29AB18;
	Fri, 11 Apr 2025 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmRn1HD4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F4F238C2A;
	Fri, 11 Apr 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374261; cv=none; b=JUXmIe8EZTKPopSDyiZGw9tZXvYV+wFxzoICqI4xFE0M5hMHqTH1SJtVI1XJgD531NoOqMD2npZX78ZSjQh1jlNV/ngZfVbqFibDUqC9x4fCJB6BgwagTs6jGg+7jEz8/F8CYi03JsS2ITTPlewomhy8Pp0AwSnBsDQk+Ei94l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374261; c=relaxed/simple;
	bh=S59TFiOW1DePHAWC3F9WhmM5KQEnPbDT4zMu7GL6Ehg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QQaVWxw2YK3Mz510aGfnk4r2JMJwIKfueiaIn/kU9RVLP1lY7sSn7AJiR5vtzdg6+p4UwJcX5bXIY7u6Pq++zWVJY+nZx2qF+A8+PQrKr8nFVUbfuzv+mMljjpncVqmnfs1/2Jx+wMCIDxmxSrfWn7mSA4nYMh/0k733WvUIFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmRn1HD4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744374260; x=1775910260;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=S59TFiOW1DePHAWC3F9WhmM5KQEnPbDT4zMu7GL6Ehg=;
  b=LmRn1HD43iJIk9CrghBHQBWdgIADC5mLaMQ8dGp+k4xzXnH/xlT+Ya2u
   UrvA/UE1ZqfvQnoj5A1YDbKRhet7iyEXrxVSyTY3bh4s90x+BTEXTC8Ny
   pmA9yn7n9Eq7d3Knib4mKmX7eAT1elA1iC5o8ZCQxEvTZXrXvBu1YO/yh
   kFxz4PrpmPVw610HVpEdTGUya8BQEN3vkRT6tiPIA87VsMwysiZbJslsa
   xHC3IzBnf5EQKSYqdE1HqV6olhUfN2mJV7G7Ej8t/LL6XJ87H6NzxDwfV
   68pjcTSkMHmLKmofmJ7mekSy9TpSz+q00ZtI+mSxMwQpb8MfU/oclEZlM
   A==;
X-CSE-ConnectionGUID: ckMafwVIRjGksIiAi9wQ0g==
X-CSE-MsgGUID: 2S8g26LpSQWbzpsY5CK5rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45937052"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="45937052"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:24:19 -0700
X-CSE-ConnectionGUID: sXORNplpRYaBWPQXPCkAnA==
X-CSE-MsgGUID: eGCbsX8+TiWJ9EleIvRBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; 
   d="scan'208";a="133942448"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 05:24:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Subject: Re: [PATCH 0/3] platform/x86: convert GPIO chips to using new
 value setters
Message-Id: <174437425146.3859.1859602845128430744.b4-ty@linux.intel.com>
Date: Fri, 11 Apr 2025 15:24:11 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 08 Apr 2025 09:19:52 +0200, Bartosz Golaszewski wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the x86 platform GPIO controllers.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: barco-p50: use new GPIO line value setter callbacks
      commit: 29ba3b6037dcf73f0fc563611ea81669fb2a3f37
[2/3] platform/x86: int0002: use new GPIO line value setter callbacks
      commit: e0071ad2ee0bf09a06e650cb5d697e6c8a7ca827
[3/3] platform/x86: silicom: use new GPIO line value setter callbacks
      commit: 88f67f2a99f061cb938812db3deb965504cf5c5c

--
 i.


