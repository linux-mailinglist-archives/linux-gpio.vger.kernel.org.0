Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EB7791278
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Sep 2023 09:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235810AbjIDHpE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Sep 2023 03:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245561AbjIDHpD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2023 03:45:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F270B132
        for <linux-gpio@vger.kernel.org>; Mon,  4 Sep 2023 00:44:14 -0700 (PDT)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-WnAaJKbjO8afTNJjgR_n7g-1; Mon, 04 Sep 2023 03:44:13 -0400
X-MC-Unique: WnAaJKbjO8afTNJjgR_n7g-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-500c67585acso1095131e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Sep 2023 00:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693813451; x=1694418251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCnPbYvxu38HX07qEqAnvqBEBRaaRpiyl4NRXxuXsDE=;
        b=Zfn8cgbQETA0DZXrwPD23HuMffyX9Nun7BEUam6Iv5D/lo70bpCWMfVFmfIAoxJTQv
         XaD0wjJepsEWtZ81SiG7iCUXL7fJvwHzaqrcIqnLaGfP5g1KqgO4rwkkMq/uBWIGH9w5
         pU9T5MmQhb2TsSuSpRKBf9ajztSAJeFHxIMU9mZi0OlLAP/k6HyxqfWZc5r3aLDuqEqm
         TdTYD+sRDJq1s/80QxkZpkiug8qstmtoOmoWZwwFDzHvpB2qUWtbvtiNcVpetRyRrse6
         zF2fsyuci8rxvFD73f7Tm72j80BVHzNb8+A0C4uVIjv8ytv3vNsGlfTnUblbEPazV2x/
         cNuQ==
X-Gm-Message-State: AOJu0YxpgGQDPMXrb0hAtWa7SWCUYrht66SKquDctkT/QfG+ZuE4U+OK
        oZKKgUDtQAOoGxRMtRUrQJk+Bzkq8uYQ7VSEtR+5pmRtiVDu1W3buAlOxXgjCeVpg0JsiGkcAd0
        KATug4HprSJP7UpYdlP9N/w==
X-Received: by 2002:a05:6512:3055:b0:500:7fc7:852f with SMTP id b21-20020a056512305500b005007fc7852fmr7328705lfb.39.1693813451658;
        Mon, 04 Sep 2023 00:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGutLONW5RyLNG298Yk7nmHrk0pqiIoQ0OSUln1oaU5ReOgAXS+F8oZC7W+1jIcmQbbdPfkeA==
X-Received: by 2002:a05:6512:3055:b0:500:7fc7:852f with SMTP id b21-20020a056512305500b005007fc7852fmr7328677lfb.39.1693813451337;
        Mon, 04 Sep 2023 00:44:11 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id n16-20020a1709061d1000b0097404f4a124sm5727038ejh.2.2023.09.04.00.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:44:10 -0700 (PDT)
Message-ID: <5674e677-2bdc-bb0e-20cc-2ec855d1f8d4@redhat.com>
Date:   Mon, 4 Sep 2023 09:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v14 0/4] Add Intel LJCA device driver
Content-Language: en-US
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com
References: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1693806261-12958-1-git-send-email-wentong.wu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/4/23 07:44, Wentong Wu wrote:
> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
> IO-expander expands additional functions to the host system
> such as GPIO, I2C and SPI with USB host interface. We add 4
> drivers to support this device: a USB driver, a GPIO chip driver,
> a I2C controller driver and a SPI controller driver.
> 
> ---
> v14:
>  - fix build error: implicit declaration of function 'acpi_dev_clear_dependencies'
> 
> v13:
>  - make ljca-usb more robust with the help of Hans de Goede
>  - call acpi_dev_clear_dependencies() to mark _DEP ACPI dependencies on the I2C controller as satisfied, and patch is from Hans de Goede

Thank you I can confirm that v14 works well on my ThinkPad x1 yoga gen 8:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Note I still have one small remark for patch 1/4, I'll reply to
the patch itself with the remark.

Regards,

Hans

> 
> v12:
>  - switch dev_err to dev_dbg for i2c-ljca driver
>  - avoid err printing because of calling usb_kill_urb when attempts to resubmit the rx urb
> 
> v11:
>  - switch dev_err to dev_dbg for i2c-ljca driver
>  - remove message length check because of defined quirk structure
>  - remove I2C_FUNC_SMBUS_EMUL support
> 
> v10:
>  - remove ljca_i2c_format_slave_addr
>  - remove memset before write write w_packet
>  - make ljca_i2c_stop void and print err message in case failure
>  - use dev_err_probe in ljca_i2c_probe function
> 
> v9:
>  - overhaul usb-ljca driver to make it more structured and easy understand
>  - fix memory leak issue for usb-ljca driver
>  - add spinlock to protect tx_buf and ex_buf
>  - change exported APIs for usb-ljca driver
>  - unify prefix for structures and functions for i2c-ljca driver
>  - unify prefix for structures and functions for spi-ljca driver
>  - unify prefix for structures and functions for gpio-ljca driver
>  - update gpio-ljca, i2c-ljca and spi-ljca drivers according to usb-ljca's changes
> 
> Wentong Wu (4):
>   usb: Add support for Intel LJCA device
>   i2c: Add support for Intel LJCA USB I2C driver
>   spi: Add support for Intel LJCA USB SPI driver
>   gpio: update Intel LJCA USB GPIO driver
> 
>  drivers/gpio/Kconfig          |   4 +-
>  drivers/gpio/gpio-ljca.c      | 246 +++++++------
>  drivers/i2c/busses/Kconfig    |  11 +
>  drivers/i2c/busses/Makefile   |   1 +
>  drivers/i2c/busses/i2c-ljca.c | 334 +++++++++++++++++
>  drivers/spi/Kconfig           |  11 +
>  drivers/spi/Makefile          |   1 +
>  drivers/spi/spi-ljca.c        | 297 +++++++++++++++
>  drivers/usb/misc/Kconfig      |  14 +
>  drivers/usb/misc/Makefile     |   1 +
>  drivers/usb/misc/usb-ljca.c   | 834 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/ljca.h      | 113 ++++++
>  12 files changed, 1762 insertions(+), 105 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-ljca.c
>  create mode 100644 drivers/spi/spi-ljca.c
>  create mode 100644 drivers/usb/misc/usb-ljca.c
>  create mode 100644 include/linux/usb/ljca.h
> 

