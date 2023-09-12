Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F91379D5EB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 18:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbjILQOB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 12:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbjILQOA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 12:14:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EC71708;
        Tue, 12 Sep 2023 09:13:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E3FC433C7;
        Tue, 12 Sep 2023 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694535235;
        bh=VMD8t60BA+fCYVFp8qTJVU+Brl+tdICb5l7zWFYfnKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EgSA+CgeT4U0riGc9bKF4o7L8Dgij214PvxnOkAXsbS7hIy4MSzgAgRrqjeRmpJ7c
         TCoVKkPtQlIbj5vWFWQC1tnrtDi65nYaAlDZbczmM/o94cD5NCGojb5zVkNzrHakB/
         EnavcASxWLyylXyc2DrsWxCWwYsdxT/QMLhmRSyYdPUCUXIA9qk+sJyQZA7tDsNw0A
         7pI9cAUsMNSVvPo5MTCoYy6mG/NSLQhGkEVBCXzEOcTRcLgG4nq8CsdTIqF7Idkk2e
         OlYqxcIth9YAkwt1lkPIDi1u22Gx8wX1Ssokm9mmTr76Vf3Eir3In+f1Wx/lGMfW7r
         uzEbPMi92BQUw==
Received: (nullmailer pid 876995 invoked by uid 1000);
        Tue, 12 Sep 2023 16:13:50 -0000
Date:   Tue, 12 Sep 2023 11:13:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Claudiu <claudiu.beznea@tuxon.dev>
Cc:     magnus.damm@gmail.com, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, nfraprado@collabora.com,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        quic_bjorande@quicinc.com, devicetree@vger.kernel.org,
        geert+renesas@glider.be, linux-serial@vger.kernel.org,
        neil.armstrong@linaro.org, rafal@milecki.pl,
        linus.walleij@linaro.org, ulf.hansson@linaro.org,
        conor+dt@kernel.org, biju.das.jz@bp.renesas.com, will@kernel.org,
        konrad.dybcio@linaro.org, catalin.marinas@arm.com,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org,
        sboyd@kernel.org, wsa+renesas@sang-engineering.com, arnd@arndb.de
Subject: Re: [PATCH 31/37] dt-bindings: mmc: renesas,sdhi: Document RZ/G3S
 support
Message-ID: <169453523020.876931.11164985828808831748.robh@kernel.org>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
 <20230912045157.177966-32-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912045157.177966-32-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue, 12 Sep 2023 07:51:51 +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Document support for the SD Card/MMC interface on the Renesas
> RZ/G3S (R9A08G045) SoC.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

