Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71887C29F1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 00:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfI3WrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 18:47:22 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33504 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbfI3WrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 18:47:22 -0400
Received: by mail-oi1-f193.google.com with SMTP id e18so12691934oii.0;
        Mon, 30 Sep 2019 15:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6QfYHOqCFke/B9nmo9C0f+3JabbnkVFCdcopO1uSlDs=;
        b=DYK56En7e5kLkrgtfoZ5vbqs4hyxBnngTMLvOQtwBAwFggVtB3tCpqkc/IDKB3ea+j
         iP8UnQSmrn7kgfp3aJS588IyJ1OW+t21wsvJIiB1JTYJo+4jnpQb8byjb5wYmgmD68Nd
         XCl5GTJIzPVSKgcu0nPkvnbQ92GA3p3V62caYrtmQ0bClrSJ7vfnK04036joQb2eQmoW
         XKerP11G6x6hIcjNI2vy7+tj71sj0JtSwFHYl8JGD1XyfYrq/o/n84G2SrcRePS7dHFN
         +gDZXzRShyEZCqUVm+KrjkySrQ//cmEHXUMZzvdrc8FSItinVWGCyJZYcrxKX4UXfKRp
         VasA==
X-Gm-Message-State: APjAAAW8CkZv4ivKOz4nuCgjS+xNL3VXIne1Y/3LDR0Yyo8mPfQ19hLh
        LGhK5tqt3KrX70PKOsI3Eg==
X-Google-Smtp-Source: APXvYqz+3Izxqt7xvoQxGYq/m9r3fsWqTy00V2Zd2TZoeuaEbOZjGQBkBMnNbE31sjBCAiNnJfXlUw==
X-Received: by 2002:aca:c505:: with SMTP id v5mr1228689oif.79.1569883641379;
        Mon, 30 Sep 2019 15:47:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u130sm4705832oib.56.2019.09.30.15.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 15:47:20 -0700 (PDT)
Date:   Mon, 30 Sep 2019 17:47:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Qianggui Song <qianggui.song@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Carlo Caione <carlo@caione.org>,
        linux-amlogic@lists.infradead.org,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/3] pinctrl: add compatible for Amlogic Meson A1 pin
  controller
Message-ID: <20190930224720.GA27280@bogus>
References: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com>
 <1568700442-18540-2-git-send-email-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568700442-18540-2-git-send-email-qianggui.song@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Sep 2019 14:07:20 +0800, Qianggui Song wrote:
> Add new compatible name for Amlogic's Meson-A1 pin controller
> add a dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |  1 +
>  include/dt-bindings/gpio/meson-a1-gpio.h           | 73 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/meson-a1-gpio.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
