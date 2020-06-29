Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227A920DD83
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2020 23:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgF2TAL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 15:00:11 -0400
Received: from muru.com ([72.249.23.125]:59960 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728088AbgF2TAK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jun 2020 15:00:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D90A5819C;
        Mon, 29 Jun 2020 16:32:16 +0000 (UTC)
Date:   Mon, 29 Jun 2020 09:31:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: single: support #pinctrl-cells = 2
Message-ID: <20200629163121.GS37466@atomide.com>
References: <20200622172951.524306-1-drew@beagleboard.org>
 <20200629122858.GA506802@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629122858.GA506802@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200629 12:29]:
> Hi Tony - do you think this series is useful as-is?
> 
> Or do you want to see some usage of the seperate conf and mux values
> first?

Hmm to me it seems you should squash patches 2 and 3 together as
otherwise git bisect will fail to boot probably at patch 2.

Regards,

Tony
