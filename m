Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9602D6EEB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 04:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392246AbgLKDuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 22:50:00 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37847 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395237AbgLKDtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 22:49:40 -0500
Received: by mail-oi1-f196.google.com with SMTP id l207so8413576oib.4;
        Thu, 10 Dec 2020 19:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3McgcBv8ESEG33InZOQDaTlem2TeE/GLKiQ4C9uzn/A=;
        b=RHvN7eZfr0zPClQiS7aUQlWSECvTR6O7lM/aXwuspXMu/61OLKDg/p+85UDjcaWKte
         moFHZItvD7TyCKq9LQFQO71Fmt/pa5g8OwnN7NPGxbpJXfmph0PJb6Oku7HitpgOOx1a
         aipQFij1tueAJocNfmJUS6Y5dpO42zfhUZ1oyGF5QmHfK94cgWJlZe3wvz4wA+EIkcYR
         /k/Ad+STcb5Jj1/WJf311u/8/zckNTCYtAhXbFbhAjvBLRqO8G9xd8FGV8DLeg1tFmkI
         7UT4g2oo/5dB40p374kuflQC52nShPajA6VMbXID3q/r9SvtrI//4S+z+hvLea6y51wD
         0DGw==
X-Gm-Message-State: AOAM532GzqKb0DpvVrUcnhLuHDviuNsRGHYob0r+HbU1sUxVJfSVJvDv
        0SMQn2VCAqIQ9Lbix9jhaQ==
X-Google-Smtp-Source: ABdhPJyiwnqbveudWzcxrdkxeagwNPArCWVOrt+3GJAQhkSW4Su8Ry7eunPOu7EysVJMusIKuW5odw==
X-Received: by 2002:aca:c057:: with SMTP id q84mr8006359oif.86.1607658539729;
        Thu, 10 Dec 2020 19:48:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t19sm1675394otp.36.2020.12.10.19.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:48:59 -0800 (PST)
Received: (nullmailer pid 3606354 invoked by uid 1000);
        Fri, 11 Dec 2020 03:48:58 -0000
Date:   Thu, 10 Dec 2020 21:48:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sean Anderson <seanga2@gmail.com>,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 09/22] dt-bindings: reset: Document canaan,k210-rst
 bindings
Message-ID: <20201211034858.GA3606290@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-10-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Dec 2020 23:03:00 +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Canaan Kendryte K210 SoC
> reset controller driver in
> Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml. The header
> file include/dt-bindings/reset/k210-rst.h is added to define all
> possible reset lines of the SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/reset/canaan,k210-rst.yaml       | 40 ++++++++++++++++++
>  include/dt-bindings/reset/k210-rst.h          | 42 +++++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
>  create mode 100644 include/dt-bindings/reset/k210-rst.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
