Return-Path: <linux-gpio+bounces-7532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B190CBA4
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 14:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2088CB2BB7A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 12:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD7213C80B;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBgCu5V7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5561C2A3;
	Tue, 18 Jun 2024 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712556; cv=none; b=VTcTM0uAN6aXHqcbteOXXwm6HEXSb9+X27u+TqW0uu0n8sKEE8PO/6UM5fXrjPl5+whtB397nHvKH6KF+bY6dqXgKyBmhCwnTLf2Tur9ZBqPGXthSkh2dj4rPNXEzwnlf+cFtnHte9GjxmEL05tQKKL29hhYehO0lnMZKlb5iRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712556; c=relaxed/simple;
	bh=7LQU7CMmTtsJYSGvULUGLDFpxDse6Q7yX9aiBgHGnWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ps4Mpo0Dvx4/hEXnD0zLGgXmwdEhAcSQe9gt0xY3G+xhpJFUxgMq/f1LymwA+QfKev2D7kJwMEtDZ2fL2uqHHQVWxMjPG46kxTBxMPFuBs9j+/6RbT5G8Em7HmCrPin1JyofkK209lO1Qy7qrHtABcQgI+dzwKVF+ULEj6xA5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBgCu5V7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2D45C4AF53;
	Tue, 18 Jun 2024 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718712556;
	bh=7LQU7CMmTtsJYSGvULUGLDFpxDse6Q7yX9aiBgHGnWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hBgCu5V72wYalpBb36tFUxsED0yKl01TlAfVqhHstW3/+uwxbKieS75ogGQyXWx9N
	 Wqtm82xu77z/irKQrpdQgnp88wxybiWD9oOFsUtnRQXBZIOF2ZAVKapRuNF+7fIzWu
	 nymm4k07C3s3eTsCuMDhvoiBfTIkwWkw2hbs/NNXVDP8MXoeTDVbSDlZ2qktZ2meeD
	 NiGDfqV6fKKhNEHzYiAyikaeGeI+EuaN+qmJjGQW/beTfKaeR+3iNrtvlf8OfFd6Gz
	 TaMC8AwWfxfxwVSj3RcjgX1O6TgxefIJ9K7Bfh3nogj+PoX1MRFCoH7WB1PnkKkbf/
	 gXuEi8kbPWS9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36EAC2BBCA;
	Tue, 18 Jun 2024 12:09:15 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Tue, 18 Jun 2024 14:08:13 +0200
Subject: [PATCH RESEND v10 02/12] dt-bindings: pinctrl: pinctrl-single: add
 marvell,pxa1908-padconf compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-pxa1908-lkml-v10-2-754e5ece9078@skole.hr>
References: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
In-Reply-To: <20240618-pxa1908-lkml-v10-0-754e5ece9078@skole.hr>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Rob Herring <robh@kernel.org>, 
 Kees Cook <kees@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=989;
 i=duje.mihanovic@skole.hr; h=from:subject:message-id;
 bh=DHVN0JCnU9cjk5HoT2nuCXlkwB4DvFUsqraG05pTwEY=;
 b=owEBbQKS/ZANAwAIAZoRnrBCLZbhAcsmYgBmcXjRcSJnF85BqFVepG9EMDyQ5R/kh868wHfKL
 rhGHfjfhkaJAjMEAAEIAB0WIQRT351NnD/hEPs2LXiaEZ6wQi2W4QUCZnF40QAKCRCaEZ6wQi2W
 4Sl0D/4qdztHij0UjE7SDl6Kq+zjmKmNa83246ceGFzwDddPrJOEd0yGeHsvv4VSpx+37aY7/2K
 Xqm1+uyGlWevlP8GNiHJFoioql8g5V4j6JRdlZLoqkIieII6w5XDF3qtYTaGqmRjDKx119eOTJ/
 8s0qZsLsynK2QXqTVuCrs5K1E54Ql+48Zi7tZpdkfb8HFq9rRy4aFgtGXuERCLkl/GJd6+GuI/n
 IcpuM318ymNQn+6UtNyvYlPRHsupRJhgX2pnR1PoYug+iTRdKGpNyTS60LNsUOmdT2SEItAqyOz
 8zA+yfh2M8dePSh06d4nxmSJ0BRbPoUaGnqmnrlDhTAiYYz6FE6GD6XZow6QKb6OZ520Kn6/zII
 dj7ZxyHY16huTFTHVSh9IAxDE6G6gPPY+pfjXQJ4xS4NSAAnNibqPOZHHeMmPkoYJCY2ZtguxcT
 yJf8WdOQPjjWO3IISkRTVLVrO6bYDrnntoa+6VHualswq7B3VKX/V+X9EOXjh1IEtgut/q4cfST
 NeRqaSWXbuT6Ij6RjqxYm/pgxpyzViNonXR8pM/rHWz1I8CXx25TnleixG0/ep29Z+or5UuRvw8
 mdGdGS9bivAdKm38D/N9AFqe6xJEuVauIpnMJPC4EJWP+Lj4LjDqUEQAKPYbi+hf50qmoCgpZLf
 m19cb16EaTUb7pA==
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=53DF9D4D9C3FE110FB362D789A119EB0422D96E1
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/default with
 auth_id=112
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
index c11495524dd2..1ce24ad8bc73 100644
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



