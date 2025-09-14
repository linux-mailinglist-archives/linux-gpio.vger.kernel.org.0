Return-Path: <linux-gpio+bounces-26127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B01B56B9A
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 21:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21DF3BCC61
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 19:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F4B2DEA7D;
	Sun, 14 Sep 2025 19:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b="KYz3YJNC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A7D2D0C83;
	Sun, 14 Sep 2025 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878332; cv=none; b=RlPhGS4rRW+cb8gtqCzzUI5kAh4sgCDhOhTm09jGU0VPZ5rx8+QF2RViLjLe0HUtoCcXgOo/bbFbrHqUVcI0mGmIODgwx3h/p1BlJW3zbqtzTHy8AT6aA4e22QVdSbnE14TGIoutw8499WbjIPm60zdK2n1gz7h0VxM05oHGEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878332; c=relaxed/simple;
	bh=XyJr1Et83VSZI4TiOdi7NfvvgURQCYI5SyEeqwKJn9c=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmoXUoVj5dX9QK3oZxWHPrzK93fIOmKEthvH7xgMZLmt6jR2EgYqY9AARvFYInzs0+qlrQyH/NPO/jTO2ZL22wm16pjxzwAbC+NEe9gkxl0ekgSgHLenb1sHkEiE0CfExgDelEHfnfA9ZQ10nKo2e2OVXbhCmjNvuydArSCzQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro; spf=pass smtp.mailfrom=chimac.ro; dkim=pass (2048-bit key) header.d=chimac.ro header.i=@chimac.ro header.b=KYz3YJNC; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chimac.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chimac.ro
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757878328; x=1758137528;
	bh=7lpOnihuzgN8aXgYGmo1vFZZPGJlskHF0+CRgoIdYsg=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KYz3YJNCQf7EePMd5eoDtgjn1HULYv4MJteOCyQneSINTVQNMtPI7EMTOBafoovi/
	 IZkvH3E1Xpc9mMNeMBO5Nzh156176PIChR5B/ibkRfHSksXfb8fyZ7jRH9GQydgoLJ
	 j/2gse+ef29E5TqlKkzclMAwiRQCAX+xxpy9YSD2di6KZE/NgUXjzPW7ggwt+lnGQM
	 IehuKetoA9MxXK9LqxYsqt00fjkdTOBcMV1kR1pWqwM+f0x4xO424XEr8nd03QkNU5
	 1TBlUZ6bBctn1APx+XgJq3DSGhckYoyYHbSztLywsiRmz30oiS94k0TFYZSpyn+feU
	 tinHhojYE34BA==
Date: Sun, 14 Sep 2025 19:32:04 +0000
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
Message-ID: <20250914-exynos9610-pinctrl-v1-1-5b877e9bc982@chimac.ro>
In-Reply-To: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
References: <20250914-exynos9610-pinctrl-v1-0-5b877e9bc982@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: c2dd42e13741ea2a0c5e007de82694ad671e68a0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document pin controller support on Exynos9610-series SoCs.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml=
 b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de846085614166087ef9046cf5d154fb9dad8309..2ebe9353d3bff9f708118a249b5=
e969aa5fc393f 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -56,6 +56,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos9610-pinctrl
       - samsung,exynos9810-pinctrl
       - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl

--=20
2.47.3



