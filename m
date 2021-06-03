Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7501F399E67
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhFCKFT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 06:05:19 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:33490 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhFCKFT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 06:05:19 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184] (unknown [IPv6:2a02:a03f:eafb:ee01:398f:956e:2c86:f184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2A60220804A;
        Thu,  3 Jun 2021 12:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622714613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+jqxeeHE2pvKOfNp3PIxGrAXlH3QpY7gaOLQeOxcS/s=;
        b=NqLeydT59bSTvV8Z8ogmgK2XCDNONLd9qe6tcdCdXHx+RSLTQSHHDXug0biMruR2LybETn
        7V6O19Mw0ZHjIxU4ilgparRmeb1mCTurClnmL+CegwSH3Qc97os5H3pqCyXfJZE8iMohUF
        gHFQSCH08N+seNqXDfgwWO48etDl/9McPD90eo+Mxqkc+z2etzHcwPjhIHD+kiyG3q5z2r
        v1zTq0H92QbNgCVyyZyE5X8CdQaEi3JARVjkyz9lBIpOcrp+6og5ET/8XlnRWzsXxZI3w7
        gzR3cOWT/kcipAKSeoMGn2nDq8NpwKM6NCL6+8pYi9kupMJdQslyATZ7uBvQyQ==
Message-ID: <c3823af525703e08f76260e1b154110b97d91c17.camel@svanheule.net>
Subject: Re: [PATCH v3 1/6] gpio: regmap: Add quirk for output data register
From:   Sander Vanheule <sander@svanheule.net>
To:     Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-kernel@vger.kernel.org
Date:   Thu, 03 Jun 2021 12:03:31 +0200
In-Reply-To: <001c48fb08887cbec88f79ebe3bf644b@walle.cc>
References: <cover.1621809029.git.sander@svanheule.net>
         <be5ffefa007ee4ebd7d4cec88f5f2fb7cd5b689e.1621809029.git.sander@svanheule.net>
         <001c48fb08887cbec88f79ebe3bf644b@walle.cc>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael, Bartosz,

On Fri, 2021-05-28 at 08:40 +0200, Michael Walle wrote:
> Am 2021-05-24 00:33, schrieb Sander Vanheule:
> > GPIO chips may not support setting the output value when a pin is
> > configured as an input, although the current implementation assumes 
> > this
> > is always possible.
> > 
> > Add support for setting pin direction before value. The order defaults
> > to setting the value first, but this can be reversed by setting the
> > GPIO_REGMAP_QUIRK_SET_DIRECTION_FIRST flag in regmap_config.quirks.
> 
> Nice! If this is really needed:
> 
> Reviewed-by: Michael Walle <michael@walle.cc>

Looks like the quirk won't be needed for this series, but I can always resubmit
it separately if needed.


Best,
Sander

