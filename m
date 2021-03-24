Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D25A34781B
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 13:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhCXMRW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 08:17:22 -0400
Received: from muru.com ([72.249.23.125]:46584 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230035AbhCXMQo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 08:16:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 208158057;
        Wed, 24 Mar 2021 12:17:38 +0000 (UTC)
Date:   Wed, 24 Mar 2021 14:16:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     andy.shevchenko@gmail.com, haojian.zhuang@linaro.org,
        linus.walleij@linaro.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, tgershi@amazon.com,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] pinctrl: pinctrl-single: remove unused parameter
Message-ID: <YFstp7/WgTG7q3zw@atomide.com>
References: <20210319152133.28705-1-hhhawa@amazon.com>
 <20210319152133.28705-3-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319152133.28705-3-hhhawa@amazon.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Hanna Hawa <hhhawa@amazon.com> [700101 02:00]:
> Remove unused parameter 'pin_pos' from pcs_add_pin().

Reviewed-by: Tony Lindgren <tony@atomide.com>
