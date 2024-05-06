Return-Path: <linux-gpio+bounces-6150-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BB8BD124
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AAB51F223B5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CE8155A34;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfJ56tuA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E5F15533A;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=Frs6aNgDPCCTVOGODj2IOLF4ltJDoRTjrNAa0pN/O0yzckQqT9JMOiFjr2ocCjRuoxytoV/5IQMYgsq/ri8hPI6nI4nThuyStpdRr9TEnQHb/EhUWswhnPuvv/rqUJ5pKHCtQxcWXlzchIFrc5sUr8dJ6yvjneA6Jlw6c79KBMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=3nHjQ8geF8c61rNg0mCqn4/A6dXpqr7qrJ7QmC0179I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5AHH2sQQcMGkJ516CXVIK9994Rgp/Pu8zGji6/1408joATsfqoCUYIDcb8nCjjJl3TfFG+zMfCtU7JdA0+huXlYjGa/e5wLMu9jTMCXHlm50lr4v4eNxYZHJQRaTLqo+cXbMWxO7GHoptMZXEyB7JxSnbOjMzZb01VxbxOA+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfJ56tuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2F7C4DDE2;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=3nHjQ8geF8c61rNg0mCqn4/A6dXpqr7qrJ7QmC0179I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfJ56tuAN5FTksuu5gk/A3vUZlyYzTzIsNZVIsRwPooHWxtQMVjgufOkiYg5njjyq
	 0Vp4OHdFyLZaeatEIa943wEvB4T2brHNifoYIv0DCncnt3dk8dR69/1mYTTSXsEI4A
	 +7xLYpHYHyvzSrn2FcXHO72NXW65s23dPmz2ipv5gb5MDdaau4QqF4SgUXxmC7zp0W
	 MPQOwbl+W0E80PGzGyKP0iWmP12A2QpdktKesXsuXpbhc7BpV1WjSjKTCVU6NTTsvH
	 qMoZIXrzvrVpIzSZ2GhBOZ96TlRB0P8On3dthqYqt1xHbj8fm0knfO/x9CUYhol+FH
	 plMro2YdeN7IA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CL-1a1f;
	Mon, 06 May 2024 17:10:16 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 07/13] mfd: pm8008: drop unused driver data
Date: Mon,  6 May 2024 17:08:24 +0200
Message-ID: <20240506150830.23709-8-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c client driver data pointer has never been used so drop the
unnecessary assignment.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-pm8008.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index a04bae52a49a..c7a4f8a60cd4 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -169,8 +169,6 @@ static int pm8008_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	i2c_set_clientdata(client, regmap);
-
 	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
-- 
2.43.2


