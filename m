Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E11838C172
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 10:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbhEUIMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 04:12:25 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:34061 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhEUIMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 04:12:05 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id D4EC62224D;
        Fri, 21 May 2021 10:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621584639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hc1c1PZJhL/A4HLXBtSJVqGzGuuyzG49SjvibWoejWI=;
        b=R+QmkaDBsEZcE056vYscpCKqBmMceb75TLzdAGDvGClvWLvk7XbIKgvLwAmg++HxMuEG5z
        3C4PAHM7gnXJVvRHZlOX2GQ2wVO1m/Q0HKSL/vGVu3f1r6C++4ErFhZl2uXnoDx9/w2jbR
        GrOVbzy6dhqFMlyrwm4A1B52LbqYj+w=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 21 May 2021 10:10:39 +0200
From:   Michael Walle <michael@walle.cc>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
In-Reply-To: <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
 <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <12bb40f022be0378ed493e7ad33122b0@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-21 08:28, schrieb Matti Vaittinen:
> Slightly simplify the devm_gpio_regmap_register() by using the
> devm_add_action().

Hm, nice, but what bothers me a bit is that no other subsystem
does it that way, eg. hwmon/hwmon.c or watchdog/watchdog_core.c.
They also store just one pointer, thus could be simplified in the
same way. What I don't know is if devm_add_action() was intended
to be used this way. So I can't say much for this patch ;)

-michael
