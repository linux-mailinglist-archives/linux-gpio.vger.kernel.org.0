Return-Path: <linux-gpio+bounces-25975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FDB53775
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB7211BC7823
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA12350D6C;
	Thu, 11 Sep 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="W/8Q8TfP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0284D34AB17;
	Thu, 11 Sep 2025 15:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603751; cv=pass; b=S9hWAeFDN/ynNBrYp1BUxsSlKttP8YbbFM0I3HU45qoBbiaHvhB7FmOOyhb/xfgMatcJ691XWVSrt4br/738z38Nwu0basGSBsOAu6BeYNLqidoXTAH0ZstAVuvlUPsfb8A3mg114sHOrxUK2YK0qFdyaAx0vNAtFgH1k3LvOrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603751; c=relaxed/simple;
	bh=hJimOGIlflNfY+Hfsbe7CGCFOAT/jbK7kxzR39doFTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoNuwmgj1ZJWdQSeyLRcSAMDZmz3Jegoe5TLn29NHXPG/ec5D/H19to+ZXcfNhvVlZ+lY+FWMbBh54P8YcWz6c7ZnjD7qpemxrPG76N2Kkz6YDxjDOwiNkFShVcPc+aa2lmv6oYGaNlTzMfnnjNuASvJxTDEs3Ul+vmFAKacBXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=W/8Q8TfP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fN1oUjrQCtFrarLOSqPeTAZ/qjlPA1iQBPsVZbcnUCqHoCsB2EdvpXJXjPzPyBvMaYVKAkO1B1fbjK9hxa0ADRTBHkDbucsqhAGUg8nEkj6fCc7goDzq/I+vEXbML4AWtW4O8Lwy04Jk3HlGxmSVAugYrGjouy6kM9U8xlG/QGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603687; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=; 
	b=lwu4fk9jAjv8xW9gu/KJ8VPUZvFT9wo547buNeskkF58nqNOr5asRRSxZBfTMexRMx8L2ya93Wff1m8dDKxDdket16UiTri2RTivj4g5QcPe5uH42vDAR+qa9PY6a6yoBDJhI/q4pZUCM4tMb+pSGGqiMY40/V4naKG+NIqxZtI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603687;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=;
	b=W/8Q8TfPU9/6++HGf4rco1kTzpSzs3h5uRssn93jKUahoQlvfobdcE6OlWl/DQZw
	+gRZ4uKC4dRxMkrilsKjVwILidN22UsV2JUdbb1Y+nlmw5hTroUK7K4nN2PctgzEWUW
	SyxRxWIDGPvPVfmx37H3ZbYE/KS0YlrLA/6riH9c=
Received: by mx.zohomail.com with SMTPS id 1757603686217696.2957018828596;
	Thu, 11 Sep 2025 08:14:46 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 10/12] arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
Date: Thu, 11 Sep 2025 12:09:59 -0300
Message-ID: <20250911151001.108744-11-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The mediatek,mt8173-thermal device tree binding schema doesn't allow
regulator supplies like the ones defined in mt8173-elm.dtsi. Drop these as
the associated driver doesn't implement them either.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index f52a9906f6a65..eb4f6ba555465 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1149,11 +1149,6 @@ &ssusb {
 	status = "okay";
 };
 
-&thermal {
-	bank0-supply = <&mt6397_vpca15_reg>;
-	bank1-supply = <&da9211_vcpu_reg>;
-};
-
 &uart0 {
 	status = "okay";
 };
-- 
2.50.1


