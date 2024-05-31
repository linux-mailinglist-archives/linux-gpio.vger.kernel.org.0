Return-Path: <linux-gpio+bounces-6986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3D8D58C6
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 05:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462001F257EA
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 03:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56FC78C6C;
	Fri, 31 May 2024 03:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="BokKH45L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235436134;
	Fri, 31 May 2024 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717124601; cv=none; b=HNrdynhu+Z2new3WY5C67ijo7Zz7pf0Hr6O7SD4agtSOwixw/oNmAupTBVgQYWbWZgoCkflBBHziycpjoRuf7KIc4wcU67FNHFg2Vw8msI8djZ57jc30EcYL0ZSK3uxTtWT4cUIYI7zeAJ4z0ci2XbR/RGzjvyzwQ6Dfl0sPkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717124601; c=relaxed/simple;
	bh=jHIjRLocOl4PuU0ihM4adjMxH0LEIl1BhvwvLWjKEYw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EPWlHZI5sgGR/anLDGyXR0Vdo1jmEU1FA1RPPp3KnGgRssijroGys55DDZueECtyLG+7lbsSAtbPZJ5eeTrhJvIcKIBODNFNoVTjbz/y8wpzg592gPc62G6qpJ/DWfy2T0eprDxEBL2h9zZyJOCygGVPu7mH6YzGJJXQYIWqe98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=BokKH45L; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 97782200E0;
	Fri, 31 May 2024 11:03:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717124591;
	bh=KcNJCLwnq4RAZ/qwQckgdLlOAEGHpzhWwOSzLGWplOk=;
	h=From:Subject:Date:To:Cc;
	b=BokKH45LooJ+L8pFLyk2x6SZnVKAuyBU+wMXbLJMDLigf4A8uxI2bMP+q8FGxgTuG
	 SJT9EkAbkhLUd+lYfeXrInmK4XavfFBhwq8lSSOeECK4GvqV2XOfE0ytgOhhP8LC0T
	 0jXzTaXvAMhQCQBkpqKHzf8wFdlHcClGY6wVutk4FHDskhkcdEaCTHZy6N/jN6PDGF
	 5a49/bchnLENwDWKdbhEk06SpBaF84JWfA1S1Ypb5uEREKBGtseWVZVWEKRLwC8aUB
	 jr+UkUjWXPN7/4au7Dg2WQkd5L0JzxW/zxYsXk/Csft/zFCDbCqRWNBCh6ZWqjakcD
	 5hNzfUPJVCUSQ==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing functions
 and groups
Date: Fri, 31 May 2024 12:32:46 +0930
Message-Id: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANY9WWYC/x2N0QoCIRAAf+XY5xbU7Ip+JXow3bOFWMX1Kjju3
 5Meh4GZDZQak8J12qDRm5WLDLCHCeIzSCbkNBiccd6cjhZTx09owpIVc+WCQbubjcHKEnt74bJ
 KHKqVtSqS9bMPZ5cu/gGjWRst/P3/bvd9/wFsjBL1fwAAAA==
To: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Hello,

This short series cleans up a collection of binding warnings concerning
use of undefined pinctrl functions and groups. Together they make a
reasonable dent in the volume of output from `make dtbs_check` for the
Aspeed devicetrees.

Please review!

Andrew

---
Andrew Jeffery (3):
      dt-bindings: pinctrl: aspeed: Use block syntax for function and groups
      dt-bindings: pinctrl: aspeed,ast2500-pinctrl: Describe SGPM
      dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Describe I3C, USB

 .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml   | 169 ++++++-
 .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml   | 188 +++++++-
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   | 507 +++++++++++++++++++--
 3 files changed, 781 insertions(+), 83 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-e1464a72d84b

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


