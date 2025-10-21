Return-Path: <linux-gpio+bounces-27346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F1BF5267
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 10:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99BE03A3CA8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 08:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487DF2E9EDD;
	Tue, 21 Oct 2025 08:06:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDBA2E8E0C;
	Tue, 21 Oct 2025 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033970; cv=none; b=TiUVJP2LOzOiVMk1RXknX2wK94qKXDCLHka4JskFeT35VPZX9F6cbosADLnhiSOG3UPLFvWBaCiFVU5iRHb3ExKuqtoqeSBLwFXfKRQcJH7oQbHtoF4msu5FISwUvfLloN8VQ0oKzyAAFrlnohBGrHBC0Tkr/Rg+eH65ghd/H5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033970; c=relaxed/simple;
	bh=N+UBxgEfFV4F2I/XWA9Ic1gx8435iNi6PR+Q4ZVk2wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sy8xLq97HjnEKODmwm2x19EfU44lbggi/OGj7f8f3pGxSLtoHEz4swWbYe0sTv2WT/sCMDKoKCcd9I4jw19xZIoAkXNVCxn86yoV5/hRd2aRRHulE8pM2l8bdfYd71F7TOpDiRLDNCJ9aHC4KiyqwMHOEs4yXyb7tvQdiDFLktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EE2C4CEF1;
	Tue, 21 Oct 2025 08:06:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] pinctrl: renesas: rza1: Make mux_conf const in rza1_pin_mux_single()
Date: Tue, 21 Oct 2025 10:06:05 +0200
Message-ID: <168e06bc57081aa3c42ff9aa2740a0a108df7d34.1761033950.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The rza1_mux_conf object pointed to by the mux_conf parameter of
rza1_pin_mux_single() is never modified.  Make it const.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
To be queued in renesas-pinctrl for v6.19.

v2:
  - Add Reviewed-by,
  - Rebase on top of commit fbba4a9e368f6ec5 ("pinctrl: constify
    pinmux_generic_get_function()") in v6.18-rc1.
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 4c7326e3de07ce38..3cfa4c8be80eafd5 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -668,7 +668,7 @@ static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
  * @mux_conf: pin multiplexing descriptor
  */
 static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
-			       struct rza1_mux_conf *mux_conf)
+			       const struct rza1_mux_conf *mux_conf)
 {
 	struct rza1_port *port = &rza1_pctl->ports[mux_conf->port];
 	unsigned int pin = mux_conf->pin;
@@ -1118,7 +1118,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 			   unsigned int group)
 {
 	struct rza1_pinctrl *rza1_pctl = pinctrl_dev_get_drvdata(pctldev);
-	struct rza1_mux_conf *mux_confs;
+	const struct rza1_mux_conf *mux_confs;
 	const struct function_desc *func;
 	struct group_desc *grp;
 	int i;
@@ -1131,7 +1131,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 	if (!func)
 		return -EINVAL;
 
-	mux_confs = (struct rza1_mux_conf *)func->data;
+	mux_confs = (const struct rza1_mux_conf *)func->data;
 	for (i = 0; i < grp->grp.npins; ++i) {
 		int ret;
 
-- 
2.43.0


