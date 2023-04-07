Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509306DB3D2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Apr 2023 21:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjDGTAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Apr 2023 15:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjDGS7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2023 14:59:42 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EEAE190
        for <linux-gpio@vger.kernel.org>; Fri,  7 Apr 2023 11:58:13 -0700 (PDT)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 0d580af0-d576-11ed-b972-005056bdfda7;
        Fri, 07 Apr 2023 21:57:33 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 7 Apr 2023 21:57:32 +0300
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Message-ID: <ZDBnnKy7QF0KZuZd@surfacebook>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thu, Apr 06, 2023 at 11:33:41AM +0200, Alexander Stein kirjoitti:
> Hello everyone,
> 
> thanks for the feedback I've received. This is the first non-RFC series for
> adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
> 
> Changes compared to RFC v2 are mentioned in each patch.

Reading the (poor?) documentation does not clarify the use case.
Looking at them I think that this is can be implemented as debounce.
Also I have no clue why it's so important that we _need_ to have a
driver for this. We have plenty of consumer drivers that implement
delays on ramping up or down or whatever if they need.

Which part(s) did I got wrong?

P.S. Are we going to have a _driver_ per each subtle feature like this?

-- 
With Best Regards,
Andy Shevchenko


