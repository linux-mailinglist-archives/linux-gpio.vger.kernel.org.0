Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798E738C216
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 10:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbhEUIkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 04:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbhEUIkJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 04:40:09 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2897C061574;
        Fri, 21 May 2021 01:38:46 -0700 (PDT)
Received: from miraculix.mork.no (fwa191.mork.no [192.168.9.191])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 14L8caPj019527
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 21 May 2021 10:38:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1621586318; bh=Q01SFkcr9Wi5BGak8NCE7jrjuH8xhWe3fF05ul/qluE=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=kOu6oDQXoHqXn1uru7t3jgxj9m9x8BwlHzLTFyMT89s0CrPtYak3FUZ19ysgw64Li
         /6GRSAZ/ZkuLT7cLyHz/Re+ruEors5mhgvy3YGUeXKQRMkXAyqaydhSutjWTA6892D
         KsoJfj+QM0ZLPF8cZPz58B78aekVBJSUsZJwIHpo=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94.2)
        (envelope-from <bjorn@mork.no>)
        id 1lk0g0-0004qS-0I; Fri, 21 May 2021 10:38:36 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Michael Walle <michael@walle.cc>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH v2 2/3] gpio: gpio-regmap: Use devm_add_action()
Organization: m
References: <cover.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
        <e3d3e704804668d1403f3630c181010b34409c8f.1621577204.git.matti.vaittinen@fi.rohmeurope.com>
        <12bb40f022be0378ed493e7ad33122b0@walle.cc>
Date:   Fri, 21 May 2021 10:38:35 +0200
In-Reply-To: <12bb40f022be0378ed493e7ad33122b0@walle.cc> (Michael Walle's
        message of "Fri, 21 May 2021 10:10:39 +0200")
Message-ID: <87a6ooh46s.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Michael Walle <michael@walle.cc> writes:

> Am 2021-05-21 08:28, schrieb Matti Vaittinen:
>> Slightly simplify the devm_gpio_regmap_register() by using the
>> devm_add_action().
>
> Hm, nice, but what bothers me a bit is that no other subsystem
> does it that way, eg. hwmon/hwmon.c or watchdog/watchdog_core.c.
> They also store just one pointer, thus could be simplified in the
> same way. What I don't know is if devm_add_action() was intended
> to be used this way. So I can't say much for this patch ;)

There are some examples.  Like:

int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
{
        int ret;

        ret =3D i2c_add_adapter(adapter);
        if (ret)
                return ret;

        return devm_add_action_or_reset(dev, devm_i2c_del_adapter, adapter);
}


You should probably use the devm_add_action_or_reset() wrapper here too,
catching the unlikely devm_add_action() alloc failure.


Bj=C3=B8rn
