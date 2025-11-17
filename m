Return-Path: <linux-gpio+bounces-28566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAACC62D13
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 08:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 227CD4E6B98
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 07:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADED31A811;
	Mon, 17 Nov 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpaXgtOx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7103831A571;
	Mon, 17 Nov 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366312; cv=none; b=gzSv6rLiyHC59ClghUBhC2IeUWunho35QMynhuF5BAa+dqaUw5dyHK6RJZMjDR1jzh0qI24KLYJzW0Md0KH+PaOZMQLMxuq7roURxjL/KxSXrqoY3BKPXn5r70qvJ6yAcxwwXEBGsG1ExD6H5xQzJlkjyehMTDL9xY0y3iyT3rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366312; c=relaxed/simple;
	bh=LGsaBV1WEUAkbzoemzky6Cd66TsgAFuGqFWo9MAiCEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3YnCJvMMmXvVNbh3YHjEVSRyXPo/MVW9r64gKufWjBHHavO4KiQGfZqLibsLHxX1E94Q+42cWJXjD0aF5HkMP9F0mYv+RGmcrpV9BXLe10AgOhZy0ygLONDR2Hp+6iRNZkSlkQwBFXDlPc19fHMkgehIxvqn3UhPXTDFUqU+U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpaXgtOx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763366310; x=1794902310;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LGsaBV1WEUAkbzoemzky6Cd66TsgAFuGqFWo9MAiCEM=;
  b=MpaXgtOxWkpXc7WaTg81Y+YVyGP4K2+WJKtDFv2eNgmadnWzKhmGZoYo
   05tnkdosAXBbr0IjYAxr5aCxKNWYdgGIc4wRZBbu+j6aEsHpHwSVkl8WN
   mO0aBYhhY0mYKYt37YqozKqxnukQ3PO/c27/wX8D3BardeO+L+3jcsbzy
   m4REFqySiONBbCjiaHD1oBURG7KDPD7c0lQCpfV+GVaysiwFP+PBmAgq6
   YDPHrTGLP2/61ZoQEIUVvgYZbGa3jzjvAnwefrmXAYMVwRkQoSBrlypc+
   z5TBQZVexhxhSGRGQJB4IhCUCz6tN/jBf3wOPikqUj0Bk2kWiGjJ153V8
   g==;
X-CSE-ConnectionGUID: F3NVuG84TNS+HvG4ngAFpA==
X-CSE-MsgGUID: zBpP6LM/Tv2RREWukB0lBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="76039004"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="76039004"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 23:58:29 -0800
X-CSE-ConnectionGUID: Pd4lnF52SxmKaPQYwshdgA==
X-CSE-MsgGUID: W/12kmJ/QMyHDG4RSUd5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="194833609"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 16 Nov 2025 23:58:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F0D0E96; Mon, 17 Nov 2025 08:58:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 0/3] pinctrl: intel: Export intel_gpio_add_pin_ranges() and use it
Date: Mon, 17 Nov 2025 08:56:58 +0100
Message-ID: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deduplicate more code with help of being exported intel_gpio_add_pin_ranges().

Andy Shevchenko (3):
  pinctrl: intel: Refactor intel_gpio_add_pin_ranges() to make it
    shorter
  pinctrl: intel: Export intel_gpio_add_pin_ranges()
  pinctrl: cherryview: Convert to use intel_gpio_add_pin_ranges()

 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +-------------------
 drivers/pinctrl/intel/pinctrl-intel.c      | 10 +++++-----
 drivers/pinctrl/intel/pinctrl-intel.h      |  2 ++
 3 files changed, 8 insertions(+), 24 deletions(-)

-- 
2.50.1


