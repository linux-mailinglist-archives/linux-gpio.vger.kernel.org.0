Return-Path: <linux-gpio+bounces-8673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3194C2DC
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 18:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805D91C22086
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 16:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D627190483;
	Thu,  8 Aug 2024 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="M2LLns+T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D9190052;
	Thu,  8 Aug 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723135231; cv=pass; b=kRp+ktluvxpzeF7Q3/Lf+oXGj7XWuKQ948mCfIJqH5Sd8chcYlBkZPTUcMoVjkaN7G+B7dsczPCcwqEIWme8hsqA9MeZmKdwoUQ8QsMLcKapzeu+NbxdrXqg1X8abxIBj0argD25P346+fNCEPpjfJN9FlEP4WfxRbWh3iXZsik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723135231; c=relaxed/simple;
	bh=Ds8qBnHLDgA42/kA+kMiwuKowRMTq/ui7y3pG5X8m1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRhb+/Vf40dUpZLYOGDRuk1Zdmspat4Tll0U1LwQGNgw4rFr3LpmUYcKwgH/C8QeK4OIMk72G7AAdocWquYJKBqUWNRN75A/vC7PplwolJJ8YBLgoWXOREKenYxzSLNlk2YHHdsJMEQ5hHnkr9AnKLkMPNHhOp2CJ4DmmB/ElG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=M2LLns+T; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723135217; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dfW2r5Fq7UNfxTCilPKqP/00P8hDa2H1+zQ2bTStAwDbj5BNJMh8gZ8nnKuaIYYSGuJGv3nbbjaLB/oAO3mJHw1uBe6cUfcIkY6Pet2tcYC3U7lwNKuCRAUPIzE4NWMmofm66PTcpLP/cumwT2e9ODfE2kbXGUyz6UZoDALPJkE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723135217; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1hFOOgQNuFw3jng9LfBqqWBIPK6obWd7jc9M0xSkVUM=; 
	b=McIn/+ePhSqIb+ek+O9vojhKyR72+kjoBEjHJM5338J3O5536/Hq70ZZWDa7LFvcULbuKb31nhhWdl1Oi/znYSxxmp1Xj0FXpgSx9mg1bnnxtz+CkCshah2fOf4FS3m8Kx4oFgqhtV21NTETvHa9ZyLoQvXn1IQJx2ztPTqls78=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723135217;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1hFOOgQNuFw3jng9LfBqqWBIPK6obWd7jc9M0xSkVUM=;
	b=M2LLns+TvwCVfDIBbp2LPddQNbEfiQdKP2zp+APw+RSz55CuYrxO2vC2VYvpEfhQ
	NQCFjv78gKyNCxbZfQSywCvleUd09D1pXnETv+lHqOlSlbW1j+eDBOjOldrX6S1pHto
	bOfIDRpqI8szjhyKm+IBv06WD2NjvYt/RieyIYrE=
Received: by mx.zohomail.com with SMTPS id 172313521613735.44667276664302;
	Thu, 8 Aug 2024 09:40:16 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/2] Add pinctrl support for rk3576
Date: Thu,  8 Aug 2024 12:39:54 -0400
Message-ID: <20240808164132.81306-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for the pinctrl core on the rk3576 SoC.
The patch from downstream has been rebased.

Changes since v1:
- Reorder commits
- Describe sys-grf use
- Update imperative commit message

Detlev Casanova (1):
  dt-bindings: pinctrl: Add rk3576 pinctrl bindings

Steven Liu (1):
  pinctrl: rockchip: Add rk3576 pinctrl support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   7 +
 drivers/pinctrl/pinctrl-rockchip.c            | 228 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   2 +
 3 files changed, 237 insertions(+)

-- 
2.46.0


