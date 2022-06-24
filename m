Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C25559EA1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jun 2022 18:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiFXQe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jun 2022 12:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiFXQe5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jun 2022 12:34:57 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C19B47545;
        Fri, 24 Jun 2022 09:34:56 -0700 (PDT)
Received: from p508fdadf.dip0.t-ipconnect.de ([80.143.218.223] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1o4mGk-00027S-7X; Fri, 24 Jun 2022 18:34:54 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: rockchip: add gpio-ranges
Date:   Fri, 24 Jun 2022 18:34:53 +0200
Message-ID: <9957098.lvqk35OSZv@phil>
In-Reply-To: <20220623160801.240779-2-sebastian.reichel@collabora.com>
References: <20220623160801.240779-1-sebastian.reichel@collabora.com> <20220623160801.240779-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Donnerstag, 23. Juni 2022, 18:08:00 CEST schrieb Sebastian Reichel:
> Allow usage of gpio-ranges with the rockchip gpio controller. The driver
> already had support for this since it has been added to the mainline kernel
> in the first place.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


