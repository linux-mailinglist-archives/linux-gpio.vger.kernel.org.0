Return-Path: <linux-gpio+bounces-15099-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF4A22D15
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 13:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BEEE18895DB
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jan 2025 12:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC431DE2DF;
	Thu, 30 Jan 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOy/TLJ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC60B660;
	Thu, 30 Jan 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738241268; cv=none; b=dgckGg4fx8+lMhs4UHiBv1V7c7Cm7rAW2Zt7EhwuKSeu7Ej6ezUEUJaijtkUpU4rEHjM5PqED1dGJR5tvCVr15t48AIi5M3Vog+8fdKOxn4wpr5rwl9gM3gBhN8qJLIXYi63Xbmu7wAJIQH4eb9kDqMEROL7OxEhUsjsvWqIIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738241268; c=relaxed/simple;
	bh=MH4YJEotHU6hNPVhOBHYHmRcZSpmDTgQNlpEf+lAPLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBPeQ//0R9uYpPzvXWSemP1VtnWw48PNkUkRB6Z4x3f2c4XiwT93iozZS14188WaUCDddAlW0E/CzoWQBA70pJ9jhRy9LhrKpEBzq1nqP6hf8fEb1IwLgx6cY/8XH5ZCvCamQDYngzrR/H4+meErV4bfOBxK/CHx/OZ3gcvmN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOy/TLJ/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738241267; x=1769777267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MH4YJEotHU6hNPVhOBHYHmRcZSpmDTgQNlpEf+lAPLg=;
  b=fOy/TLJ/WAVAh+WnYGNnOmd2BXa9focUXt9Jow2RGvDJnlZje4rY/bhl
   F+F+GE8yDT2Ry7u6Bj/I94y7jY1+J+9fIyW1sVOSY0Ks4WfsvHktPyAEN
   4XNLpvjPyB3QEgJqVngATidS3AIJtvPL4+OPBH+6OT5V2BJr3Xcau68Vk
   Fx7NiP8KXaZznnwFkhIZrfM+lx0+VMhgQe74Vi+7J+7bwfypOCncIMiKg
   8WDHsvlwGDJO4b3NSasmGaBmn+XXvIsa+M3aLykzXUl8L4dvXdqVMshv6
   su67fjwiENRto8BICoYhvK4xox4SmdZHsIJLtwi6RTncCTS04wfyvO/zy
   w==;
X-CSE-ConnectionGUID: V3v2/eohTZ+Arnk48Jrw1A==
X-CSE-MsgGUID: Ehw11Q49TtiBFg9a3zAfoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49370110"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="49370110"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:47:46 -0800
X-CSE-ConnectionGUID: Rb5sWTffQ/OL6wMCaufgYQ==
X-CSE-MsgGUID: VgNF2NLdQzehZKOmPvMuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140201095"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jan 2025 04:47:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6305EDC; Thu, 30 Jan 2025 14:47:43 +0200 (EET)
Date: Thu, 30 Jan 2025 14:47:43 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/2] pinctrl: intel: Unify the way of handling chained
 IRQ
Message-ID: <20250130124743.GX3713119@black.fi.intel.com>
References: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250129145155.1746876-1-andriy.shevchenko@linux.intel.com>

On Wed, Jan 29, 2025 at 04:49:38PM +0200, Andy Shevchenko wrote:
> Some of the drivers are using the dedicated helpers (chained_irq_enter(),
> chained_irq_exit() helpers) and some relies on the specific implementations
> of the parent IRQ chip and its configuration. Update the latter ones to
> use dedicated helpers that cover all possible scenarios.
> 
> Andy Shevchenko (2):
>   pinctrl: baytrail: Use dedicated helpers for chained IRQ handlers
>   pinctrl: lynxpoint: Use dedicated helpers for chained IRQ handlers

Both,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

