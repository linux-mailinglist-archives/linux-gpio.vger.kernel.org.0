Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA615B8BAA
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 17:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiINPV1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 11:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiINPV0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 11:21:26 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8090125587
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 08:21:25 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z191so12555739iof.10
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 08:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8sVnRYf4lRZtHclJFM/PYgijezwVHsVwJUa/M1F9Nfw=;
        b=aU+pRvep+sXGVRr01+jPV7M1KGeUuIOdGm/7Imgv2e35rdbyXzmARUq1pX7NbUK31d
         P7JnZtuwOHE1Y3V+NSrCkrjcfy/IVgYVBkLzYROVFEJ2rN4QRKzlug+IhDRBgsnblfD/
         z6gvdEo890XqggiMeBDVIPT5KAcHLF/iLDo5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8sVnRYf4lRZtHclJFM/PYgijezwVHsVwJUa/M1F9Nfw=;
        b=nvDjEsZUh4N/VEgWqFan0Qe+hRwXVBsQQ4Z+UpLXTV0C/LH8ALtcjZjyrWFzdSP4e9
         gQbETMqejOjRaPEXQtTiJXirjPSEaRQcpEOCAeG/sxw5j0TUdlYj4btw08FiDFyz4ONx
         8Vk/KjWvFk+4NIqFHTKvd/k8cPcA1WkfRGC1Sm/yKvEAt0ljYnC1PEfIlSv3yEED7upF
         EZlVSPxnu979J2fdW7V/Ulk4ASu9/HfpajwVMnRJbA8r17bOqx62I0ZoVF9YFiGzkFT9
         /P5Iirm03pFGP2X4UziTmMXMZg4AkfDw6IO9cwPT92QZ9RD97QfL6SrKnvq0Hdi0PXsw
         VStQ==
X-Gm-Message-State: ACgBeo2NXHVjnKnqtAFwt0iZFjaXyOZtKi6jQ2+zlvYpXpYwvT1xz1Tt
        tjNxPkXAvp9qdmVnHZpzMwfLFBXhkPnOYA==
X-Google-Smtp-Source: AA6agR6K7k/p4jNFz43/ITfeOH18QQD8hlzO5qq+xBfGcRQoMi3dC3HgLDXJPe4k80Emxxa8rdV/ug==
X-Received: by 2002:a05:6638:4107:b0:358:4a01:e1e3 with SMTP id ay7-20020a056638410700b003584a01e1e3mr15352008jab.189.1663168884198;
        Wed, 14 Sep 2022 08:21:24 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id 18-20020a056e020cb200b002f16e7021f6sm6639029ilg.22.2022.09.14.08.21.20
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 08:21:23 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id v128so12526720ioe.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 08:21:20 -0700 (PDT)
X-Received: by 2002:a02:9509:0:b0:349:b6cb:9745 with SMTP id
 y9-20020a029509000000b00349b6cb9745mr18869971jah.281.1663168880396; Wed, 14
 Sep 2022 08:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220912221317.2775651-1-rrangel@chromium.org>
 <20220912160931.v2.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4@changeid> <YyFs5q67RYR2aAy7@black.fi.intel.com>
In-Reply-To: <YyFs5q67RYR2aAy7@black.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 14 Sep 2022 09:21:08 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CU2-YtOfGYXJq3c=-1ttyw=hKZvViOfWGAKkxXO1C5Gw@mail.gmail.com>
Message-ID: <CAHQZ30CU2-YtOfGYXJq3c=-1ttyw=hKZvViOfWGAKkxXO1C5Gw@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] gpiolib: acpi: Add wake_capable parameter to acpi_dev_gpio_irq_get_by
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Tim Van Patten <timvp@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "David S. Miller" <davem@davemloft.net>,
        David Thompson <davthompson@nvidia.com>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
        Lu Wei <luwei32@huawei.com>, Paolo Abeni <pabeni@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2022 at 11:55 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 12, 2022 at 04:13:09PM -0600, Raul E Rangel wrote:
> > +int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name,
> > +                          int index, int *wake_capable)
>
> Here too bool.

I've incorporated both of your suggestions. I instead added
`acpi_dev_gpio_irq_wake_get_by` as the basic function and left
`acpi_dev_gpio_irq_get_by` the same. THis way I don't have to update
any of the callers.
