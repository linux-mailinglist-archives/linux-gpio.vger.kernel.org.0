Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902BE48F7F3
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Jan 2022 17:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbiAOQpI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 11:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50663 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229784AbiAOQpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 15 Jan 2022 11:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642265107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QVDHDswXxan44+yxDMcyGpbr6VGvajl3PBQlDkytgqQ=;
        b=Jh8CogSFKztvFeFDd0TA7zM9EYe9qnnoccCG87SJRbe5TqkKGNnn617ecUsXJYm5DXFNCW
        fsVEt3IEgD2MpXjo2MkKt/BoZbM98uoWIj1dgw/I452jbAUeGZU9Gbi6r/jB2MmVr12G9d
        d0cuFhNwgJ4O5MscNM0r+h6W/S2JJt0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-U1GVJ0ikOfe3RRPQF0Wv_A-1; Sat, 15 Jan 2022 11:45:06 -0500
X-MC-Unique: U1GVJ0ikOfe3RRPQF0Wv_A-1
Received: by mail-ed1-f72.google.com with SMTP id x11-20020aa7d38b000000b004004e4fc8fdso8131869edq.6
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 08:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:cc:from:subject:content-transfer-encoding;
        bh=QVDHDswXxan44+yxDMcyGpbr6VGvajl3PBQlDkytgqQ=;
        b=6WalHuWG/EDHGiMF+Loy+RmAVLgfLz2IymyPf9bjmPMmSnXOferLnvXwO2b4LrfDZt
         s/A9AVGrsBvOyKfo06NY/Fndx5e2wlpvYlekVt6JRdyDSHdyPhw4gp1ADmQHjTHsQqdM
         uJUlF4VEi56c5dv7TUIqcu32kNHoPOJwLkYDnVN8m4sv1JBoEFKiEywZUtkqkFY+XLmA
         ngj0EhTnzsU++1vzds7x605yvAhml0EiJtbke9oC2Ht+52FOJMhRZVYPspWwRNZO4s6H
         dH22m4KTXKt1hcCCaIokMIOJszN8SR+rHSvZlmSj6LHsPvjdw4bpCqydlfT36l386Zf5
         UQ1A==
X-Gm-Message-State: AOAM5314bNgnpTRVZaU09G9EcctT0l1NB78lwyfb46PK5kiHI2igty6E
        IX980oBI3lCJ4wsoWfLN6afkgJf99uN8GKA8ZKVc7/u207h+eMkk/bDetcdG6KAc6clrGL060+T
        trsznKvsL6BtCw5T9fXV4ew==
X-Received: by 2002:aa7:c9ca:: with SMTP id i10mr14154589edt.66.1642265104765;
        Sat, 15 Jan 2022 08:45:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQCmC+GxGFjAyX245b8Q6TBUgrwWjpgjwQ1G6sgttOLoueibnPlflpAd14Kd5XP3s8LtxR6Q==
X-Received: by 2002:aa7:c9ca:: with SMTP id i10mr14154583edt.66.1642265104611;
        Sat, 15 Jan 2022 08:45:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id g21sm3493800edt.12.2022.01.15.08.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 08:45:04 -0800 (PST)
Message-ID: <e865361a-b75b-5a35-18e1-7136f3094d54@redhat.com>
Date:   Sat, 15 Jan 2022 17:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To:     Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Language: en-US
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: RFC: pinctrl: baytrail: Need to fixup mux setting due to broken
 BIOS/DSDT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy, Mika,

For one of the x86 Android tablets with broken DSDTs which I'm working on
I need to change the mux value of pin 6 of SUS aka INT33FC:02 from 0 to 1,
this changes it from a normal GPIO to outputting the PMC's 32KHz clk.
This is needed for the jack-detection in the audio codec which needs an
external 32KHz clock to work and that is connected to pin 6 of SUS.

On the Windows version of the same tablet (which uses slightly different
hardware, e.g. there is an embedded controller on the board which the
Android version lacks) there is an ACPI call to toggle the mux, since
the firmware does not set it for us.

So the x86-android-tablets.c code for working around all the firmware
challenges on these devices will need a way to toggle the mux and
directly poking it itself is a bad idea because of the need
to serialize all accesses to the GPIO islands on byt, see:

39ce8150a079 ("pinctrl: baytrail: Serialize all register access")

So I see 2 possible options:

1. Add a pingroup for this pin in drivers/pinctrl/intel/pinctrl-baytrail.c
and then mimick the pwm0 pinconf setting code from
drivers/gpu/drm/i915/display/intel_dsi_vbt.c in x86-android-tablets.c
This seems the cleanest, but I'm leaning a bit towards:

2. Do EXPORT_SYMBOL_GPL(byt_lock); in pinctrl-baytrail.c and then just
do a ioremap + raw poke of the pad_conf0 register in x86-android-tablets.c.

This avoids adding an extra pingroup just to workaround around the
buggy firmware on these tablets; and more importantly this gives the
x86-android-tablets.c code a flexible way to fixup various possible
GPIO/pinctrl misconfigurations with needing to push workarounds into
pinctrl-baytrail.c.

To make sure others are not tempted to also take the byt_lock (which
needs a rename before exporting) I plan to not add byt_lock to any header
files. Instead the x86-android-tablets.c code can just do an extern
declaration of it inside the .c file.

###

Typing this out I think that 1 is cleaner and so far on a number of buggy
DSDT Android tablets this is the only case I've found where poking the
GPIO/pinctrl registers "directly" is necessary.

So I guess I should go with solution 1 and if it turns out more workarounds
are necessary then we can reconsider the (somewhat ugly) option 2. 

Before moving forward with either approach I would like to hear your
thoughts on this, so please let me know what you think ?

Regards,

Hans


