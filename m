Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCA834F867
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 07:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhCaF4e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 01:56:34 -0400
Received: from muru.com ([72.249.23.125]:49068 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233473AbhCaF4S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 01:56:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6F13D80C3;
        Wed, 31 Mar 2021 05:57:19 +0000 (UTC)
Date:   Wed, 31 Mar 2021 08:56:13 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     bcousson@baylibre.com, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-boneblack.dts: unique gpio-line-names
Message-ID: <YGQO/YdTGLiMBXKh@atomide.com>
References: <20210324222201.674905-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324222201.674905-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [210325 00:25]:
> Based on linux-gpio discussion [1], it is best practice to make the
> gpio-line-names unique. Generic names like "[ethernet]" are replaced
> with the name of the unique signal on the AM3358 SoC ball corresponding
> to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> represent "not connected".

Thanks applying into omap-for-v5.13/dt-v2.

Tony
