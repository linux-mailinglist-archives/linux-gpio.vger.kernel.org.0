Return-Path: <linux-gpio+bounces-8446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A492940F0D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 12:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 247991F23ECA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 10:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D14719B5BE;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+BXSZjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED49199E86;
	Tue, 30 Jul 2024 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335171; cv=none; b=UkTaNiEWTCfh/BCIy2++SNB4DVnvDVCFpLGMsVUmuPPVbckqsX6Afp44XdxXmRt2Zri3yZSXZfMMu54+oTHzMBQc0HWUpmaAoRSgrfX4dWHZdWQYBVb18VBaDZx/5sNOdqZjoCLjmgXg8gfk0XZYdJQ25a2wfwWKxZo4+anorCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335171; c=relaxed/simple;
	bh=46Oqf2WgSUncFl6KJ/Rl3s+WL3FozDK9b2e8JLoL7Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z251ND+Z3j/LICWz6NpUwahjDJo+IuHkjbfemVs7urvyw06Ol1oK5Iii1k5+MnxecZb/tJyta6dyLSC4vBp31gT10RFS7b2Wu8PEobUh2y/uzfesp1d99ZFxVpW9lGqr/yw43+GhTNkk/CPMJZI404TRKiBck1CMiwodQW0PfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+BXSZjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E18B9C4AF15;
	Tue, 30 Jul 2024 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722335171;
	bh=46Oqf2WgSUncFl6KJ/Rl3s+WL3FozDK9b2e8JLoL7Ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N+BXSZjBPJ05X2LFbTDl1h09oy5MmBGn370bk2kuqsqPK19WsbTPSNHWdkwOejE4r
	 roP+CQgYjlGiJuEANaEYhh/FvfH5NriT4+aVKMYDcgLq7hRUAKM4d+K7nTAkWToN0x
	 xoAjB31G17BY5iGI4s1aLuExj/ClKBgXB+prS8OEzpO326sOCtj4SPrTcuT6Nk1Hcf
	 w7dgSBsy5ifw94SsnBSCeuKfdM0j2oJSAxsiKTUn7uc/mZjjMIzrquwTvzWitXyo6f
	 qZczdGLRjgqpHV4Jp/1dMzAPgXk7Rm8VNkk5TuXUAnX+dGDeHzRWqtSDFlOaP/bU/S
	 oOlTEbC5cHVVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE7BC3DA61;
	Tue, 30 Jul 2024 10:26:10 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 30 Jul 2024 12:25:10 +0200
Subject: [PATCH v11 02/12] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240730-pxa1908-lkml-v11-2-21dbb3e28793@skole.hr>
References: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
In-Reply-To: <20240730-pxa1908-lkml-v11-0-21dbb3e28793@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=mlhjrL140onBNKS/OlhGE8aipvQXsIEzCBjKg3OZbFE=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGkr9m8+fdLL/eGBzkMCxouFiiYUTRASq25QeL3z0Z5gk
 +Ri33enO0pZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAir9YwMvwrNghK8u14+ff+
 J62MmJmh19wPbnN/9l7YdlJ5yq+tZtkM/6zz7vI973IKMHrxWLNzGZOk58HsmfanTJbH9+w4/dZ
 rMx8A
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
index e02595316c9f..f83dbf32ad18 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
@@ -33,6 +33,10 @@ properties:
               - ti,omap5-padconf
               - ti,j7200-padconf
           - const: pinctrl-single
+      - items:
+          - enum:
+              - marvell,pxa1908-padconf
+          - const: pinconf-single
 
   reg:
     maxItems: 1

-- 
2.45.2



