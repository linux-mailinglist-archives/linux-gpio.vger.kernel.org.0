Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D4B77281A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Aug 2023 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjHGOpj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Aug 2023 10:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbjHGOpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2023 10:45:38 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DF3E310FD;
        Mon,  7 Aug 2023 07:45:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 323CD809D;
        Mon,  7 Aug 2023 14:45:36 +0000 (UTC)
Date:   Mon, 7 Aug 2023 17:45:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230807144534.GQ14799@atomide.com>
References: <20230721082654.27036-1-tony@atomide.com>
 <CACRpkdbOMAGYm2WBJ_opNyfmo55MdMA5YaGiqf_DanCCwix6Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbOMAGYm2WBJ_opNyfmo55MdMA5YaGiqf_DanCCwix6Ug@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [230807 13:33]:
> On Fri, Jul 21, 2023 at 10:27 AM Tony Lindgren <tony@atomide.com> wrote:
> 
> > Update binding for yaml and remove the old related txt bindings. Note that
> > we are also adding the undocumented pinctrl-single,slew-rate property. And
> > we only use the first example from the old binding.
> >
> > As we are mostly using a generic compatible across various SoCs, let's not
> > start adding matches for random pin group node naming. Let's standardize on
> > pin group node name ending in -pins with an optional instance number
> > suffix.
> >
> > As a pin group may have additional pins added to it later on, let's always
> > use -pins rather than -pin for the gropu name.
> >
> > Most of the dts files have been updated already for the pin group node
> > names with a few changes still pending.
> >
> > Cc: Nishanth Menon <nm@ti.com>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >
> > Changes since v6:
> 
> Phew!

Whee!

> Patch applied. Any remaining issues can certainly be fixed in tree.

Yes there should be only few more warnings remaining. Having the
binding in place will enable some nice warning checks to prevent
new inventions for pin group name variants :)

Regards,

Tony
