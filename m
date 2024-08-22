Return-Path: <linux-gpio+bounces-9003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C9395BF37
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 21:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A85F1F262FB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 19:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A13C1D0DF0;
	Thu, 22 Aug 2024 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Wl/kZB/Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2251D0499;
	Thu, 22 Aug 2024 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356658; cv=pass; b=H8IRuMzSH9fJxHut+oKINrKFLyfKd2d4/nh10Bq84alKQd/0BQ1xJ2iOw3IWBnmg9MQxsiXA7LpH1SezyT594NzzUbQg0UJEhPyhqJ58ODnIJd5TAJ/gKWkVeVkZmMEoo3afdaqkI+rP3so8kd+qqkakrUKRAwP2H7JbMlcg6iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356658; c=relaxed/simple;
	bh=FYXvWzRTZWgnW9i9bBFw2x7MrD6acq5Gg1I3Om+YqBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwACypp6biJzQGYtxb2sACTpCUwH6G7tLLhgtCBmr5JqxIApHeNsn+pEa2wulKXTEhAAZJ4Kyis1UtMsA+kqjUTTXpGilwckl+ikbCsUp+xQACcVpG+sAmQS9sJt+kBjTF5DykdRKVDuIZbgJPYYzBFDhyn2F+XQIpreTzRKwYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Wl/kZB/Q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: sebastian.reichel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724356642; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dOQG379/jVTi2dNGxoDkn6HXO80ZsClGEZ1qe+xZMwWVCXsZm3/2LfeT+eU6EvsRRNsPsIW4BhuPHz52lqXKM0Yz6CloIMTkIqdaHQlyiwdU9I7wZmDR4oJnu+B51ZTfipjv0bpiNqaU8/p6GJsdZBB7tPccDT/HfsoTIBN3nGM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724356642; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5H+Ta+1pr9NtfEOdpaRVmvlyf6UnmYB8Nq+4H/8l53I=; 
	b=V3Ki9/quUhejKnYlOBkk6BR0wsopNQ1UKNMZEoi+I0ICQBT+o5jK6jNWXaHqCv9NrLARQAHXkgJFSfZHS3L/2EM7dYLtuNAvm/20e6SJSubAG9ttzE9an2EeqLEKOl8cSPHoVFNRK0LF8Nt8ae76BbsWaCK6aNgxBFJxfFvTbaQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724356642;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5H+Ta+1pr9NtfEOdpaRVmvlyf6UnmYB8Nq+4H/8l53I=;
	b=Wl/kZB/QHE8bn0PCi5umpsJgLeznE4AhghH43l+gOBmpjTXtmL4LVWhqLfjJCbAS
	RLD1/+/7HupiljawaJplmoIupHiW6FwYpPvf3ZgxUXyi6uPsiUGaz0DjA6NvS8Bikom
	nM2SEAgudi21Uc++kXbGVXuOwIVnLhvxXkX6+nh8=
Received: by mx.zohomail.com with SMTPS id 1724356641568368.2845162991723;
	Thu, 22 Aug 2024 12:57:21 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v4 1/4] dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
Date: Thu, 22 Aug 2024 15:53:36 -0400
Message-ID: <20240822195706.920567-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822195706.920567-1-detlev.casanova@collabora.com>
References: <20240822195706.920567-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add all syscon compatibles for RK3576.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../devicetree/bindings/soc/rockchip/grf.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 78c6d5b64138..9735063e6aa5 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -20,6 +20,20 @@ properties:
               - rockchip,rk3568-pipe-grf
               - rockchip,rk3568-pipe-phy-grf
               - rockchip,rk3568-usb2phy-grf
+              - rockchip,rk3576-bigcore-grf
+              - rockchip,rk3576-cci-grf
+              - rockchip,rk3576-gpu-grf
+              - rockchip,rk3576-litcore-grf
+              - rockchip,rk3576-npu-grf
+              - rockchip,rk3576-php-grf
+              - rockchip,rk3576-pipe-phy-grf
+              - rockchip,rk3576-pmu1-grf
+              - rockchip,rk3576-sdgmac-grf
+              - rockchip,rk3576-sys-grf
+              - rockchip,rk3576-usb-grf
+              - rockchip,rk3576-usbdpphy-grf
+              - rockchip,rk3576-vo0-grf
+              - rockchip,rk3576-vop-grf
               - rockchip,rk3588-bigcore0-grf
               - rockchip,rk3588-bigcore1-grf
               - rockchip,rk3588-hdptxphy-grf
@@ -58,6 +72,8 @@ properties:
               - rockchip,rk3399-pmugrf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
+              - rockchip,rk3576-ioc-grf
+              - rockchip,rk3576-pmu0-grf
               - rockchip,rk3588-usb2phy-grf
               - rockchip,rv1108-grf
               - rockchip,rv1108-pmugrf
-- 
2.46.0


