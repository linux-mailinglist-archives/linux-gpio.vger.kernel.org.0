Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB5F460C0E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 02:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233023AbhK2BLe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 20:11:34 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:46649 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234839AbhK2BJe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 20:09:34 -0500
Received: by mail-oi1-f180.google.com with SMTP id s139so31400554oie.13;
        Sun, 28 Nov 2021 17:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gpRRvK9r9O97XvCAiJTGMmQVu03foEfqtRsiLywdxH4=;
        b=kRKJrobfu6eI3N9THZba9ZjNPy2e58LLxiQF/ZctLiQFZ108DlcKRK6GuECsFbL/wh
         ySwz59uD7zG9/XTYRT/y26wbP/s+1f1ne3e0X3tQB+oBaTwOl6bnQTZQyNb0YC9wUk9P
         yX9KFfzfBWdfdB1Vt6QrNvB0ORolJJHprw+lSQhHUv256Ukm8o4iNDkH7eYetvNmduOb
         pZieKi0DDhs7nzdroH4m33ccxV/ZuXBGL8DCOyeql9YMLnU2PnU+d77OPPufCzjGiaig
         wkuMDSoyxdKhM++fAAS3jWslTdtKjKmM4o37CIA+3EjtnT55uQlvaW5JxFoodLvkKerZ
         VcEg==
X-Gm-Message-State: AOAM530qjypESCHYDfYVoxJHztBqLb9xXbz4K1y7BKJxivQUZRpFYQzM
        pOc1NEscXZuURUJ4E7cJJKg034hw1A==
X-Google-Smtp-Source: ABdhPJy5D3GTNsvBMul80UgG3Lo1JoUnIUKs/SP1wv8plmtcYo5HCaIWhD6EfHm4biI5heyxosXndA==
X-Received: by 2002:aca:2205:: with SMTP id b5mr37485428oic.177.1638147977123;
        Sun, 28 Nov 2021 17:06:17 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id n23sm2640740oig.4.2021.11.28.17.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:06:16 -0800 (PST)
Received: (nullmailer pid 2942765 invoked by uid 1000);
        Mon, 29 Nov 2021 01:06:04 -0000
Date:   Sun, 28 Nov 2021 19:06:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     Mr.Bossman075@gmail.com, s.hauer@pengutronix.de,
        linux-serial@vger.kernel.org, mturquette@baylibre.com,
        jirislaby@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
        ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
        olof@lixom.net, robh+dt@kernel.org, linux-imx@nxp.com,
        stefan@agner.ch, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, festevam@gmail.com,
        linus.walleij@linaro.org, abel.vesa@nxp.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, arnd@arndb.de, linux@armlinux.org.uk,
        giulio.benetti@benettiengineering.com, shawnguo@kernel.org,
        sboyd@kernel.org, soc@kernel.org, linux-clk@vger.kernel.org,
        gregkh@linuxfoundation.org, adrian.hunter@intel.com,
        aisheng.dong@nxp.com
Subject: Re: [PATCH v3 03/13] ARM: dts: imxrt1050-pinfunc: Add pinctrl
 binding header
Message-ID: <YaQnfBGC2NhXeWEA@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-4-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-4-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 25 Nov 2021 16:14:33 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add binding header for i.MXRT1050 pinctrl device tree.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> [Jesse: move pinfunc from dt-bindings to dts folder]
> ---
> V1->V2:
> * Move pinfunc from dt-binding to dts
> * Change subject and description
> * Change licence to "GPL-2.0+ OR MIT"
> V2->V3:
> * Change License comment style
> ---
>  arch/arm/boot/dts/imxrt1050-pinfunc.h | 993 ++++++++++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imxrt1050-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
