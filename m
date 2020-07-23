Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B3522B404
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 18:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbgGWQ6D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 12:58:03 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:35700 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbgGWQ6D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 12:58:03 -0400
Received: by mail-il1-f195.google.com with SMTP id t18so4938731ilh.2;
        Thu, 23 Jul 2020 09:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0LnwlI1S5EQWUCFb6m87YysKGHLu9NoBXK/tn34ZRrc=;
        b=eRSWrrSl3XScYNTiROJ8uywP9IQiZjHz/3Lite4UMmJd/04k07wn0stuJfnUvl10Ld
         9a9I/kn2qHQtREW4FZjoIXbNOJ7TWjAd8Wr7KgKVvsXI/9zP40KiKgB0NZ8+Pzuu/9hC
         gfy8OS8c2udHFOxOVWad5JQg8AWDbQccPVaujyKJeYFrTl2VHKv8OWcfh8jvczwintH+
         kmS0Qe3OsbGOcfUJvEc7qRb47iDSYKBf5Dhy1/Jx8JuFHSgjRQsUxtUhv2KNW4d1EpgV
         qCjkXrFP/ohPEzGr8p3OS2foyD3hzXdySqlMDvfoisY0bvnRLb/mr7sD7MyPAyBQz+oI
         mzqw==
X-Gm-Message-State: AOAM532pBIRvtm7KDP98lelBVBNnQBvx9z66p5OgxUlOcgPQ7ACUFO4+
        AVZC98AsRj2iFsmCYkRdlQ==
X-Google-Smtp-Source: ABdhPJwQCiVULLsxm4VGGqM8O9N7yWxVLbkgy3IfVHRROofBGtaoCFRjZH3xwx9PT3bCh81k8FzNUA==
X-Received: by 2002:a92:cd48:: with SMTP id v8mr6202422ilq.114.1595523482443;
        Thu, 23 Jul 2020 09:58:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d18sm1710697ils.34.2020.07.23.09.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 09:58:01 -0700 (PDT)
Received: (nullmailer pid 529139 invoked by uid 1000);
        Thu, 23 Jul 2020 16:58:00 -0000
Date:   Thu, 23 Jul 2020 10:58:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Sean Wang <sean.wang@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        mtk01761 <wendell.lin@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, wsd_upstream@mediatek.com,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v9 1/7] pinctrl: mediatek: update pinmux definitions for
 mt6779
Message-ID: <20200723165800.GA529090@bogus>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
 <1595503197-15246-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595503197-15246-2-git-send-email-hanks.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 23 Jul 2020 19:19:51 +0800, Hanks Chen wrote:
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

Acked-by: Rob Herring <robh@kernel.org>
