Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A1321FEE8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 22:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGNUvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 16:51:05 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:43532 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgGNUvF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 16:51:05 -0400
Received: by mail-il1-f195.google.com with SMTP id i18so15418215ilk.10;
        Tue, 14 Jul 2020 13:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B4fQ4Da3GvEpwvOWV9cCZStWA9/O0JAMOM8pQxx12l8=;
        b=l7xCQQVa8TP/GCl2bmSbWHIvrtQfJ4MKPCasCDfcalaTSqwC6BVj1oMvWXKQfx3y0a
         eGjfv5GrAFMbP73K1JgTpIpYPHEeQKjaM8YjN8aL6kWyuMCPHV+v1Qlu44sDrRfrC3bh
         81XRN/FoMYF9PGo/A3F/R/EJY/w4YWEMYZ8+ESmzOHWNiTDrtmXyxeo9jp1T/V7Bv/xJ
         8uu1m61rsE5NgcClbSjoL/4LHM1cyxEX2wmiuQaQsL6FIBqWZ7U3iojf/DIlfUEVP/n1
         csqu6QXMVSOsHNxs5P9EQx0Sw65aowF7ZJ2ZOcWeVtAqCIR5uh4S02nP0lt3wI3ZDxdW
         wnRQ==
X-Gm-Message-State: AOAM5302fH09zpnaMsljiYpo8TTh8bL+5ivrbkc0Ci3rF3nKQTv8WlRg
        6xGg0bF6qMYH3OcBuDZFiw==
X-Google-Smtp-Source: ABdhPJzV8OTL+/kjmhmE8ckRKY1ImOzlWkX943ufWVC9PyjA8egrsSX2kyLJHZeqr/HM+RkP9dSCSg==
X-Received: by 2002:a92:cecd:: with SMTP id z13mr6581900ilq.76.1594759864113;
        Tue, 14 Jul 2020 13:51:04 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id w10sm39139ilo.10.2020.07.14.13.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:51:03 -0700 (PDT)
Received: (nullmailer pid 2896428 invoked by uid 1000);
        Tue, 14 Jul 2020 20:51:02 -0000
Date:   Tue, 14 Jul 2020 14:51:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     liyong@allwinnertech.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        tiny.windzz@gmail.com, huangshuosheng@allwinnertech.com,
        linux-arm-kernel@lists.infradead.org, wens@csie.org,
        linux-gpio@vger.kernel.org, mripard@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 04/16] dt-bindings: pinctrl: sunxi: Add A100 pinctrl
 bindings
Message-ID: <20200714205102.GA2896316@bogus>
References: <cover.1594708863.git.frank@allwinnertech.com>
 <7be3efafd34cbb5938ea73dfe08f3db3e7747123.1594708864.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7be3efafd34cbb5938ea73dfe08f3db3e7747123.1594708864.git.frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Jul 2020 15:06:23 +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> Add device tree binding Documentation details for A100 pinctrl driver,
> which has a r pin controller and a pin controller with more irq lines.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
