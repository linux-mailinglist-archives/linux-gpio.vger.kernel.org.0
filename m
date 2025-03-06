Return-Path: <linux-gpio+bounces-17173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30637A554CA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 19:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85D3C1886F7F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 18:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8FD26B2AD;
	Thu,  6 Mar 2025 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UnDMrJ75"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6854230273;
	Thu,  6 Mar 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741285310; cv=none; b=dFhrlT+k8P9AT64IB6UBeB31MSkubJ3WvqquJB0hDg2gcwagKmthpEAIAYihSuXBuGAZ8KmJtPHWdg3NQMW+mD1yvgfErLDOhhZ48D+2GPBXLnNb6XoJeb6+aJ3LlBSX5NTVb0JUclFTElO3xDNfDZjPx2uTIhB2R7XxnYPnISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741285310; c=relaxed/simple;
	bh=zT//KZZFEKytLDpgaT8Obwl7x/iYNsngN/KykrGbh3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXGNH7pj46CADJhe6V7jgWXcpP3bJ8XGAC6ZGMbT8h2nNX+HT5DkRCSnMbuMzMA50O+YF8dwwnNODBlQMizDdCOFho21HErFhTRWXSAdvg/uub0Fuqk3tAHr60MM3dV2zifZ2cU+iDl0Mz1kjEP3gV+cYiU6pstCjvKy79ENejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UnDMrJ75; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AF501C003E08;
	Thu,  6 Mar 2025 10:21:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AF501C003E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1741285307;
	bh=zT//KZZFEKytLDpgaT8Obwl7x/iYNsngN/KykrGbh3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnDMrJ75OX3hcsHuFZ+n0/AfWoS5zAilNrJihvoWQKa8tA/VS2RNaCrIReq3AkN8Z
	 LZiPMi6YzuF4/OG+P2+zjT+pQqL/WuydAgCwMfQuigDfZOjl4ynJNWn/72Yg71mPf8
	 djq0lnPC6KUDfj+aFFmZ5AgNQTye338MYwspbnkM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 394BB1800051E;
	Thu,  6 Mar 2025 10:21:47 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Artur Weber <aweber.kernel@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 6/6] ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
Date: Thu,  6 Mar 2025 10:21:46 -0800
Message-ID: <20250306182146.1762360-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303-bcm21664-pinctrl-v3-6-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com> <20250303-bcm21664-pinctrl-v3-6-5f8b80e4ab51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 03 Mar 2025 21:54:51 +0100, Artur Weber <aweber.kernel@gmail.com> wrote:
> Add common DTSI with common pin control configs for BCM21664/BCM23550
> and include it in bcm2166x-common.dtsi. The configs are kept in a
> separate DTSI to keep things cleaner (pin config definitions take up
> quite a lot of space).
> 
> Currently contains pins for BSC buses and SD/MMC; more pins can be
> added in the future.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

