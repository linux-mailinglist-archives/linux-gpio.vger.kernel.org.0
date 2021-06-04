Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B97C39C2E2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 23:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhFDVuM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 17:50:12 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:35650 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbhFDVuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 17:50:11 -0400
Received: by mail-oi1-f171.google.com with SMTP id v22so11181618oic.2;
        Fri, 04 Jun 2021 14:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i82elBrWcX7dkg/tjqk1o+lzd0sBqhf4Gql6Pck5Qxw=;
        b=I+vwf5P0MfZ/OG2hqSpNHzoW4qxGAQJMVHAvE7xRHyBjEq11SjL2tU0hntVyvPbd0s
         aXmgTRsFSNxWITMdtx7aWTAlz6HShFTd2WydNUL23kbQR9txItCF6JmmyG+gIj5PrPrO
         bQkpBFX1urFzXvunWZP9fhjgb+HLwLHzhqSW0efYVqgiqxsBMIqCDOV7Aap0vPQdC8uW
         LZ0On5YXhjY8E1wHOEDzwjlV6fc7g4P1GSWkhWzm4gNaPEjzsYo1RO0gBOtX38iqjwIw
         6uCzgOFYmU++W2r2ab2M4Ww0d6hh45N/lmtHq4Eu5wPE0ILL+ESL6CtvBcc4P0MokUjK
         mTHg==
X-Gm-Message-State: AOAM531O5bbo+3LN/VPQrevy6Yv5D27g7EvI6L/QfE4OWlg7c9zFStzk
        SGr0UDogALqNzNM7RzmIKw==
X-Google-Smtp-Source: ABdhPJzr3iNWfkAEE7c1mVgS1ga0XlxU7bXabXx3Ywb6j/vupXrCOKwaQZWAn+SFf6QJF4XD7TcdGQ==
X-Received: by 2002:a05:6808:158:: with SMTP id h24mr9895830oie.169.1622843304601;
        Fri, 04 Jun 2021 14:48:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b3sm737815otk.54.2021.06.04.14.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:48:23 -0700 (PDT)
Received: (nullmailer pid 3982809 invoked by uid 1000);
        Fri, 04 Jun 2021 21:48:22 -0000
Date:   Fri, 4 Jun 2021 16:48:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     kernel@pengutronix.de, devicetree@vger.kernel.org,
        aisheng.dong@nxp.com, festevam@gmail.com,
        linux-gpio@vger.kernel.org, linux-imx@nxp.com, stefan@agner.ch,
        shawnguo@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
Message-ID: <20210604214822.GA3982753@robh.at.kernel.org>
References: <20210601062338.1969040-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601062338.1969040-1-ping.bai@nxp.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 01 Jun 2021 14:23:37 +0800, Jacky Bai wrote:
> Add pinctrl binding doc for i.MX8ULP
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
