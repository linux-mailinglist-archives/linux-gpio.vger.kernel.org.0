Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2FC460798
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 17:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358533AbhK1QiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 11:38:22 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:37482 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346719AbhK1QgV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 11:36:21 -0500
Received: by mail-oi1-f169.google.com with SMTP id bj13so29736385oib.4;
        Sun, 28 Nov 2021 08:33:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DTKKUggdynPAqGJsI3E9zzyw5Kukgsz0VXc1dJCbKyg=;
        b=aELtFdnRyVDvMUe/FJKhKqpGZr+9pvT+qiPXxxbwm5Z2Vqpskio5WLaQUB7D/U2VQ2
         mRBVm/6WhpnGCluh9TP49r4FDYUJbIKL9UFPIBFXXZo8DwKvFKD+W/O4EQjI+9UMJ/1x
         zIoaAjmkQQEwNJViDT06k1AUCRiKFyAg+UdvjNf9eDs2+KsoMpjcKaT1m/v2Rp9N6pt0
         vX4rOcmPrsZ0qUZvUwZrtgnzP55r4b/dBwtlyqsZmu09lvzAEkuG98KCfOBfP7BEDN+z
         A8NoY3S2MPu7cwVROJd7xUR10U79VWh2NEmEOh2KNitoHJ96kuNK6rT17EWuoeeS8ZCh
         oLCg==
X-Gm-Message-State: AOAM532Atq3fMJYXGogy6Kp1uHqiLVtE339cijYSvx1JRp2tngG1qYSv
        Hiui7HXTJ3jctkq4fPhV4w==
X-Google-Smtp-Source: ABdhPJxBpTcV7eWTx2svyTY2PH5cK/LgWeTgOyLP0qd8SaQ0EyLZ4KwjQ8u5w8helE0S+iaxinbO/w==
X-Received: by 2002:a05:6808:14c4:: with SMTP id f4mr35933867oiw.76.1638117184444;
        Sun, 28 Nov 2021 08:33:04 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id w24sm2173942ots.10.2021.11.28.08.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:33:03 -0800 (PST)
Received: (nullmailer pid 2680013 invoked by uid 1000);
        Sun, 28 Nov 2021 16:32:58 -0000
Date:   Sun, 28 Nov 2021 10:32:58 -0600
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
Subject: Re: [PATCH v3 10/13] dt-bindings: mmc: fsl-imx-esdhc: add i.MXRT
 compatible string
Message-ID: <YaOvOsVzPXQrCmTb@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-11-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 04:14:40PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
