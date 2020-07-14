Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289DB21FEAA
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 22:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgGNUfd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 16:35:33 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44161 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgGNUfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 16:35:32 -0400
Received: by mail-il1-f193.google.com with SMTP id h16so15332146ilj.11;
        Tue, 14 Jul 2020 13:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dGBfIif028yRfOAIF7nvieaHolrVE+/bJyTO1qa47oM=;
        b=Il8Rs8zutN4L9VY8B+TCS6hBqpN61PSytvyDCQEHVWXFWe8w9U6wb7lsjgjFqA8kbJ
         /9AwtnMYib2A68MpTlN4n41Y/ny7Pl4EF9yidl08N1Zcdw3RqyB1fwOrfdj/ix0BvSzp
         GO1JbxjCLrOrZkQMNUljRw5Jqg9L5E/UTp4bxGMjPKCSrSHugOsST7d7eOrNwCThJpos
         zgBg4BY8feqZncRYFhndQXK6Apoc4VNfT1aS/miWE7ZtzPYCSS2wedgPeHeMh1Vhjv7D
         6ACyjmy0h1MXXSKQNBGroz2ftIaH1sNn6YlqiyKGzl9k33W/l/0unwiekWe9U07BCM93
         P6bQ==
X-Gm-Message-State: AOAM532WrgPIN4yE5eUhvL5nbX9Ohjbe+EEc982YnDfRYYYkTft9wQEv
        2iciQj1aBq1s+WHHIgg3sg==
X-Google-Smtp-Source: ABdhPJybh/BzLaIPevAOuDihB4bRZa7+AeUmETXLadjPPMl4jbfYYXujNZQry7Wa4saZu0z0T+vYag==
X-Received: by 2002:a92:d308:: with SMTP id x8mr6288332ila.3.1594758931658;
        Tue, 14 Jul 2020 13:35:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q4sm23374ils.11.2020.07.14.13.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:35:31 -0700 (PDT)
Received: (nullmailer pid 2875322 invoked by uid 1000);
        Tue, 14 Jul 2020 20:35:30 -0000
Date:   Tue, 14 Jul 2020 14:35:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loda Chou <loda.chou@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        linux-mediatek@lists.infradead.org,
        mtk01761 <wendell.lin@mediatek.com>, wsd_upstream@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>, devicetree@vger.kernel.org,
        Andy Teng <andy.teng@mediatek.com>
Subject: Re: [PATCH v8 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200714203530.GA2875265@bogus>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-3-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594718402-20813-3-git-send-email-hanks.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 14 Jul 2020 17:19:57 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 203 ++++++++++++++++++
>  1 file changed, 203 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
