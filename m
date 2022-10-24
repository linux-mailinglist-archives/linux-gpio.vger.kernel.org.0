Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F5260BF34
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 02:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbiJYAFw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 20:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbiJYAFT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 20:05:19 -0400
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABA23499F
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 15:22:10 -0700 (PDT)
Received: from rico.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED3B620031;
        Mon, 24 Oct 2022 20:45:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1666615550;
        bh=Pyfg8PLqwBMa5iJ6AGftV675Lj48l10v4mt79o2gAYE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=NNAQ0l/puuiH1M+YaQJCjoDEMwuaXelIzAjQtsA5WlL6Le2LV8KyhyzKvnx/6X7uN
         SaUjBEPa07V7e6rIbT7nbLCzoNgMb6fTMEEwi1O75jE4WKdSnCEhD4ZEbUC4ixp6CV
         NJlLvpf63ecZMlGOA0N5RfKQUPV13ceH+E6p2AyXnfOTrhnfMro1zpht4Infd5z+pk
         ikYE+yVvwRtUMW0PNykNHxQaAEtW1jPsCWXust6Ng8vKfaK2eMOLHjWAgXQphl/oBi
         yFcbdkrHE8rOz5QvDnYZp9bvrEefucq0+nJNshr0PeJTxnBkRr+Mso56DYZOxD4TKE
         KJ1uw019s0Lhg==
Message-ID: <4407163c91f21fa56f88d069a40b738ed307a812.camel@codeconstruct.com.au>
Subject: Re: [PATCH] gpio: ftgpio010: use device name for gpiochip name &
 label
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Matt Johnston <matt@codeconstruct.com.au>
Date:   Mon, 24 Oct 2022 20:45:49 +0800
In-Reply-To: <CACRpkdYEVHR0LCnxn4q=6Ccvu+vWOzR5XwAoaEtPURkubz71wA@mail.gmail.com>
References: <20221024080828.3840438-1-jk@codeconstruct.com.au>
         <CACRpkdYEVHR0LCnxn4q=6Ccvu+vWOzR5XwAoaEtPURkubz71wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.0-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

> Fine by me:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Out of curiosity: what device/SoC are you using this driver with?

Thanks for the review.

We're using the ftgpio driver for GPIO peripherals on the microwatt CPU
implementation; the driver uses a simple & sensible register layout, so
we've based the gateware on that:

 https://github.com/CodeConstruct/microwatt/commit/03293903

That's a fairly arbitrary choice, but it works well as-is.

Cheers,


Jeremy
