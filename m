Return-Path: <linux-gpio+bounces-13978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3999F572D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 20:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102171894A38
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 19:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD9B1FA828;
	Tue, 17 Dec 2024 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LurlS7pO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6451F9AAD;
	Tue, 17 Dec 2024 19:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734464712; cv=none; b=U7qjBMKuEN5t2VuWbLVeNb4kMqV50ijfjZC+KLDdpWRR0TQIq3NG6IxyxSTsodWc4vbpPd6XYmaEWUMJT8DVg22/Y9bi1ILTXED1MQacFkvWSCjWSQexX2/60ZVvkBQdJDCn3JYtnMS9wOduAnRzL+HqbV+kCZ51GJKpyLGqT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734464712; c=relaxed/simple;
	bh=13tm4e989tqq0diiIo8jbHoyqxNRWqqmhlqQUjJMQKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLOwB8HVhDOYRvMT3qlKWQPtYxxupg62jkpmyK89qpv+KPsATLbiv9ngYJhMDaTmSTChnyHXKdT2gOemP9m0f/ofhhAPMV0b6PYTm8z5iCWqlikKEVZT1wQwkz21YI7xGQMCLshNuUq8nzIorRQcCIA1WaiU0CYTg7M5ZPwE+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LurlS7pO; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7BF77C00151E;
	Tue, 17 Dec 2024 11:37:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7BF77C00151E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1734464259;
	bh=13tm4e989tqq0diiIo8jbHoyqxNRWqqmhlqQUjJMQKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LurlS7pOu94HygNHDSLoy1C73amFoAZ9gU+cXj7dvC0ogbBuqjVOPmZhiJMcC6RNQ
	 8sN10uBBTXPUg23OtU6UEt7LuVcXHkZld+OZDDKZz53us+mjeABbSIWXrSjx64oa3H
	 UK4jg1CXPoXcVu8EyPIGpNni/HnqGo61cZyP10oM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id EF09B18041CAC6;
	Tue, 17 Dec 2024 11:37:38 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	=?iso-8859-1?b?TWHtcmE=?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: broadcom: Remove intc controller on BCM2712.
Date: Tue, 17 Dec 2024 11:37:38 -0800
Message-ID: <20241217193738.901055-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com> <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Dec 2024 18:36:34 +0000, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> The brcm,bcm2836-l1-intc controller isn't used on this platform.
> It is used on 32-bit kernels for the smp_boot_secondary hook, but
> BCM2712 can't run a 32-bit kernel.
> 
> Remove the node.
> 
> Fixes: e1417095a139 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

