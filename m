Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B69CE745E23
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jul 2023 16:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjGCOHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jul 2023 10:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjGCOHb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jul 2023 10:07:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777A8B3
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jul 2023 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688393211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CB8PxyDNwVkJMIW4hfmSSWI5RtlCTt1qxsK0d6XKaw4=;
        b=KiFKSEbsBQ1eZ14DVaP+0aAhyuWaM8sYvXmj2mF6Mrun/yRz/+euwW8MQN2rXcih/FVzzk
        0CZzSdJ6IxkjDFvBuitqAzZar2Vzdtj6MO3bTL/4B9FRsMb/6NtOt6P3TlYm7P8jk9x1jP
        UPYQ+9pLFztz2X5Lt1xiQEME82nYul0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-BbGTYYHoPPeWg2bY44xsJw-1; Mon, 03 Jul 2023 10:06:50 -0400
X-MC-Unique: BbGTYYHoPPeWg2bY44xsJw-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-bacd408046cso4875664276.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jul 2023 07:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393210; x=1690985210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CB8PxyDNwVkJMIW4hfmSSWI5RtlCTt1qxsK0d6XKaw4=;
        b=Lm19NVGfiJO71qEGeHbXXnDy9/cBhxR+pxFBVwsYvbOINAWSdDEwt1u/X9XTZ0TW6R
         ZplTTHiLMd1CNuGPp799uJv5se2iiC5yzCLBLx6q6LnSFWaH6pTSPt6uB72b1JE6b+0N
         lVNPimZsJSqblF0pZES43qam9TT0lIJ3H9ZmU/sXvzTApyfs3PJliOQu2VEnRzOLifF4
         +nhetGtMg88JR122PCVsdUwXGIAS6e1O6mvVlu9RABZKZ8ekKaC/LomVMFtKuaqe2A3y
         zHm4uodS4l9n7N7LRtf28hoH7nQKNPg+mRlTg/jUWouliR0u7+Xg1wrpn+yP0r73AFtC
         fqjw==
X-Gm-Message-State: ABy/qLYQ8AoqaAQs5wouA53sTLZr/Fi8Ib48SnEpSJE6ldxKT7JOYEvl
        PSWOYt5cJIoTFf78vJ4Cym537GPWRBA2MGviJ8ZPIKetR53cFVDW9JYSXKwx9ENQoXzj1bYnXJi
        VU/DS/lmcYic0YDgy3+LMy9gjxHTBhGKx9FVz1w==
X-Received: by 2002:a25:cfd0:0:b0:c4d:f174:3c83 with SMTP id f199-20020a25cfd0000000b00c4df1743c83mr4576945ybg.36.1688393209878;
        Mon, 03 Jul 2023 07:06:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFL9AvmP2dHOWHf/Kz2nSTH0l+Cv3iKQAmB5Od+UQBYtwns0Up/LcC6ba4zFUuffi4csE/qtbIWQ48IbCK/1A0=
X-Received: by 2002:a25:cfd0:0:b0:c4d:f174:3c83 with SMTP id
 f199-20020a25cfd0000000b00c4df1743c83mr4576932ybg.36.1688393209675; Mon, 03
 Jul 2023 07:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230703121838.70898-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230703121838.70898-1-andriy.shevchenko@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jul 2023 16:06:38 +0200
Message-ID: <CAO-hwJJOW6QT-weKqTC5QJnP5e6EjJD3-d0-cxePpdHOj3Epkg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpiolib: Avpid modifying GPIO chip fwnode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 3, 2023 at 2:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Ideally the GPIO chip data structure has to be constant.
> In real life it's not true, but we can make it closer to
> that. Hence the series.
>
> Benjamin, would be nice it you can perform regression test for your
> case.


FWIW:
Tested-by: Benjamin Tissoires <bentiss@kernel.org>

I've tested Danny's series + my SSDT override, with and without your
series on top of the master of hid.git (v6.4+merge of the hid.git tree
for v6.5-rc1), and in both cases, I can access the I2C-HID node that
sits on top of the CP2112 USB adapter.

Cheers,
Benjamin


>
>
> Bart, the idea is that this series has to land immediately after
> v6.5-rc1 is out so we will have longer time to fix any downsides
> and regressions found, if any.
>
> Andy Shevchenko (3):
>   gpiolib: of: Don't use GPIO chip fwnode in of_gpiochip_*()
>   gpiolib: acpi: Don't use GPIO chip fwnode in acpi_gpiochip_find()
>   gpiolib: Do not alter GPIO chip fwnode member
>
>  drivers/gpio/gpiolib-acpi.c |  2 +-
>  drivers/gpio/gpiolib-of.c   |  6 +++---
>  drivers/gpio/gpiolib.c      | 16 ++++++++--------
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> --
> 2.40.0.1.gaa8946217a0b
>

