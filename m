Return-Path: <linux-gpio+bounces-25097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B2B3A294
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 16:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 337AE7C173D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 14:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5265F314B68;
	Thu, 28 Aug 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRoISDUd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751E3148A9;
	Thu, 28 Aug 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392144; cv=none; b=d719QciXZZHEpT1mA20La32y4H7eArmQSb59HbIEFAIYcUa5FKJxwukrvAqV8qPd1LUtBZ1AgfYPmsAxLfVo27k1S751iZRIltXAgbLoxodsRVMOime+SWEuBQKX0BgzJp+dsq98waAMF+jCyVWsdiG+N5MuOCK6LZktYHdE4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392144; c=relaxed/simple;
	bh=SMW3xNgf1e4fN0in0pQWb5Ft82SGZRFlvkKOyugEm/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxB+RxHmA7ZbNyWJN8z9OKk6Poz+tG3nvxYFd9FmYT4eVbDKwk+JLt5wgEA4RuIiXkXDTM3hUxACcYzyZG33tQ3LgAw46jPt7ILuKqRNNhj4k+6X8pa5LhkCFpmBs3XgdDuMhmEODP7QCAKCrzABm6nLvjvL2NOUbWgTB7Dv4lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRoISDUd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756392142; x=1787928142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMW3xNgf1e4fN0in0pQWb5Ft82SGZRFlvkKOyugEm/k=;
  b=XRoISDUdaQyDLopGk9yIAvfaLGYSpggunmdYzDPjrPlwe8wxluSMQCg0
   QuJlVZuWiUE9ysF7wMacdzrY52eSxYaEhSOKZrTW7hBbL6+CYxFAkunR7
   7QNXiB/mdOitPr8igsCwFTRG1wQuMN+nDLAwM9eZ8rZhuEId1GPlhBOK/
   ec6rLrFRXoHQWsMOOnpvc0OPY2eyZfcmhZxkm6xEAXgOE7NPAdx0G58tO
   6NMzjOgF5sXkw44Urfrer2HHZp7ydmMspXHkRjXVGraRUx9GJdEa0pdzM
   SF/kbjnQhAnrp+Q6RYQgUIpVXiKf3RqeMt0pJQvjdwHIdnPeqrAYPK5HS
   g==;
X-CSE-ConnectionGUID: MqjSepULRmGk9sNk97UbMw==
X-CSE-MsgGUID: S7B0zK30Qv6ZyFb2YVOPLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69256232"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69256232"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:42:21 -0700
X-CSE-ConnectionGUID: n5t3Q6rNRFaBlTLBg9DLDA==
X-CSE-MsgGUID: RwZH5Jm1Rhi4vAmq71xDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170028872"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:42:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66BF811F9D4;
	Thu, 28 Aug 2025 17:42:13 +0300 (EEST)
Date: Thu, 28 Aug 2025 17:42:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Jul 18, 2025 at 06:24:36PM +0300, Cosmin Tanislav wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on support for internal pads, for which a patch has
> been added.

Could you provide v4l2-compliance -m, media-ctl -p as well as media-ctl
--print-dot output on this device, please?

-- 
Kind regards,

Sakari Ailus

