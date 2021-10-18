Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399784327AE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 21:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhJRTdQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 15:33:16 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:43756 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbhJRTdK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 15:33:10 -0400
Received: by mail-oi1-f172.google.com with SMTP id o4so1224304oia.10;
        Mon, 18 Oct 2021 12:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FS3bYqWIMivuVLfMznqyjKC0iDgH/mw6uqBqfLdSuGw=;
        b=w8MGsPKG1/mjRbB8HE+Pw+lNVd1fSqBq3p2oI/PGwdoZfp3Y6cXgYHuf/Ew1/aHScQ
         04s4r/lOXtCAXJIiWJuuDsQtq6f4bfYVqFhq1kfQiUpqHpTNsn58WSym24HYyauP44wM
         hoPsl82/gK88z/taRIDM7imWkmegy1m8A1QRBAVM7IPQYSujwHUUY1ZFgdBEprNtCnH3
         iZEu7Mky62yd8bGgEXrRAaHXLmS/7QPz5uxIkE+IpcMO4F70niblmwCOvFaz1d71gASs
         I0qompFFr5DFUvUh/CSFX2GCJCBk65BqjOeKvUOstRVPdtLUE23bAkthW+XMX3+hsMSi
         Zu7g==
X-Gm-Message-State: AOAM531eq2mrJrttUYuWuskNu5g9U+NdaTS7Kbak/+P/PJbNY5Hem1+l
        cBz5T6P8PsWMkQV9gzqyKw==
X-Google-Smtp-Source: ABdhPJxVHkUCJhpJHBcI+UCDIHLJ35QW1yocyQti1xLvnodsNI1Ubhp6yHQLeXnb5zLy5Ji9gsXoiw==
X-Received: by 2002:aca:da04:: with SMTP id r4mr676676oig.56.1634585458912;
        Mon, 18 Oct 2021 12:30:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p12sm2638862oot.29.2021.10.18.12.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:30:58 -0700 (PDT)
Received: (nullmailer pid 2807737 invoked by uid 1000);
        Mon, 18 Oct 2021 19:30:57 -0000
Date:   Mon, 18 Oct 2021 14:30:57 -0500
From:   Rob Herring <robh@kernel.org>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     nd@arm.com, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-gpio@vger.kernel.org, Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 3/5] dt-bindings: pinctrl: Add apple,npins property to
 apple,pinctrl
Message-ID: <YW3LcRn0B7+/64YE@robh.at.kernel.org>
References: <20211016141839.45460-1-joey.gouly@arm.com>
 <20211016141839.45460-4-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211016141839.45460-4-joey.gouly@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 16 Oct 2021 15:18:37 +0100, Joey Gouly wrote:
> This property is used to describe the total number of pins on this
> particular pinctrl hardware block.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
