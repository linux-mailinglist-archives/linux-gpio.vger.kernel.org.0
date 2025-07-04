Return-Path: <linux-gpio+bounces-22782-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A91AAF8A5C
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 09:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6AB76E5026
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8B629B224;
	Fri,  4 Jul 2025 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYgFMUr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828F92868B0;
	Fri,  4 Jul 2025 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615655; cv=none; b=Tn/U7VRKeRwPZFRO1xBOoMN/96aMET8jP4UyJUJZaMomLvbBSZWABdTxzUwpWAUuBG201U0lUA/kARcHoehc6NFJoLxx6XFVXG6cUVl3hGqq6YBQAXve1KckZudhLuwqYIALl+56yjJxfQ52ti2jb8vxDSifjceStk7eNlkf3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615655; c=relaxed/simple;
	bh=PvexKr9/gRErtk+6ItgG0gzd86lk0Sl8dtRD60EIQqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R0crOhn7+i3grBmvSdHLk9evI3uQnYup19wGXeskOqhXAB6qi+F6k1Jk7BfsAqAZva9LMiKmKMa8em/Zg0RQdJyhfzdoVztuZgJCs/4dBA9XDZhaMekpn5gJZY9m86Kvf0TkDsVH2/ijEE0lyVraVLlI2x9xaItXmDzHVD1+3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYgFMUr9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615653; x=1783151653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PvexKr9/gRErtk+6ItgG0gzd86lk0Sl8dtRD60EIQqM=;
  b=AYgFMUr9yFEE26Msfn4p7pIVR2K891YYXwF8bjPP0yS9P8yUSJm2QVTw
   nWxCpswOy5rNtY+NATuSykpA8cLVbIf2mWJA5jUq6igUu0w+FVOZMLKDp
   xg0waGsvd28GlucfaGOCPJlrkDHtEay0s5EaHQvvJ1FqC7hZBXlp19+ym
   JCm7L2kNgTc7tdY2uejcZhLLyXfgaXW8Ejw77bXLR3PsZf3U8KunDnkU3
   p3TpOhh72YRubrtclJyviyQO2MzzaJe6EkklDMcdRGeRgGQTVqXallKUp
   CAPZZxjopONjsuQe3jQ14e6hdmI3wWQgMt8gTdFOSUGZ2xno4nzZ0LEqK
   A==;
X-CSE-ConnectionGUID: 8JgaxZAWTKmgaYlkL8elfA==
X-CSE-MsgGUID: IRAvMsEUQHKTxUe4ikzvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494532"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:12 -0700
X-CSE-ConnectionGUID: tiWNuHgPTZOgE7yQViXsfw==
X-CSE-MsgGUID: ykaMj68pQ/CpLYcV53Unlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924199"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:10 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 7216444424;
	Fri,  4 Jul 2025 10:54:08 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/80] gpio: arizona: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:08 +0300
Message-Id: <20250704075408.3217690-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpio/gpio-arizona.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index e530c94dcce8..89ffde693019 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -39,7 +39,6 @@ static int arizona_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 		return ret;
 
 	if (change && persistent) {
-		pm_runtime_mark_last_busy(chip->parent);
 		pm_runtime_put_autosuspend(chip->parent);
 	}
 
@@ -82,7 +81,6 @@ static int arizona_gpio_get(struct gpio_chip *chip, unsigned offset)
 			return ret;
 		}
 
-		pm_runtime_mark_last_busy(chip->parent);
 		pm_runtime_put_autosuspend(chip->parent);
 	}
 
-- 
2.39.5


