Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 074821B155
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 09:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfEMHml (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 03:42:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40170 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfEMHml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 03:42:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id h4so14000284wre.7
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WERxYzDoS7P0TiPMnvs6x/f95pNMjt2W3p3cXcDJuWk=;
        b=kvhlvPfaHsa2MhLBhlzN7ZeqLc6aNYNtJBpYSOQKMsDjCAV+R3yRNJ+onuLlEL2J0X
         oYeAXvLUyL8GROw/z9W8YdM4VDloh9xKvUi1nVau3ujGsJOJl4DlPaxHmyMpHoYXl2IO
         dj9ZgBVKalBU7BXJwdNbcO/0SfwprNvDDdDk6y5dlhu6Jd2N36ZQvySXgTDSOH3Q82jA
         9OhWkB6B11IOCXhuuQTx6CfPZ5qO3BKywDaYzakxLVNEevUtSznDiWOBvttXz5BvhX53
         GZo86ZkOwe2fuuHlpLC3BFVvIUlkD7QfBxOBtjtUOlt2bRLGyx4S1Me1+MtdiWFWcuJK
         1POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WERxYzDoS7P0TiPMnvs6x/f95pNMjt2W3p3cXcDJuWk=;
        b=MAUhNhd9iIlKsL0Gks7QrrlwFC3e8+y04qYDe9dy5zkdlEBrisRlmyMh1QLV87M9c+
         fJ1n+OclZga00MVxQMao5W9rh85JghqFaQQ5u1mnmQhkNGm8nhGz3F7scsbr435Gb6Dr
         4ZpUD+qq3q+QLRWanGHePSvmqBE9pzOo+nDB83bBr4ogm3d69SeXuTmxXsbaq7SQUPLL
         pFstq2yFpMZPDEq54zTv9stx6xEx1QNyeACxpT/uC3N3ofQFdHS/vS1aAmj6nwap9C7p
         XQvEF3rWjufRwI2FAp4gHgG9+xnMfmADFoAji1BECkARDXjfxJN8b52jlMg9xI0DN0NN
         IKBQ==
X-Gm-Message-State: APjAAAXCNfuQ7We53t6WtYYIp5EYtFDL8xqpWFX1VPWrq9ZWHUg/2XsD
        trxk+s4HEkPLU5GLgnNmyJgdRQ==
X-Google-Smtp-Source: APXvYqyZozQkpGZHOk4y/a4Pt3SprPlhW3ZxFXrms0vy6bx9PRMxI36vjtz603WWWh1jUgXCNGKShg==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr2157887wrf.78.1557733359560;
        Mon, 13 May 2019 00:42:39 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t18sm27938340wrg.19.2019.05.13.00.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 00:42:38 -0700 (PDT)
Date:   Mon, 13 May 2019 08:42:37 +0100
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
Subject: [GIT PULL v3] Immutable branch between MFD and Pinctrl due for the
 v5.2 merge window
Message-ID: <20190513074237.GI4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell>
 <20190510151556.GA4319@dell>
 <20190510151912.GB4319@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190510151912.GB4319@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Enjoy!

The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:

  Linux 5.1 (2019-05-05 17:42:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-pinctrl-v5.2-2

for you to fetch changes up to d17ed797b8fd5c8765cd959ac44aaa2f090f5a89:

  pinctrl: stmfx: Fix 'warn: bitwise AND condition is false here' (2019-05-13 08:28:26 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Pinctrl due for the v5.2 merge window

----------------------------------------------------------------
Amelie Delaunay (5):
      dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
      mfd: Add ST Multi-Function eXpander (STMFX) core driver
      dt-bindings: pinctrl: document the STMFX pinctrl bindings
      pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
      pinctrl: Kconfig: Fix STMFX GPIO expander Pinctrl/GPIO driver dependencies

Lee Jones (2):
      pinctrl: stmfx: Fix 'warn: unsigned <VAR> is never less than zero'
      pinctrl: stmfx: Fix 'warn: bitwise AND condition is false here'

 Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   2 +-
 drivers/mfd/stmfx.c                                | 545 ++++++++++++++
 drivers/pinctrl/Kconfig                            |  14 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-stmfx.c                    | 819 +++++++++++++++++++++
 include/linux/mfd/stmfx.h                          | 123 ++++
 9 files changed, 1660 insertions(+), 1 deletion(-)
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
