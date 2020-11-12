Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4482B07CF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 15:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgKLOwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 09:52:43 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34828 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLOwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 09:52:43 -0500
Received: by mail-ot1-f68.google.com with SMTP id n11so5823146ota.2;
        Thu, 12 Nov 2020 06:52:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j+NtsxIWerG3PypKnHGj1vHWDm1dlWfy0K8oMDj6ZN0=;
        b=uDK1jYflja3a5Khn39GtyMWM+/sXR/M7qDXDClflFS2XPaQVyzAzYKG63+4iMY3Z0S
         Sq1JYJZvCtKPQ6JfIIp3fIFxMmZ3/jL/OI11NnmVNl0TexkDhrPf7nIcugzZ7ibZ2xm5
         XkdZeKcQGqEHtzwNczw8SuMjUC6QSyBEG12l9bq4M0yeUfG3drSKIeQzVBfseFfndBIN
         dMq8/tr5UkRmezA4j7GyCe26kDf/vT0MsT1GdICvLjY4ouQOjB6/6tvHhhllwAFUnoKA
         oUqls/xA5H+8+1rNvWITj95zxpqr3gRBuXRPjXvyQDvyj8SLXSTpvLIHnt5ELPapcFJq
         IVmQ==
X-Gm-Message-State: AOAM531Y9z9ksAeIjAsE9rV0sY/H0uW/I2TlBayZj9Nb8FXxKNLFY3lw
        aj0zMyrdZ0uR+THlxBc2cWP0qzTYSA==
X-Google-Smtp-Source: ABdhPJy3LKjufxrHMWCK3kiwWxQViG1miClOrK9sNPsfoNY+EeJrFLlPdDdAnpQ0Mbvw5/pnE6StRQ==
X-Received: by 2002:a9d:ea9:: with SMTP id 38mr5656420otj.339.1605192761971;
        Thu, 12 Nov 2020 06:52:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i82sm1166693oia.2.2020.11.12.06.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 06:52:41 -0800 (PST)
Received: (nullmailer pid 3581406 invoked by uid 1000);
        Thu, 12 Nov 2020 14:52:40 -0000
Date:   Thu, 12 Nov 2020 08:52:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     yuji2.ishikawa@toshiba.co.jp, punit1.agrawal@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: Add bindings for Toshiba
 Visconti GPIO Controller
Message-ID: <20201112145240.GA3566867@bogus>
References: <20201112084057.1399983-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201112084057.1399983-2-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112084057.1399983-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Nov 2020 17:40:54 +0900, Nobuhiro Iwamatsu wrote:
> Add bindings for the Toshiba Visconti GPIO Controller.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.example.dt.yaml: gpio@28020000: interrupts: [[0, 24, 4], [0, 25, 4], [0, 26, 4], [0, 27, 4], [0, 28, 4], [0, 29, 4], [0, 30, 4], [0, 31, 4], [0, 32, 4], [0, 33, 4], [0, 34, 4], [0, 35, 4], [0, 36, 4], [0, 37, 4], [0, 38, 4], [0, 39, 4]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml


See https://patchwork.ozlabs.org/patch/1398656

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

