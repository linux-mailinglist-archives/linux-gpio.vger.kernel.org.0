Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A67821FEA7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 22:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgGNUey (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 16:34:54 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44281 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgGNUex (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 16:34:53 -0400
Received: by mail-io1-f65.google.com with SMTP id i4so18716563iov.11;
        Tue, 14 Jul 2020 13:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uSvktDxrURDAPk1lcLpPbZnOgOU1nKqvNNzMxPxnjLA=;
        b=QQP+VMae95pCWjdplR1wu4y2GSilNfyOwWKDVFTwXv90zUu9KExKgJaJz4ZxBWJIZc
         9+IAGum2Bh+BLZxVuLK88p+2D91ThNlc0YnkqeYgqwTKSNtnTnq+vrFo+d5FTrxEGpz9
         TI4lcjBwbN0gCb4f5QTn2md2zXv+5hkkiYz0TwlrJoijgoNC0VX1WcfFsDojwWlbSGHV
         6eHIMdfRzl7DxlcuLUaNXLR2I20s79AU0Re2+NbmaB6mpOfNvTH0HUORT41xayDKLl1w
         FYrPWfkrEyR8hOsbcHeiPIKl5iDNUYS3FSWuR7LZYzvJKbCeiqO45GA1isrtBoo/KTge
         q+AA==
X-Gm-Message-State: AOAM5336k87Sr7bktq6eTcEKpQnaL7I9jCEaQN6b/BMV9Kwnrg37cHei
        Oqf6AoDYaMvJxNQMaDKTxg==
X-Google-Smtp-Source: ABdhPJwH2lS3w18l1/H8LJeXEvXmYUueiCeILVoYmOiLCul1iDA501lA6N+qA5gZHxI9+fpA0OfgLA==
X-Received: by 2002:a6b:1496:: with SMTP id 144mr6868679iou.6.1594758892683;
        Tue, 14 Jul 2020 13:34:52 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k1sm17128ilr.35.2020.07.14.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:34:52 -0700 (PDT)
Received: (nullmailer pid 2874342 invoked by uid 1000);
        Tue, 14 Jul 2020 20:34:50 -0000
Date:   Tue, 14 Jul 2020 14:34:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Loda Chou <loda.chou@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Teng <andy.teng@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
        CC Hwang <cc.hwang@mediatek.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v8 1/7] pinctrl: mediatek: update pinmux definitions for
 mt6779
Message-ID: <20200714203450.GA2874293@bogus>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594718402-20813-2-git-send-email-hanks.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Jul 2020 17:19:56 +0800, Hanks Chen wrote:
> Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
> 
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  include/dt-bindings/pinctrl/mt6779-pinfunc.h | 1242 ++++++++++++++++++
>  1 file changed, 1242 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
