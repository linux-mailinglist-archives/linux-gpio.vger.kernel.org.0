Return-Path: <linux-gpio+bounces-4757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C288FD34
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 11:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DEDBB25AD6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B637CF0F;
	Thu, 28 Mar 2024 10:36:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa1.ltts.com (unknown [118.185.121.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53CB364DA;
	Thu, 28 Mar 2024 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.185.121.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711622217; cv=none; b=b2/kcZYbhmC+5eIsFlp7paSTrSPABcqU0BpDbY6DM5ErzXZ5LlaLjz98pnifzi4ytFyRJw2k7rfKSYSHAn7qp6FDLPAUdO2zInCqGmGf+szLFCOgQWmpbc1ZKCIDVAw5kN9IjcT6OIZQwIwpb0WL2IDsTRli4syggX94QAhWfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711622217; c=relaxed/simple;
	bh=Os6DEVMpy0MVvDypxQN8E7UfFW3iDNRRY7vFRvLNuCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kP8O9qiKmKtseJLiIo5R9J2i3gJO1Yksf+0Fdij9Ko+1Y6oWdH474/kQ90xFvv7K65jnj3LO9J23geVMpTIgB/SZ6hvysl7twdnaG3Vv3F9Fz9dz7HV2dkEzcfry57kRY5Ec+pgQvWy+IBK25KQhZBPIqqnicYfUoC9Bbrml9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=118.185.121.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: Yj6kBjcMH8ie4lCNaEpRd5jnFagS52QpVoZ7SBzsfGEDj1QL28yNdEEm3zQvbLV93cKt2itv8p
 K6SzxvDPJ38w==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa1.ltts.com with ESMTP; 28 Mar 2024 16:05:42 +0530
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: eblanc@baylibre.com,
	jpanis@baylibre.com
Cc: arnd@arndb.de,
	bhargav.r@ltts.com,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	kristo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.nirmaladevi@ltts.com,
	nm@ti.com,
	robh+dt@kernel.org,
	vigneshr@ti.com
Subject: Re: [PATCH v4 10/11] pinctrl: pinctrl-tps6594: Add TPS65224 PMIC pinctrl and GPIO
Date: Thu, 28 Mar 2024 16:05:30 +0530
Message-Id: <20240328103530.147566-1-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <D00DSDGHFPLU.1MTQNFWP5DF0J@baylibre.com>
References: <D00DSDGHFPLU.1MTQNFWP5DF0J@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

On Fri, 22 Mar 2024 16:24:07 +0100, Esteban Blanc wrote:
> Hi Bhargav,
> 
> LP8764 is not supported but the driver was wrongly instanciated on the
> MFD. For V5 could you:
> - Disable this driver for LD8764.
> - Make sure this driver correctly supports TPS6593
> 
> Best Regards,
> 
> -- 
> Esteban "Skallwar" Blanc
> BayLibre

Thanks!
We will make sure the driver properly supports TPS6593.
This issue will be fixed in v5.

Regards,
Bhargav

