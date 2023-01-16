Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44FA866B7A1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 07:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbjAPGt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 01:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbjAPGt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 01:49:56 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3AFEC83E6;
        Sun, 15 Jan 2023 22:49:56 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A8AA78108;
        Mon, 16 Jan 2023 06:49:55 +0000 (UTC)
Date:   Mon, 16 Jan 2023 08:49:54 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Message-ID: <Y8Tzkn5sS5Gzmqx0@atomide.com>
References: <20230112083152.10277-1-tony@atomide.com>
 <20230113202016.GA2833245-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113202016.GA2833245-robh@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Rob Herring <robh@kernel.org> [230113 20:20]:
> On Thu, Jan 12, 2023 at 10:31:50AM +0200, Tony Lindgren wrote:
> > Update binding for yaml. Note that we are also adding the undocumented
> > pinctrl-single,slew-rate property. And we only use the first example from
> > the old binding.
> 
> Isn't this v2?

Hmm yeah I posted a earlier WIP version of this in the "dt binding check
error with hash and comma" thread, will use v3 for the next version.

Regards,

Tony
