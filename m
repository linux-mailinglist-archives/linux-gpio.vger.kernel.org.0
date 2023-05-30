Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C1D7166DA
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 17:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbjE3PUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 11:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjE3PUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 11:20:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C312EC7
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 08:20:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418d-0007zm-KT; Tue, 30 May 2023 17:19:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418c-003uGX-It; Tue, 30 May 2023 17:19:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q418b-009XZl-Lk; Tue, 30 May 2023 17:19:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v2 0/2] gpio: introduce hog properties with less ambiguity
Date:   Tue, 30 May 2023 17:19:44 +0200
Message-Id: <20230530151946.2317748-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wiI74e46ToWHZc/6ArbrTrYVH4iGdfuKtXso1nG5FLs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdhQA++q78TcFbOUXN57P/8g0FuP9WF5sfuwzZ OEauF+GOLaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHYUAAAKCRCPgPtYfRL+ TvX+B/913rRAOd36p3+tdaHmShzFshqd2HddX4VTqsprTW8wSjA4926VYIZfevmypYshVDt0kFx j0ZHuCKVjix64ioUR/xqigdOddTzMbt47eBlap1POLJ+8FgmTNyiFnbtzaTkziVnYms2V0WUm59 xYNbkmynuHH8OtW5UvtLijmsAu48ahEv4PfM15hHWQrxJeQHc/F/oiMmbGv7onTvqp3JCoYpTSb Psf9Yp8NNPiIELRt+skmO2tU9PGZhnYWZGwd1c0HYDWP6Fq7wXRYUm1WP49plEQKWWik9phmQgL PEvFu5tsGVQ+j5qzfl1HXw7v2RpxZTcX4Xb6NfjFjC6xL16t
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

this is another approach after
https://lore.kernel.org/linux-gpio/20210503210526.43455-1-u.kleine-koenig@pengutronix.de
two years ago. I switched back to "active" and "inactive" from
"asserted" and "deasserted". The poll about the naming is ambigous, but
I think with a slight preference of active/inactive over
asserted/deasserted (with my unbiased self preferring active/inactive,
too :-)

Rob Herring acked patch #1 and Linus Walleij acked patch #2 of the
asserted/deasserted variant back then, I dropped these as the change is
too relevant IMHO.

In the previous post I had some inconsistencies that should be gone now.

And Andy wrote:
> I like the idea (with active-inactive terms), but...
> 
> It’s a half baked solution. Please use fwnode to cover all possible
> providers.

which I didn't address because I want to change what is currently
supported and not introduce new support. Adding fwnode is orthogonal to
this renaming. I didn't find any other more general implementation that
would affect more than "of" for output-high and output-low. Please tell me
if I missed something.

Best regards
Uwe

Uwe Kleine-König (2):
  dt-bindings: gpio: introduce hog properties with less ambiguity
  gpio: use "active" and "inactive" instead of "high" and "low" for output hogs

 Documentation/devicetree/bindings/gpio/gpio.txt | 16 +++++++++++-----
 drivers/gpio/gpiolib-of.c                       | 10 ++++++++--
 include/linux/gpio/consumer.h                   | 14 ++++++++++----
 3 files changed, 29 insertions(+), 11 deletions(-)


base-commit: 8c33787278ca8db73ad7d23f932c8c39b9f6e543
-- 
2.39.2

