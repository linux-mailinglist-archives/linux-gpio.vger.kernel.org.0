Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF23460790
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 17:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358449AbhK1Qhr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 11:37:47 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:37615 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhK1Qfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 11:35:46 -0500
Received: by mail-ot1-f45.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so22031466otg.4;
        Sun, 28 Nov 2021 08:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=54vGdHRfblz7k8nhPNfNOqK2JgAb9gDm9fCVWfBgaLQ=;
        b=BlKDhvqNLaxxGPsgIEtifkv7RiQvcPpiogZuwzL0spbpIcxazBZTZiReKyr+l4ZFxr
         CbBisqXaiudi1X4LXHbI5ZXKWKTGxsbrR0BIov1/CYytUFGaIB+DD/G+s2DFx/3ew6H9
         RCa69h9aVe/Ew5GOPT15bRrs6JE7SpOVTCIJdAaEDXmUp4p6y+AI8FuL2T6m6YrESZwF
         JFxIvlg7mFG0nRxqS551IlzjGGXQIT5edkZL1vhjhr+kK6dNpH+7wafPdP63teDbCxxw
         hUHqjzUE0Mc7WVJLjXIT2IPv1GoO4gYlSMDZR2BNFNqHslUrJzM+GPRKck4gE3GWYX/5
         8oHQ==
X-Gm-Message-State: AOAM531a9M7IyoegyP990ywCnJzuv1coTXWkS+rSIlT5mQnd4RfNGzRv
        maGePSmeo7b/olfTsK3T7A==
X-Google-Smtp-Source: ABdhPJzN4EZGaZPtBZOnZdApXzljUYQ1gi/zc6C5H0R8ybQTzPiewS2KVMDIxH+H4886CFVaC+15Qg==
X-Received: by 2002:a9d:7516:: with SMTP id r22mr40253906otk.81.1638117149662;
        Sun, 28 Nov 2021 08:32:29 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id v19sm2183955ott.13.2021.11.28.08.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:32:29 -0800 (PST)
Received: (nullmailer pid 2678569 invoked by uid 1000);
        Sun, 28 Nov 2021 16:32:24 -0000
Date:   Sun, 28 Nov 2021 10:32:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 06/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
Message-ID: <YaOvGJ5EUfNtdODd@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-7-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-7-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 04:14:36PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> V2->V3:
> * Remove anatop
> * Use lpuart not gpt
> * include imxrt1050-clock.h
> * 2 space tabs to 4
> * Remove oneOf enum
> * Change maxItems to 2
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
