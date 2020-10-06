Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CAB285116
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 19:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgJFRoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 13:44:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37486 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgJFRoG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 13:44:06 -0400
Received: by mail-oi1-f194.google.com with SMTP id t77so9972631oie.4;
        Tue, 06 Oct 2020 10:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3qBY/l7SF+xhkZcFU4RRfNWWr30Jq3atxwWLx22F+9c=;
        b=hBmLgh0GtGHTyEvwSVL1pvCjtle9+XOGBVs8ZPggzRGF1JSYoWvyZxymXtb0W8peew
         VdEOKxvNxCMJuqv36y7eiDhCbRBpSfTqcadfTWvbAV1SOGDTV8y2/BqheM7jAcTwDbot
         g7A2wI/yL6U53cpV1DUUf+7Sz9CO04wFJlaGCNTF6Ulb4MKUhbVSLsTRZe2SLW4uylU/
         PQvxu5eo+Ipt8OMwh+rrloxJ1XJKgAveRsV9FDRILyjNJd8Sldvph1gr7KRXmyhAWogy
         KT2gwTFQnDnduQBpnHQFq26kWw88FT9dEIXjijbHDZHomputzzH5Wr02samY9TGieWtb
         7zBQ==
X-Gm-Message-State: AOAM532FqX7Qmxz22sgWzWj94BzgvfssBOhY5bdJ7YDr2cWZDxvD1dW0
        HA8/UNbmG9CYLdFwaKZiGsk4XxrNj7dY
X-Google-Smtp-Source: ABdhPJyqU4G8ncampr1FXlDqvnEh1N64eA81gz+H8WNGpLZ2QNStQOL/yOPJnhIDRvaF10ilnZg4Rg==
X-Received: by 2002:aca:ef03:: with SMTP id n3mr3410908oih.67.1602006246025;
        Tue, 06 Oct 2020 10:44:06 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k13sm1277449ood.31.2020.10.06.10.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 10:44:05 -0700 (PDT)
Received: (nullmailer pid 2515696 invoked by uid 1000);
        Tue, 06 Oct 2020 17:44:04 -0000
Date:   Tue, 6 Oct 2020 12:44:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Imre Kaloz <kaloz@openwrt.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: favor "gateworks" over "gw"
Message-ID: <20201006174404.GA2515615@bogus>
References: <20201003103335.23404-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201003103335.23404-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 03 Oct 2020 12:33:35 +0200, Krzysztof Kozlowski wrote:
> There are two vendor prefixes for Gateworks: "gw" and "gateworks".
> Favor the longer one (more descriptive) and mark "gw" as deprecated so
> it will not be used in new bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> "gw" is still used in multiple DTS and bindings. I could fix them up as
> well, although maybe this is unnecessary churn and compatibility
> breakage.
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
