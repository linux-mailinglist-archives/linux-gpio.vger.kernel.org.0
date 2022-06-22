Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6A855446D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jun 2022 10:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352087AbiFVHzC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 03:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351750AbiFVHyz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 03:54:55 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABCB37A17
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 00:54:53 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3177f4ce3e2so131000277b3.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 00:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=1QurFpwvS/mLrEGaQ5awVF8GVDN87oF0RVZ2hfv+BpA=;
        b=mlorrDYqFcWlBJUsi6zOZt1S8xRzloUJBb15smVQPrNr0DGFHx+AzQz91p9D0Zn8e3
         piHx/9Upt2KapDIWTdOC70/NuMTW1PTgd/dYY9jK/F4O077Jv8vZeWn3l1tSKeYWFeDI
         z6GcKdOJ6nxNiHrKQT54DJrPky5GTS/o/Y5rxaqpE1O6ar3RbAvhg2WlZ0yy5PvGb7gQ
         /9WT/HCbMCuyASGkW59oSMYvbwiwtu2v3FoZ+OrvONM4LIKUfoOaEowdExJ2SlJ/FNst
         jiL2a/55kU9CWP2NPRWZMyBiiHwM4k/ucybpCNnN+hat4xU5v3jWpG1NfBHjn5bg6rG+
         d/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=1QurFpwvS/mLrEGaQ5awVF8GVDN87oF0RVZ2hfv+BpA=;
        b=TPlifyfApZkFmiUGVO7dYeCGi8d62RhGIuqXYLzuxD79dWcWh2YXIUQQ4hqyWrxQ/W
         fS3AM33OGws3hT6ydKScgQMCgnv/6Or5Ib1lsAW/ozUUsVVCyV0mmkcoRCdI/FuWxupP
         hlC7ZqhoptcXV1uO8o7/p9EkTGMaAXjZTdSoBGMOXfflhaTrRXb5tbsOE5IqSHoB5LIg
         B4l/IpdgUHMkeMovC6MDlofwMzTV/O6XXnrNrknH2v+GE/ORKIE1AOXoAMMSjYs3fixV
         cBPgpnTxh1HcvUjeNnk6aVD1kV2USOzgUAXNm57OIUrtWm2jjbZwH0hzDWBNZVIQSt30
         SQoA==
X-Gm-Message-State: AJIora/gOgS/Zj64tG7hXHfRYJmVna5zf2o7AaECFDF6Pj848o/HSdUa
        lEsLsGFr6PsXdfbUgc6rgFMqn0C/dYffii7iNnFWkEiS6bhfuQ==
X-Google-Smtp-Source: AGRyM1txJEbxV2QgPWQtyTzY11cts5Rn4JPTG0MLobGfuA+Um6ODOBgIFggqHUDdA/HZfnCBNQprxvBCGbeyYwVrVXo=
X-Received: by 2002:a81:a212:0:b0:317:7a55:c7cb with SMTP id
 w18-20020a81a212000000b003177a55c7cbmr2659537ywg.13.1655884492490; Wed, 22
 Jun 2022 00:54:52 -0700 (PDT)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 22 Jun 2022 09:54:41 +0200
Message-ID: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
Subject: Reading current output value
To:     Linux GPIO List <linux-gpio@vger.kernel.org>
Cc:     brgl@bgdev.pl
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On a am335x based board I have a GPIO pin that enables/disables power
of an external device (the bootloader sets this pin to output and 1,
and the kernel is instructed to not change it). Using kernel
5.19.0-rc2 and sysfs interface, I can read the current status as
follows:

echo 68 > /sys/class/gpio/export
cat /sys/class/gpio/gpio68/value

As a result, I read 1.

Using gpioget (libgpiod) v1.6.3, the line will be configured to
"input" and the value is set to 0:

# gpioget 2 4
0

So, how can I read the state without changing it? I am mostly
interested in using the kernel userspace API directly.

By the way, setting pin to 0 works but not to 1:

gpioset 2 4=0 - OK
gpioset 2 4=1 - no level change

sysfs works.

Regards,
Yegor
