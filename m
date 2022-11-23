Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53B426350F2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 08:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236167AbiKWHKf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 02:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235892AbiKWHKf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 02:10:35 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79D17F72D8;
        Tue, 22 Nov 2022 23:10:34 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EBD27816A;
        Wed, 23 Nov 2022 07:10:33 +0000 (UTC)
Date:   Wed, 23 Nov 2022 09:10:32 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Ranostay <mranostay@ti.com>
Cc:     michael@walle.cc, vigneshr@ti.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, a.zummo@towertech.it,
        linus.walleij@linaro.org, lee@kernel.org, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v5 3/4] rtc: rtc-tps6594: Add support for TPS6594 PMIC RTC
Message-ID: <Y33HaAOjGwESUJZ6@atomide.com>
References: <20221123053512.1195309-1-mranostay@ti.com>
 <20221123053512.1195309-4-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123053512.1195309-4-mranostay@ti.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Matt Ranostay <mranostay@ti.com> [221123 05:33]:
> From: Keerthy <j-keerthy@ti.com>
> 
> Add support for TPS6594 PMIC RTC. However, currently only get/set of
> time + date functionality is supported.

Reviewed-by: Tony Lindgren <tony@atomide.com>
