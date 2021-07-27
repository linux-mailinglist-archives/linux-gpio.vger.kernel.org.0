Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEF73D7268
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 11:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhG0J4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 05:56:33 -0400
Received: from muru.com ([72.249.23.125]:55736 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235950AbhG0J4c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 27 Jul 2021 05:56:32 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8803B80F0;
        Tue, 27 Jul 2021 09:56:46 +0000 (UTC)
Date:   Tue, 27 Jul 2021 12:56:27 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] pinctrl: single: Move test PCS_HAS_PINCONF in
 pcs_parse_bits_in_pinctrl_entry() to the beginning
Message-ID: <YP/YSx4dPAe1gl0w@atomide.com>
References: <20210722033930.4034-1-thunder.leizhen@huawei.com>
 <20210722033930.4034-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722033930.4034-3-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Zhen Lei <thunder.leizhen@huawei.com> [210722 03:40]:
> The value of pcs->flags is not overwritten in function
> pcs_parse_bits_in_pinctrl_entry() and its subfunctions, so moving this
> check to the beginning of the function eliminates unnecessary rollback
> operations.

Looks OK to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>
