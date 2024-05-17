Return-Path: <linux-gpio+bounces-6416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9868C8096
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 07:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94CDC1C20F5E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 05:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBDF10A09;
	Fri, 17 May 2024 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ltts.com header.i=@ltts.com header.b="oXrcqdOW";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="CNm0dYFs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from c180-40.smtp-out.ap-south-1.amazonses.com (c180-40.smtp-out.ap-south-1.amazonses.com [76.223.180.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4B1095A;
	Fri, 17 May 2024 05:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=76.223.180.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715923336; cv=none; b=nhOOE218us0jQz1GVtbR0TdxyUfz59+od6CIUVibISQWk7g8ECM0eok+CC1wxA8uGPuzYJug0by4gecwwdUn+YdCbhA6nrrHGXW/GoJ1m//MBuQYXFEaS390YHpbJNweEJLNSF7TIq9M59WVMwwPOZPTMZrh8ZpWAJvNvt75DzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715923336; c=relaxed/simple;
	bh=lclVx6WfAVXVWLfHGAr9HA/dSg48QUSA0LJIVcukNkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G82628hgS5jDhQYDG41R56NNF29Vt9QopiiSDBSJje20j13q7r2KzcIWy9hUIv450II3VIy9CGysOrCYY0dEArshcNKpItwCwG+MumsTHdOesodFvodIxfK0AY8WmJalmOt2Om/McXiZ8sjN67jP7K3ABv4LZoGGXByEbRzy3YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ap-south-1.amazonses.com; dkim=pass (2048-bit key) header.d=ltts.com header.i=@ltts.com header.b=oXrcqdOW; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=CNm0dYFs; arc=none smtp.client-ip=76.223.180.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ap-south-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=i3fe3efcd4pbz7ipgssfqjhzqx347xbc; d=ltts.com; t=1715923331;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
	bh=lclVx6WfAVXVWLfHGAr9HA/dSg48QUSA0LJIVcukNkQ=;
	b=oXrcqdOWaeFdXfu2V5tSR1qlEI76HUzIVIhLCHlXxG2umyKEzFlN+YhZQUwso6FR
	8zPQiSl6LA36nHghcP9+nk0001XxRnLssqHdB9vO3Z0EPQRTaGa2iIinkyWRbPDCs7M
	tgTy0m2kHt1EeUH1eRkOl6sQta8p+zjlSopRj03TByZ+KdubiyGyr6W6aHiHqzOOqwN
	OoESsM7DEotMpZk2QqOI6I6Gl2u3y+3xoSRFu+vJdVqbce4RjUWurO4jRqfHq3RSt80
	5YnJFwZBA0jcswdiaPlQS/56X8bzyh1VabEg8o2jtcLl+COXLBucSQ6mUWtSP9OPLu7
	azX8Dj0oqw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zpkik46mrueu52d3326ufxxchortqmoc; d=amazonses.com; t=1715923331;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=lclVx6WfAVXVWLfHGAr9HA/dSg48QUSA0LJIVcukNkQ=;
	b=CNm0dYFs1Kld/3jueJlAGfNWihlsSxRPMWFBLZ2ufQH+DELMnzk7ZxbOaPordhFr
	bNFzyTKoG/aH8eCXajwTwVgvQq6PMwFaSHTIamnhCpjjz+DzsIWb4v1qDb4a27jW/S5
	kqFh7GkfM58bn9fNaxww7wT9Lb6ulV7dwyFncfw4=
From: Nirmala devi Mal Nadar <m.nirmaladevi@ltts.com>
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, lee@kernel.org, 
	Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>, 
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: pinctrl-tps6594: make tps65224_muxval_remap and tps6594_muxval_remap as static to fix sparse warning
Date: Fri, 17 May 2024 05:22:11 +0000
Message-ID: <0109018f85002ae1-6fb831b2-74c2-4559-98f1-a3ef25e72558-000000@ap-south-1.amazonses.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.ap-south-1./RC/PI2M8xOxQmTMPi0M1Q8h2FX69egpT62QKSaMPIA=:AmazonSES
X-SES-Outgoing: 2024.05.17-76.223.180.40

From: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>

pinctrl: tps6594: Fix sparse warning.

warning: symbol 'tps65224_muxval_remap' was not declared. Should it be static?
warning: symbol 'tps6594_muxval_remap' was not declared. Should it be static?

Signed-off-by: Nirmala Devi Mal Nadar <m.nirmaladevi@ltts.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405111523.9yt759uX-lkp@intel.com/
---
 drivers/pinctrl/pinctrl-tps6594.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tps6594.c b/drivers/pinctrl/pinctrl-tps6594.c
index 085047320..95ec21d0f 100644
--- a/drivers/pinctrl/pinctrl-tps6594.c
+++ b/drivers/pinctrl/pinctrl-tps6594.c
@@ -237,13 +237,13 @@ struct muxval_remap {
 	u8 remap;
 };
 
-struct muxval_remap tps65224_muxval_remap[] = {
+static struct muxval_remap tps65224_muxval_remap[] = {
 	{5, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION, TPS65224_PINCTRL_WKUP_FUNCTION_GPIO5},
 	{5, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION, TPS65224_PINCTRL_SYNCCLKIN_FUNCTION_GPIO5},
 	{5, TPS65224_PINCTRL_NSLEEP2_FUNCTION, TPS65224_PINCTRL_NSLEEP2_FUNCTION_GPIO5},
 };
 
-struct muxval_remap tps6594_muxval_remap[] = {
+static struct muxval_remap tps6594_muxval_remap[] = {
 	{8, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION, TPS6594_PINCTRL_DISABLE_WDOG_FUNCTION_GPIO8},
 	{8, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION, TPS6594_PINCTRL_SYNCCLKOUT_FUNCTION_GPIO8},
 	{9, TPS6594_PINCTRL_CLK32KOUT_FUNCTION, TPS6594_PINCTRL_CLK32KOUT_FUNCTION_GPIO9},

base-commit: 1482489b5196f4203576ae1dc2ba4ce3ada381c7
-- 
2.34.1


