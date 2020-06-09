Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41BA31F44A1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 20:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388245AbgFISGi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 14:06:38 -0400
Received: from muru.com ([72.249.23.125]:57496 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730160AbgFISGg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:06:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7D1E68088;
        Tue,  9 Jun 2020 18:07:26 +0000 (UTC)
Date:   Tue, 9 Jun 2020 11:06:31 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH v2] pinctrl-single: fix pcs_parse_pinconf() return value
Message-ID: <20200609180631.GS37466@atomide.com>
References: <20200608125143.GA2789203@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608125143.GA2789203@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200608 12:52]:
> This patch causes pcs_parse_pinconf() to return -ENOTSUPP when no
> pinctrl_map is added.  The current behavior is to return 0 when
> !PCS_HAS_PINCONF or !nconfs.  Thus pcs_parse_one_pinctrl_entry()
> incorrectly assumes that a map was added and sets num_maps = 2.
...

> Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")

It would be good to get an ack/tested-by from Haojian for this.

The patch looks right to me:

Acked-by: Tony Lindgren <tony@atomide.com>
