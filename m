Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F765B1912
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 11:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiIHJoQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 05:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiIHJoN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 05:44:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5814336DE0;
        Thu,  8 Sep 2022 02:44:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4B121B82054;
        Thu,  8 Sep 2022 09:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A802FC433C1;
        Thu,  8 Sep 2022 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662630247;
        bh=qHxjNZ9eoQ09NzZ60tZWBlc1pAbJDcHWaQgoCpN//1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iCWQfLS6/PmG0MNCNcDnXicpYA60PebcB4mNmBptI9RM11XzEpVEdbRrRAVi3g+WM
         9bNHb5gm1dmNfIpIXDhLsz73BPp/PJaP7V9pMwM2LImPgoXZ7eqFgJ8rUL/pUb29LS
         kYgNpCrgNtRZ/x3rWkyo52sIAfsqm8sGuv2Jg1USWUADtkE3e3sSYXO2ctqUX3iNJj
         I8wIYwk14+Cd7K4fJaA0HFKMGgix8Oia6m7EcD2Yd1yCtataZmqUvZVdORoXwEMfoZ
         xEgRe2EdEOWI2weKbzV0DQl6Me9wdJq9L/yNG4H7WvQE3++krPenwrATqs3oOj3B/L
         6ZG7hbCmoEptw==
Date:   Thu, 8 Sep 2022 10:43:58 +0100
From:   Lee Jones <lee@kernel.org>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Terry Bowman <terry.bowman@amd.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        UNGLinuxDriver@microchip.com,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        katie.morris@in-advantage.com, Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH v16 mfd 7/8] dt-bindings: mfd: ocelot: add
 bindings for VSC7512
Message-ID: <Yxm5Xq13ouKJgXx1@google.com>
References: <20220905162132.2943088-1-colin.foster@in-advantage.com>
 <20220905162132.2943088-8-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905162132.2943088-8-colin.foster@in-advantage.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 05 Sep 2022, Colin Foster wrote:

> Add devicetree bindings for SPI-controlled Ocelot chips, specifically the
> VSC7512.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> 
> (No changes since v14)
> 
> v14
>     * Add Vladimir Reviewed tag
> 
> ---
>  .../devicetree/bindings/mfd/mscc,ocelot.yaml  | 160 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
