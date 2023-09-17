Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1FB7A3559
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Sep 2023 13:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjIQL1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Sep 2023 07:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236043AbjIQL1M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Sep 2023 07:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE0F10A
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 04:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694949982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BuH7ai+941Vx35jCECU0AJVv0JPHdhh1h4CBSnSFvu8=;
        b=O0xnlCfWyhFM6hH5Xna6EG1KFLi1keGHE4kyG5Wut4lXYHBQDAtcDrFMS/D1Nw9EwyWLE+
        ALpQX+00ceiVCQCUWIstg7pvD35RtRcLmVBpjNz5MiktJNaxeOf+zF4PEtjMdGRTFRKpuF
        uQ62jnqP5PrBfLenC4rToJQ5IuVcv1U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-BOk-F_biP3iur1zt5Y32Rg-1; Sun, 17 Sep 2023 07:26:18 -0400
X-MC-Unique: BOk-F_biP3iur1zt5Y32Rg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a681c3470fso252122366b.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 Sep 2023 04:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694949977; x=1695554777;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BuH7ai+941Vx35jCECU0AJVv0JPHdhh1h4CBSnSFvu8=;
        b=URDBgXXdk16Vc4bklaYvc7N5swH022m8OeBGlnaf+Wg+frX4/aiCm4gdcrHdt3FXWi
         CFDpTnVhUz8+zohcfLnkIhbjiSC23MBJAOUy+mw6aAnZSwqWvbuemwxLLDuYIo3YqI/e
         09Z6eeB14KwV7CNdwnak6dxMlsAkeHZU49mUYHpvQWvKEYk7KgTGR5ZK9F4nyHQf97rX
         1osAV/+KABbWjDoJWtnuBpbhp7VDjCl2wKUzqBVaM2a2uCTiv5JPcpvb2CpUuJXP+KRI
         tGGQUa4PRHnnzP6kewwLaiixIkDmMIOltKVZdAWfaAohb/Coo2fI7am0Bt/UEuKjYMyf
         bqsg==
X-Gm-Message-State: AOJu0YwAUGOQZLd6Z2xcs+G1gm0SMfufMkgPiSyuJmBU28qufU6nRVPX
        RSNCD4P8gCDZOGs1WBejEXcXRnrdLJvRuz+msB++yMQ9jo7zH0VAvJUr2gRQKd5sh6/PWNWFYCx
        PgeXCrnAh8ToEzVEgsFNr1A==
X-Received: by 2002:a17:907:2ccd:b0:9a1:f10d:9746 with SMTP id hg13-20020a1709072ccd00b009a1f10d9746mr5350174ejc.20.1694949977643;
        Sun, 17 Sep 2023 04:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFXW3JSeOF0nLlD6YyQtID0cQESf5QaSb04tcI6mRO+ygDijyyCnMhIit5NcoM6CKQpu5Qew==
X-Received: by 2002:a17:907:2ccd:b0:9a1:f10d:9746 with SMTP id hg13-20020a1709072ccd00b009a1f10d9746mr5350151ejc.20.1694949977292;
        Sun, 17 Sep 2023 04:26:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mc17-20020a170906eb5100b0098733a40bb7sm4844010ejb.155.2023.09.17.04.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 04:26:16 -0700 (PDT)
Message-ID: <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
Date:   Sun, 17 Sep 2023 13:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Content-Language: en-US, nl
To:     Greg KH <gregkh@linuxfoundation.org>,
        Wentong Wu <wentong.wu@intel.com>
Cc:     arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2023091704-nape-coconut-af6c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc, Greg,

On 9/17/23 12:42, Greg KH wrote:
> On Sun, Sep 17, 2023 at 02:53:32AM +0800, Wentong Wu wrote:
>> Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
>> IO-expander adds additional functions to the host system such
>> as GPIO, I2C and SPI with USB host interface. We add 4 drivers
>> to support this device: a USB driver, a GPIO chip driver, a I2C
>> controller driver and a SPI controller driver.
>>
>> ---
>> v19:
>>  - add v17's change which v18 doesn't apply
> 
> I don't understand this changelog line at all, what do you mean?
> 
>> v18:
>>  - rebase patch set on top of Linus' master branch (57d88e8a5974644039fbc47806bac7bb12025636)
> 
> Why?  What required this?

I noticed that this did not apply cleanly (the SPI patch did not apply
cleanly), so I asked for the next version to be based on 6.6-rc1 or
Linus' master branch.

Note I did not ask for a new version to be send right away, but
I'm afraid there has been a bit of miscommunication and instead
of rebasing the next version based on further review Wentong has
send out a new rebased version immediately, sorry about that.

Regards,

Hans




