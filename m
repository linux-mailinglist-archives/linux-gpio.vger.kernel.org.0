Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB314422CB
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 22:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhKAVka (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 17:40:30 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33540 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbhKAVk3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 17:40:29 -0400
Received: by mail-ot1-f46.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so27280716otg.0;
        Mon, 01 Nov 2021 14:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qQTVlkt8JIT08MNLJfjE2Iyh+KuYXs7SGP4eDewcQkc=;
        b=S71eUpii/nI/545xjhxVbMXl2LaN7TKL+MHcYIVvfMzuSfCXAVvJPF+yo46qWp4pWO
         CEQdJ3bkHva8Gmb5W70mGK5ctiY2Nd3LXz54qs2Sil3MQsPPcUFFmXtmCSRgzqk526Ao
         lbA6H0sETBm8mUrp+g+FRInJgOTshgxUKtx9u7PG+IYFffFy1ITPzBax13lYjSqkxI+t
         YL89AordVmlkIKgz/Xpxubk6lQIzXyDkrVGLo/A+XQ5DjUpcgOEvnzeImwDqoRfpK3Es
         blcHrlBALsVLjwqezzF55MIopMOhWM4FEQdD/EJodQmx4U0+Ej31I7uKKdtihmyTE2e1
         B0cw==
X-Gm-Message-State: AOAM530YH8E0fIyHRbr3duhkbuPc3LBuTEhF9UpCObEoMPEGQG4maQZ7
        0viW00IXJl0egxR4Hnl9zQ==
X-Google-Smtp-Source: ABdhPJzIDgo+8pYPy46CVkrg9V/51zgyaIkdXiKqkSB2mtA4pn3h6Tw757HAgz1bP+AwA4EVkKQa/g==
X-Received: by 2002:a05:6830:1dd6:: with SMTP id a22mr23555547otj.201.1635802675499;
        Mon, 01 Nov 2021 14:37:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i18sm2044824otl.0.2021.11.01.14.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 14:37:55 -0700 (PDT)
Received: (nullmailer pid 1111652 invoked by uid 1000);
        Mon, 01 Nov 2021 21:37:54 -0000
Date:   Mon, 1 Nov 2021 16:37:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: pincfg-node: Add
 "output-impedance-ohms" property
Message-ID: <YYBeMvCniK0D9bGu@robh.at.kernel.org>
References: <20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211027134509.5036-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027134509.5036-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 27 Oct 2021 14:45:06 +0100, Lad Prabhakar wrote:
> On RZ/G2L SoC for Group-B pins, output impedance can be configured. This
> patch documents "output-impedance-ohms" property in pincfg-node.yaml so
> that other platforms requiring such feature can make use of this property.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->v1
>  * Dropped type
>  * Renamed output-impedance -> output-impedance-ohms
> ---
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
