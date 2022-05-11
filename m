Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FB9522EBE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 May 2022 10:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiEKIxO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 May 2022 04:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiEKIxN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2022 04:53:13 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FCE5F272
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2022 01:53:11 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 16so1655185lju.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2022 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibbo.com; s=google;
        h=to:from:subject:organization:message-id:date:user-agent
         :mime-version:content-language;
        bh=GjaJTmJQLfoieKVIhH0A76iGZeFWuXIsg6hUtVj7nDs=;
        b=c64aKCebJfEzkplGmYtMmoc3+f0Z5BfR2/p8zaSsbbmlq/uXoNAeqMI5AG00ChP29c
         hElydN7UiXth/2Lb561iCu3UjCs0CBBGJzU35R0x+si2Y4xMndYgE4Nkbm16q4ylqcxW
         H/3W9GQLZ7kzttOB3YM6CkiatqRqpkCyitow+CjF/q3i1uNoMZWlaK9YBj3Lam+sjaSJ
         Dkkd2p55rmh2PWCSJNFVKQQx9MiP8Oez9nVsGrFcVgOa7XySnkciTcVlf8/4pVKDdZq0
         iiVeJpVAlCKmxOAUlmPWtYqwqGUwEyhsVjB+Gm0pseDB6eWk391/Ue6HHWwVScwQynJY
         pS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:organization:message-id:date
         :user-agent:mime-version:content-language;
        bh=GjaJTmJQLfoieKVIhH0A76iGZeFWuXIsg6hUtVj7nDs=;
        b=cxbc/9C6ASAKF8vMkMglYryU4YiFl6GjT/ddYNTzf+uH497R9/lc+abHKnilbgKytS
         X8J/jnYzgHOP+Mq5iqynCEz9dhFAq/nOkAYmyWeiGoLI/Zni9so+dGTn2ihhaolKFsQF
         vnanDB1nyo/CRNijWWDKiaPm4t3d1FLOL51WYIml6zTOiUpYLo2tadbVW5E5Nxm6ak3e
         gA2ogQ+o1B8Vr3+b0ctyzhaT8dI7KX69ZtqjFnPYBuQSuQrO0xdntm/b7gYNUC1m5wZy
         Il2Xti9+mDTJQ0YcDXH8hYIIHtr5y0GBGurkdWmj87ZlB+HeTLlohYjs8D6QKka0Hi7g
         +TTQ==
X-Gm-Message-State: AOAM533KMm/s8LKXfD80Sr3nwZ8mTZ2Cq4xqo0lvDoyp9EPSSTi3Gw0Z
        KgO9xGYUn/DDVc99VHQ+x1zfKYYXfZeZ7PVP
X-Google-Smtp-Source: ABdhPJwVlCn1uT+V1ZL30wvs+SG+Mp24Yei4O2KiYbf1BmQGZpmAmsHvbxxDZRuc1r8Zsvs6Ct1LDg==
X-Received: by 2002:a2e:a911:0:b0:24f:41c7:81d7 with SMTP id j17-20020a2ea911000000b0024f41c781d7mr16580689ljq.309.1652259189280;
        Wed, 11 May 2022 01:53:09 -0700 (PDT)
Received: from localhost.localdomain ([5.167.98.73])
        by smtp.gmail.com with ESMTPSA id g4-20020a19e044000000b0047255d211c4sm181000lfj.243.2022.05.11.01.53.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 01:53:08 -0700 (PDT)
To:     linux-gpio@vger.kernel.org
From:   Dvorkin Dmitry <dvorkin@tibbo.com>
Subject: gpio ->to_irq
Organization: Tibbo Technology Inc.
Message-ID: <0498c761-1a80-a37a-264d-a6665d8873e5@tibbo.com>
Date:   Wed, 11 May 2022 11:53:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------AB7286C79256A54BC2EE8155"
Content-Language: en-US
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------AB7286C79256A54BC2EE8155
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello!

I have a question about gpiochip ->to_irq().

Kernel call gpio_to_irq() requests IRQ for the pin, previously taken by 
*gpio_request().

But for sysfs when user does echo "pin#" > /sys/class/gpio/export  
gpio_to_irq() is also called at the time of export there:

https://elixir.bootlin.com/linux/v5.4.100/source/drivers/gpio/gpiolib-sysfs.c#L171

and there

https://elixir.bootlin.com/linux/v5.4.100/source/drivers/gpio/gpiolib-sysfs.c#L378

It is a problem for my driver. I have 120 pins and only 7 dynamically 
muxed GPIO irqs.

So when somebody requests gpio_to_irq() I am creating the mux to the 
first free gpio IRQ. But When user just exports GPIO pin using "old" 
sysfs kernel interface in the filesystem, it should not be done.

How can I see if gpio_to_irq() has been called by sysfs to prevent 
unnecessary dynamic muxing? Or there another way to get rid of this 
wrong behavior in my driver?


--------------AB7286C79256A54BC2EE8155
Content-Type: text/x-vcard; charset=utf-8;
 name="dvorkin.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvorkin.vcf"

BEGIN:VCARD
VERSION:4.0
EMAIL;PREF=1:dvorkin@tibbo.com
EMAIL:dvorkindmitry@gmail.com
FN:Dmitry Dvorkin
NICKNAME:dv
ORG:Tibbo Technology Inc.;
TITLE:Embedded Linux Architect
N:Dvorkin;Dmitry;;;
ADR:;;9F-3\, No.31, Lane 169, Kang-Ning St., Hsi-Chih;New Taipei City;;2218
 0;Taiwan
TEL;VALUE=TEXT:+79190546388
URL;VALUE=URL:https://tibbo.com/
UID:1c58210f-ac8c-4337-b391-0bde146d2d83
END:VCARD

--------------AB7286C79256A54BC2EE8155--
