Return-Path: <linux-gpio+bounces-6686-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1198D0868
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 18:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B851B28238C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 16:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888BF7345E;
	Mon, 27 May 2024 16:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmFwZq6M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11821640B
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 16:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716826664; cv=none; b=ulLG3xuJYFZ9VExOEfpnuvwTit5BfOzJ8yrV4rDA3d+Gif16wbSSUv+B89JJ6RS0XbocDW0Q0Fil0uGJ8CZ/7zPvpb6CLr0lDU/gJuzLrWn/IGJNq+lhin4Xdvdn+Z77HL2BChCjSPy66TWd3+p7Z5Q9kaRnfEEAM0yFswrMbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716826664; c=relaxed/simple;
	bh=/cYLbdnY1522R/6BsKY7PW4D80Sh2dGT66C7ZAx6PEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTkVTNRK6N6ZlHL2kIP38KPhZ3Ex8vZk2CJHzBKV3ojX1BOZ/PBmrEFrUiEMggg24zN/lJj3K/ExOOasx84Y+kP03KiFC/qqaYSAyuIn2r64pZZM9FIyos/4B7ahXPHbimwK7IEn6IGIq04OEx0Es4z0iGnIckTmysubeEh1y14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmFwZq6M; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716826662; x=1748362662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/cYLbdnY1522R/6BsKY7PW4D80Sh2dGT66C7ZAx6PEk=;
  b=ZmFwZq6MgRSgHJyJlZUZGhsNTpyalg4DZMpU4YWs8G72ZFd134d4BVjA
   HchHmWMk12FBesUFLrYAQkplHutDhwtZovIndsIor5OCZMtR/k13m2dy0
   W+Hny/6J1xIDPhhG2m+HnuOBlK72K+234uSZbNU6Jtfyzmjw/HozS9qUP
   SKpHY6z6y5iQfRwvgbr7V4aA/m3K8LUD+XaedV9wC+FweEMfMysNTyiEi
   vrwRPrb3WMoXCfsNl6KS7uXfMQ6wOs9pbzGWRzFsMfowdhehl1naoW5fB
   Npd6BgsL0Gxhefnh9oy5eNO9bEN9hz45lxwEkiGBbSAxwWcRjFwCuO7Ou
   Q==;
X-CSE-ConnectionGUID: lJgVn18PTqaAEv4jo7agAA==
X-CSE-MsgGUID: Cw3UOxFDR/KoWkosxZLvAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13376164"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13376164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 09:17:42 -0700
X-CSE-ConnectionGUID: nFR/Q45QS7OHWb/4x85HqQ==
X-CSE-MsgGUID: MrFDV5PYRkW0mzp9bnRFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="35287148"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 09:17:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBd2X-0000000BJpi-3rpy;
	Mon, 27 May 2024 19:17:37 +0300
Date: Mon, 27 May 2024 19:17:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 2/4] tools: tests: use "$@" instead of $*
Message-ID: <ZlSyIWorOYQZX25a@smile.fi.intel.com>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
 <20240527-fix-bash-tests-v2-2-05d90cea24cd@linaro.org>
 <20240527124420.GA108041@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527124420.GA108041@rigel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 27, 2024 at 08:44:20PM +0800, Kent Gibson wrote:
> On Mon, May 27, 2024 at 02:02:34PM +0200, Bartosz Golaszewski wrote:

...

> >  assert_fail() {
> > -	$* || return 0
> > -	fail " '$*': command did not fail as expected"
> > +	"$@" || return 0
> > +	fail " '$@': command did not fail as expected"
> >  }
> 
> Ironically, shellcheck doesn't like the '$@' in the fail string[1], so you
> should use $* there.

But why does it do like this?

-- 
With Best Regards,
Andy Shevchenko



