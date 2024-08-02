Return-Path: <linux-gpio+bounces-8543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C89945FAD
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 16:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47E511F22106
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 14:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AAA2101AE;
	Fri,  2 Aug 2024 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rAVzIX6j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF91C693;
	Fri,  2 Aug 2024 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722610438; cv=none; b=BFrnFQD/4K/xxZ1LvSEpzQGen/+9MY9cDJDAE9k+W49jhCblVprnZQghjT5VH+PpIBEbpX4NR38cFr405wBdqmMH3Ew5h28kSpBjiYP4mjUWDJ7FPaL7rJB7kHKk4HaVtIc3XXrUBzZof2UBQo5DnOfcGpbT7h0TbnFyTXdk+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722610438; c=relaxed/simple;
	bh=wMSXbHgdztQ8Vy7EQBiAkB4jPXd5Iv5FFJ65MyOzQ0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cX5oVQcGrvaWYl684A/+tv+cKOFzKnSKnVbDI/CeYSKmgB+gq6s6kiCr+c7iW4JywH1V6TTc/SWBVBVZf5NFVF82+IR2TrIzE3EoNKASFxI7mjgdgEk5tkmsAXtWsknpjCiRMMsxjxCLob9ZYD6vrp/JbYNusIfmR/eYpZkj1aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rAVzIX6j; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722610434;
	bh=wMSXbHgdztQ8Vy7EQBiAkB4jPXd5Iv5FFJ65MyOzQ0s=;
	h=From:To:Cc:Subject:Date:From;
	b=rAVzIX6jTydkyx+lqZdV0C/7PPYNT6WeEyxEszG8yQIeXxWdb0LghQYnywHxYt6Qt
	 QaUuowX1GpyzevVA14t/62QpXRSQxbwtWO6Shr4Y8MR4zB+/muWME2GyAUOO0c6Uv0
	 XwgU1n45AeQWHt/SjIytwfuRPqq8pkKztPRz6PR3wIt1dER7SHkpskdVts7BTaXRg7
	 tM8djs6ZQWdzYlAOvATuazh6sv7vg6u19Z5u0FERoeENBDtiABAcAydVaDEIFeZy/y
	 kYCLbxrFU/EVxSddIHbc8ZkNsmVoEGJQzojjRpplpwg5pFp02tI/pZLj1CZ7z2FLG1
	 mBO4Ai9rQOSaw==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BFFD137806B3;
	Fri,  2 Aug 2024 14:53:52 +0000 (UTC)
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/2] Add pinctrl support for rk3576
Date: Fri,  2 Aug 2024 10:52:02 -0400
Message-ID: <20240802145458.291890-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the pinctrl core on the rk3576 SoC.
The patch from downstream has been rebased.

Detlev Casanova (1):
  dt-bindings: pinctrl: Add rk3576 pinctrl bindings

Steven Liu (1):
  pinctrl: rockchip: Add rk3576 pinctrl support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   6 +
 drivers/pinctrl/pinctrl-rockchip.c            | 228 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   2 +
 3 files changed, 236 insertions(+)

-- 
2.46.0


