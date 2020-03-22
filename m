Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8195018E7A6
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Mar 2020 09:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgCVIut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Mar 2020 04:50:49 -0400
Received: from lists.nic.cz ([217.31.204.67]:50678 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbgCVIut (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 22 Mar 2020 04:50:49 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id B45BD1431AC;
        Sun, 22 Mar 2020 09:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584866519; bh=c0iPGSVbnihz9NXe7Ea3L/zunHsBs5zNbe8yF1Z9MTc=;
        h=Date:From:To;
        b=kHRnaUu95r1Zr748P/qaDkUC2Bw39+3oFPa2xmReRrnP3Rwwf+XTramVmHBu+ap+R
         Zdm1QoRBd3JRWq+KCt40YFF+VzhJ3FehlfmUeo/pQz1EW4uIE2fw4SyRS0UAMX8Qt8
         4bQUfTo4QV3rL648/OAkVOmfAA0LawlcKuQAbpDY=
Date:   Sun, 22 Mar 2020 09:41:56 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: REGRESSION pinctrl armada-37xx
Message-ID: <20200322094156.0ab534c1@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,
I am encountering a regression caused by commit 
06e26b75f5e6 ("pinctrl: mvebu: armada-37xx: use use platform api").

The pinctrl driver won't load with error
[    2.374219] armada-37xx-pinctrl d0013800.pinctrl: invalid or no IRQ
[    2.381309] armada-37xx-pinctrl d0018800.pinctrl: invalid or no IRQ

I just spent several hours finding this, because it caused some weird
bugs for devices using gpio as irq source.

Either platform_irq_count should get fixed or we should revert this
commit.

Marek
