Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0BE6AD2D9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 00:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjCFXdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 18:33:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjCFXdL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 18:33:11 -0500
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB2B0769D
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 15:33:04 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 3c75c19d-bc77-11ed-a9de-005056bdf889;
        Tue, 07 Mar 2023 01:33:02 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Tue, 7 Mar 2023 01:33:01 +0200
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Message-ID: <ZAZ4LY+xG2LGiHwh@surfacebook>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Mar 06, 2023 at 09:00:02AM +0000, Biju Das kirjoitti:
> Add pinctrl_get_device() to find a device handle associated with
> a pincontrol group(i.e. by matching function name and group name for a
> device). This device handle can then be used for finding match for the
> pin output disable device that protects device against short circuits
> on the pins.

Not sure I understand the use case. Please, create a better commit message.

Also it is missing the explanation why there will be no collisions when looking
by the same pair of function and group name from different device.

(Always imagine that you have 2+ same IP blocks on the platform before doing
 any pin control core work. This will help you to design it properly. )

-- 
With Best Regards,
Andy Shevchenko


