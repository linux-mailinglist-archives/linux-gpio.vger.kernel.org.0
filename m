Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB62D383AA1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 18:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240985AbhEQRAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 13:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236776AbhEQRAc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 13:00:32 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19952C061573
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=mLoQT+qGBvd/1mEB5gb03+Hl/Dxp8v73Tjw/NB6UcmY=; b=qQb3r7ZcFPHktlC8bgHDO8KruT
        mJuQP9VL+XTjf8EI8oZP/6wNKi4RiclM2APD3Ia7L/H9foXukM05VcBBqRP0TSZv1H5KW1WIeaHku
        BQ8JNIH0vzJ9z1Zwklc2r1iJhLChWZYlhII/tFfTj19pfK2UXK5jKGJj654UJfPJusNXCRLrTLGXh
        K5FCgPMOE8phbD6dyMrhUD4ObQTCc+9TiJoMxnig3+DeDy3Suste/N8tLu4x74x7UxYnGMJlavIxE
        bt4+oNrWL9/u3iJE6ZV0hePTNF7glJJVa+W+ZsKCiRKfOSgSCDo0uoSYbGBX4mJaB6a2CJD+AdCM/
        8O2hgX6w==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164] helo=ubuntu)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <sandberg@mailfence.com>)
        id 1ligaA-00036N-0z; Mon, 17 May 2021 19:59:07 +0300
Received: by ubuntu (sSMTP sendmail emulation); Mon, 17 May 2021 19:59:04 +0300
From:   Mauri Sandberg <sandberg@mailfence.com>
To:     sandberg@mailfence.com
Cc:     andy.shevchenko@gmail.com, bgolaszewski@baylibre.com,
        geert+renesas@glider.be, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, drew@beagleboard.org
Subject: [PATCH v3 0/2] gpio: add generic gpio input multiplexer
Date:   Mon, 17 May 2021 19:58:45 +0300
Message-Id: <20210517165847.206316-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325122832.119147-1-sandberg@mailfence.com>
References: <20210325122832.119147-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello all!

This patch set is closely related to another thread at [4], which I abandoned
against better judgement and created this one.

Here I am sending revised versions of the patches. It builds on v2 and adopts 
managed device resources as suggested by Andy on the thread mentioned
above [5].

I have tested the functionality on a NXP 74HC153 dual 4-way muxer. Drew, did
you find the time to have a go with this [6] and if so, did it work as expected?

Thanks,
Mauri

[4] https://www.spinics.net/lists/linux-gpio/msg58573.html
[5] https://www.spinics.net/lists/linux-gpio/msg60160.html
[6] https://www.spinics.net/lists/linux-gpio/msg60159.html


Mauri Sandberg (2):
  dt-bindings: gpio-mux-input: add documentation
  gpio: gpio-mux-input: add generic gpio input multiplexer

 .../bindings/gpio/gpio-mux-input.yaml         |  75 +++++++++++
 drivers/gpio/Kconfig                          |  16 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-mux-input.c                 | 124 ++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mux-input.yaml
 create mode 100644 drivers/gpio/gpio-mux-input.c


base-commit: 6453b9532b5f77d19837b159c4d074f0af9f141b
-- 
2.25.1

