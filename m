Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F30006D75B4
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Apr 2023 09:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbjDEHkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Apr 2023 03:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237137AbjDEHjy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Apr 2023 03:39:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEF812D
        for <linux-gpio@vger.kernel.org>; Wed,  5 Apr 2023 00:39:53 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g19so32340433lfr.9
        for <linux-gpio@vger.kernel.org>; Wed, 05 Apr 2023 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680680391;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=trKLWSkkrTcQyTH6aAw3mKjWVdPgZ5R0yKwVxH0UJsU=;
        b=SzILj73QuCtvfPX2EcruUcCbJqYXOBtU8q3ydpUQX0ELIbc3dZU3j2n3B2cSOOFC0J
         hwn89DAawJJCP1xnNJV0+O+sN4lKYaql9Y0UVzN6yn2Vwhy4SgjIdGjOvvTF8G+I0WTA
         RyDfD2hrZ5QpO9FCuUt7Zt+s6m2QZs+Z0oTy+3n517PemKUmIWDYRPX3mAjDpnUV6CgQ
         F2817p/s2h4sNgkVZb/b6uPSYa6q1ppU3kB0f+DEyErr4ReZtcm9wX58jgOVDMF2/VDg
         3f50Bbd+Zt0AuX/icWRfVwEp55YaM9y0BUOTP5tM9MzGz74TguCSqLz91UVCAwVeE3uD
         /rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680680391;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trKLWSkkrTcQyTH6aAw3mKjWVdPgZ5R0yKwVxH0UJsU=;
        b=u2PCzZSRS9C71e3v6xyMpExD8HARkpy8X5C9JBL+8dCO3q/SH1xHyveu9gUuiPaC88
         OCbp0LMbi21TfW42vQ9kEjpEovnfAp/GkkdRFHYL1qyi0yPK6K5A7rRk7Pcrn9i7DpQy
         uq9QinrOhgERVWEqtO6hpj217wCdffucpV0Amqw+rJYEFXsEaDwMMm6Va+h8scPI282i
         ZqoS4O/yqWtpyNaLDRRyl6r42ORXAKYqi/9bemLi+pHy6pGtPWe1Yblex0WkpvyM+qtG
         RJhEEz7S+jnuzbko3J4DPXZgecOK5XA26uLa/uo/koDCgu9q1uo+bWe/YvOutmYAtcDV
         kElw==
X-Gm-Message-State: AAQBX9d1QJBOOJQa4nh/huc3hD7HfFS3/qWO5SE/RsTbkHgGgL0cNsV+
        /m1rYudGUnZRdsHrsc+COq6SUKbNFau6FDEJRsDmVtbZ8vYWhXvB
X-Google-Smtp-Source: AKy350bDx2BLB2H9e64wiZmv4r3+DyND3F90zq9mnydGnf7JqPDXx1EbDXxIXXndSTmsWS5IxSdUcIKpk1fNuhCJEqk=
X-Received: by 2002:a19:c206:0:b0:4eb:5232:53ad with SMTP id
 l6-20020a19c206000000b004eb523253admr540899lfc.3.1680680391189; Wed, 05 Apr
 2023 00:39:51 -0700 (PDT)
MIME-Version: 1.0
From:   Vincas Dargis <vindrg@gmail.com>
Date:   Wed, 5 Apr 2023 10:39:40 +0300
Message-ID: <CAPNCXk2OLwVCQmS66Wudj+tfi_6gHb3sxF-U_ecmfRcQ_8M+sA@mail.gmail.com>
Subject: About accessing Intel GPIO pins
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi list,

Chinese manufacturers produce so-called "fanless", "industrial" PCs,
and they advertise that they have GPIO pins available to be used as
digital inputs, for example.

In reality it seems that reading these pins is rather.. low level and
complicated, in sort of "hidden" way. They connect external GPIO
panels directly to CPU.

One manufacturer managed to get for us some sort of examples, and with
their help we could read Skylake GPIO pins, by:

1. mmap()'ing 0xfdae0000

2. adding offset 0x100

3. calculating individual offsets for each pin with some basic multiplication.

Then, I could write some specific values into final pin address to
enable input mode, and then later read (poll) actual value.

Now we got different machines, Kabylake not Skylake, and had to
"fight" to get some examples too... It seems it's same 0xfdae0000 but
with different constant offset, different port offests used, etc...

I wonder, aren't there some sort of more generic way for accessing
Intel GPIO (should I call it PCH GPIO?) pins?

I don't see Skylake/Kabylake gpio driver in [1], but I see some sort
of "pinctrl" Intel drivers in [2].

I have rebuilt Debian 11's kernel with additional configs:

```
CONFIG_GPIOLIB=y
CONFIG_GPIO_F7188X=y
CONFIG_GPIO_IT87=y
CONFIG_GPIO_PCH=y
CONFIG_GPIO_ICH=y
CONFIG_PINCTRL_INTEL=y
```
Though still don't see how to access Intel GPIO. gpiodetect does not list them.

We indeed can use gpiod to read the pins if we get device with F7188X
or IT87 family chips, and it works fine, but is there a way to somehow
make Intel pins available via gpiod too?

Thanks!

[1] https://github.com/torvalds/linux/tree/master/drivers/gpio
[2] https://github.com/torvalds/linux/tree/master/drivers/pinctrl/intel
