Return-Path: <linux-gpio+bounces-8423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45893EF32
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 09:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC0F1F21DC6
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 07:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E4F12FB3B;
	Mon, 29 Jul 2024 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="fLcMfEtz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b="R73XDV/r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BAE12EBC7;
	Mon, 29 Jul 2024 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239830; cv=none; b=G30+PWL8voitKyvuVhmBzHznv0TXj9whoWMgwCRHhJXjCrcx6bSzjvjy82LzLUqz8/P6ZYElQSn+hJ2+Mya5dFqTrEyZ09Lc3wBO0z8EUK5PEHfjNzTOc+RTEpdvBf3GjdLcWKldfakccWoMOLQuFag8Z0XCGFpkft5O8xiYvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239830; c=relaxed/simple;
	bh=mLZGhzCsLduvcX8oRnBAgsrExNxaF/jk9j27gHUDSho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NkNBh+7HjjCAUPhh6cA4utepmHNO45jcusx8KSO+35DEn4bDGRoyLOoDHSDz8qvjmjL/xt1qhmzPHB/wXVSUXazXJ8tSk0Kw7fUVxOmhi7nPtl9kYAHvuqXUHG3wmGib3GLJa+mgWMfV28j/4HLIKXsed0+FATqsJd4pYcxNrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz; spf=pass smtp.mailfrom=adomerle.xyz; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=fLcMfEtz; dkim=pass (1024-bit key) header.d=adomerle.xyz header.i=@adomerle.xyz header.b=R73XDV/r; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adomerle.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.xyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=adomerle.xyz; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=/TbXQBlgqQSjOPeeAx6Ru67Uzek8is2joDRzfe4Rs1c=;
	t=1722239828;x=1722329828; 
	b=fLcMfEtzkDDZNl4lyOIQSM8QQYj6sfgsBGHAt73ErrHW2gIQIGXtR7iGy/ChpcenvNsaRNw/oGACXDfiPfalXI7T2pUFCYWKWsMXJxfyHnN0e85X1JcL1OF4eHo5/xgXjS46EAnHWmNRi3FjYNCOYFtpz0luoA9U+45halUKLr0=;
Received: from [10.12.4.20] (port=32832 helo=smtp44.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <me@adomerle.xyz>)
	id 1sYKuK-00DtzL-TH; Mon, 29 Jul 2024 10:35:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adomerle.xyz; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID
	:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=/TbXQBlgqQSjOPeeAx6Ru67Uzek8is2joDRzfe4Rs1c=; t=1722238500; x=1722328500; 
	b=R73XDV/rM30hly0b8DLSweWZ2+lF2M6mUFV4XuSQkDxaORzRZn/ccKQkSBNRJ5dFq7YjgyrTBgg
	yF27RDgFAMCSuj2cN/pkY/ik2fWYlcD5ZdaxCFVLQ/LnAYyz4eC/uJJn5bqDM7iz5gSyCJzMowx+5
	ANymehvjy4Q0VGyDuBs=;
Received: by exim-smtp-868bf69f6c-zg7fr with esmtpa (envelope-from <me@adomerle.xyz>)
	id 1sYKu2-00000000275-19Zy; Mon, 29 Jul 2024 10:34:42 +0300
From: Arseniy Velikanov <me@adomerle.xyz>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@vivo.com,
	jiasheng@iscas.ac.cn,
	mars.cheng@mediatek.com,
	owen.chen@mediatek.com,
	macpaul.lin@mediatek.com,
	zh.chen@mediatek.com,
	argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Arseniy Velikanov <me@adomerle.xyz>
Subject: [PATCH 0/5] Initial preparations for MT6765
Date: Mon, 29 Jul 2024 11:34:23 +0400
Message-ID: <20240729073428.28983-1-me@adomerle.xyz>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9000B6812E77BE1C669BA6703360678607962ACE7A38F93F0182A05F5380850404A6EBD8EB87EDCD13DE06ABAFEAF6705D991A35C54BC5450303324A9B5BFDD32AE205DC559FE8AC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71BDE6A359BD5B800EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372521E7C1CE72986C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82A521D5026967AC283832EE758E1DF54C02766D67BBD0307CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC85FF72824B19451C6F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C89DDFE3E282F3DD103F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3318E5214BBCD6382BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7A3CCBC2573AEBDE1C4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A53B5360BC74C387B05002B1117B3ED69692B8EDD8BD57A116715D9AB585B0EB04823CB91A9FED034534781492E4B8EEAD47A3109F1ACFD409C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34C5CF6F4B28551E3FCFCDB6F81F4ABBC6AFBE35CFF15CE9124750DE6FE30A1E071C782815521A7D1E1D7E09C32AA3244CF66988C60A0257E477DD89D51EBB7742CA0EC8289D0F426EEA455F16B58544A2F3B462F4D52ADD1F5DA084F8E80FEBD3FBC589A3B60A97D065BEEC70984F910843082AE146A756F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6V7K7+CihZ7+g==
X-Mailru-Sender: 5DE64BD8B4008F63F32F89B2E510BB54FBA398EA2A28809EB951B70A5BD4BD8EE2C593C39D5A9F6C0D95629463F16A6A3B9265ADAFE7D7E06F53C80213D1719CA6FC796F43705345A9EF9D9C6A90DD94D3D6663D5D4272A7B4A721A3011E896F
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B431B8944160407DD0558ADADE14CD5136C862D2A3006641E368F3CF0E9FE49B69BA651B92B2A570CD6964137520D2457C4F9C35499EA414ED6F2C1DBCDC9480F3
X-7FA49CB5: 0D63561A33F958A514FEFC60D719171D5B13E86127B30E230DA7CF2ADB6A341B8941B15DA834481FA18204E546F3947C3E12B096E30173B4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B3E160BC32DA0ECB389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C30AE2CC35261D99CA75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX2k8aL79D6UEFcxGEd6A4Q==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Hi!

This is first series of patches that fixes MT6765 upstream drivers
(mainly PWRAP), just a preparation for sending the rest
of the patches (there were too many of them, so I splitted them
into several series). More patches can be found here[1].

The pinctrl patch (virtual gpios) can be confusing.
I did the same thing as on MT6735 (see[2]), these are
EINT-only pins that are not linked to any, so "virtual"
ones were added.

Also, there were no MT6765 pinctrl bindings in the upstream,
so I decided to attach them to this series of patches too.

Thanks, Arseniy.

[1] https://github.com/adomerle/linux-mt6765/tree/mt6765-next
[2] https://gitlab.com/mt6735-mainline/linux/-/commit/c4b988b2bea231e9175fd1d78f7602de1931e4d0

Arseniy Velikanov (5):
  dt-bindings: clock: mt6765: Add missing PMIC clock
  clk: mediatek: mt6765: Add missing PMIC clock
  pinctrl: mediatek: mt6765: Add virtual GPIOs
  dt-bindings: pinctrl: mediatek: Add bindings for MT6765 pin controller
  soc: mediatek: mtk-pmic-wrap: Drop CAP reset in MT6765

 drivers/clk/mediatek/clk-mt6765.c             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h |   66 ++
 drivers/soc/mediatek/mtk-pmic-wrap.c          |    2 +-
 include/dt-bindings/clock/mt6765-clk.h        |  131 +--
 .../pinctrl/mediatek,mt6765-pinfunc.h         | 1025 +++++++++++++++++
 5 files changed, 1159 insertions(+), 66 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6765-pinfunc.h

-- 
2.45.2


