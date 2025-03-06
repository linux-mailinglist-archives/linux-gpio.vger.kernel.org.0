Return-Path: <linux-gpio+bounces-17174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54EA554FA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 19:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E8AA16907D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 18:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFB125CC96;
	Thu,  6 Mar 2025 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="of7gjB3m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CB13D897;
	Thu,  6 Mar 2025 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741285732; cv=none; b=QAuqWKaVS3yz2LhpW6rxf9ujhkU9a0lC5dsTr2hCxR8IpGyIscciN7Wzy/7Iy6TAQIrElbU5Q34MUQN+24D19PdbRgomSq48pJ1gDp3U1FWtBaN91yZ7z52OOHrR8y0001iuVaXpBPZwDk7VfzL1rdzWm7D0bKt8lWRVXeDil0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741285732; c=relaxed/simple;
	bh=CjtmHp/S04LVkwvsmmKCaOu6MxK3AnwxF7vP539EiUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNLZq9iVjhJaK+d0kV6uuC4G7OTAl4uR4x5pTvCqp7KOj09Eb6y/QqnOKcyP/rmCtxTwn1Pg5ZfISB+QMBkbj6Oa57F5NvtFMfbdvZRAshCJvvwqICe7RoUztIK3yGmTC51qbXqFrJJWP7Xpwh1sFdFaHeEWcKEC9Zbnx6lN1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=of7gjB3m; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3031FC0000FD;
	Thu,  6 Mar 2025 10:21:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3031FC0000FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1741285297;
	bh=CjtmHp/S04LVkwvsmmKCaOu6MxK3AnwxF7vP539EiUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=of7gjB3mi7D+8kURI9bTCHfo5sT6Ed2PzBwJ8dsszg71eK4lq4295hMNkO2ISZwW7
	 ibbi7tf5YY3xOYaOkrGRPEajRcNKErxxWbs47sWARBJNYY+1OMX71sgtUsxEQztVnV
	 BFDsV+egy+B6evnuAXUOM3AMp8UMfVyWg2YZyP+0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E78271800051E;
	Thu,  6 Mar 2025 10:21:36 -0800 (PST)
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
Subject: Re: [PATCH v3 5/6] ARM: dts: bcm2166x-common: Add pinctrl node
Date: Thu,  6 Mar 2025 10:21:36 -0800
Message-ID: <20250306182136.1762272-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303-bcm21664-pinctrl-v3-5-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com> <20250303-bcm21664-pinctrl-v3-5-5f8b80e4ab51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 03 Mar 2025 21:54:50 +0100, Artur Weber <aweber.kernel@gmail.com> wrote:
> Now that the pinctrl driver supports the BCM21664, add a node for
> pinctrl in the DTS to allow for controlling pinmux pins.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

