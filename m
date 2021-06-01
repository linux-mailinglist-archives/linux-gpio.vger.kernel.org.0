Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82404397146
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 12:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhFAKUY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 06:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhFAKUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 06:20:24 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA78C061574;
        Tue,  1 Jun 2021 03:18:43 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8759222236;
        Tue,  1 Jun 2021 12:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622542720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HzIP1Z1xTd2WYU6MG28q+U1UuISttybt2KJCWFWdwxw=;
        b=ikvzPSPBKKIxeop7dDEupVKswEojvHqdVIaaBgq9zIttdbd0AxrcVhK7IQjaziflagzzR+
        hsOwb6huI9MI/NTR6PJL13VijS38vOkSHKf9+DTGq4z2O0/LW0cl6CmAIQKfSx05cA9pVC
        t9oZ4jkZkJ7+jp3ETR1Y7cLEL8IddqA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Jun 2021 12:18:39 +0200
From:   Michael Walle <michael@walle.cc>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sander Vanheule <sander@svanheule.net>,
        Andrew Lunn <andrew@lunn.ch>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/6] RTL8231 GPIO expander support
In-Reply-To: <CACRpkda+m5mOzMJ8KcPmojFGWkUpCrbmY0ySPTVx72RtWwf89A@mail.gmail.com>
References: <cover.1620735871.git.sander@svanheule.net>
 <cover.1621809029.git.sander@svanheule.net> <YKr9G3EfrM34gCsL@lunn.ch>
 <CAHp75VewCw8ES_9S48qmeCtSXMkGWt0s4iub0Fu4ZuwWANHpaQ@mail.gmail.com>
 <02bbf73ea8a14119247f07a677993aad2f45b088.camel@svanheule.net>
 <f03d5cdc958110fc7d95cfc4258dac4e@walle.cc>
 <84352c93f27d7c8b7afea54f3932020e9cd97d02.camel@svanheule.net>
 <a644b8fa-c90a-eab6-9cca-08344abec532@redhat.com>
 <CAHp75VcFmU4rJ6jL204xGFM=s2LV=KQmsV8E75BpuSAZMXBn0w@mail.gmail.com>
 <CACRpkda+m5mOzMJ8KcPmojFGWkUpCrbmY0ySPTVx72RtWwf89A@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e10c8ef7f758b4f7fa0fcbc992c84125@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-06-01 11:59, schrieb Linus Walleij:
> Just regarding all registers/memory cells in a register page
> as default volatile (which is what we do a lot of the time)
> has its upsides: bugs like this doesn't happen.

I don't think this is the bug here. If it is really a write-only 
register
the problem is the read in RMW. Because reading the register will return
the input value instead of the (previously written) output value.

-michael
