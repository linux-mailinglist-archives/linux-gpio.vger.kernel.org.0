Return-Path: <linux-gpio+bounces-17053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D4A4E1FA
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 15:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC57617E3DC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C2C20A5C4;
	Tue,  4 Mar 2025 14:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHSENisG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB41205E0E
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099660; cv=pass; b=A/7zCRSfNgdaBVy7L0+uA4LZyH6lbfaKH9gijt8HjXS6i5o7zLt82ndd5E1WJ9h4LXAzAwpL/k3nQ/2QLhF2JMV22jT3aqUgd72KOarSabbtOAnGt4xfTSwn/fv+q1Ip4QJ3NySekk0rtbBtOJny69LLtz3VgmDMVj5E9c8MtSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099660; c=relaxed/simple;
	bh=N9mZl4TD3z0y0yE+U4uxZdByy4waB69DBjZwBEDVK0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTTSd+SYMvR2uWy6pH/pxOiewiSWwoBaFqQHnmox4KwGGdBVsOBlK53N3zmoZEusZO24qNq3qKBT79XF1KdbwOeW5j9Kls9GLH0PA7uwPoSEWUfzslsoTspS8BYTSl+3r+LBV8R3P7FzBl6c76cvGul8rTU6ib4S+t/MNthEgP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHSENisG; arc=none smtp.client-ip=192.198.163.17; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 62C1340D0597
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 17:47:37 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QHSENisG
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dmM1fRNzFxd8
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 17:46:27 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 0F0994272F; Tue,  4 Mar 2025 17:46:20 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHSENisG
X-Envelope-From: <linux-kernel+bounces-541134-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHSENisG
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 3174B428D6
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:21:36 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 101852DCE0
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:21:36 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13E518904C9
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEBC1EEA4D;
	Mon,  3 Mar 2025 08:21:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C51EEA37;
	Mon,  3 Mar 2025 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990080; cv=none; b=gs5fJW50takPlpyW9JaU0qqzeqXxPaRHuFcHnptgENnz85S6G5oQmXHQ5ymzX51I8M6PtmE3GemEXOWrydvwwzVMjT1pTMkXOFYB/FaP1XlM32nE8cBGfWrQnyN2IdPAKyhuGQbduKdKvACJDAO4SM+NSPiOMpVLZ4qRbxlZGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990080; c=relaxed/simple;
	bh=N9mZl4TD3z0y0yE+U4uxZdByy4waB69DBjZwBEDVK0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXWjaz6tBqVMryOVu3hfIC3+AuJFnNlrOjT7PGuIk6L6xou9tQR8VFfW7ABpAm/F/b/ekeranwpNvddmRM5IeuF2SIgxoAq5XSfsfvexc8AKCkmTXL2TOnORrjECgmq/B+x+NO0tM8wNT/Bs890QD9UVgIfMQt47AELVWcHpiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHSENisG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740990079; x=1772526079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9mZl4TD3z0y0yE+U4uxZdByy4waB69DBjZwBEDVK0s=;
  b=QHSENisGlf/P1/vlyD6SApEXNHQJkWY20TlJYqH1FZC/Bh9T8nyP4Nft
   dgTH4OpTZohvcW2Nj19rlcmC7F0+v52HaOLhUuDFLjRuVD0szL8aCmq+s
   DWf32KIQ6f6DW7tvvmFuMo1BLgqeNdGL4+VqyEuhPARi9ol2mvjJhuRw/
   qHV8exm9TbSghvvFjh+3aXJqPgJq398MMvxs6zuce0O0kmpC7kTXlGFGk
   zXNczbuE3vULP4C/omPsTYZG7kgzpDsJPVImEVPylaPUrt1NGbc4tcKcI
   AAchiUTrG00DW1+TWqod1xpfRv3KfPH7Xvafrgsh7xtNazGztAVp8vS21
   g==;
X-CSE-ConnectionGUID: PZlu3JROTVu1UWbU2Mn6Sw==
X-CSE-MsgGUID: bxck2UHdSAmiEmA5UYIWlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41741002"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41741002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:21:18 -0800
X-CSE-ConnectionGUID: 97up0/dCQbWEIlFstbw+Gg==
X-CSE-MsgGUID: VKhMROqeTjyq46TDp4kIKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122947971"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:21:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tp133-0000000Gkip-2FPH;
	Mon, 03 Mar 2025 10:21:13 +0200
Date: Mon, 3 Mar 2025 10:21:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lee@kernel.org, giometti@enneenne.com, gregkh@linuxfoundation.org,
	raymond.tan@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] gpio: elkhartlake: depend on
 MFD_INTEL_EHL_PSE_GPIO
Message-ID: <Z8VmebNcrH6CjHp6@smile.fi.intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
 <20250303044745.268964-3-raag.jadav@intel.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303044745.268964-3-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6dmM1fRNzFxd8
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741704393.07751@pwZVicw1RG4F2aGfmOY6sg
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 10:17:42AM +0530, Raag Jadav wrote:
> Now that we have Intel MFD driver for PSE GPIO, depend on it.

...

>  config GPIO_ELKHARTLAKE
>  	tristate "Intel Elkhart Lake PSE GPIO support"
> -	depends on X86 || COMPILE_TEST
> +	depends on (X86 && MFD_INTEL_EHL_PSE_GPIO) || COMPILE_TEST
>  	select GPIO_TANGIER

Looking on how GPIO PMIC drivers are written, I would redo this as

	depends on (X86 || COMPILE_TEST) && MFD_INTEL_EHL_PSE_GPIO

-- 
With Best Regards,
Andy Shevchenko




