Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6AABBADB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 19:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438062AbfIWR6b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 13:58:31 -0400
Received: from muru.com ([72.249.23.125]:34314 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393421AbfIWR6a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Sep 2019 13:58:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DE9AA809F;
        Mon, 23 Sep 2019 17:59:02 +0000 (UTC)
Date:   Mon, 23 Sep 2019 10:58:27 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: devicetree.c: remove orphan
 pinctrl_dt_has_hogs()
Message-ID: <20190923175827.GA5610@atomide.com>
References: <20190923142005.5632-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923142005.5632-1-linux@rasmusvillemoes.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Rasmus Villemoes <linux@rasmusvillemoes.dk> [190923 14:20]:
> The helper pinctrl_dt_has_hogs() was introduced in
> 99e4f67508e1 (pinctrl: core: Use delayed work for hogs), but the sole
> use then got removed shortly after in 950b0d91dc10 (pinctrl: core: Fix
> regression caused by delayed work for hogs).

Oops, thanks for catching it:

Acked-by: Tony Lindgren <tony@atomide.com>
