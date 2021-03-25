Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BDA3491EE
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 13:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhCYM3e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 08:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhCYM3V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 08:29:21 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6896C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=IOdMP1Fd8w8HfaeQ5Eg6DNJzYGqcRl+YXQjx+Aj5AdM=; b=TLiklu/ynzak7XGyouTEGuq/+t
        ZIzNzBqlbz0aznjLMTd+5sqtPaPTSvuNlWR/HUFpvbD62iJ1J3ac1pOUNEh92NSE8ijS/ff5rICD2
        zCq55fkfaCXi6G9+nBD4VKZ+y4CFbiTSxHrSxtW2LL6yxyoB0KsF9C0fIchvTlz3S7sbPkiEZxQVI
        gjeS5SAjJonsujbLEBwmCVFgUSF/4YgwW7RN4BBC97tU8+J3xJ8AsGeSeu006Oe2xxkcDWEL8Y1Yp
        fjJpCjSxUmPO/l8zrFmZD51wnhjTS8xCtOiCk8Tb92dK1DVNhhRaqvbxqyyy5J20I94Y3FEUNFeCF
        W7WjMblg==;
Received: from 97-173-191-90.dyn.estpak.ee ([90.191.173.97] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1lPP6y-00034Q-GZ; Thu, 25 Mar 2021 14:29:17 +0200
Received: by ubuntu (sSMTP sendmail emulation); Thu, 25 Mar 2021 14:29:13 +0200
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     linux-gpio@vger.kernel.org
Cc:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, geert+renesas@glider.be,
        Mauri Sandberg <sandberg@mailfence.com>
Subject: [RFC gpio/for-next 0/2]  gpio: add generic gpio input multiplexer
Date:   Thu, 25 Mar 2021 14:28:30 +0200
Message-Id: <20210325122832.119147-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.173.97
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I obtained the list of people in CC: after discussions with Drew Fustini and I
hope I am not bothering any of you. Here I am sending for review a couple of
patches that add a multiplexer that uses a GPIO pin as its output.

I welcome all ideas how to improve this or, more importantly, pointers if
similar can be achieved with something that is already present in the kernel
code.

Thanks,
Mauri

Mauri Sandberg (2):
  dt-bindings: gpio-mux-input: add documentation
  gpio: gpio-mux-input: add generic gpio input multiplexer

 .../bindings/gpio/gpio-mux-input.yaml         |  55 +++++++
 drivers/gpio/Kconfig                          |  11 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-mux-input.c                 | 143 ++++++++++++++++++
 4 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
 create mode 100644 drivers/gpio/gpio-mux-input.c


base-commit: 7ac554888233468a9fd7c4f28721396952dd9959
-- 
2.25.1

