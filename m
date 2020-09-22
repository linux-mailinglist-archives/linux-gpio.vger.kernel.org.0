Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF3F27498F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 21:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIVTyy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 15:54:54 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43424 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgIVTyy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 15:54:54 -0400
Received: by mail-io1-f67.google.com with SMTP id z25so21017052iol.10;
        Tue, 22 Sep 2020 12:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gxR58nROS/k02YIzwamhGnljAkGAh3W3ICVvXBZGFxs=;
        b=RR1xvnMEYI9y3GjkG7n4qGfLxnkDK5rcGmMp00Q7HPeV19V2BR0o6pj/sZahjJ8zvJ
         ocbjilV54bxwODhpKEgmzJa83DU71dIfhRKWj5AM/sAYC31qgMkgankN5P/kto/xupUB
         K/jXYkpGr6n8hm9pGJjguzVFZQ+eargPEWnntDxrmqaqyVuu29MpDk/zz/XE8XtM9bJx
         OC9eVnPkMn314TKFS7sC8CrbI7qIDwSG8vcQs5b7Yf8eH9/pqHgLNb/b7fMneX+jPiKh
         YUUYR4itav6+LTL3lN8OJHlk+q1uqctgPfz5UepuWYVS9bbhdaNWRhRsjiXROez0nCBy
         sDxw==
X-Gm-Message-State: AOAM530ZUS852LlupEg7HnpVnQ4cDYOPmLgBh5Yt3L7dg0P91/3wZlf3
        Awu8SWwagnDkR2H4Cb4iGg==
X-Google-Smtp-Source: ABdhPJx+OGxNYUzjfCrA6FLmNyvIE+JgqcuR9dAOg756ZUanSumQaSz7A/wh4DxLEkBg7DE9XdEHNQ==
X-Received: by 2002:a02:c60b:: with SMTP id i11mr5379283jan.82.1600804493258;
        Tue, 22 Sep 2020 12:54:53 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n11sm9799517ild.3.2020.09.22.12.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:54:52 -0700 (PDT)
Received: (nullmailer pid 3132969 invoked by uid 1000);
        Tue, 22 Sep 2020 19:54:51 -0000
Date:   Tue, 22 Sep 2020 13:54:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Olof Johansson <olof@lixom.net>, punit1.agrawal@toshiba.co.jp,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>,
        yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v4 3/8] dt-bindings: arm: toshiba: add Toshiba Visconti
 ARM SoCs
Message-ID: <20200922195451.GA3132935@bogus>
References: <20200909204336.2558-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200909204336.2558-4-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909204336.2558-4-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Sep 2020 05:43:31 +0900, Nobuhiro Iwamatsu wrote:
> Add device tree bindings for the Toshiba Visconti ARM SoCs.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---
>  .../devicetree/bindings/arm/toshiba.yaml      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/toshiba.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
