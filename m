Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74E52BB342
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 19:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730354AbgKTSbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 13:31:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730172AbgKTSbj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 20 Nov 2020 13:31:39 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4EF9924137;
        Fri, 20 Nov 2020 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897099;
        bh=Xip7ipBVWfBbpRD8RhvPtfIFv2Vp9Nnuwl1m0NubIPU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N8bapkAjVxAq992p1LQFFEjvmzbVSLbYef8OxqDd8fQIqBflYeIPv3ofWautfb0Qh
         bHipkuwyOw+ZJneI94FblWjlJdhcbcemxm6uFV3vecpDb40PRl1c5HiQD+S/GtTCvg
         SN22LyfBS6qO3ev4+Z5PNrYgNAU7aqLNrWHV8bGI=
Date:   Fri, 20 Nov 2020 12:31:44 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 049/141] pinctrl: Fix fall-through warnings for Clang
Message-ID: <da20103af0c22424c5d08a12f7107771bf4c01c5.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 15dd007700c2..10020fe302b8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -931,6 +931,7 @@ static int rza1_parse_pinmux_node(struct rza1_pinctrl *rza1_pctl,
 		case PIN_CONFIG_OUTPUT:	/* for DT backwards compatibility */
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			pinmux_flags |= MUX_FLAGS_SWIO_OUTPUT;
+			break;
 		default:
 			break;
 
-- 
2.27.0

