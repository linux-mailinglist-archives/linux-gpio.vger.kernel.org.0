Return-Path: <linux-gpio+bounces-25627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD4B44805
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 23:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F35493BB832
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BC7290DBB;
	Thu,  4 Sep 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZaTD7D/1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFB727FB2E;
	Thu,  4 Sep 2025 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019926; cv=none; b=HQPEMrF2G6Bav87Jj+KtRxE8RdbZK14kVHi6QcVBA89rrCQDCDHO+nFj+S9QPKI4OV16PKcp8h/DuPE1VQ4wnCZampedFEliCxDTD13e7JX32CB4qQscmIH7/Ru7bJePTQNlvJ9YabFJw7rKhrCPGbVyQY4dk7FExVJIICatBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019926; c=relaxed/simple;
	bh=q4bHoqpCr2Q3jUWmMCTsjSg2SwzWOoNsjilN0aT5mKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TkrIDWGYaMQehpOv5gTYx1W6KNqDpVR+Bp5e6GOVTVODz4nmHq/gXG0g/wMA6CgYrqTC19eBaIUCTXSLREqRrQXK5UrgMxCrV5Utd3vd2QEprfUedmwGFg7kWwoLRDSAu3jTDtReLug+8P1BP7NbK3yB2l0cEvguww99Uir4Mjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZaTD7D/1; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4C058C000567;
	Thu,  4 Sep 2025 14:05:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4C058C000567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019924;
	bh=q4bHoqpCr2Q3jUWmMCTsjSg2SwzWOoNsjilN0aT5mKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaTD7D/1lokj3KqwhXZ0/ygdK7SlY+AL2PPPj/5tYFew2nd3DP9FwubB+TN6tWa60
	 DDnhKs4L2vCAJVX1lFOEWjxgBLv4gGZxftCgZQipOU7d85V1e6RDQKdkvx7xBLvb5M
	 MopDS5avy5P/768n+HkT8vTbJeJ3mK1TYkXZM2Q0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 04D4E180004FC;
	Thu,  4 Sep 2025 14:05:24 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Andrea della Porta <andrea.porta@suse.com>,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: broadcom: bcm2712: Add UARTA controller node
Date: Thu,  4 Sep 2025 14:05:23 -0700
Message-ID: <20250904210523.222558-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <35c0da6a741019efefc3c8e405e210a3a8156830.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <35c0da6a741019efefc3c8e405e210a3a8156830.1756386531.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 28 Aug 2025 15:17:14 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> On RPi5 device Bluetooth chips is connected to UARTA
> port. Add Bluetooth chips and related pin definitions.
> 
> With this and firmware already provided by distributions,
> at least on openSUSE Tumbleweed, this is sufficient to make
> Bluetooth operational on RPi5 \o/.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

