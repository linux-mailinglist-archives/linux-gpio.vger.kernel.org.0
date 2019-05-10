Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A78D19FFE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 17:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbfEJPTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 11:19:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34947 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbfEJPTR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 May 2019 11:19:17 -0400
Received: by mail-wm1-f66.google.com with SMTP id q15so3927755wmj.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2019 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hfI45TE1I5uwK0Bfe/252jb7t90fCE1bIelVOQNQaUM=;
        b=hTSM6nL3NXhJDSGIenedVMXQCAahPRhCKQONbsUCkgElASVaWCoXoB/enwAMkt3HnW
         9yW7IpAGGEd/XrkSdUn70qhMdE7GjAlOnzRjg9V0B9RBCLHYdS1lagxRofNG4pBt4BoQ
         wxZtYN8A6k++tmlCAieXsGtjdnbtAm1xxlgrZyPrhQUAUmf9LQV/JlHzGLnGGIUTJiE/
         RfrnhNIItnQj4F/hWUel5GJxlmSnfvE8SmepuANJA1AgPYAZ+ww99Wr2IKK2iEMyG7qS
         WvhC3oaML3ks38p9YEBQQ7k2aT9F+QNw6j1UP3Q296UMFRpJJ6/wKAVIHkKOfq8/gm89
         soJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hfI45TE1I5uwK0Bfe/252jb7t90fCE1bIelVOQNQaUM=;
        b=OXu5rJu5qjvBK529b5SUrVTsjghmX1+n1408HEvMf6oCaRHGemL/390+P0QW1imDfJ
         k/MvUozpFM5AeN+pAQcR7NnuOmQWqYVF3QsshTMm50EFXFJGMWg/5BDqMYiNsgYhIhwH
         gFFBuaHJwPSYv+epRnlR1qlvEoszE+Ik/jUy0wbUFFgeAhFc+Y9Vc3J7yxPzf44jhTrP
         tQEdY+FEWjSvOVaVHCOxsmI83wx6EI110ebAg9VUgkf1r2nnj+alNChu51OdWKye92/U
         7hTRbYPtU5iHJ3/Cf6V8DmDrLhtlTW0HkUPP4k8LXjn+bmv9gD6M8nQbuzuHT4T6IwoN
         GJZw==
X-Gm-Message-State: APjAAAXm0JvuQH9S6rnDo09SWRRXw4CGMQj9Y7fkNC43zbbOBC6OSRgL
        rszK/pZ2knkTMaJofPJmEl0FhQ==
X-Google-Smtp-Source: APXvYqybXr+vcsOtoC6cNdTKe08GTN1LUn7gnJpq13Ga3bAoBaeBpdNLmgGY1GT+GtndyMTjIbD3zg==
X-Received: by 2002:a1c:a008:: with SMTP id j8mr7652413wme.73.1557501556269;
        Fri, 10 May 2019 08:19:16 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id c131sm6807619wma.31.2019.05.10.08.19.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 08:19:15 -0700 (PDT)
Date:   Fri, 10 May 2019 16:19:12 +0100
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
Subject: [GIT PULL v2] Immutable branch between MFD and Pinctrl due for the
 v5.2 merge window
Message-ID: <20190510151912.GB4319@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <20190510072314.GC7321@dell>
 <20190510151556.GA4319@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190510151556.GA4319@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change of subject line to v2:

** Contains fix for i386 build breakage **

Enjoy!

The following changes since commit e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd:

  Linux 5.1 (2019-05-05 17:42:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-pinctrl-v5.2-1

for you to fetch changes up to 9af2de7657f5a52f9e15aebb6f9348f9b8f250a6:

  pinctrl: Kconfig: Fix STMFX GPIO expander Pinctrl/GPIO driver dependencies (2019-05-10 16:09:56 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Pinctrl due for the v5.2 merge window

Contains fix for i386 build breakage

----------------------------------------------------------------
Amelie Delaunay (5):
      dt-bindings: mfd: Add ST Multi-Function eXpander (STMFX) core bindings
      mfd: Add ST Multi-Function eXpander (STMFX) core driver
      dt-bindings: pinctrl: document the STMFX pinctrl bindings
      pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver
      pinctrl: Kconfig: Fix STMFX GPIO expander Pinctrl/GPIO driver dependencies

 Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 +
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++
 drivers/mfd/Kconfig                                |  13 +
 drivers/mfd/Makefile                               |   2 +-
 drivers/mfd/stmfx.c                                | 545 ++++++++++++++
 drivers/pinctrl/Kconfig                            |  14 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-stmfx.c                    | 820 +++++++++++++++++++++
 include/linux/mfd/stmfx.h                          | 123 ++++
 9 files changed, 1661 insertions(+), 1 deletion(-)
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
