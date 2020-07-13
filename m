Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BAC21DFFC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 20:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgGMSlF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 14:41:05 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34801 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgGMSlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 14:41:05 -0400
Received: by mail-io1-f68.google.com with SMTP id q74so14637020iod.1;
        Mon, 13 Jul 2020 11:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xVnYXm90TciDTh2YPxpRc1BbA5jY+lHowiK3/JDRUhI=;
        b=N+Jg2jT0XRTdz1GlzY4wsS47BBoJYuCq/GAKTQQni/Gf4gQHW6idgDYb02C0TtN3AH
         0LgYIZ7ZlEHtYWqeTaJ8xsbRoeLuHxSzo9c8JnOs0bDXLJswtECc79PIqX8CFvb8Lte2
         wzYZPOlb5rP10Osz5cJ8uG4ripgDVh5wDmcgdbza0K8+yb848JW2lD4ezA2rBmqi+pBe
         bTD/djyxRBKZUmvClVmSe/jOpfuRHI8qWqgIrJmKM8S7YTW2CLRCXVymqQIw6ElTNCRj
         d15D6InQzAs+0lnb3VoEtuIa4Eij9EGZmoFyAf9rT6YgmLVr6+M/K2rnbvtqm0Fp5oad
         w2+A==
X-Gm-Message-State: AOAM530oZ2NJilq4ZJi4k1qpSB2UVZfg+4+HafbuUgVgc5AX2WeRHFGv
        BZjt9iw30v66Gdl1EPYOcA==
X-Google-Smtp-Source: ABdhPJw2QbYtMFoE24PFCU4Lfgw6EWVUjtnIcxIEOPLzSjcCpZSdgq9UcTzBcfybWn9l9iMRJKVgHw==
X-Received: by 2002:a02:6a26:: with SMTP id l38mr1626761jac.60.1594665663087;
        Mon, 13 Jul 2020 11:41:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id f206sm8327748ilh.75.2020.07.13.11.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:41:02 -0700 (PDT)
Received: (nullmailer pid 516664 invoked by uid 1000);
        Mon, 13 Jul 2020 18:41:01 -0000
Date:   Mon, 13 Jul 2020 12:41:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, SoC Team <soc@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Olof Johansson <olof@lixom.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 06/10] dt-bindings: clock: sparx5: Add Sparx5 SoC DPLL
 clock
Message-ID: <20200713184101.GA516614@bogus>
References: <20200615133242.24911-1-lars.povlsen@microchip.com>
 <20200615133242.24911-7-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615133242.24911-7-lars.povlsen@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 15 Jun 2020 15:32:38 +0200, Lars Povlsen wrote:
> This add the DT bindings documentation for the Sparx5 SoC DPLL clock
> 
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> ---
>  .../bindings/clock/microchip,sparx5-dpll.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,sparx5-dpll.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
