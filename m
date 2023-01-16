Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3071766CD51
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 18:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbjAPRft (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 12:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234413AbjAPRex (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 12:34:53 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 81D1F1353F;
        Mon, 16 Jan 2023 09:11:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C8B278108;
        Mon, 16 Jan 2023 17:11:00 +0000 (UTC)
Date:   Mon, 16 Jan 2023 19:10:59 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <Y8WFIzElz8/pv4uy@atomide.com>
References: <20230116071602.63788-1-tony@atomide.com>
 <167388667378.596858.12053272103098373981.robh@kernel.org>
 <CAL_JsqLQMkU-r=E2wmbgO9+PA=XxAeR2OC5isAYY701f6V+BOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLQMkU-r=E2wmbgO9+PA=XxAeR2OC5isAYY701f6V+BOQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Rob Herring <robh+dt@kernel.org> [230116 16:39]:
> I imagine you don't want to go change all these node names, so I'd
> make the schema accept them.

Heh yeah, I was wondering about that too :) Some can be handled with a
regex, but there are still a lot of completely custom names. If you have
some preferred solution in mind, please let me know.

Regards,

Tony
