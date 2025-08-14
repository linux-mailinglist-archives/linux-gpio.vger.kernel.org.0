Return-Path: <linux-gpio+bounces-24381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43481B26197
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 11:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EAAB188D398
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Aug 2025 09:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B8D2F3C3C;
	Thu, 14 Aug 2025 09:51:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46731A317D;
	Thu, 14 Aug 2025 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755165065; cv=none; b=Oc+copms6yKihVDPxjEyaYh9Qk3a4K8YaJ66e15PWBLl2HcIEEabf7J3d7ufwaMT6gxBbV34jBcrvkO/wdCD+9AXyyZa/JHoI0ad72+HlruVo2ndMBlzmI656Nph+n+WYn7RnZvwbOD4zIMp893Fj8vGFahJgToEu351CWObGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755165065; c=relaxed/simple;
	bh=hdhEnb54ZO+MOXtghjX4y1UpSsnN7MEoUiPcwKkVOpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfbgD4QXQcafAvy0SF38ssg7+Ig4qZ9dL1KXQlCUX/bJ9Ege0rLAOdOxNwy0YL4ULdwADRSlSXxuHJFy4Emb1FljrL2iRvC3o/b5kPVA60+ImpKbKWaZOb6kzZhz1TiVgxAJ5wxZmaOwOoL8JAzPp9l3yIZBFL6tnwB6eONjibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1157CC4CEED;
	Thu, 14 Aug 2025 09:51:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rza1: Make mux_conf const in rza1_pin_mux_single()
Date: Thu, 14 Aug 2025 11:50:55 +0200
Message-ID: <470389b1411074f0da2cef8c6c3531f16aba6589.1755164114.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rza1_mux_conf object pointed to by the mux_conf parameter of
rza1_pin_mux_single() is never modified.  Make it const.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This has a small conflict with "[PATCH v4 09/15] pinctrl: constify
pinmux_generic_get_function()"[1], which I have already acked.
Perhaps the best solution is for Bartosz to include this in his series?
Or I can resend an updated version for LinusW to apply after Bartosz
series has handled?

Thanks!

[1] https://lore.kernel.org/all/20250812-pinctrl-gpio-pinfuncs-v4-9-bb3906c55e64@linaro.org/

 drivers/pinctrl/renesas/pinctrl-rza1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 23812116ef42682d..4613d2c8cccc1dab 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -669,7 +669,7 @@ static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
  * @mux_conf: pin multiplexing descriptor
  */
 static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
-			       struct rza1_mux_conf *mux_conf)
+			       const struct rza1_mux_conf *mux_conf)
 {
 	struct rza1_port *port = &rza1_pctl->ports[mux_conf->port];
 	unsigned int pin = mux_conf->pin;
@@ -1119,7 +1119,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 			   unsigned int group)
 {
 	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct rza1_mux_conf *mux_confs;
+	const struct rza1_mux_conf *mux_confs;
 	struct function_desc *func;
 	struct group_desc *grp;
 	int i;
@@ -1132,7 +1132,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 	if (!func)
 		return -EINVAL;
 
-	mux_confs = (struct rza1_mux_conf *)func->data;
+	mux_confs = (const struct rza1_mux_conf *)func->data;
 	for (i = 0; i < grp->grp.npins; ++i) {
 		int ret;
 
-- 
2.43.0


