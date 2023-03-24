Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36486C829C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Mar 2023 17:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjCXQuG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Mar 2023 12:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjCXQuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Mar 2023 12:50:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FC2F766
        for <linux-gpio@vger.kernel.org>; Fri, 24 Mar 2023 09:50:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfkc4-0001sE-VX; Fri, 24 Mar 2023 17:50:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfkc4-006QTt-2f; Fri, 24 Mar 2023 17:50:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pfkc3-007faJ-Eh; Fri, 24 Mar 2023 17:49:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 0/2] pinctrl: mcp23s08: Implement gpio bulk functions
Date:   Fri, 24 Mar 2023 17:49:55 +0100
Message-Id: <20230324164957.485924-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=551; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kzYeglOBaOTq7TpshpK5Q0B7i4AhtII6KEZ0mSQuvUs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkHdSyusX4TYU/pv04dHwdY9ajfD/uaovGEeKcN 6b6wkmtq9WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZB3UsgAKCRCPgPtYfRL+ ThjdCAC57A/320L2ZUnKM4EiwUeggh67w+ZgQFZ6bs8Y6fO8c5rpwfxKhrSW6poAPB4NTCEZM0Y Jk38lcTFcHT55F4IhC+1yYH7rXDSCP1c2Ip5pR3q6k6gg0/XGIMZYBS/ppUF9BTiMuKFzcxJu3q 4/CplkkynJgg91oe7CW64jlumFPDq0673Wrcm90fIxgVEgZVqCsYh4mY1vjAoOdsFjrhnXmdNTA Iw6wZ7YIUujVr2A3PATM7NBHDxISViuEbQ6XLAlE6DThaJ5Ko8kUbip5en0/3hG67tlzgRzvZyz SqcVZM8BhUhgDI0lR/2aVWVsyugcGpH5yKUW17DWp2dXVy5N
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I just found an uncommitted fix to this series in my working copy ... So
here comes a v2. (ret in mcp23s08_set_multiple is unused and so must be
dropped.)

Best regards
Uwe

Uwe Kleine-König (2):
  pinctrl: mcp23s08: Rename and change function that wraps
    regmap_update_bits()
  pinctrl: mcp23s08: Implement gpio bulk functions

 drivers/pinctrl/pinctrl-mcp23s08.c | 45 ++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 6 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

