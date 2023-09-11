Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2DF79BA0C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239569AbjIKUzG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236939AbjIKLn7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 07:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37ACECEB
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694432588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iKdjkytRW1RKARIy7Ovk3eIg/sQI4Dyr5qqVf3qxKz0=;
        b=c98mYypFrNPajZyehVS0iHDPU5cjzaZYbStCbQTp0NWGUlTuVSWGGJ0EKxRv50j2X88pMU
        YYcbm8ufNs6uo5qOa0jwFMpxB3VNHdqQeDvjdBxZqKdaQCp9QLmup4HCSi66LSXIHbterF
        VNMUd9+S+QGkL+OBk80WVNw6fMDA95k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-bSCDCwIpOUqnn6zHq1OJ6A-1; Mon, 11 Sep 2023 07:43:06 -0400
X-MC-Unique: bSCDCwIpOUqnn6zHq1OJ6A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99388334de6so285455966b.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 04:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432585; x=1695037385;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iKdjkytRW1RKARIy7Ovk3eIg/sQI4Dyr5qqVf3qxKz0=;
        b=eqWk6cjRsFUS0DU2waStz7mRWYYr6ID5/LuvYew5TihtVCZ9rtqa+5u58kM+VIQgjj
         H8N7W5Vz3ON2Hje0qZsqXTSRlixljQh8C+iuiV1gElLbdtasotwLmM/TYJhSKs+gs0k0
         Zfjtuao8FKKJd92xzRZY9dl6x+G20YmxQtP/GhzZCpIVGmaYXwCHCKRTfzY1DnNKQzLo
         BAKoTzRRFFCZlMC8wclhcvxXIp0cha4hEdfBSLsEYlDM1erB+pUYbD9PjAcBd+p0Xn6r
         PBtfYD3f81X/UdWQjSLwJ3bz8NsKjcaMS0QWbJkyqVRk992RzsUU6IggisywlEBuwT/3
         60JQ==
X-Gm-Message-State: AOJu0YxvzApzzer+88RSE0K2cx1i8Oxntx8IQmPAwRDQB2OElrVHiMZY
        AKqgPIZVHTi/MJZ4QC72j5TcE4Bg3BqdatD2+M8+aWt3T/J1NjsbPAFUQUy7RiZ21DRpPi72a3T
        9qZuEcf2KuaZQs6Fk+pk6MQ==
X-Received: by 2002:a17:906:3112:b0:9a1:914e:490e with SMTP id 18-20020a170906311200b009a1914e490emr7302017ejx.53.1694432585399;
        Mon, 11 Sep 2023 04:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF6L5QiZIF0AMsl3073IFMxcJiS8zc6zqEssMd1l9qYLyrRfhHjHEXeCPy7+HjFRkrdhI3EQ==
X-Received: by 2002:a17:906:3112:b0:9a1:914e:490e with SMTP id 18-20020a170906311200b009a1914e490emr7302004ejx.53.1694432585103;
        Mon, 11 Sep 2023 04:43:05 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id va17-20020a17090711d100b009929ab17be0sm5187708ejb.162.2023.09.11.04.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:43:04 -0700 (PDT)
Message-ID: <cc9f31c3-ad0a-a688-c202-ce432dc71daa@redhat.com>
Date:   Mon, 11 Sep 2023 13:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between pdx86 android tablets branch and
 GPIO due for the v6.7 merge window
Cc:     linux-gpio@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bart, Linus, et. al.,

As promised here is a pull-req for merging into the GPIO tree
this makes the x86-android-tablets code stop using gpiolib
private APIs (to provide a cleaner basis for Bart's gpiolib work).

Regards,

Hans


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-ib-x86-android-tablets-v6.7

for you to fetch changes up to 9578db7939fcfa0bdfa6ab767fd0386adf2302eb:

  platform/x86: x86-android-tablets: Drop "linux,power-supply-name" from lenovo_yt3_bq25892_0_props[] (2023-09-11 13:28:59 +0200)

----------------------------------------------------------------
Immutable branch between pdx86 android tablets branch and GPIO due for the v6.7 merge window

ib-x86-android-tablets-v6.7: v6.6-rc1 + ib-pdx86-android-tablets
for merging into the GPIO subsystem for v6.7.

----------------------------------------------------------------
Hans de Goede (8):
      gpiolib: acpi: Check if a GPIO is listed in ignore_interrupt earlier
      gpiolib: acpi: Add a ignore interrupt quirk for Peaq C1010
      platform/x86: x86-android-tablets: Remove invalid_aei_gpiochip from Peaq C1010
      platform/x86: x86-android-tablets: Remove invalid_aei_gpiochip support
      platform/x86: x86-android-tablets: Create a platform_device from module_init()
      platform/x86: x86-android-tablets: Stop using gpiolib private APIs
      platform/x86: x86-android-tablets: Use platform-device as gpio-keys parent
      platform/x86: x86-android-tablets: Drop "linux,power-supply-name" from lenovo_yt3_bq25892_0_props[]

 drivers/gpio/gpiolib-acpi.c                        |  30 +++++-
 drivers/platform/x86/x86-android-tablets/asus.c    |   1 +
 drivers/platform/x86/x86-android-tablets/core.c    | 117 ++++++++++++---------
 drivers/platform/x86/x86-android-tablets/lenovo.c  |  29 +++--
 drivers/platform/x86/x86-android-tablets/other.c   |  11 +-
 .../x86/x86-android-tablets/x86-android-tablets.h  |   7 +-
 6 files changed, 118 insertions(+), 77 deletions(-)

