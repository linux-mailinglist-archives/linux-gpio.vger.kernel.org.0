Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D3A393D41
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 08:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhE1Gm2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 02:42:28 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:40215 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhE1Gm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 02:42:28 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id B5A8E22239;
        Fri, 28 May 2021 08:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622184051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aKMstC74m0t8RFg44bHe0X3M6w1j6lfurV7fvVkL2mk=;
        b=OrNcpkyCkHTOICGFAjoV/bdijsuZ6S35nZQyvQ8bx2zMj0AMMYvvRd5wzXXTooyW5Qp1Sl
        Pof9HdN5fZsoE56BHCnxj7fzJQANo824GUAmJDU0Wc2J5w7NtfDi+TdCy0PEAYTSBpyoPZ
        xlnXYh8xEBHNby4CXtyFcWqWZjIYblo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 08:40:49 +0200
From:   Michael Walle <michael@walle.cc>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] gpio: regmap: Add quirk for output data register
In-Reply-To: <be5ffefa007ee4ebd7d4cec88f5f2fb7cd5b689e.1621809029.git.sander@svanheule.net>
References: <cover.1621809029.git.sander@svanheule.net>
 <be5ffefa007ee4ebd7d4cec88f5f2fb7cd5b689e.1621809029.git.sander@svanheule.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <001c48fb08887cbec88f79ebe3bf644b@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-24 00:33, schrieb Sander Vanheule:
> GPIO chips may not support setting the output value when a pin is
> configured as an input, although the current implementation assumes 
> this
> is always possible.
> 
> Add support for setting pin direction before value. The order defaults
> to setting the value first, but this can be reversed by setting the
> GPIO_REGMAP_QUIRK_SET_DIRECTION_FIRST flag in regmap_config.quirks.

Nice! If this is really needed:

Reviewed-by: Michael Walle <michael@walle.cc>

-michael
