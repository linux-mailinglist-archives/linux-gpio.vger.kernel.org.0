Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35967419ABF
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 19:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236540AbhI0RMA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 13:12:00 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:38490 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236552AbhI0RKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 13:10:00 -0400
Received: by mail-oi1-f174.google.com with SMTP id u22so26459579oie.5;
        Mon, 27 Sep 2021 10:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LP975dl3xHlgyqPGMVgzcJgxzN1j0uNYB1HMMJCHNTg=;
        b=e9bADm+nFDh1D9qU45S65OooI67eF8kuz0G34i1Lcl8PA7CWnwXlPZxJ4iSle8/ZWZ
         69SzobrpRoQwfNFKWC2dYfJi2opY5FfD05rNom6M13iFZum+RW4NB/yy1jfgYBj4tqq2
         UQGtF6vn4wNczh4nkEBUZH/2JPs8DSweuNLhJ1n4cZeuhmaaB4a8iQYS2m5XDzWeySIF
         H7j0sJC/WKKDRYWZ1oV15bZ0+YSw1+OQch2XmQgH0NZGCOfN/ERVZ+Ei+jq5P3EhP+6V
         wYxMvUkOHIFM2Cq4v3Zp/1kjbgY9CwkxTf/D78azAE00SwWJAtH9iZAB8GaX3VCPSZH4
         Tgdw==
X-Gm-Message-State: AOAM5305dF5q1w9iHvDFTOgrkNvQfVwt0GwBKm0LIuIkOVsslQHCatDy
        oOaHUdwMpErz+RiQTOzT5w==
X-Google-Smtp-Source: ABdhPJzTrUa14LFZIHggVDOTBYg5Zt0YNgNpRcOEWlaeESALOxzCAyAUF81ovmdfNwoyyc9kfuLQrA==
X-Received: by 2002:aca:a88e:: with SMTP id r136mr96832oie.101.1632762501505;
        Mon, 27 Sep 2021 10:08:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x34sm1897955otr.8.2021.09.27.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 10:08:20 -0700 (PDT)
Received: (nullmailer pid 3478888 invoked by uid 1000);
        Mon, 27 Sep 2021 17:08:19 -0000
Date:   Mon, 27 Sep 2021 12:08:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: interrupt-controller: Add
 Renesas RZ/G2L Interrupt Controller
Message-ID: <YVH6gxfzpo2vT+Ar@robh.at.kernel.org>
References: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210921193028.13099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921193028.13099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 21 Sep 2021 20:30:25 +0100, Lad Prabhakar wrote:
> Add DT bindings for the Renesas RZ/G2L Interrupt Controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
