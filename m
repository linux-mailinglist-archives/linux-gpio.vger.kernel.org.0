Return-Path: <linux-gpio+bounces-10964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F46992EA6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293AB2850F8
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 14:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B881D1748;
	Mon,  7 Oct 2024 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yA9Wv/j2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627191D5CDE
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310597; cv=none; b=uJPlA0W4DPvYG812xZnX4QH/ZF7u6KVJik4zVyYmsB+WX5ntgnxYNAlX+DmUTy7R8RFgmCQFRPPYGn3kHuZDDu7xe9OUBCTpI0qGUtdFte4tRCDX9peo0mlV9+dMFr/gFjS8LmjCgSjTMjqksIbncR37rZgOx0kgho8BagNp6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310597; c=relaxed/simple;
	bh=3elurgGVViKCPdpbSagNfEraZxYhYLBwgqU9yeOTtu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V69SP45erTNTrOp2nQe1T3vgHINPau29xCdI6qZD1cmceVE32pOgU4yIK2bMbUPcK06ydSM2MjbMqiF2Yhq9EzZo8Zg5m62Se5OqxdIO0hOapgp4ESSVxNiks9H5R9ESJ8k16BsNagS5GkWzoUevizO32FCW35ddNShzGITBink=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yA9Wv/j2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so60313245e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728310594; x=1728915394; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/TOM7EB64+eyeu1JpKwXmL1gp84yFTLvnsIJDegP4w=;
        b=yA9Wv/j2faKnn98s1pVwJ64StDpHKS70DrKbuOf4Ahulhn/lGbM3+I5OQ8Dvzr3m4d
         5vij3m58PneRdDh2vlOXtsVH0d00CPVr15CtW0j5fPZaczPSPrUCcHHZd7ziyDUKNLQi
         I4s79I0+eENLBPOqdAhUoyFQ4x1CNugcaqilkLJS/K6M8/rh0cI1WZ3dpMsQR/8C2iQU
         4JPW9cmOn+BKzt/0KYUTVZ9mimLkPzPr3M8N0mZdml3wQC4LK8mqTtfmEMW6saH78J9D
         eWEWG4w8tCqBemFzSOpR5Wcd9aWdEsn9Pydvc9RrT9RS/X+HckMVI0nMHTVGOYIPos/D
         Ih7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310594; x=1728915394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/TOM7EB64+eyeu1JpKwXmL1gp84yFTLvnsIJDegP4w=;
        b=SsSxYzqXjHZ96Q6YBMcv5kFPcuS2B0ktiZph94pSxxhuDf5VB8LDefKMgO8M316Ldm
         ovg9ec82GfZDvi9HJD+NOol5XmhY6qAUNEvcbSYrjN9tEEttrtc/tAg/rIiy3t8lqJWS
         JGl2GGra2klIMJKXDpGsM9luJzBppZy+fu7fJU6eB5qha+4x0tj6NmdUOyyPMgyPlJfc
         9rE73lEwt8SVYLMdB+JEtJeC68vVFfE3c/8cV0nkKizFxJl5XurKzBW36C9aOsZvagQt
         pGV2RF9LN+Xtb97PjNWwYjnU4567vviC24KGdv053SRkrs26Z/RgIqmwmArEKlWZc8nR
         T5cw==
X-Gm-Message-State: AOJu0Yy5uoeWGfvFe/jN+38jxscZraHoXMMQsgCarIovx18YLLVX34yl
	cdXwqnD6N+ef6Ydm3Ef6b0lLqzBIGCU37BtjlG6U1lF7TX+dnQ2dnBMOR7k098E=
X-Google-Smtp-Source: AGHT+IG04331dVtmaVR4lXQicn5AzQqZD0RSic7wGjyhOhclkIxnftFNWZzaSmZpQMgfr7SYxPHz0A==
X-Received: by 2002:a05:600c:4686:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-42f85ae942cmr116660645e9.23.1728310593652;
        Mon, 07 Oct 2024 07:16:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20537sm94197965e9.15.2024.10.07.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:16:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] dt-bindings: pinctrl:
 amlogic,meson8-pinctrl-cbus/aobus: add reg for cbus/aobus pinctrl nodes
Date: Mon, 07 Oct 2024 16:16:24 +0200
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADntA2cC/x2NywrCMBBFf6XM2oE0Spr6K9JFTMc40DzIRBFK/
 93o6nDgcO8OQpVJ4DrsUOnNwjl1GU8D+KdLgZDX7qCVvoxKTdhyYY8ubjn8WONZ46tIq+Qi3jm
 tnILggz8kGElyslg4+VY39M7qyRhn59lAPyiV/l3fvy3H8QUYcO5RjAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3elurgGVViKCPdpbSagNfEraZxYhYLBwgqU9yeOTtu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+0/oMpaDd6H3HnheIXgpFZlSsGTrWXBj4P4znTb
 y1PAbreJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPtPwAKCRB33NvayMhJ0V6wD/
 0Qf9gVnJ5jjPEOqXfPvBa5NRnfVCbnAR+WdosYfIDfzPALKTNcTYEVtTUkCzFckK6VpNo4C8zPtwM7
 PZxufPchtnPKPsfkMC6QChjBYNHIfeiIVFK9/137/JvZUp+VyMLtf2Qb45D1syrtC2+uVJFeYTXmpt
 FZ7PtCFAo0MWv+qwnQDZ1e/foenAMxi98iFjlu5FhB/pcOdXxjQD4Hfkn1WO9Mo6cRlq/PTWpHbHxk
 t53eW7CObQtkS6T/CfLSKAe5UPGKKojGolTT6zLennMLv370jDFvr74TCygjcmkSCuAiLy6eVwPTXS
 y4hDd4UoCklL6BXpQbE0DRFSfpQph7gtHCqp2gz71exdkJY+xo5pEnyXXqOMpIC29PQ/jwkS6euAgd
 vQaeJEfo7HG2uxXmkauB+vw9F2aDU/h28MhFz/8vVFGRdhIRwOr5nEeF9cz6Jb+m4tZy4WxxWEUwfD
 6EZxVKO0OMbvoyGqkGtpmt/N9aUSsMQNA7GU6SNMSJ+2cg3iDFXOnEfLR2KplAEitHZZ2cciP8/iRq
 t9FAHZN+1ZLyerb7O/H1B1oLicmiTrfvZ0ru2AK93Erp3+o0U1+ZVeysRClj95h4W8EUGebik780NG
 DENgpQ73SssgIpvlfDgdiK9Rd4RXnz3s/gw2uJ+KgIN4NUY6TXtWGgMudcSg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
reg property for Meson8/b cbus/aobus pinctrl node was ommited, fix this to finally
pass all bindings checks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: pinctrl: amlogic,meson8-pinctrl-aobus: add reg for aobus pinctrl nodes
      dt-bindings: pinctrl: amlogic,meson8-pinctrl-cbus: add reg for cbus pinctrl nodes

 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 22 +++++++++++++++++++---
 2 files changed, 38 insertions(+), 6 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-ca82766a8996

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


