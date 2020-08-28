Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A451E2562D0
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 00:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgH1WI1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 18:08:27 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:38279 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgH1WI0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 18:08:26 -0400
Received: by mail-il1-f194.google.com with SMTP id w3so1956707ilh.5;
        Fri, 28 Aug 2020 15:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g9TEhhzfPJNo507HgVdNfadoHCEazjI6EMFZNAEONSA=;
        b=fBCCF3iVMnbp+k2yBxKKJ88fqzj6Z1gvkzlVvetjzmEg2E26VxfrJMEVNHt6ublTHM
         yl4at+Uzcdjk0aVVzSSlu1WWUOchv5W7L4KI1JAvuddH7TDWwh3kmcAXYEIUyMrVP9Vq
         i7mz5I5tdi//R2SRFVUguBqWLslTmJtU3hd1iJiPztDM0aKo0Jeq2Sp1lFZJ8UhJDATX
         YN1OYUMhDLzjtoICifok7obPKwomxeksXKZwRuzvQBjZgT40WX0tyK4v1jTlOlhIz4Q/
         6wlIE3yjCH0wksa0nkPG+z+JDDXs7O7fr3S8r+9bO8qD5/4p5B3USU63ur1slrA9Z7TF
         yK3w==
X-Gm-Message-State: AOAM532wuEwYbJ8CVodcWFWTY63TZDyrWi4jE96uz7iogV8yJzttkAFN
        mRau28S47rJvZoBJe/gVQQ==
X-Google-Smtp-Source: ABdhPJyfe9385KJwzBZKiOey6eG9WWfSQsLrOZjTqq0zarZ1XGC646y5xuk0QY/M2P2MMoNo4zswUw==
X-Received: by 2002:a92:79ca:: with SMTP id u193mr736236ilc.185.1598652505737;
        Fri, 28 Aug 2020 15:08:25 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id a9sm260507iol.9.2020.08.28.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 15:08:25 -0700 (PDT)
Received: (nullmailer pid 3490667 invoked by uid 1000);
        Fri, 28 Aug 2020 22:08:24 -0000
Date:   Fri, 28 Aug 2020 16:08:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: sh-pfc: Convert to json-schema
Message-ID: <20200828220824.GA3490592@bogus>
References: <20200821112208.5295-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821112208.5295-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 Aug 2020 13:22:08 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Pin Function Controller (PFC) Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Drop deprecated and obsolete #gpio-range-cells property.
> Update the example to match reality.
> Drop consumer examples, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Notes:
>   - "interrupts-extended" is used explicitly, because dt-schema does not
>     apply the related fixup when "required: interrupts" is conditional,
>   - "phandle: true" is needed because dt-schema does not add it
>     automatically to subnodes.
> 
> To be queued in sh-pfc for v5.10.
> 
> v3:
>   - Enable "drive-strength" and "power-source" enum checks, now
>     dt-schema applies fixups correctly,
>   - Refer to child schema instead of duplicating everything for
>     grandchild nodes,
>   - Use "pinctrl" generic node name,
>   - Replace sh73a0 example by r8a7740 and r8a77951 examples,
>   - Add child and grandchild example nodes to exercise all schema
>     classes,
> 
> v2:
>   - Add missing "input" property for subnodes,
>   - Rebase on top of:
>       - "dt-bindings: pinctrl: sh-pfc: Document r8a7742 PFC support",
>       - "dt-bindings: pinctrl: sh-pfc: Document r8a774e1 PFC support",
>   - Describe pin configuration subnodes.
> ---
>  .../bindings/pinctrl/renesas,pfc-pinctrl.txt  | 188 -----------------
>  .../bindings/pinctrl/renesas,pfc.yaml         | 193 ++++++++++++++++++
>  2 files changed, 193 insertions(+), 188 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
