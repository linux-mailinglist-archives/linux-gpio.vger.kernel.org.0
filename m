Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24CC38E1F3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 09:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhEXHvf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 03:51:35 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:54666 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbhEXHve (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 03:51:34 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1] (unknown [IPv6:2a02:a03f:eafb:ee01:cbcc:e481:3e58:4db1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 6114B202DC4;
        Mon, 24 May 2021 09:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621842605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VAwS7O7h6ckvOChC2t/wCDFm6SafoLRKGtedg/bk8mU=;
        b=jWzNDqitZO3W8yIV+YDSgKWttTh7DTLkV7/aBhcxzGfUXavmexZi3PlVFuJ5zOfBQi4ExA
        x1dAB1iq/bh/IeVsh6EGM2XIBf3vIJyTY4J3X/u5VZncp2Y0aEZtaSTe1Dtf1VWiPJQsTw
        wE5AcuNzGVp1O+eDvPxxQnk4F6uC3XHEAAGm9fThkVrdE/G09nbBFksFx1/jQuynkCOAPz
        DqXCX/Z5l77bFmQ1Ab5Jc9gvtA0fVklL7IjeQ7t0og297ofnzoRoXEQS+sMsTeStJFWDio
        fb8Re7XNA5hATE5ccEhQV39OA8WBc3GsNzdBv9R762BAeZSs+ADvqpy/tr4bWQ==
Message-ID: <33eb043f2ef9d81bbe26876a1c73859f56a8abd9.camel@svanheule.net>
Subject: Re: [PATCH v2 5/7] mfd: Add RTL8231 core device
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Date:   Mon, 24 May 2021 09:50:02 +0200
In-Reply-To: <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com>
References: <cover.1621279162.git.sander@svanheule.net>
         <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
         <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

I forgot to address one of your questions, so here's a short follow up.

On Tue, 2021-05-18 at 00:18 +0300, Andy Shevchenko wrote:
> On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
> > +       err = regmap_read(map, RTL8231_REG_FUNC1, &v);
> 
> > +       ready_code = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, v);
> 
> If we got an error why we need a read_core, what for?

The chip has a static 5-bit field in register 0x01, called READY_CODE according
to the datasheet. If a device is present, and a read from register 0x01
succeeds, I still check that this field has the correct value. For the RTL8231,
it should return 0x37. If this isn't the case, I assume this isn't an RTL8231,
so the driver probe stops and returns an error value.

Best,
Sander

