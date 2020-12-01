Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBBD2CADB4
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 21:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbgLAUrj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 15:47:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:38094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727499AbgLAUri (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Dec 2020 15:47:38 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A049020679;
        Tue,  1 Dec 2020 20:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606855618;
        bh=LS9GMj1n/eN9UUkw9Zp0KOc3sLANUmSLj7BKgmogZsk=;
        h=From:To:Cc:Subject:Date:From;
        b=p3D/0N30oQlLVeYvJJeVU5+gipd+j9b/sShzBxybUCcZUqWT+UOqAGjKYPoq06wQC
         rnl2UrvqCpLxehpj58Dhdxbpzs8ixrL4ou75ln1VdeM8S2fIyk0XNlpQAfZBeAXbZo
         1IfeDtTo4/Faa6mhcBX95WMnPiSmUnCoNwYxoXOg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: Pull for v5.11
Date:   Tue,  1 Dec 2020 22:46:52 +0200
Message-Id: <20201201204652.22913-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.11

for you to fetch changes up to c5564a50d99019f3c713fa306d5feecc3e909b10:

  pinctrl: samsung: s3c24xx: remove unneeded break (2020-10-26 20:23:29 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v5.11

Only a cleanup of unneeded breaks.

----------------------------------------------------------------
Tom Rix (1):
      pinctrl: samsung: s3c24xx: remove unneeded break

 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 5 -----
 1 file changed, 5 deletions(-)
