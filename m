Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441632D46F4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 17:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732081AbgLIQlP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:41:15 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44207 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732076AbgLIQlG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:41:06 -0500
Received: by mail-ot1-f66.google.com with SMTP id f16so1945706otl.11;
        Wed, 09 Dec 2020 08:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=76GLuSgEXPDcyKb7N3Q5y1o3y89KP4AUudXkwxJo8dQ=;
        b=CFK/+L+9Ohn59qFQWxPJ2WvO1cxWK+gay7wmAghekKBjFlwYc7H9awqJ4tYvzsoa2B
         8evaE4SR3EAvGI+aLy3EHtik21sR8VkebVSCQsrS+tlLExjnQRnK1sxLsgQu19qgqGnl
         JFWvYCyngHMUMz02Xt35LcXrlPEHWJODsEVCGR+dWdvzXC8H56FB6BiyE1OwN0yfjz0C
         Jw6Ae2Xv2Pig1pnpyhPb2PUyLtlFgjVArEUgktGRdB6YNoALntnT7MMHPudkmHqmlLQZ
         iAFYy4i3iGY01RPBoqlmZjBCjTFxjAWreADGtN2Q1ZwUM6z9WeNnsKcpPzCDVQYb6MF6
         +wSA==
X-Gm-Message-State: AOAM5313IGf6mkCgzPAJ0qlEH/rDdwmn3Ph08hTst31nYf2FL5EMcVKO
        Tio3dV3AGXR7qo6MxNGQ3w==
X-Google-Smtp-Source: ABdhPJwqTKQEExoNaEC0bd6PjShLUq2KaKIuWpOksgt6D+G+oflq4/HyGZ39ka9YnN54hGKXJMi90A==
X-Received: by 2002:a9d:470f:: with SMTP id a15mr2441280otf.303.1607532024796;
        Wed, 09 Dec 2020 08:40:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q77sm415355ooq.15.2020.12.09.08.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:40:23 -0800 (PST)
Received: (nullmailer pid 575852 invoked by uid 1000);
        Wed, 09 Dec 2020 16:40:21 -0000
Date:   Wed, 9 Dec 2020 10:40:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, punit1.agrawal@toshiba.co.jp
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: Add bindings for Toshiba
 Visconti GPIO Controller
Message-ID: <20201209164021.GA575805@robh.at.kernel.org>
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 02 Dec 2020 03:14:03 +0900, Nobuhiro Iwamatsu wrote:
> Add bindings for the Toshiba Visconti GPIO Controller.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  .../bindings/gpio/toshiba,gpio-visconti.yaml  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
