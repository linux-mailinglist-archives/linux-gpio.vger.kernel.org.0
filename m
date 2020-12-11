Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA662D6EEA
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 04:50:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388495AbgLKDs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 22:48:56 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39850 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395235AbgLKDsZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 22:48:25 -0500
Received: by mail-oi1-f193.google.com with SMTP id w124so5270787oia.6;
        Thu, 10 Dec 2020 19:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XhSRab4aMQWwYyuTmi2vIMiRs/pePu7XSUwtatQgq6g=;
        b=VeVtOIiNrYJOrHAA2Qa0N8ilT/jIsRgihHWShCe1w7zUN9d7zlSLt660yckFQWbFd9
         gYfcA/LGLckpRVNEr2z678e09iA8nAq8p1UsYvARVvVMWRkMyAJaZIA47cKKI4MDS6bi
         2dEUQ9H/f1EHqaOmnKyZ81kwULB5QWWr2B5l7EOPneIy7lQ+qDopUCtrKJKAgXQcHOVI
         +AKzl9bELodmdQxOSGre580jkqIVvPR5SlTf8O9yKzR7b0r7uozivX+LLfjo2bKhlWeT
         dVIji1rZJM57Hba2DnXaHJ/IAs74V+rBGbHfO0WdxP6xr1em+V1SPmRoo2y4fXTA1B9e
         5sNw==
X-Gm-Message-State: AOAM5326tlZzmwNHkURPV2BtXi5br6cp4BSTMW/9zv3RD2u5qlk8IajV
        OtVeIFDZW1ToktJlXOEHFw==
X-Google-Smtp-Source: ABdhPJxUY0qfNTBPh2nGN2/hb2xbvceB+PnFxN2dfniKPwJhm/a4XaBEIxkKPAEQaDy/NmYFelMwaQ==
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr7857127oig.170.1607658464855;
        Thu, 10 Dec 2020 19:47:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d62sm1511737oia.6.2020.12.10.19.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:47:44 -0800 (PST)
Received: (nullmailer pid 3604500 invoked by uid 1000);
        Fri, 11 Dec 2020 03:47:43 -0000
Date:   Thu, 10 Dec 2020 21:47:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH v8 07/22] dt-bindings: Add Canaan vendor prefix
Message-ID: <20201211034743.GA3604451@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-8-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-8-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Dec 2020 23:02:58 +0900, Damien Le Moal wrote:
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
> vendor of the Kendryte K210 RISC-V SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
