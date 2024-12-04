Return-Path: <linux-gpio+bounces-13495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB69E40E7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1609288DB0
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7584421146D;
	Wed,  4 Dec 2024 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCeOhGO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7FD2111A7;
	Wed,  4 Dec 2024 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331636; cv=none; b=bpeduUSHwFQ6TbVaH/1vBBu+cv7yUxlHMMkjYWEYC6K1q7qqKPMMV0F/r8Nd0cLPkdIMuKoiHt4cB112unun2YgAdxY00GeOMTSeFBeXfoUrZRvA7lpr+y1iUBloDwLOyuHhZR3A+X8OabyTFE/yBZiXvhFb9a6zfxQnbbAX+yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331636; c=relaxed/simple;
	bh=4PTzI9SiixNaBPPfu0IX8+a8aPSOijkDtiLpKSS0aaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iLuyRYxUQmBFg2D66dkLHzd06Gd7+uJtmhtd/WEHFkENb9rLtBpFDrNCwbhhEwgfMjdOBrdERxPXHAusqSYTjSld5D8NtoJ2/O2TqXoYTSYihYtAJDqeMjSALC+GK2thvIiqTkyzQ9ePsbldRYBAodZkRt+kr7EeLcNF8ymRe1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCeOhGO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05608C4CECD;
	Wed,  4 Dec 2024 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331636;
	bh=4PTzI9SiixNaBPPfu0IX8+a8aPSOijkDtiLpKSS0aaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCeOhGO3THcKos7bfyi8OxxrGCapAhO3ZNuk9XyDnHTMLRz7qTPbuiAB76JXU9Le/
	 qfKMeNU6FnBs0SgjqN+mGzukZYlhe+AAIo3/Khh8GQMxBrtE8SwxW3MzUYpPxHoTQ7
	 ErOlVtZ8wjfKkqy6+f0wPihwld0kYEDeq6FvxeWHvT2ZPhIoQjcqdMwnGybce8CSrD
	 AXkeufT9yHLoEnm1uhvJggIRKx97Ye0UoYDTEKdcUfVD70Rrpkfn66gwgF3C57tsTj
	 di5BSV1QXdOeXcHVuY/izKYqykwXF0n838y5a2NgtqFAztMjKxOZXFU7sxKzAUeYNh
	 qcMKj0oMWlaXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 26/33] pinctrl: qcom-pmic-gpio: add support for PM8937
Date: Wed,  4 Dec 2024 10:47:39 -0500
Message-ID: <20241204154817.2212455-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154817.2212455-1-sashal@kernel.org>
References: <20241204154817.2212455-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Barnabás Czémán <barnabas.czeman@mainlining.org>

[ Upstream commit 89265a58ff24e3885c2c9ca722bc3aaa47018be9 ]

PM8937 has 8 GPIO-s with holes on GPIO3, GPIO4 and GPIO6.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/20241031-msm8917-v2-2-8a075faa89b1@mainlining.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d2dd66769aa89..79ee60514372d 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1226,6 +1226,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8550ve-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8550vs-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	/* pm8937 has 8 GPIOs with holes on 3, 4 and 6 */
+	{ .compatible = "qcom,pm8937-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
 	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
-- 
2.43.0


