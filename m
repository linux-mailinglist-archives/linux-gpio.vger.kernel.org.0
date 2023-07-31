Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283A5768BD3
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Jul 2023 08:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjGaGTN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Jul 2023 02:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGaGTM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Jul 2023 02:19:12 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 57B50188;
        Sun, 30 Jul 2023 23:19:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A2977809E;
        Mon, 31 Jul 2023 06:19:09 +0000 (UTC)
Date:   Mon, 31 Jul 2023 09:19:08 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v7 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230731061908.GG5194@atomide.com>
References: <20230721082654.27036-1-tony@atomide.com>
 <169021456020.3622493.10284534202541859578.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169021456020.3622493.10284534202541859578.robh@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Rob Herring <robh@kernel.org> [230724 16:02]:
> On Fri, 21 Jul 2023 11:26:49 +0300, Tony Lindgren wrote:
> > Update binding for yaml and remove the old related txt bindings. Note that
> > we are also adding the undocumented pinctrl-single,slew-rate property. And
> > we only use the first example from the old binding.
...
> Reviewed-by: Rob Herring <robh@kernel.org>

Krzysztof, does this look OK to you now?

Regards,

Tony

