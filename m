Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A52625DCE5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 17:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730675AbgIDPLt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 11:11:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:57188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730220AbgIDPLt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Sep 2020 11:11:49 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 628C22073B;
        Fri,  4 Sep 2020 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599232308;
        bh=JZ4eSwyutwPbx/K38OfUbGJt+IvpOFygmGAFH4BK5MI=;
        h=From:To:Cc:Subject:Date:From;
        b=uwK8OiImRJL5gm4FDZIvMdGK0vLCRQ/lvRyiequ8KuI+0eKuM4TxOxYpJaOjaFJ+2
         Y9Q6F82zhIQbutwGIMb6+oRbx1aqzha6Nd1YXmuzMCKukJqz0zCRrlQS9Coy0otsNT
         qjvwFiffKZAa299HXNwBHLxL+8LT2F+i6pBtNRFQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [GIT PULL] dt-bindings: gpio: fsl-imx-gpio: Cleanup for v5.10
Date:   Fri,  4 Sep 2020 17:11:39 +0200
Message-Id: <20200904151139.18715-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

These were on the list for some time. They got review from Rob so I guess they
are good to go via subsystem tree.

Best regards,
Krzysztof


The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/imx-gpio-5.10

for you to fetch changes up to 8c0aa567146b1df5e74f732cd4c2aee376d8c082:

  dt-bindings: gpio: fsl-imx-gpio: Add power-domains (2020-09-04 17:04:38 +0200)

----------------------------------------------------------------
NXP i.MX GPIO bindings for v5.10

Few NXP i.MX GPIO controller bindings cleanup.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      dt-bindings: gpio: fsl-imx-gpio: Add i.MX 8 compatibles
      dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges property
      dt-bindings: gpio: fsl-imx-gpio: Add parsing of hogs
      dt-bindings: gpio: fsl-imx-gpio: Add power-domains

 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 43 +++++++++++++++++++---
 1 file changed, 37 insertions(+), 6 deletions(-)
