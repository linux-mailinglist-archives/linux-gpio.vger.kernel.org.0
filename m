Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE7F460C0B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Nov 2021 02:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376713AbhK2BKT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 20:10:19 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:35600 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236011AbhK2BIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 20:08:19 -0500
Received: by mail-oi1-f179.google.com with SMTP id m6so31490594oim.2;
        Sun, 28 Nov 2021 17:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRbGvsMdjctgkO/jbWe7OhIGOnprYk/c8aO0z2s/XnE=;
        b=JlEW5ONMxROBInqp6ofQo/mLJc3C+yutAYZx/+Cxts+U9jgtRjqB5NMa6kzkxA44rp
         ddivMpEb6CGbZJfTopxdCr/0mAHJi3Qy6MVK0QvjP4lEZ1ZmHTi0IeBI3gg5qg+L3EKK
         8FVBq0/BztXmNiwa3u4x2uNjAvlE/SRpY+nfLZlfoWACuVFG+UWonFxkDVZpxRQacmAK
         ZUMeTDi0Um18Jk2flWgoeIT3iWVhc1wcS1T5ehMa2GVlhV5KkBQyJALROQ1SSFS6xLVq
         HLNCpoIeiYCr+2zekX3+JctnCmFn5p0vQYTYNFoHUMsI/AouxyieohA07Yl8fGcjG3PI
         Pv4A==
X-Gm-Message-State: AOAM530KyegsNCUlZx5TyR8ir3UG9u4HdJ0L4BQH/D/yTQSCDTRu7L8h
        mJScYsydXvFwJcnAj34HH6j++NQKkQ==
X-Google-Smtp-Source: ABdhPJyQ/h+K8qmPJJpq0AL7Pyq+tOsogXfJ+YiMSI7EqwKIpRdyFtlYdQdW2g5q95ArmyZTVH5baA==
X-Received: by 2002:aca:2103:: with SMTP id 3mr15282711oiz.48.1638147901940;
        Sun, 28 Nov 2021 17:05:01 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id l39sm2431063otv.63.2021.11.28.17.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:05:01 -0800 (PST)
Received: (nullmailer pid 2940353 invoked by uid 1000);
        Mon, 29 Nov 2021 01:04:56 -0000
Date:   Sun, 28 Nov 2021 19:04:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     jirislaby@kernel.org, linux-mmc@vger.kernel.org,
        shawnguo@kernel.org, abel.vesa@nxp.com, stefan@agner.ch,
        Mr.Bossman075@gmail.com, giulio.benetti@benettiengineering.com,
        gregkh@linuxfoundation.org, linux-gpio@vger.kernel.org,
        adrian.hunter@intel.com, robh+dt@kernel.org,
        mturquette@baylibre.com, kernel@pengutronix.de,
        aisheng.dong@nxp.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        linux-imx@nxp.com, linux@armlinux.org.uk, linus.walleij@linaro.org,
        olof@lixom.net, devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ulf.hansson@linaro.org,
        festevam@gmail.com, soc@kernel.org, arnd@arndb.de
Subject: Re: [PATCH v3 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Message-ID: <YaQnOPiCMWIA7zzD@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-3-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 25 Nov 2021 16:14:32 -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> * Add tab for last pinctrl value
> V2->V3:
> * Remove imxrt1050-evk container
> * Remove unnecessary handles
> * 2 space tabs to 4
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
