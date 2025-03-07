Return-Path: <linux-gpio+bounces-17274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840CA56EBB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 18:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7571B3B74C7
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 17:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EB123F417;
	Fri,  7 Mar 2025 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sz4TdbAY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B49219A8D;
	Fri,  7 Mar 2025 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367313; cv=none; b=o4OtyEkGFcftYPZ4Inu1BiuOj1Tt4llFA50DPiiZ7eIdrTBH2R05gExFMzZBUOOArOZ3q7SAT5DAtOEizUgaHQ9AgRFk4bhfDhORlfkqv7rMbixtk4Z10m+BmzdXfX7KtDVmV3uKfHy0NGur8hIH5TZSogdMXxqZ+jXxqq/oqQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367313; c=relaxed/simple;
	bh=rDDTdWoW3F3zLKcm1y89ZgAulGu1KIWL3Ub3VEnBd1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hStTOTNgNYm0hU7+rLmaB5lw2Zop9KMc7l7TUj1BxFNCWQLV3/tgPFV+9pK38vZjhlWSKw09cppNQ8D1apNWugKvrS0tgHR9SzkcW5Wz2EmsJ5nuswyfZgxcXCcLYhdEO3J/rG33r5g4gyGl4ELkVjWYKP1K8otkJg/jofJQIN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sz4TdbAY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACEDC4CED1;
	Fri,  7 Mar 2025 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367312;
	bh=rDDTdWoW3F3zLKcm1y89ZgAulGu1KIWL3Ub3VEnBd1o=;
	h=From:Subject:Date:To:Cc:From;
	b=sz4TdbAYn8qfnLpUX2pMwFYNhjck5ipk/K0NTtOi4DHV78+SLm3CWDoNwth6erWWz
	 Jd9yPAs/mynFZzCGf2yHr+y6NlBrX7WyH9W5pKSW0K4px0/+TUTk19+s9XuAEVoJsN
	 /RPRo7/Vf93OgCwzCSaYuoud8SRT/s8F6Lzkl/XaAUFF6HQh7CpD7SYFizvEd0aDVC
	 eU1N/8xaYKL/+oPxRZxcgBiTEjBXfKE05sYAWaOmwfwRwmvgUJQJRt3G9fnQVPOeab
	 sv7Sfl7fAgmR66QIIaZDcqFU9AZCW2jgJf16fSSiiDQ5rUIu0Q3TBGPdjO5CwjVt61
	 vmb9izOLHOavQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] Add gpio-ranges property for EN7581 gpio controller
Date: Fri, 07 Mar 2025 18:08:18 +0100
Message-Id: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAIoy2cC/x2MSwqAIBQArxJvneAHsbpKtCh72tuoKEQg3j1xO
 TAzFQpmwgLbVCHjS4Vi6CDmCexzBo+M7s4gudRcccMwGL0I5hNFlofgLF6KW4PSrtC7lNHRN57
 70doPPuGuwGMAAAA=
X-Change-ID: 20250307-en7581-gpio-range-fceb30c7e2c9
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

Introduce missing gpio-ranges property for Airoha EN7581 evaluation
board

---
Lorenzo Bianconi (2):
      dt-bindings: pinctrl: airoha: Add missing gpio-ranges property
      arm64: dts: airoha: en7581: Add gpio-ranges property for gpio controller

 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3 +++
 arch/arm64/boot/dts/airoha/en7581-evb.dts                            | 4 ++++
 2 files changed, 7 insertions(+)
---
base-commit: a8a297e8bb3dd304cac77f7c435a4983d885a657
change-id: 20250307-en7581-gpio-range-fceb30c7e2c9

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


