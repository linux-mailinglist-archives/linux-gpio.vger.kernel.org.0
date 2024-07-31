Return-Path: <linux-gpio+bounces-8484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AA942C37
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 12:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A26B285EFC
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 10:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A31D1A7F70;
	Wed, 31 Jul 2024 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtXGrv4l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B7616D4CB
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722422575; cv=none; b=oGkc/so8efHav/ysAiXI+fQ7wCzdASK9nqW0SPiSla+9kfOAo5o3ChWu6g7C/skjoJQpIIFE1XRcpPFaH93oVx6zf18Gb78b8ZhJsq7fCcMFtpMxgwhDNvenXClphKbcsPBaeV7Leozz+s6LuWWm0B0W7hzCblgY0YWRtoL77Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722422575; c=relaxed/simple;
	bh=I97OMakUr5XiU39ziL6pl3MynBMLAu3NQuUXgmrD7AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Am5+XRc0wpPzorOYKWaU4xkLBIFQFl15dT8vaihd03UYyEj1sMwOJF2Y3N0dAxdvgezDw6ixa7NqLjgpEsSM2cVt62oafBAfysGXyecipXXH1xuSe/91JgxV0K091uR0dhBGGUyxrKfLq4VlVLjlEmUq6eDX61/NpDuq7O0RJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtXGrv4l; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722422574; x=1753958574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I97OMakUr5XiU39ziL6pl3MynBMLAu3NQuUXgmrD7AM=;
  b=ZtXGrv4l44nnaIvKfpfWk2L0spRH92rZHTEZjUzehycxMdUoio3AufzQ
   auQeO5Tv1/fHp4IjZFMdsfsI1GicNNZBSBQMCZW5wrdQINdV/8LfeyYV1
   7ynJeQowRQGywT+z8/zlQyVPHrltQPovdLDWpVgKEs7TZuJeo8yiuY181
   QzhXkfHi6G56fIfyUwKpeMnnOL/Zk9z4AYmV4YE0CGq7EA8YNNrqBrcTu
   k9uoP8eBTfPhO9CK2SEnURfq1DIiRpJDsArR9j62aSQeH3WZHPSZFbp1X
   iiHJfULseVI6f4sVQ96WTpEYVT+IGQ1nsjVS4LE7XXS7xupbVTcpgCjqW
   g==;
X-CSE-ConnectionGUID: tSFK8xpnR8iPN5rD1QPyqg==
X-CSE-MsgGUID: pyVAJPotSZKis8CDTikvYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="12804485"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="12804485"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 03:42:52 -0700
X-CSE-ConnectionGUID: OOxah7JZTbSNT+paDZhEWA==
X-CSE-MsgGUID: gR0lFa+gS6y42wDtB6WTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54633986"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2024 03:42:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6CA73483; Wed, 31 Jul 2024 13:42:49 +0300 (EEST)
Date: Wed, 31 Jul 2024 13:42:49 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID
Message-ID: <20240731104249.GU1532424@black.fi.intel.com>
References: <20240729072530.372153-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729072530.372153-1-mika.westerberg@linux.intel.com>

On Mon, Jul 29, 2024 at 10:25:30AM +0300, Mika Westerberg wrote:
> Intel Arrow Lake-H/U has the same GPIO hardware than Meteor Lake-P but
> the ACPI ID is different. Add this new ACPI ID to the list of supported
> devices.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to pinctrl/intel.git/fixes.

