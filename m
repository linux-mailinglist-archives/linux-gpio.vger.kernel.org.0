Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05AD04D3A8C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Mar 2022 20:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233517AbiCITqB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Mar 2022 14:46:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238001AbiCITqB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2022 14:46:01 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2ECB74
        for <linux-gpio@vger.kernel.org>; Wed,  9 Mar 2022 11:45:00 -0800 (PST)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MwQKp-1oJrkE37qf-00sNtT; Wed, 09 Mar 2022 20:44:43 +0100
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/2] gpiolib: of: Introduce hook for missing gpio-ranges
Date:   Wed,  9 Mar 2022 20:43:44 +0100
Message-Id: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:8Z2LArKHTLFerCSWr2QMCIYnjownib6pqhn0/2gF7LU3ZqtZ1zd
 LVyg2rShFXcBXaG4E1ZmtJRktbEWchbUzuzgYWDt5gmKI4Yo5fIYmmkT2kGLddLvqut6P59
 vVqrinGzdZNhBOqiTwvkoKUukM2Oi5w/wpP90QyeYPikAgZvRoT5xMzSt+VSMrp4Pm9lCwp
 JgpL4qPTd3twp59TsLziQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rWvp9cFklYk=:TCGlv5CHqsesb4S+W0QGwv
 qHX1SEXZ0B6odHVJmd/s0cM+Obo5tPjWjRX4OUbYn1wFO0Y4ApouHPLYIoMgJTfKQGepaad7I
 nKqmV5wgpsld19qIXIxAaq6njP5W343YditEuY1S85h2Dglb6jxlbxvYV6HEiyGAhYjhaOfwP
 ZJSqQ6AKFwKwrPQYOlYpHA8oA6OczC7gitBSmXJVYhXL1CGfRBCN0jonSyK8SoCpwuvGdrkiB
 qWTVfD7wh2yjAk2Y2p3PhAOCrtV9Lw4yTJA+n7qwD9eFDw9F0Bx4s/xe847Q5GuSyUuvWmI4/
 sEMtpgGhh3ygIAelljYrnKGSGu9G842MTcTgiN98bbbO3UNHvgovw/Af4CzdYMpEtb2qWNKbX
 4xG7NJgmPBySmCAPrJwBX53nil14a7LMummoNlDVu8cE338mGY1KlA1+diJggobz7wkjfvYIc
 YH3XfxkNiTyNjPqQmtuaKZ4wqOfgry8cIx+I3jffLMzWpB0WVGLc/a+Xcufkleqoh+7vfr3mD
 ln0p+j/iIFJ7bj4WIvre7XDZebqtn5HjqnOSvTLEaeOyah6m/B2eNQ5Ay7YxChcxJtReIItfZ
 tbxGCCaBH+LMI/yJ0exBnLhAnwoFKLiIzCIrjg8cfHOpLLniEEAIOD9ALOgMoWuTs2B0Wl69V
 pfPA5T3oKXENzPnic5mT0jc7TammekgEUlKksRRwBKWZbsgLQB+eGwstRx2Pg93b93u0GjLfz
 Z8StFCY59lYh8TSi
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series tries to provide backward compatibility for DTB which
lacks the gpio-ranges property.

The commit ("pinctrl: msm: fix gpio-hog related boot issues") by Christian
Lamparter already contains a fallback in case the gpio-ranges property
is missing. But this approach doesn't work on BCM2835 with a gpio-hog
defined for the SoC GPIOs.

Based Christian's on explanation i conclude that the fallback must happen
during the gpiochip_add() call and not afterwards. So the approach is to
call an optional hook, which can be implemented in the platform driver.

This series has been tested on Raspberry Pi 3 B Plus.

Stefan Wahren (2):
  gpiolib: of: Introduce hook for missing gpio-ranges
  pinctrl: bcm2835: implement hook for missing gpio-ranges

 drivers/gpio/gpiolib-of.c             |  5 +++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 18 ++++++++++++++++++
 include/linux/gpio/driver.h           | 12 ++++++++++++
 3 files changed, 35 insertions(+)

-- 
2.7.4

