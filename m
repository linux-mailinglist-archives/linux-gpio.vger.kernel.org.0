Return-Path: <linux-gpio+bounces-13472-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F49E33C6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 08:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C481284836
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 07:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2820187848;
	Wed,  4 Dec 2024 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cehRV6EX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC481E522
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733295861; cv=none; b=T6pl17Ml0LDiv9YMoQnKd+u+Aoap0o42JlUzJ+TzALT2k9XUAD0zHbXO8bA/9qgVGsHp00WRUsSJRTFc41LYmjB/1dHTyGEnCUEXjCmWfIFegrxUR+qAh32BHUxxRJ72O3Q+ml67U9I5GVmi3nJ2OmGgc9PljcctnBQ7gro7LA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733295861; c=relaxed/simple;
	bh=YdnkwsyP9ZbPTwCVmhzFpJ5mHWs7w/NyCvftsJKROms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lRtZiSHT2Np4C2GucbKkEW4EUOtQgbn0ztO13lQk7PfRmt2D/wwg4offLIDLf3GKs2cy7aRCHTQ3TuypjTRZJZzZZs06vgVocxwsQWVhcNDIAbDcOKcT8kmfmQnwa5l5R+urCiADsuLqhj8Szw0mV3zwPSE3eEZBgm9QceWpjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cehRV6EX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733295860; x=1764831860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YdnkwsyP9ZbPTwCVmhzFpJ5mHWs7w/NyCvftsJKROms=;
  b=cehRV6EXWLcm1KR8x7B+iXZHl84THvN+7hETI83Ifohw3VYe62MBtc8g
   iKS5JxJlmlgNm7w5UdShRPCK8R0FQMFp0rmZWtzYeDxz6HH6BAUwBGIL/
   oZW0spm1MEwQ97782hhqhbTVQ0JN0WucD9y0X2B2Qo5JmIU6+9+QzLqXh
   +xm2DnKBfAEIO/OXq/Iht/DyZLu5oZddQoMesHKhhby2D313ngB44FDI/
   jvZM7i3PiPYozg1aNdLn0SoYFN8TmnF4gnYT7b6Ti7SHgDgPduKl9zslE
   NJsAzoOrtCfB0yz4d7AVKDfpc9IXu+AtVN5fVShknLTb5+zRHtJiOfiIH
   A==;
X-CSE-ConnectionGUID: Wu7W6W4PR6W1AwF4+ANNfQ==
X-CSE-MsgGUID: B9ZeT9GvT5m4KKCmZ/u6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44573902"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44573902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 23:04:19 -0800
X-CSE-ConnectionGUID: CCrikU8eQ7q946kT7aKyvw==
X-CSE-MsgGUID: rd58mtUmRqqavqY/vRZT2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93540775"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Dec 2024 23:04:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 14A2727C; Wed, 04 Dec 2024 09:04:15 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Shankar Bandal <shankar.bandal@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/7] gpio: Fixes for Granite Rapids vGPIO driver
Date: Wed,  4 Dec 2024 09:04:08 +0200
Message-ID: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series includes several fixes for the Granite Rapids vGPIO driver
found during validation.

Alan Borzeszkowski (5):
  gpio: graniterapids: Fix vGPIO driver crash
  gpio: graniterapids: Fix incorrect BAR assignment
  gpio: graniterapids: Determine if GPIO pad can be used by driver
  gpio: graniterapids: Check if GPIO line can be used for IRQs
  gpio: graniterapids: Fix GPIO Ack functionality

Shankar Bandal (2):
  gpio: graniterapids: Fix invalid GPI_IS register offset
  gpio: graniterapids: Fix invalid RXEVCFG register bitmask

 drivers/gpio/gpio-graniterapids.c | 52 ++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

-- 
2.45.2


