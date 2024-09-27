Return-Path: <linux-gpio+bounces-10472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4D987DC2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 07:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E031F2386F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 05:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7916F824;
	Fri, 27 Sep 2024 05:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRMSI2LA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E562F2E;
	Fri, 27 Sep 2024 05:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727413229; cv=none; b=cDmsE9ZzxqdbGa+Ux5/yMScxmh0c4RsvQky6kOgvFg9v7ZKz0bfFG28u9jdEcOgWIs45WU/xb+fDrFo6WNx153H0l4JaVAaTaJQ5JfZDHsbO5Gyq9mj0DFYukEiBJUrdvWfSEAMp25ynR4RdSo3zNYVT7Fw9B8w6oap0/ZwRzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727413229; c=relaxed/simple;
	bh=fyEkOgWNjkVh2h59wO0cF/KpMYftbWbXFZjDs5tjBfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwmx/3TfmT2mYIBlxD45eP80+Xtwm2EBo+8CEqCrZFJGEar9txhYVRKx27YGaCamUq3XgcqJoT300a8M8q9R9C3rtFbCbiLSQEmUf7dpGsdNf4lxwI1J4ykMgDFtVIEKVVbaBGFypoJKVxHUzkVvumfuU2bQDYuqy2/piXB/q6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRMSI2LA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727413228; x=1758949228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fyEkOgWNjkVh2h59wO0cF/KpMYftbWbXFZjDs5tjBfo=;
  b=DRMSI2LA/te88F0BJTN35VZs8jJmeVkJSHq5FPW2eAOcBFZFzp75IfbY
   tDM7byQoJ2kvLHqnqCVqeSDq45h1wizpHUAOa1QpkJGJ/ec7BSR3BkC0m
   lL1Rr7pBXIRHNFTElca8pcerLIHhxj1jSChzpMKAPsvtzkMkLQFPaygTa
   jmZipcs3znzc7eL2nIAw65A5WXUbpVaAK8R5rnExsv6ShKOYj5xEeKNNt
   gT312WiGzT7Giqi3JVsQHPfaJSIugiZsZImZijnWdZcpq5j/Kuq+PNk4X
   j3Y8phAAJwkETU9Q9QQUAyuySm/nf+9NjlXqWcJ+8YaudyUwxKbpVXrgV
   g==;
X-CSE-ConnectionGUID: EL00soVsSoutFVN5lONqJA==
X-CSE-MsgGUID: nqZSdCbTRAupxs2nIVuZvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44062605"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="44062605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:00:27 -0700
X-CSE-ConnectionGUID: y0CtHs0STD2a81Hi67P80A==
X-CSE-MsgGUID: Ua0jgpiCTPOtT7V2VjnvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="72558649"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2024 22:00:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A8CD6170; Fri, 27 Sep 2024 08:00:24 +0300 (EEST)
Date: Fri, 27 Sep 2024 08:00:24 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: intel: platform: fix error path in
 device_for_each_child_node()
Message-ID: <20240927050024.GB275077@black.fi.intel.com>
References: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240926-intel-pinctrl-platform-scoped-v1-0-5ee4c936eea3@gmail.com>

On Thu, Sep 26, 2024 at 04:11:01PM +0200, Javier Carrasco wrote:
> This series fixes an error path where the reference of a child node is
> not decremented upon early return. When at it, a trivial comma/semicolon
> substitution I found by chance has been added to improve code clarity.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Javier Carrasco (2):
>       pinctrl: intel: platform: fix error path in device_for_each_child_node()
>       pinctrl: intel: platform: use semicolon instead of comma in ncommunities assignment

Both,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

