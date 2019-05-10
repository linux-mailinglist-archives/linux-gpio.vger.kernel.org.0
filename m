Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F910198F4
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 09:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfEJHXT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 03:23:19 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36856 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbfEJHXT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 03:23:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id j187so6193490wmj.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6IJvqYq4JZWD5aTcjw2ROgUsvIuulKVOwmPtVdRwUBw=;
        b=MLfJXEMdZmKpvWHQlqIzfyImp6Wy+KcsU0p5YvE1otyh3zIOF+I1vvQ/PJnC4diJpY
         sh7j6UBJ/0TsdJxDPFx15teFeEEP0QzxEIQEcUOhHwljvJCS2Tjkf/2mrXiP9/ZgNwHe
         CH4EkBxMqLQgUUoLVvHev0mv2XVIeQZeRZWtqthsJGrx+ZQjGkna1+4trW4eI+KMpWg/
         NqQgmANFTSZNHuEBAXzpXICTBex/HmPLIEN8E0Q2umUFYZfV9vf8qRqgiXOYJdB/lK+T
         nasc2eF4kXFxaiNB/WjJeNwU3qb9R9VMtLpc1FhwexCo5vE8Uqiyx1kEp0G2RSSP1FIm
         NJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6IJvqYq4JZWD5aTcjw2ROgUsvIuulKVOwmPtVdRwUBw=;
        b=WbKb0W4V2CJootF1XUYHQvVF48VjYXDLl74k42Ujp4xn5tZGcUL7lxgElyUBoYNJQr
         qbE25cyghpub31ltZJHkxKiCUiGjLXj/MgU2uuKc/OYirhHWMnbh9r3FEApH7VvrEoTR
         ZBq8aE70ePX8XKjiOHpoaG47bTLzOFcJr67gmHtUgcee5zRxXBigaPoHR0og+CQe3n0f
         iKkNW2xxLIt5sLshQJpNc4tLv+vrTUDRhBk7xMeiOJSwPvMQJZdH6FqzRMMCHZpSwFWU
         mZuNlYeQPaamyjf8oOLdkl6TaVxhF0n8/CwEzirr+y8Yo8Z2pkkAoFsB686/++J1a94i
         6fAw==
X-Gm-Message-State: APjAAAU3nusLnkjpd2vMx+waTLHAu8FJPsLAlgvyY6uYU/ImqhTHZQwC
        sJqxjZ27VhVWsImI4VLXQBbdgQ==
X-Google-Smtp-Source: APXvYqwFI/XoRqh3l4hbVHQYN4vuu2sgvGQIfc1CDZPFb5/hfW20fNRJaFM/GapMBIrdKush+zwVEw==
X-Received: by 2002:a1c:7008:: with SMTP id l8mr5638463wmc.49.1557472996594;
        Fri, 10 May 2019 00:23:16 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id n14sm1748514wrt.79.2019.05.10.00.23.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 00:23:16 -0700 (PDT)
Date:   Fri, 10 May 2019 08:23:14 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [GIT PULL] Immutable branch between MFD and Pinctrl due for the v5.2
 merge window
Message-ID: <20190510072314.GC7321@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enjoy!

The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:

  Linux 5.1 (2019-05-05 17:42:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-pinctrl-v5.2

for you to fetch changes up to 1490d9f841b186664f9d3ca213dcfa4464a60680:

  pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver (2019-05-10 08:21:31 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Pinctrl due for the v5.2 merge window

----------------------------------------------------------------
Amelie Delaunay (4):
      dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
      mfd: Add ST Multi-Function eXpander (STMFX) core driver
      dt-bindings: pinctrl: document the STMFX pinctrl bindings
      pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver

 Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   2 +-
 drivers/mfd/stmfx.c                                | 545 ++++++++++++++
 drivers/pinctrl/Kconfig                            |  12 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-stmfx.c                    | 820 +++++++++++++++++++++
 include/linux/mfd/stmfx.h                          | 123 ++++
 9 files changed, 1659 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
 create mode 100644 drivers/mfd/stmfx.c
 create mode 100644 drivers/pinctrl/pinctrl-stmfx.c
 create mode 100644 include/linux/mfd/stmfx.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
