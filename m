Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24403691A0E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 09:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjBJIap (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Feb 2023 03:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbjBJIao (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2023 03:30:44 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8AF7B155;
        Fri, 10 Feb 2023 00:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rvaaL7YmRTw6eseyTGi/8V+9zB+Cva0ciBp+yaipxI8=; b=JhAyoAH+Os3JZkiL3QlAjelDTm
        8UKIBiYXhNtkULVHxWWkmjTW2MZfy+l5AlTMtYKGHq225/bKLRb9+wZa3Bvzmbr/B9e3yl2KBs4op
        7e0jVBdn7daaM8bVWBClV+AHdI2j15Qy81mnvpqua6CDPtfa3V3qoTEsQRo/3sLADESQMeOapPokb
        lFIrJdfPDSYLRxNp1HgPxaX6WGZvDF+mVe9TRkRr+2ZBJxY5DsM6DD28Tdj5A4nwYXELFssgH4EJQ
        zsUUT/xCP1f7oAUjriibVfT1A2c2dstIGX8hhYy6YAkIDMoWljAYMEaV836KwducPGzqsdWh1SO+B
        YUuVqHYw==;
Received: from p200300ccff0d84001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0d:8400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1pQOnW-0006oe-AU; Fri, 10 Feb 2023 09:30:22 +0100
Date:   Fri, 10 Feb 2023 09:30:21 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230210093021.216576bd@aktux>
In-Reply-To: <CAL_JsqLQMkU-r=E2wmbgO9+PA=XxAeR2OC5isAYY701f6V+BOQ@mail.gmail.com>
References: <20230116071602.63788-1-tony@atomide.com>
        <167388667378.596858.12053272103098373981.robh@kernel.org>
        <CAL_JsqLQMkU-r=E2wmbgO9+PA=XxAeR2OC5isAYY701f6V+BOQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Mon, 16 Jan 2023 10:38:43 -0600
Rob Herring <robh+dt@kernel.org> wrote:

[...]
> 
> I imagine you don't want to go change all these node names, so I'd
> make the schema accept them.
> 
hmm, if they are not changed, they will end up in new dts submissions tomorrow.
And we have dash vs hyphen. From my experience, that gets commonly rejected. 
Maybe allowing -func also would limit the changes.

For omap3-gta04* I will help cleaning things up.

Regards,
Andreas
