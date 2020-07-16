Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD98222D98
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgGPVRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:17:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:56798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727771AbgGPVRx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 17:17:53 -0400
Received: from embeddedor (unknown [201.162.240.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4451720760;
        Thu, 16 Jul 2020 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594934273;
        bh=fl1M7KHJ6l6iSD5rSUZXrn1j+ZTdSGkBJT8qw0W0aV8=;
        h=Date:From:To:Cc:Subject:From;
        b=QzHl1kwGgmnLUBfSLRD17xkzonCsUImNvS+Y6vY0WCWOfENLRZgMbl4EjNdoheJwF
         /zgVdBHiRfOq9OHpLBfUou8VouyIvV8uIHuAv2NT6WBE9gQ574IH2MK8TkXcf2blHv
         7L8OZIyW1cuQoTCj4I2k1AO5iJcdrEKAsnE/NTzg=
Date:   Thu, 16 Jul 2020 16:23:17 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] pinctrl: single: Use fallthrough pseudo-keyword
Message-ID: <20200716212317.GA17754@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e6d1cf25782c..132b36ef5d83 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -560,7 +560,7 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			case PIN_CONFIG_BIAS_PULL_UP:
 				if (arg)
 					pcs_pinconf_clear_bias(pctldev, pin);
-				/* fall through */
+				fallthrough;
 			case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 				data &= ~func->conf[i].mask;
 				if (arg)
-- 
2.27.0

