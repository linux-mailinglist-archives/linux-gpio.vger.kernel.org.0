Return-Path: <linux-gpio+bounces-25628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E580B4480A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 23:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C818A065C9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C579292B54;
	Thu,  4 Sep 2025 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="txXorDv4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB4C290DBB;
	Thu,  4 Sep 2025 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019955; cv=none; b=oQcJ7i7YCIUCu3dxeGI7T0n7yzvpx4uclFmlgp1mDBPW7xfhE8vGcu78eD0dRZmFd/a8rlL3KGvB+YXpKPJo6T4uFypLKchk/EywLiqxUo7CZGe0F3h9XDAiEl2SGtpjGPpqaZieRewDWFz15pLlZSu1dxFMyBTL8JsS33QBc5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019955; c=relaxed/simple;
	bh=39/B6WSkEZZ3cp0giMe6gcf/hX7JaIajniFWVqvJ2Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+2tPQQDOcOPmKY324F+kVgNndMswrmUpqsRy0B1Ug9zwYawY0xV3vAcjDEHCb8V2ZOuu4e+elg8/EWhkSsKEyJQC4ux4/EnecOuX8QfPpJT4OyXDGSw068FNnPmTHoEsz7ON2JO5I21GtuhfOG+wfkRCihtj5HLhwKrDyHjCBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=txXorDv4; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B5A58C0019F8;
	Thu,  4 Sep 2025 14:05:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B5A58C0019F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757019952;
	bh=39/B6WSkEZZ3cp0giMe6gcf/hX7JaIajniFWVqvJ2Y0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=txXorDv4HewUVQbZTj2+8dXmaYOEY/R0h2JJSm1uglaPfsRnvdwI428fj0gNWStQG
	 cgHB0/hEeXXKMSuqpeiUOwSvibdL2u5CEoFz41lx9wnLdxjmsK/7DjrNIgwWTNHFp1
	 pbJ5foXJwg6kfeRL6BeRd7nnaYUFq6toObuUvcoQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3EB1A18000530;
	Thu,  4 Sep 2025 14:05:52 -0700 (PDT)
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
Subject: Re: [PATCH v2 1/5] dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI controller
Date: Thu,  4 Sep 2025 14:05:51 -0700
Message-ID: <20250904210551.222689-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
References: <cover.1756386531.git.andrea.porta@suse.com> <181cc905566f2d9b2e5076295cd285230f81ed07.1756386531.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 28 Aug 2025 15:17:10 +0200, Andrea della Porta <andrea.porta@suse.com> wrote:
> The Broadcom BRCMSTB SDHCI Controller device supports Common
> properties in terms of Capabilities.
> 
> Reference sdhci-common schema instead of mmc-controller in order
> for capabilities to be specified in DT nodes avoiding warnings
> from the DT compiler.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

