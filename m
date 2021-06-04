Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFEA39B498
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 10:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFDIJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 04:09:24 -0400
Received: from muru.com ([72.249.23.125]:36208 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229925AbhFDIJY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 4 Jun 2021 04:09:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3631E8167;
        Fri,  4 Jun 2021 08:07:45 +0000 (UTC)
Date:   Fri, 4 Jun 2021 11:07:34 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [RESEND PATCH] pinctrl: single: config: enable the pin's input
Message-ID: <YLnfRpV8dvc59lKL@atomide.com>
References: <20210602150420.18202-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602150420.18202-1-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Dario Binacchi <dariobin@libero.it> [210602 15:04]:
> It enables / disables the input buffer. As explained in the description
> of 'enum pin_config_param' this does not affect the pin's ability to
> drive output.

Looks OK to me:

Acked-by: Tony Lindgren <tony@atomide.com>
