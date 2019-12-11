Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6390111BCE9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 20:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbfLKT2J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 14:28:09 -0500
Received: from mail-vk1-f202.google.com ([209.85.221.202]:38427 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbfLKT2I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 14:28:08 -0500
Received: by mail-vk1-f202.google.com with SMTP id h197so11302vka.5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 11:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=FFYsrl0I4BK8yz9gxBX4VqimpZj53+CX6IzmsB+i61g=;
        b=qjhzPdRkkjH8hezi0iexmvjJfx5lLROsOSgkPxJ0VzJbXxQ/PyflgClhibaTHjBnXh
         m0IF7aG7MoDk/irhKDTOLa/QCUQHReSY3y/iCe2JiJg/NfKW7zgnRw5Uxwqx40t73YLI
         L9TjMcmos2iq+x6f0ASaDj7IvtjyU/OQFwt+AEML3/ZJa0dE3KErVccwMCq+NhjnfSK8
         U3v5wJBmhLrXkHV8XIeZmTjmTf3c2QNJsnCYskZTUotp1LV3et1W+MlhpR0xw5neG4Cw
         ZQUp0OS9LTZ7CtgsV0ulfIoLBGTpEsXW3aKAnZF+9E/HnFFcYp+OouxsCAw+iDf/Tjnj
         Ge8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=FFYsrl0I4BK8yz9gxBX4VqimpZj53+CX6IzmsB+i61g=;
        b=Z3TbivfSnBwUHPiL9vk6uhHXD3I4czoGPQFm5S9gkgKz9xUeFvn/ZeQ0EDenVwI1xk
         p393M+00g24pKwhjNdAqGp/FDk06Y27C7+b2n11fWY5DPznWrik5LneYpZ5MF1i5RXQl
         bBNII1sNeBYLYoqsw3Ju12cEs1DtRUz4oNTs2p9nsIXDlYSVzLBDy39jNKnXy3JH+UEE
         WG3BIq8xzQsJEocGLlM1AatdwI2q/jNOJ9iI8bCN5wBm13AP5yZHTJHGqQQFnS46kf3/
         CHxP4+wz0IlANqUkpdXnRVU4hLgq4n43r/5LYJAqpY6DaZ6l0HerkT/yP+r9yOkvqrck
         rjfw==
X-Gm-Message-State: APjAAAUQU6jFjmriMSbZj0XlZbuJTbxMH54oGGktLZeLBTmX0Xs3Erjl
        BBcG8zIkAO6nUdTIelwNRHZRVtMaKbZwrWcWQm5j4g==
X-Google-Smtp-Source: APXvYqxZTtO++CKtLp5UsNMBbAFmJ3Okf55RGHBmvJd6qKXUpN1TYKd0d0hxF/Yg3QQDsrfpHrxUF7ZEfSVuhxirr9ljlg==
X-Received: by 2002:a1f:4193:: with SMTP id o141mr5037148vka.19.1576092487771;
 Wed, 11 Dec 2019 11:28:07 -0800 (PST)
Date:   Wed, 11 Dec 2019 11:27:36 -0800
In-Reply-To: <20191211192742.95699-1-brendanhiggins@google.com>
Message-Id: <20191211192742.95699-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20191211192742.95699-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH v1 1/7] pinctrl: equilibrium: add unspecified HAS_IOMEM dependency
From:   Brendan Higgins <brendanhiggins@google.com>
To:     jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
        davidgow@google.com, Brendan Higgins <brendanhiggins@google.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently CONFIG_PINCTRL_EQUILIBRIUM=y implicitly depends on
CONFIG_HAS_IOMEM=y; consequently, on architectures without IOMEM we get
the following build error:

ld: drivers/pinctrl/pinctrl-equilibrium.o: in function `eqbr_pinctrl_probe':
drivers/pinctrl/pinctrl-equilibrium.c:908: undefined reference to `devm_platform_ioremap_resource'
ld: drivers/pinctrl/pinctrl-equilibrium.c:223: undefined reference to `devm_ioremap_resource'

Fix the build error by adding the CONFIG_HAS_IOMEM=y dependency.

Reported-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/pinctrl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 3bfbf2ff6e2bd..2c0b30477f7d0 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -422,6 +422,7 @@ config PINCTRL_TB10X
 
 config PINCTRL_EQUILIBRIUM
 	tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
+	depends on HAS_IOMEM
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-- 
2.24.0.525.g8f36a354ae-goog

