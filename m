Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EA2218642
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 13:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbgGHLgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 07:36:45 -0400
Received: from mail-ej1-f44.google.com ([209.85.218.44]:44594 "EHLO
        mail-ej1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728410AbgGHLgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 07:36:45 -0400
Received: by mail-ej1-f44.google.com with SMTP id ga4so50006227ejb.11
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 04:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F5svP5sRyHkcOQdXOAJ74XZurSVru3rT8ZzCDKJCui8=;
        b=PTtDDLy28f5LTwWGk5HLfO/9IvuruwKLFKMxORnNCx7gdvSjbDu2EMnYSynypO061R
         +OPhqc6whbOoguf1eah3ckJi4/LHYHEgiJNVkGeN0WddivcTT0GljILBMmuQfCGwOQGn
         0SgpUM5/p17aeprlJ4clmYXu8VlFkhka7qQ2+LkkHareaU2QQ6zmR9Bq5GNzXweUBhr0
         WjjHmPNjYrw18OFO/WB1RDJQA8IKQwgAsvy4DIKgV6JEipZBuS9AXccaoz0+jRS6i2ZN
         7FcX6Vzy7rD/aGGnk8Tg7Gj/JT61yH8HcIACkHni5IwR5C6L2A/wxzfLYRgVximoTSHJ
         LQUA==
X-Gm-Message-State: AOAM532vaAj58QqE4GrHE5CLwgjtPi7bBmq1S1wxWeoWpUi6j1f3y9Of
        b5EC3+qOBX5stl3UQbgeh9w=
X-Google-Smtp-Source: ABdhPJxy9Z6twa6adUdoH/L0a3r9yMAYo+thzlqpAXircV/Pleg12n8hneX4iPnf+7TLCm8RBJETmQ==
X-Received: by 2002:a17:907:7294:: with SMTP id dt20mr50163337ejc.355.1594208203647;
        Wed, 08 Jul 2020 04:36:43 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id r19sm27324351edp.79.2020.07.08.04.36.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 04:36:42 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
 <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
Date:   Wed, 8 Jul 2020 13:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 08. 07. 20, 13:24, Hans de Goede wrote:
>> It also has only 32 but EFI. It doesn't recognize 64-bit binaries. I had
>> to load 32-bit grub first to load the installer from a USB. So this is
>> EFI-mixed mode as it is called.
> 
> Hmm, ok, with CHT I would really expect there to be a 64 bit UEFI and
> your DSDT and the fact that my untested patch broke your boot, all do
> show that this is Cherry Trail / Cherryview and not a Bay Trail.
> 
> I guess that doing:
> 
> cat /proc/cpuinfo  | grep "model name"
> 
> Will output something like this:
> 
> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
> model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz
> 
> Note the model bould be some other Z8xxx nummer, likely it is a
> Z8350, and if not a Z8300 but any Z8xxx number is CHT.

Yes, correct:
model name      : Intel(R) Atom(TM) x5-Z8350  CPU @ 1.44GHz

> Further confirming that this really is Cherry Trail. Which
> at least means that my patches might help a bit.

They do not :(. The interrupts are still storming.

FWIW I tried the acpi_osi="Windows 2015" kernel parameter. No success too.

> But ideally we would still be able to get the BIOS to see
> us as Windows and set its OSID variable to 1. So we don't
> try to use the wrong GPIOs as IRQ at all. Can you try loading
> the BIOS setup-defaults / optimal defaults?

Loaded the optimal values. Still the same

> If that does not get rid of the IN3496 device (changes its
> status to 0), then try this:
> 
> Maybe you have a "Boot Architecture" option under the "Boot"
> menu in the BIOS? I know you are already at 32 bits, but
> maybe changing it to 64 bits helps? (after installing a 64 bit
> shim + grub)

Unfortunately, there is nothing like that. It's discussed on the net,
that these UMAXes have only 32bit EFI.

thanks,
-- 
js
