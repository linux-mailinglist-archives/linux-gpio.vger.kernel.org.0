Return-Path: <linux-gpio+bounces-24870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F9B332C8
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 23:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00AF917F928
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 21:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A0B24A066;
	Sun, 24 Aug 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV0lG5Ra"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80A421FF2A;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756069526; cv=none; b=Mk5JjMdMXarsyES7HLZU62yBq+UfmzEgFraQ7Yk7whkRd+qagqfOvyD82i4CC2awDsRRJg6e4fQJpluLaF/bx1OmTZORFVyuH7C61/8gYWIlUs3CtAawx0bpF2HPUhbSu4hkISibbGeFJHCrHv2D/wbSL1Dc81114pfy0tXxe6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756069526; c=relaxed/simple;
	bh=5VUazREVDtfkEJZkms2RrEeXvbQ0KQvMondMafy0oK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkFgBiYeHyTCDTCQMl5cyVTh7IA3nJToQbjU6j763m3233MoIEC9gKnYTzKvIs6KWEffjCToEQjZBCAnwg0oEKTU9i7hEst7QmkixxXLjXSqmE/Q5NN40hXQxyInxRCKxGBVt9Mot26i4efDHzprBWTvLxCOPcppKKSdFU3ymLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV0lG5Ra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C605C116B1;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756069525;
	bh=5VUazREVDtfkEJZkms2RrEeXvbQ0KQvMondMafy0oK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DV0lG5RauJ/5nXRVd341aT/66VJpClAcLYL4wXv94cb5xbkM7N1Dh6WvejL3S1X3Q
	 UGbPWKBYOF6KRPsA7gIJCuPWCpicfG1NaFJe/naQCYZSb9t6nPfTFou7oRKDJRbxFH
	 xLnGfbIZO389RNrouVLDY0BsEprFnhUKVxpQ0bNz0wneIRofyyUYWnd+axhwkDhfRL
	 +dDLqaG+bk4GJI1Zj9FOXz9EoQX+W9lNWos0MibrHOFsBdL3wR9dVQXTwHeeK8/UZO
	 Q+2OG6gni6iRc/14Fax+vezYhu5iwvpOu5eK9UoQFdhB51TtlUWvE5VNHzpHr8CVyu
	 nsw6fZqKv40QA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD61CA0FE1;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Mon, 25 Aug 2025 00:05:24 +0300
Subject: [PATCH v2 1/3] pinctrl: qcom: lpass-lpi: Introduce pin_offset
 callback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-sdm660-lpass-lpi-v2-1-af7739f5c27e@yandex.ru>
References: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
In-Reply-To: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756069524; l=8823;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=hzvm5B4s4jHkIJ54rtQ+EQO71zBfGIsLhAluQCNnkIs=;
 b=60orG+cHiHe8UtlWEDS6fCwftM52uVvtCSejp+j5NyzobBnoY7H50sFFUAaDINaYm9q1vhMvp
 zlRxtx7wDOoCT1En91OjMl+ZAkrWfVPCoOhpyojN9RBA6RtxQ0em9Lz
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

By default pin_offset is calculated by formula:
LPI_TLMM_REG_OFFSET * pin_id. However not all platforms are using this
pin_offset formula (e.g. SDM660 LPASS LPI uses a predefined array of
offsets [1]), so add a callback to the default pin_offset function to
add an ability for some platforms to use their own quirky pin_offset
functions and add callbacks to pin_offset_default function for other
platforms.

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.7.2.c27-07400-sdm660.0/drivers/pinctrl/qcom/pinctrl-lpi.c#L107

Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          | 13 +++++++++++--
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h          |  2 ++
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c |  1 +
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   |  1 +
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   |  1 +
 11 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 57fefeb603f0e2502fccd14ba3982ae3cb591978..8ba0ebf12d8113cdc501e9fe97311ec0764fbef5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -38,16 +38,25 @@ struct lpi_pinctrl {
 	const struct lpi_pinctrl_variant_data *data;
 };
 
+u32 pin_offset_default(int pin_id)
+{
+	return LPI_TLMM_REG_OFFSET * pin_id;
+}
+
 static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 			 unsigned int addr)
 {
-	return ioread32(state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+	const u32 pin_offset = state->data->pin_offset(pin);
+
+	return ioread32(state->tlmm_base + pin_offset + addr);
 }
 
 static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
 			  unsigned int addr, unsigned int val)
 {
-	iowrite32(val, state->tlmm_base + LPI_TLMM_REG_OFFSET * pin + addr);
+	const u32 pin_offset = state->data->pin_offset(pin);
+
+	iowrite32(val, state->tlmm_base + pin_offset + addr);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
index a9b2f65c1ebe0f8fb5d7814f8ef8b723c617c85b..3a2969ac85410e9fb796ec792d1349822257b3a0 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
@@ -85,9 +85,11 @@ struct lpi_pinctrl_variant_data {
 	const struct lpi_function *functions;
 	int nfunctions;
 	unsigned int flags;
+	u32 (*pin_offset)(int pin_id);
 };
 
 int lpi_pinctrl_probe(struct platform_device *pdev);
 void lpi_pinctrl_remove(struct platform_device *pdev);
+u32 pin_offset_default(int pin_id);
 
 #endif /*__PINCTRL_LPASS_LPI_H__*/
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index 1161f0a91a002aaa9b1ba2f9ca13e94b2f145ec8..ed0c57fb1ed4770cce4afe7b1f3ec51aa3d44cf3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -125,6 +125,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
 	.ngroups = ARRAY_SIZE(sc7280_groups),
 	.functions = sc7280_functions,
 	.nfunctions = ARRAY_SIZE(sc7280_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4bd88f078cf36091faa9c2c885518..40834242a7699352c63ad2ddc82ca3663a39275f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -162,6 +162,7 @@ static const struct lpi_pinctrl_variant_data sc8280xp_lpi_data = {
 	.ngroups = ARRAY_SIZE(sc8280xp_groups),
 	.functions = sc8280xp_functions,
 	.nfunctions = ARRAY_SIZE(sc8280xp_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index c0e178be9cfc3ea8578a39d8998033058f40dabf..69074c80744663268fc034019ca5523a18ce7f22 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -213,6 +213,7 @@ static const struct lpi_pinctrl_variant_data sm4250_lpi_data = {
 	.ngroups = ARRAY_SIZE(sm4250_groups),
 	.functions = sm4250_functions,
 	.nfunctions = ARRAY_SIZE(sm4250_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index b7d9186861a2ffa9f3c00a660bde00858fff9462..651e52f4c886821ebb8207af3783da87758f1a30 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -133,6 +133,7 @@ static const struct lpi_pinctrl_variant_data sm6115_lpi_data = {
 	.ngroups = ARRAY_SIZE(sm6115_groups),
 	.functions = sm6115_functions,
 	.nfunctions = ARRAY_SIZE(sm6115_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index 64494a86490e2f5d3e00184622f68097bbcdfff0..a693df05c4fdb40750f449a58817e2371e564dea 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -123,6 +123,7 @@ static const struct lpi_pinctrl_variant_data sm8250_lpi_data = {
 	.ngroups = ARRAY_SIZE(sm8250_groups),
 	.functions = sm8250_functions,
 	.nfunctions = ARRAY_SIZE(sm8250_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
index 7b146b4acfdf42e7dd69f1f022c0041b3e45b174..15d453482d68b8b9ae2d572f7538e05f83425a12 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c
@@ -125,6 +125,7 @@ static const struct lpi_pinctrl_variant_data sm8350_lpi_data = {
 	.ngroups = ARRAY_SIZE(sm8350_groups),
 	.functions = sm8350_functions,
 	.nfunctions = ARRAY_SIZE(sm8350_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e924a2a77db7a8b15ccb709e7a53d..629a110963d610fe7b9667ea1abab66338711bf1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -191,6 +191,7 @@ static const struct lpi_pinctrl_variant_data sm8450_lpi_data = {
 	.ngroups = ARRAY_SIZE(sm8450_groups),
 	.functions = sm8450_functions,
 	.nfunctions = ARRAY_SIZE(sm8450_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2654670b07372bd2dd5839baf2979..1ebc93a61e965f8c0d29348586905cb0e38ae074 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -199,6 +199,7 @@ static const struct lpi_pinctrl_variant_data sm8550_lpi_data = {
 	.ngroups = ARRAY_SIZE(sm8550_groups),
 	.functions = sm8550_functions,
 	.nfunctions = ARRAY_SIZE(sm8550_functions),
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d7115e605c54229ba0096b9081636..a6dfeef0f6fa0860f44808a4bb8e5db57d10d116 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -206,6 +206,7 @@ static const struct lpi_pinctrl_variant_data sm8650_lpi_data = {
 	.functions = sm8650_functions,
 	.nfunctions = ARRAY_SIZE(sm8650_functions),
 	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+	.pin_offset = pin_offset_default,
 };
 
 static const struct of_device_id lpi_pinctrl_of_match[] = {

-- 
2.51.0



