Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5E154BBC1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 22:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352859AbiFNU3a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 16:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357840AbiFNU31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 16:29:27 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A014E3A9
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 13:29:23 -0700 (PDT)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MrQR7-1nPNNG2hjr-00oTPi; Tue, 14 Jun 2022 22:29:05 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Phil Elwell <phil@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/2] pinctrl: bcm2835: Make the irqchip immutable
Date:   Tue, 14 Jun 2022 22:28:29 +0200
Message-Id: <20220614202831.236341-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:did/W7HY9pdHK/XGpjhcj7VKZ+OID72flMf6GJwFq5uZMzag9du
 y61NvsySydc2G2RJPzeB6S/NCpvTuPR0X+WqOfxlDTmDvqp2gDZ3p7bK+PdrBfnf/oVW/X2
 KzGQqunM9rrGP2vLCrxqszOkxtaNyspmsAe/VsB+rQnyKm/XcKu4DoMnH7FoPVnkNMQgPti
 Go+033aokeTkle011WXcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:R3hFPouP7w8=:0T7ZAcExEAK4LYlq0IN/p6
 f8O00woUWetNEZWGLsCmgAElWXRBuPPTLLsj4yAcKxRx2f8Wj904KU30OmhZTL7S1bL0PfFfP
 L5Cpwi+uooS4y/zS0XzqLkCyQg7i8IY3j7mbct4hM6EePA/RQ+ZC1hoOMnS+rrqdtyDQXARKP
 wlhFoe0XJpJu9QKJe6ZmzxyGchAlVKtR9E59jfUx6vJ2dGT0qrEPu3scU3MfsiQm5sIlhHxSY
 y4nb/iixEjo8bAqqN3R4fMg65TfzA0ftwAlEGdIeAccAQzvlMPmdpbj5ElrJSxkySzELEfSSD
 ud9qxvMQN5QKJ2A+p6vqMflmNbv/TPFsL8eqyUOrddPXQN29BjOWTHe3ZGWtXk+wMZqZXdagg
 nsGlmSinD5qCgiulZ/NI2kN+OwOI1jyOATOsStzImyGWtlF21gAZ1OLrh261VT6OEFKEDN+Fh
 DcW1P3YeIC+FJd/bSqGgxEZq2lzRS831hbrK1QseBbEyCk39QtoDHFTZIpM3wo71o/ExgU2O/
 wKD9i4jwoGGajfMQ/GB5/6WaySETaRH4ZIS0OdNJ6pV9cq9ZTOqg6RC/M4f6durRsfLGs86JU
 amg/Mf7doPcjjq44tDXQcOLP53xvYTBkk+LoyxZStcDhjhjrx57AOo6CLMP4sFbr+B8HzURvG
 8GitxyiTAPs2hIbW8YKg7HpZj0r1FfZ0Sg9j+JuNmSthMcZa4nAzUJB5/O0WtOIJ6hSMMpOg/
 T11Z5uXgVI/oStFYmLu/O6SlTeQ6U64DccTidWFhjNPLG6AF6hI1f5PFofs=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This small series makes the irqchip in the bcm2835 pinctrl driver immutable.

Changes in V2:
- add patch to drop irq_enable/disable callbacks as suggested by Marc
- add missing GPIOCHIP_IRQ_RESOURCE_HELPERS found by Marc

Stefan Wahren (2):
  pinctrl: bcm2835: drop irq_enable/disable callbacks
  pinctrl: bcm2835: Make the irqchip immutable

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

-- 
2.25.1

