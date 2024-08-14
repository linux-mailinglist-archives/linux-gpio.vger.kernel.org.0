Return-Path: <linux-gpio+bounces-8749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78939525BC
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 00:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAEF21C22629
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 22:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D97F14A617;
	Wed, 14 Aug 2024 22:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="hNS8Miwf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C431448C1;
	Wed, 14 Aug 2024 22:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723674667; cv=pass; b=fkjcnSReCdaHREpTlX79DQESvzBYpoxGAcpOZrqBBZgnFXjDFQ6rqX7IRtvbe8ydaRYyNR6s98qcseJmkUHpXcvWvNzd+87t3mxnPFCKeIEow2jyJUJvGpuaTniPlA5v+ulh1EtSSZtlvEAGC0CVfbXKk8gR1C3hBetaK80FCcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723674667; c=relaxed/simple;
	bh=Ad7oLpwYOyuo628ujdJYZsbLOT0FbynJkaWvt1g8iYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0bmyimXTQSFyWWpygtHHKOj5GpS9eSlv/RrK/JlLEQWFml5bCewFKvsY2pY+BxQPQzUKa1Jf7gMTbQd5nfdwgWIHGdRAXNS/yQoY1Vavsu4rOpob3Md9nGPpsCl0vz80N4raWAh/lN0c3H2+8ubju7ASg1oDKlRLedRUzuEooo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=hNS8Miwf; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723674651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CaoKoabb2x/8TNTE75o1EYoQEp6sNXjvWwW5UflBEnjD0kBu6Xbb8eXcEWH1ayTwasPzcj413QyfNm0a9wirt1etiX43xQ6KlLtg0Fbt0VmKHguMR1Bn3eReggNWqyq+IN5CKKCLiDoSHPSQISK9lFG176XYVSNVs1wfS5xIw+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723674651; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pP9o4Ggk0/aQzpPcc0l1T8SG/bLefUOPqdiVZtqQK/Q=; 
	b=RKmV9S1yDaEUgc4BwcRUXq0WDuoNGuYWNWcJ93aWLMlv/d2kLxjQqkywlDcB3+MYDTjczqxMM2MAqlMJxKanstWDZ2R0OgjjzmyxJfi215ZPgQoSsbvy59LdkDyUy7DZ5hjuLjVzgoXoFxfnNl95x6FZWjqMBdXvIBfbAsujQNM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723674651;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pP9o4Ggk0/aQzpPcc0l1T8SG/bLefUOPqdiVZtqQK/Q=;
	b=hNS8MiwfGxFQkZGeNQmFUxcmsyg93fs/5OFS697z8NBnbA/Fsbxfawttu4wwb3gJ
	UnTyqQq0oC+07Mg4rJYFo3ProFng76kgNqkctE4x9W+HV8n90sazs4tozbJ3wzE+kw6
	A8I+J4khO2fEvYLVB3t4QB8OGxrIkcL5ZhIPWY+Y=
Received: by mx.zohomail.com with SMTPS id 1723674650458476.4613063280085;
	Wed, 14 Aug 2024 15:30:50 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add pinctrl support for rk3576
Date: Wed, 14 Aug 2024 18:30:37 -0400
Message-ID: <20240814223217.3498-1-detlev.casanova@collabora.com>
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

Changes since v2:
- Document rockchip,sys-grf field as only needed for rk3576

Changes since v1:
- Reorder commits
- Describe sys-grf use
- Update imperative commit message

Detlev.

Detlev Casanova (1):
  dt-bindings: pinctrl: Add rk3576 pinctrl bindings

Steven Liu (1):
  pinctrl: rockchip: Add rk3576 pinctrl support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |  18 ++
 drivers/pinctrl/pinctrl-rockchip.c            | 228 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   2 +
 3 files changed, 248 insertions(+)

-- 
2.46.0


