Return-Path: <linux-gpio+bounces-19781-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C81EBAAFDC4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 16:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09D774C76CE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2354227816E;
	Thu,  8 May 2025 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtBK+lkM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29509278150;
	Thu,  8 May 2025 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715850; cv=none; b=h1ZrNfgj+vOdFmf64ADpO+OReZ7ltN+tU4CWsAegSXU5SaBOF/k56X4n07bpx/9NDHbN0by9UNEeHyr5qw4kQNxcb0jtB8nCfDJjF8aLH/efb+jYU4IsfjLxZ2LeAjh0xoBk8Qdiy/b/ETU0p9tZxup18IxDQ2nkXLpFSwVC53k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715850; c=relaxed/simple;
	bh=jH5SGcX3ZdcFxEoulSCBV2Phdw9LLtV84mxbdRu7o88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n6Cw3slLF1NG0TQvx/QZvO5GOP+xh7IZX/A2LLhNrnhgTbrkihZ8P5g59jdAUSyiH7t+M9Q27sxa6apLb9m6YKXSvncBxiq3PHllX6GI6W0OdsmTohV/xwVysuTgx0B0a0vxCXSyYBtpCLNMDZe9U15njVAkTekZN1YXiMx1HpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtBK+lkM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746715849; x=1778251849;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jH5SGcX3ZdcFxEoulSCBV2Phdw9LLtV84mxbdRu7o88=;
  b=FtBK+lkMplz6Ioy4bKWL1I2nFofraf4HJ655+YOqyxe02auO9yliD/OX
   exJo2WeLkTMjHOxA8OGn6HiffTXvTRSo6Ne8Dni/HaoKjvP71zf5Kg0jn
   MSqecy3SnZAgfe/6ZFjqNTF5t5rYvolzD2BlSjQNnw0iRhSBvi0Sflnem
   wW3+PXQsBffez0v72+RriaifS+U+SdvaIOU3PijxjsuR26f0lJGWXVO2z
   Xhbm2iquE9pMhee1kS+5l5/FkMe2zJ/dAP6r1HFXrhllANAwWR1K+E4wX
   Pc69N8JB1golCYTzz+NkMb2G/tGcW/ihDjWepUPn2tsQBewZA7/jYAwJe
   Q==;
X-CSE-ConnectionGUID: wSrA1B0hTBaRONDTTdTUiQ==
X-CSE-MsgGUID: 31rN+qmoQbakQJuCz2B3fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48372324"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48372324"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:50:47 -0700
X-CSE-ConnectionGUID: axgp00/iTnewpBziKXtiTg==
X-CSE-MsgGUID: pZ4zCB+EQimd1ypaXJ/xog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="167265552"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:50:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
 wim@linux-watchdog.org, linux@roeck-us.net, 
 Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 jay.chen@canonical.com
In-Reply-To: <a04be962-b207-4085-af5b-523f59bffcbc@portwell.com.tw>
References: <a04be962-b207-4085-af5b-523f59bffcbc@portwell.com.tw>
Subject: Re: [PATCH v6] platform/x86: portwell-ec: Add GPIO and WDT driver
 for Portwell EC
Message-Id: <174671583458.18151.3490608010947983443.b4-ty@linux.intel.com>
Date: Thu, 08 May 2025 17:50:34 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 06 May 2025 18:23:14 +0800, Yen-Chi Huang wrote:

> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
> It integrates with the Linux GPIO and watchdog subsystems to provide:
> 
> - Control/monitoring of up to 8 EC GPIO pins.
> - Hardware watchdog timer with 1-255 second timeouts.
> 
> The driver communicates with the EC via I/O port 0xe300 and identifies
> the hardware by the "PWG" firmware signature. This enables enhanced
> system management for Portwell embedded/industrial platforms.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: portwell-ec: Add GPIO and WDT driver for Portwell EC
      commit: 83579675331059689e2869bf752ca9e17fadbd82

--
 i.


