Return-Path: <linux-gpio+bounces-7457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D28908EBD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 17:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6FA0284574
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F2C49649;
	Fri, 14 Jun 2024 15:28:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B7225D9
	for <linux-gpio@vger.kernel.org>; Fri, 14 Jun 2024 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378936; cv=none; b=o61aHJ7JypahXrpYzbCx5RqA6CqyuaDMmb+Ao7xbrMb4QZ8BdooNKjDr4WWP8bxi/o6AtNUBaBz+QWCYbE753jKBnRWurh5GaN7DB34Ri/jdYBcLsvd4M7oex+HoacMhSZf7Me2IeqXrfFJ8EsMF3ya6lj2PHs30hCJ7QS/rxKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378936; c=relaxed/simple;
	bh=E9KjxTSFdzQOgjiZEmWKGeer3n0xUqTpmHV9ZcwhZq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CzR4n0VLhCG2LezSKJ+4cm3ePkQNBgkiarzLsA+BIWAoem8NTXXUbQEO32vbHjiqanMKQxgo9ZzgqvHnm3ys3RJtE66EwO5MmST3S8VjNlCxHhPCvWBlwwaB7jn9vCwYWJKzNy4dacVTE2a6ZA85wxZkeETTSGr3zsDuqePFS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:be2a:f066:50f0:dff7])
	by xavier.telenet-ops.be with bizsmtp
	id bTUs2C00H3w30qz01TUsVL; Fri, 14 Jun 2024 17:28:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8qA-00Ce8v-54;
	Fri, 14 Jun 2024 17:28:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sI8rE-00FqKr-LE;
	Fri, 14 Jun 2024 17:28:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: r8a779g0: Remove unneeded separators
Date: Fri, 14 Jun 2024 17:28:51 +0200
Message-Id: <2375711d5edd03a209b4ed996f136e1f3c649773.1718378859.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usually there are no separators between alternate functions.
Remove them to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This removes the separators still present after "[PATCH 0/8] pinctrl:
renesas: r8a779g0: Fix pin group suffixes"
(https://lore.kernel.org/r/cover.1717754960.git.geert+renesas@glider.be)
---
 drivers/pinctrl/renesas/pfc-r8a779g0.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779g0.c b/drivers/pinctrl/renesas/pfc-r8a779g0.c
index bb843e333c880f91..49b44bdb12505bf2 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779g0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779g0.c
@@ -2099,7 +2099,7 @@ static const unsigned int pwm0_mux[] = {
 	PWM0_MARK,
 };
 
-/* - PWM1_A ------------------------------------------------------------------- */
+/* - PWM1 ------------------------------------------------------------------- */
 static const unsigned int pwm1_a_pins[] = {
 	/* PWM1_A */
 	RCAR_GP_PIN(3, 13),
@@ -2108,7 +2108,6 @@ static const unsigned int pwm1_a_mux[] = {
 	PWM1_A_MARK,
 };
 
-/* - PWM1_B ------------------------------------------------------------------- */
 static const unsigned int pwm1_b_pins[] = {
 	/* PWM1_B */
 	RCAR_GP_PIN(2, 13),
@@ -2126,7 +2125,7 @@ static const unsigned int pwm2_mux[] = {
 	PWM2_MARK,
 };
 
-/* - PWM3_A ------------------------------------------------------------------- */
+/* - PWM3 ------------------------------------------------------------------- */
 static const unsigned int pwm3_a_pins[] = {
 	/* PWM3_A */
 	RCAR_GP_PIN(1, 22),
@@ -2135,7 +2134,6 @@ static const unsigned int pwm3_a_mux[] = {
 	PWM3_A_MARK,
 };
 
-/* - PWM3_B ------------------------------------------------------------------- */
 static const unsigned int pwm3_b_pins[] = {
 	/* PWM3_B */
 	RCAR_GP_PIN(2, 15),
-- 
2.34.1


