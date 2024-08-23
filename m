Return-Path: <linux-gpio+bounces-9095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4D395D81F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 22:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29117283D89
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 20:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2907F1C86F2;
	Fri, 23 Aug 2024 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8FEfGQc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A41C6F7D;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724446539; cv=none; b=t2FzzLMnYI/Ekr2Zg/VHSJa14P0nF3vj0pymVq/VAReQ7ebeMDUR4qFaiG1L8wQSxZKOfIkyAvfRRRPv7Z74kq4Wzxw0WSsI8AI0DWKQj7SOuVmA04q5/K/8u2SxqdyqpkVwn039hcjN2iJ79nFszdXS6PK/rIkhF3AHuSTu/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724446539; c=relaxed/simple;
	bh=fsHk61niTVsPeKsjrtYOwSxoRUIRFtSXZ+Tv2NMS4/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+VDMAbfpKQ/rShwlYXvCCRuCYM/DkjUSaDsN3b7Zp5RNOOHYzvPh3PmvEqkrMdNID0WEuavoG5UikNTPI9LbNwP/eFBJm0RQPXyEUVSfop7/ZhQF4wIp4ZviEtfCbupZwdCC4/73CDjN9SCrCsMOu3JbjVVNqOvivBWKwPwwDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8FEfGQc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45C1FC4AF13;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724446539;
	bh=fsHk61niTVsPeKsjrtYOwSxoRUIRFtSXZ+Tv2NMS4/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B8FEfGQcSvixtBfTxAaJ30AX+0kAEgL7YrDFSndIa9Kt60LRK2xmiQhW6iDhWHCgz
	 q/6MsnZ0IRne5LHXSFGq9XbX3PXJVjwmrhI4wKc+BDTZv/xGwuXKed3K/ZVal+OMO4
	 UkZGOVf9RmPAzNZUFp/9e9eo3JGZ37uGuyzXz4dD+ZoCrEWEF3YoABvNDUpotgun6R
	 /BxwSswDU2fe6Fyup4c6mp5w84hEgeNU/rnyxRskiZHMZYmPZo8py4OuuBO4Sm/8wH
	 /aXWRJFIIHuM4D6o/8mq6lSyxD71BTpE4bICM7ennmvP92RdMD9qjvuIx5/ewaaUSi
	 1ZxUoyvVSqjDQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC6BC5472F;
	Fri, 23 Aug 2024 20:55:39 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Fri, 23 Aug 2024 22:54:38 +0200
Subject: [PATCH v12 03/12] pinctrl: single: add marvell,pxa1908-padconf
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-pxa1908-lkml-v12-3-cc3ada51beb0@skole.hr>
References: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
In-Reply-To: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=938;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=SqzyQbKfxnpwnFXP3f6fJKwa7753b4kTK6T5hNwwn5c=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGknvms08D6oXB4avHei9erJxl0MdVNP+n/dJlv3+eCVG
 2H7MsybO0pZGMS4GGTFFFly/zte4/0ssnV79jIDmDmsTCBDGLg4BWAi7eKMDEdmdLDLmeW8/SSt
 Y7enyKuf+5ThsdKVy2ckOS56+X/n3G5Ghi0/444fOz2d7VdreQHX87BzpW+cb2yaxDk/QH3ezot
 xp9gB
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
separate pinctrl driver later.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4c6bfabb6bd7..45166d479c70 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1963,6 +1963,7 @@ static const struct pcs_soc_data pinconf_single = {
 };
 
 static const struct of_device_id pcs_of_match[] = {
+	{ .compatible = "marvell,pxa1908-padconf", .data = &pinconf_single },
 	{ .compatible = "ti,am437-padconf", .data = &pinctrl_single_am437x },
 	{ .compatible = "ti,am654-padconf", .data = &pinctrl_single_am654 },
 	{ .compatible = "ti,dra7-padconf", .data = &pinctrl_single_dra7 },

-- 
2.46.0



