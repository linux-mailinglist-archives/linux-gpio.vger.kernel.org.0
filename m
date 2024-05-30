Return-Path: <linux-gpio+bounces-6896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A08D4307
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 03:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427AE1C2166D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 01:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD9917548;
	Thu, 30 May 2024 01:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="WvwVfVTi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0D1BF50;
	Thu, 30 May 2024 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717033222; cv=none; b=BRl3niBM+7uZVNLq8CYamfRehIQsUJgDwW23qYwkaVRYprLXwQUSEI8bWw7FbSWiHz3NK28UWjGUpSNacVwAbREV8lWAdAHVfCAP+Hj9PUySSx/mRPHfcCAFZh7AyaFnGEecYneHMLu1jgZVptbvSirdQBttXcuY9KodQD5bWbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717033222; c=relaxed/simple;
	bh=humXagFzp2TTUo1KCImBwgXocgMGATB8oAoKFBnou04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LwKN/hNQf5KW2GoJTIRgmXDbSF6cG0uYpOaW9jcifq6uNH0wlu1fVbyMdXhpES8I/WNdetl1Oj6rMFj5ikNbP9Z9LJIO3HTJmuqTvvR9MSCqqZL85Moj94+wdokN4MNLm4cjzwGJUMY8yBgc3z5sA3U/w2oTMsBOhnC+4IPFD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=WvwVfVTi; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E47652012A;
	Thu, 30 May 2024 09:40:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717033218;
	bh=EnpgvCQ83VB8g74TESGnxZOig6hO4zozd7+EDbYaZdE=;
	h=From:Subject:Date:To:Cc;
	b=WvwVfVTijD1agLB40N6LiGES8bNqb6Zrj+GTlB3LCCXAxk8zVRoSt+qSfCWcI8iwE
	 Nm9Y1MB3tjp54zgB2PSZf9/xyoOGZS40+xrOxtHSygWk8OD8iEZ1MPMRwQQTrSvZq2
	 1kfaLVzkaZBndUiedAxv7FZt/pJVRA0zk9O9B7rbc5Y5Etnk0CwRURgXymHtLFtPrZ
	 bs8Ea+/z8Sej7Qnn54llR6+7PXmvQuCm9rz6qNP2OPuLnODAzCDQW00KR5ug4Re9Os
	 T++Wd9abvPhay84WSAl28ecfJIsG0DIB6iaNE0QNNoObNQ23MZxHPpuR4VoMFswW9L
	 J5SKo1HEu0SXA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 0/2] dt-bindings: gpio: aspeed,sgpio: Miscellaneous
 cleanups
Date: Thu, 30 May 2024 11:09:47 +0930
Message-Id: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPYV2YC/43NTQ6CMBCG4auYrh1Syo/gynsYFtAOMAm2pFNQQ
 7i7lcS9m0neWXzPJhg9IYvraRMeV2JyNoY6n4QeWzsgkIktlFS5LFQFJsCz9ZbswDDM5ICPSza
 g98scQOM0MZRV0UrsjdKyE3Fs9tjT64DuTeyRODj/Ptw1/X5/RP0vsaYgoU51rupLWWVZd9POo
 HaWg190SLR7JO0imn3fP6FgIb3nAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Hello,

This short series fixes some SGPIO-related devicetree warnings currently
emitted by `make dtbs_check` for Aspeed devicetrees.

Please review!

Andrew

---
Changes in v2:
- Dropped 1/4 from v1 as it was considered noise (Krzysztof)
- Squashed 4/4 into 3/4 from v1 (Krzysztof)
- Addressed remaining comments and applied tags (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au

---
Andrew Jeffery (2):
      dt-bindings: gpio: aspeed,sgpio: Specify gpio-line-names
      dt-bindings: gpio: aspeed,sgpio: Specify #interrupt-cells

 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240528-dt-warnings-gpio-sgpio-interrupt-cells-685a0efd2c0b

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


