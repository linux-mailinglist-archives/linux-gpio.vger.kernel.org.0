Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71E544F9A0
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Nov 2021 18:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235621AbhKNRNn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 14 Nov 2021 12:13:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236591AbhKNRLT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Nov 2021 12:11:19 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEBBC079783;
        Sun, 14 Nov 2021 09:07:03 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id a11-20020a4ad1cb000000b002c2657270a0so4968982oos.8;
        Sun, 14 Nov 2021 09:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XpAS6BBw1T3zY4eZyUsPcr/QNf1RWV9b1FJ9v/LrJJM=;
        b=ixZe5O7WuXGXkoOb1E6qqmV77u+DxQ6GKG39HH3FHtOSQu2Tr7I2PdBLec5r9kwaI1
         sVw63r/BVO4g77qkYZJF3UOc13uFTNyYUZh38FrMXHE0OJRsrVOOWXsoLzntJbVoC9wA
         Aziru3ZoWc9yM1Gm0vQ48sS9GoOlead/FHyPZc3rL2TMyu0oG/JzXpMGymiBTtsLblBV
         erLwRo972FDb/dwt57oT9bioH2eRuDmP/lVT+yqkjaJ+YUVHLptlyP0Rb4GACjSY70Jb
         WMXsoKpKCDX99EaqQ8QJ6Ep0/zVaRgNXjsELPUKEtFHTCVbFRb+jl4yEn7P6DyQ3ddQE
         NaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XpAS6BBw1T3zY4eZyUsPcr/QNf1RWV9b1FJ9v/LrJJM=;
        b=PKyx9Q31GN+grN9gDw4trRhrM1pyRCdtIsMv0ih85bdE2BuHafk7gPwFQZsBJ3IL8G
         TVIvYfkOH5EuG3VY4yzKTwda4MNLBAvNAeT2POzdhjMCHd4pfbt9bKP2LNQ5C+ykRpK/
         nuwKrQlNdcxTbgJ3VjLzFb8Ysc1FiL2OOjSoO7FQUyGNzmXu80+6LzzvtjpfkBf48BU7
         CJ0TdKxRU5I5XGQH3sM6Pg9yGYfT4vAxMd3YCHL19qfAJZvE103x//93MKZj0qefehw1
         MCrCiRddQAe8/MTWZAJboB9Coy93eCgj9I0dHwYyzfrYAitmK3PMep2DT9dx0AWFj60R
         7vCA==
X-Gm-Message-State: AOAM530YQPZ8tzij80WjHMpwegiC2twPPPrUeoksbaG++d4ZqVFDGSBD
        Q+s8UMqzumNkdew5re84reMVE+nF77o=
X-Google-Smtp-Source: ABdhPJx+FPSRO7wcqYvxNVkhpnxgh2u1+PTTv4Fy13WIuWjCRBFalTEZZMKdw4y0KEtNU0zEF9lYyg==
X-Received: by 2002:a4a:abc2:: with SMTP id o2mr16667336oon.65.1636909622739;
        Sun, 14 Nov 2021 09:07:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w2sm2084969ooa.26.2021.11.14.09.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 09:07:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     =?UTF-8?Q?Pawe=c5=82_Metelski?= <pabou88@gmail.com>,
        linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
References: <CAA6C2x9Snh0jzCT7Z4+m4kA+StCfsWtESPC1C0s-uKXB6_fJWw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: New hardware support - ITE IT8689
Message-ID: <0134609e-0b03-d9d2-62ba-75d8d8211030@roeck-us.net>
Date:   Sun, 14 Nov 2021 09:07:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAA6C2x9Snh0jzCT7Z4+m4kA+StCfsWtESPC1C0s-uKXB6_fJWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/13/21 11:46 AM, Paweł Metelski wrote:
> Hi,
> 
> I've got this new hardware, Gigabyte Z690 UD DDR5.
> Apparently it employs a new SuperIO monitoring chip, an ITE IT8689:
> [    1.626587] gpio_it87: Unknown Chip found, Chip 8689 Revision 1
> 
> I'm running gentoo-sources-5.14.17 but it also seems missing on upstream git.
> 
> I could probably test your patches quite easily (I suppose I just need
> to build a module and load it, see dmesg output, try to spin up a fan,
> see if hwmon reports it, etc.), I could also try to patch it myself
> given a domain introduction (8y exp C dev, 0y exp kernel C dev).
> 

Gigabyte does not support Linux and does not make datasheets available,
and ITE usually does not even admit the existence of specific Super-IO
chips. On top of that, ITE Super-IO chips are somewhat notorious for issues
which can, if programmed the wrong way, result in random system resets.
This means the it87 driver in the Linux kernel is for all practical purposes
unmaintained, and there is pretty much zero chance that it will be possible
to add support for this chip to the driver.

Guenter
