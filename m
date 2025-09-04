Return-Path: <linux-gpio+bounces-25630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29AB44824
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 23:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A4B3BD7A7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9242329BDAC;
	Thu,  4 Sep 2025 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CLhow39X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9466299AA3;
	Thu,  4 Sep 2025 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757020295; cv=none; b=iP8unUUyLliz51XVUPcrwGM0DDb3wyc96cb6y/5zPLZJz9ESC1X6nEunTldcCbaYbfPcneLUcnZTck1GLcnSRvVWR/zee9u7X9f+c/8oPfLViHF3A1hzeenyTCtHIZN4Oc050lCW4DdBJ1Nq1By9uonWIX/W7o4FBfKmPkx1hg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757020295; c=relaxed/simple;
	bh=OBRGL6HZNFSkKPaRa20kUp/hyj/cpWg5XdAlcIDswbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oA4UXy4WCXX9XLIhaPC5ebzi7DdHSl/fuZtIMbRMTVSiNA56MufyKD5pYvu967cCe+JGgEIlxOT/Wb8QY6rHjbHClt9Eu1bsUclLFPFTKJKBkSX8VGbfbCK99r+Mg2ZMMK1NPdPxzLji6wwN6cyajCzoM+EgeIAnzt/CCzcbc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CLhow39X; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CDD74C0000E8;
	Thu,  4 Sep 2025 14:05:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CDD74C0000E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019937;
	bh=OBRGL6HZNFSkKPaRa20kUp/hyj/cpWg5XdAlcIDswbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLhow39X54JKSZ5Hz3CXrURwAjhrTRYybXg/DQKwc5Yy+k7bcTs/1LAHrrOI1jAAG
	 Bw14Cywex/D5f0y/JRW5WCqdXAKW1wtE3O8c+Rbuzs4Wk2zkuFnzn2C6VOMnf2Uqc9
	 7Z3Wlmpy8wbY4CTSSmRWetCZbJ+esXV9ZKzNbpBc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7A36518000530;
	Thu,  4 Sep 2025 14:05:02 -0700 (PDT)
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
Subject: Re: [PATCH v2 4/5] arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
Date: Thu,  4 Sep 2025 14:05:02 -0700
Message-ID: <20250904210502.222430-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4ff3a58e98d90a43deb2448b23754808afc7153b.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <4ff3a58e98d90a43deb2448b23754808afc7153b.1756386531.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 28 Aug 2025 15:17:13 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> Add SDIO2 node. On RPi5 it is connected to WiFi chip.
> Add related pin, gpio and regulator definitions and
> add WiFi node. With this and firmware already provided by
> distributions, at least on openSUSE Tumbleweed, this is
> sufficient to make WiFi operational on RPi5 \o/.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

