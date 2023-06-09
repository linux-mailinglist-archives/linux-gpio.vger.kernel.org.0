Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9270B72A443
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 22:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjFIUTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 16:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjFIUTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 16:19:04 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9BAB9
        for <linux-gpio@vger.kernel.org>; Fri,  9 Jun 2023 13:19:03 -0700 (PDT)
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id de23169b-0702-11ee-b972-005056bdfda7;
        Fri, 09 Jun 2023 23:18:59 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 9 Jun 2023 23:18:59 +0300
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential
 glitch in gpioset.py
Message-ID: <ZIOJM-CgPrfKtIFC@surfacebook>
References: <20230609153607.133379-1-warthog618@gmail.com>
 <20230609153607.133379-2-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609153607.133379-2-warthog618@gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fri, Jun 09, 2023 at 11:36:06PM +0800, Kent Gibson kirjoitti:
> gpioset.py requests lines without setting their output value, and so
> sets them all inactive, and subsequently sets them to their requested
> value.  This can result in glitches on lines which were active and
> are set active.
> 
> As this is example code, it is also important to demonstrate that the
> output value can be set by the request itself.
> 
> Request the lines with the correct output values set in the request
> itself.

Do we need a comment in the code to specify this?

...

> +    config = dict([(l, settings(v)) for (l, v) in lvs])

Aren't [] not needed?

-- 
With Best Regards,
Andy Shevchenko


