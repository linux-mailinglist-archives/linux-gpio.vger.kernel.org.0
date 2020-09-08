Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6D3262188
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 22:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729691AbgIHUzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 16:55:52 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:35668 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgIHUzr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 16:55:47 -0400
Received: by mail-il1-f193.google.com with SMTP id l4so281146ilq.2;
        Tue, 08 Sep 2020 13:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nfoTboIDwK0iw35fBQIuhBzxvfbrupgvXgVfTa2BgQ8=;
        b=bGUaE7MPk6B+eg3nOjMwFtX3ra4NHuJvvkoGS5uJtvq8XWJAGYyGyWpaUoWWwXZtGT
         1GoGq2tSQpl2/VDGh1D/PTMt342x2FixVYvPufGc4T7ldQqKRBSMxcahhnHN2WGS7MPp
         saPmyQqDe4QJpmhWNei9a7OVupH9lgRGQybmLjc663Zl62tZrt5X4Ve3sGZco3BlBJBn
         xu6eRbMCU/bNylfkOLF3JopUlap8MLtvFQ7CGGQNbQz2jRw1+2tok3bAGNy7sqElSe8z
         Ej1x3FkY7HmJkrxAasfth5bASnLptmTA6rppoNVfq7Zdii8wrC6Lj3PpxsKsuJa7UibC
         sjYA==
X-Gm-Message-State: AOAM531JXogbmHdY+kZhFiEhCMsWFF9WQ69pul6a1gI6nu+3n5gESHsA
        4yStXu46iKVCX2V+ZC4Ea2BSO+CG6wDk
X-Google-Smtp-Source: ABdhPJyDobg3VfPnL+v8xk/87+oRkF2mNyM0IdSCX1Qvrp2/N8/MOSN7toLxARAPbRe94si6HqDaCg==
X-Received: by 2002:a92:d605:: with SMTP id w5mr573113ilm.12.1599598545986;
        Tue, 08 Sep 2020 13:55:45 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t10sm211805iog.49.2020.09.08.13.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:55:45 -0700 (PDT)
Received: (nullmailer pid 904435 invoked by uid 1000);
        Tue, 08 Sep 2020 20:55:44 -0000
Date:   Tue, 8 Sep 2020 14:55:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: rzn1: Convert to json-schema
Message-ID: <20200908205544.GA904382@bogus>
References: <20200821112059.5133-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821112059.5133-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 Aug 2020 13:20:59 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/N1 Pin controller Device Tree binding
> documentation to json-schema.
> 
> Use "pinctrl" generic node name.
> Drop generic and consumer examples, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note: "phandle: true" is needed because dt-schema does not add it
>       automatically to subnodes.
> 
> To be queued in sh-pfc for v5.10.
> ---
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.txt | 153 ------------------
>  .../pinctrl/renesas,rzn1-pinctrl.yaml         | 129 +++++++++++++++
>  2 files changed, 129 insertions(+), 153 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
