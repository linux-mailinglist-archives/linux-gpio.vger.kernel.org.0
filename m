Return-Path: <linux-gpio+bounces-25912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A0B51AEC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 17:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 190C31B20AA0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09FA2749CB;
	Wed, 10 Sep 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="YYYKTX11"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ADB327A1F;
	Wed, 10 Sep 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516361; cv=none; b=KbRykyjd27m6HLcBTPF9NuFC8XfVlTwPGYs/qH9F1kjjGGcf0jz4yGyCEHFhdbIkYWd5Le7wpa6P6CpqLeKc2BBmUwXKd8ghX8wbmn+36F+D7PKCPuqH/yXBEQ3Rj6JqB+mqvrbNjhCnLsIifljQPV0MrXt5VKOKvUam5bVQcBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516361; c=relaxed/simple;
	bh=i+W9XBDNiNauWFra8m5tnO4evGE80GW9FRlAsKhJjSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRGWq49i4f7lfx5rzkcYtErGbToDQI8OZYRXykNicS8Mm1ukUJvzCyIi6IHZqKisXWv2NAv5QrqAFwMgrE19kt8cxdtyjRWmpO6Av8qFt4DVbBLUw5sFlZzGlGZ554HxU8/GObOCfbjB9dvqTfBkgA8j/9mOxEqM69IEeaTtWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=YYYKTX11; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id DB9D240ED4BA;
	Wed, 10 Sep 2025 10:59:17 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1757516351; x=
	1759330752; bh=i+W9XBDNiNauWFra8m5tnO4evGE80GW9FRlAsKhJjSE=; b=Y
	YYKTX1120skmF4K5iqoDxDVBHg32oNKfvR+B6aztF9Tnt/Oo/+9OWd27bdo9O2Kk
	wQVfELlds76JUm75Ov/8Wi+PklFnciue9eEKuEbzYelZZLucyKC6N5/z118QD63x
	rKeSyLC5LNyRGK50EPXer5xQ2Hqud6UljqAo6OZl/I=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id W3HZiSeVnRVE; Wed, 10 Sep 2025 10:59:11 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 73F8C40E2F43;
	Wed, 10 Sep 2025 10:59:11 -0400 (EDT)
Date: Wed, 10 Sep 2025 10:59:10 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
Message-ID: <aMGSPj6VKMDO8dkn@ada.csh.rit.edu>
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu>
 <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
 <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpdk5JaqXf6LkSWQvZ7FnfyLdMWOJX+7n0=PZ-udH-WA@mail.gmail.com>

On Wed, Sep 10, 2025 at 04:55:05PM +0200, Geert Uytterhoeven wrote:
> Please don't.  The m68k version is wrong.  I will send a patch to fix it.
Even better. Thanks!

