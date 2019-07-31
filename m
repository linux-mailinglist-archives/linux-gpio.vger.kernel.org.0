Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C3D7B6C2
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 02:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbfGaAUo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 20:20:44 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1933 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfGaAUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 20:20:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d40dedb0000>; Tue, 30 Jul 2019 17:20:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jul 2019 17:20:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jul 2019 17:20:42 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 31 Jul
 2019 00:20:32 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 31 Jul 2019 00:20:32 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.103.107]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d40ded00008>; Tue, 30 Jul 2019 17:20:32 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>,
        <marc.zyngier@arm.com>, <linus.walleij@linaro.org>,
        <stefan@agner.ch>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <jckuo@nvidia.com>,
        <josephl@nvidia.com>, <talho@nvidia.com>, <skomatineni@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mperttunen@nvidia.com>, <spatra@nvidia.com>, <robh+dt@kernel.org>,
        <digetx@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 20/20] arm64: dts: tegra210-p3450: Jetson Nano SC7 timings
Date:   Tue, 30 Jul 2019 17:20:24 -0700
Message-ID: <1564532424-10449-21-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564532443; bh=IAZSdScPMp/Ip7Sf+sfNEWrp2xlTiRUarz1Aolfu/RA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=VuYjBv+Z+BRNwhlxmCNlzTTak0GT3+qol3Xczel4t9wnMRm7nCxIGajRmarWnwXPD
         ryhqBrCUJ2MSIHoXug3YXhLXfwX3LzJW0oZ3x+FigGCazGZmY+KEhr9GO+4pf2tC1f
         zendWdxG2lxGd9FWlGobh8G86TIIBFNij8GArfUxwDtmjq9+QCUDgsHoDdb+xvHxG3
         KrxEJXYWptr5CRSZyK2sAvTHXwomyTHY9Dta04rAfGA5O5Ptyt0UJh6QJ8FD3AR0/k
         biSWfW0d07u75VlwV+ONB39wz04+/ti2TQoRgXpEEw9Kpp7QWsHwiqHaV+MpbemuDZ
         bdL+CAwAfYb1w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds Jetson Nano platform specific SC7 timing configuration
in the device tree.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9d17ec707bce..b525e69c172a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -382,6 +382,13 @@
 
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <0>;
+		nvidia,cpu-pwr-good-time = <0>;
+		nvidia,cpu-pwr-off-time = <0>;
+		nvidia,core-pwr-good-time = <4587 3876>;
+		nvidia,core-pwr-off-time = <39065>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
 	};
 
 	hda@70030000 {
-- 
2.7.4

