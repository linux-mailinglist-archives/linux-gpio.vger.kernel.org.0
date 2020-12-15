Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554252DB218
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 18:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgLORBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 12:01:45 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37606 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729643AbgLORBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 12:01:40 -0500
Received: by mail-oi1-f194.google.com with SMTP id l207so24096830oib.4;
        Tue, 15 Dec 2020 09:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X8gCJMjUmleKLa/nPoLv/63eSrzRGptbGJqEgfH+stU=;
        b=XgGnfkh/bDRK4yJ60HSpJ1Gq5V6XWr3Eq2VqaqMsgtvcOPlJtFkbgH6oneotp2vU1e
         SbfqCFkpYNCmYaER+mlnbOdJa+qlDXQHYX6IcRNx9supHwpQPIJb3NjPTcsZ8WTRfj+o
         H8IXMsqtOsKflwKmz6+vAbiqgx1AosfyRb0hw5pfxKH+EJ/kDWvY+2JvCJ4ObY+1/ov/
         rQek50KB3LqiBrA62hdDHeLMm9sMre7MULMShdUl5QvvAxd+vWCg9XXHx53+vvkoa33E
         drMN+Luz2/dFUdgXtlUrb8h3IEJPtgVryj1n3FhAaC8jJoTj7blS1vVChPntzyeA+7ge
         xgUw==
X-Gm-Message-State: AOAM532fz6BejMcOupj9r79mESqipOu+99bdHPszJNlFClNwUljzkbZ0
        QL6eKOxIus4s1o3Ajv0feQ==
X-Google-Smtp-Source: ABdhPJxBKssZb6QQehemTtLam4Yhhb6MzbIdTgEOXl9dxsoqsQm/sUt/QY7L3oNjBwyYbVfUOyty4g==
X-Received: by 2002:aca:75cc:: with SMTP id q195mr999080oic.173.1608051658841;
        Tue, 15 Dec 2020 09:00:58 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q77sm4770421ooq.15.2020.12.15.09.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 09:00:57 -0800 (PST)
Received: (nullmailer pid 4025072 invoked by uid 1000);
        Tue, 15 Dec 2020 17:00:56 -0000
Date:   Tue, 15 Dec 2020 11:00:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-riscv@lists.infradead.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sean Anderson <seanga2@gmail.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 12/23] dt-binding: mfd: Document canaan,k210-sysctl
 bindings
Message-ID: <20201215170056.GA4025018@robh.at.kernel.org>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-13-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201213135056.24446-13-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 13 Dec 2020 22:50:45 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC
> system controller driver in
> Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/mfd/canaan,k210-sysctl.yaml      | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
