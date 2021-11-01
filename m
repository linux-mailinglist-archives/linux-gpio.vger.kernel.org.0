Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A92442179
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 21:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhKAUOC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 16:14:02 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34456 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhKAUOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 16:14:01 -0400
Received: by mail-oi1-f178.google.com with SMTP id w193so26671443oie.1;
        Mon, 01 Nov 2021 13:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vGBRocmjUuOsxEUXg/PEBsnNgp/Um6j49Jzz6QIa8yc=;
        b=PjN5ypDWR78zinpskn/dIW2wyiQXEuCql5GxMzCr9NDzM2FPgCdQBIZRtUMCxlTU45
         i8ZkPA6KYFEY08z6tJDo3jg+2l4fwYXiKV/luba1Uvj/OHULGEAqW1Tq/nXsiwDVv0ZO
         e+tsXDvlr/zCt8b6Q5CiSXt6Zul7tEm+lTVlHzf0KLvesDheDAGtCQjMWXT5O0bYF12r
         ZYXBlDHl/MCI65CSsFjka//Ltgqcby9EHCUwircNk0R0P4SD4nkDFpZWpAAO2qT19vJq
         4qvDUSrXSPiCVm3Ztoa5LzaSyHyjLE0lrxkaXqzj6iyt9S6Le+i5UsQSf4InQTaxiaoc
         qMtw==
X-Gm-Message-State: AOAM532aFQdd1xMFWIPzD4W7RZ2LelwgLFTURMS9velR4pdmQgliBd1x
        FOdlXJBumT2DjTyMFfE9YxQqS5x2zQ==
X-Google-Smtp-Source: ABdhPJzEJPMEeZlG9eTygjSBuADrt2G2XC6VMZ09gbQ3Fhq8BmnEjm1r4hXQPtt0k157GXvtpoj1Ww==
X-Received: by 2002:a05:6808:1447:: with SMTP id x7mr1076882oiv.23.1635797487437;
        Mon, 01 Nov 2021 13:11:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a8sm340241otr.3.2021.11.01.13.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 13:11:26 -0700 (PDT)
Received: (nullmailer pid 959745 invoked by uid 1000);
        Mon, 01 Nov 2021 20:11:25 -0000
Date:   Mon, 1 Nov 2021 15:11:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     aisheng.dong@nxp.com, linux-serial@vger.kernel.org,
        Mr.Bossman075@gmail.com, linux-arm-kernel@lists.infradead.org,
        linus.walleij@linaro.org, olof@lixom.net, adrian.hunter@intel.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        jirislaby@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        kernel@pengutronix.de, s.hauer@pengutronix.de,
        linux-clk@vger.kernel.org, arnd@arndb.de, mturquette@baylibre.com,
        abel.vesa@nxp.com, giulio.benetti@benettiengineering.com,
        leonard.crestez@nxp.com, ulf.hansson@linaro.org, stefan@agner.ch,
        soc@kernel.org, gregkh@linuxfoundation.org, festevam@gmail.com,
        shawnguo@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org,
        linux-mmc@vger.kernel.org, fugang.duan@nxp.com,
        b20788@freescale.com, nobuhiro1.iwamatsu@toshiba.co.jp
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YYBJ7ebwRxidQOrA@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 24 Oct 2021 11:40:22 -0400, Jesse Taube wrote:
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
