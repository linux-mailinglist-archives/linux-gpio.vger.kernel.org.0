Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10EB44216E
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 21:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhKAUNZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 16:13:25 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:38577 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhKAUNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 16:13:25 -0400
Received: by mail-oi1-f176.google.com with SMTP id t4so26582665oie.5;
        Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YoPr0Kx00n/4wfXS6DjD6CcxN8CXGBgVqxsaU5uGgD0=;
        b=wPg/WnraeIVUENgftfE6oKk0RWR2nRMbaF/HWW5RFWB6WZl07ble2r84omT0e0wvP+
         NSUBD5Tvj1wFxV/Qk5Gjf5l3ZMbzSaqjdwANxwPwo8m3wwFhaKvSRjx3bblzy7Z+mcbu
         im1OrEObUJ+o+lYmmEeSMNC8/OGxPqG8/8WjWW8a4FcTgeAuXUWgl49Xt9cW8/qlpIFV
         oIYB0KUiH7CbAcvxEvA5KUScER0QbATh/ni7LcL8QN7PVRnh5Nil0cNEhWGnRX3tKQ4K
         0zF+2CdoIK3QDBXoXSEMJoYBlunamfIsBmdQUP2ANMPrrYk6xDkHk6wVCdY/ELGUj9gQ
         GhSQ==
X-Gm-Message-State: AOAM533gGfq9jzHC1p38aQCYNZ+t2j+aTep+1h/s36RJoX/f1Ig17lMf
        5HZgDwDB/TN0l3SrVld5BA==
X-Google-Smtp-Source: ABdhPJy6tmrwBgKtRi9dAo1kDwvxy9RZo62SehMKvvN4By4omxUupe1TXERv1fMuoG9m/jB/5Xhp/A==
X-Received: by 2002:a05:6808:1151:: with SMTP id u17mr1060525oiu.38.1635797451074;
        Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v25sm2524981otn.30.2021.11.01.13.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:10:50 -0700 (PDT)
Received: (nullmailer pid 958604 invoked by uid 1000);
        Mon, 01 Nov 2021 20:10:48 -0000
Date:   Mon, 1 Nov 2021 15:10:48 -0500
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
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
Message-ID: <YYBJyKv61p/sk1PE@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 11:40:17AM -0400, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add binding doc for i.MXRT1050 pinctrl driver.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  include/dt-bindings/pinctrl/pins-imxrt1050.h | 993 +++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h
> 
> diff --git a/include/dt-bindings/pinctrl/pins-imxrt1050.h b/include/dt-bindings/pinctrl/pins-imxrt1050.h
> new file mode 100644
> index 000000000000..a29031ab3de0
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pins-imxrt1050.h
> @@ -0,0 +1,993 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Needs to match the .dts files which has BSD-3-Clause. The rest of i.MX 
uses MIT IIRC. You should align with that.
