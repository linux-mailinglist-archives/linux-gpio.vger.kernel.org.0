Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 347301308E5
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jan 2020 16:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgAEP7T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jan 2020 10:59:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41065 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726360AbgAEP7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jan 2020 10:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578239958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qsd4xQjV0MAUWYLcVjPUOgsuXdreREynKwW8aU1/grY=;
        b=atlrYkPoI/LmWSVBgpYuFZYiWnyqJ21qmIE+AV8JCm6l4dsK+J6rr3oQKFbd/PMy2yPRch
        RNkd47T/K0uTaXFXLT11yK7YDf/+GSizod0EfiG0jJxZtoc2myvz2lxItpSwTrjimfvLET
        v6qQyo9wkKVXUUN1mpJ2CvERDftpv/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-PICFiJABMAe1iFzlL2eUmg-1; Sun, 05 Jan 2020 10:59:16 -0500
X-MC-Unique: PICFiJABMAe1iFzlL2eUmg-1
Received: by mail-wr1-f72.google.com with SMTP id c17so869757wrp.10
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jan 2020 07:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qsd4xQjV0MAUWYLcVjPUOgsuXdreREynKwW8aU1/grY=;
        b=JLMjA3tLTqTBLqrcC2oPth4UBB+ZONTrDm9SO8LhuZ+pQdVvV1TPztpgOyOLS4YR15
         mOrVtEbmcOqgK7COoie0LhPIwaxZK9WSvZanK2ZltiHq0v4yLHqqI5+yH+0R+NlwTA/Z
         VHJEaKCxpWgnQuJOI5LcDDMx5Geh3xAiq2cZ813QwtrIMt27S8Ui5EVBjrEsDZFasWkB
         NOnhDAo7TIC2oCiHBTauNCsSHTVJn11/YutNx7cXZRTnzNzP1uu2JFTailSiWFKiKx37
         5vjddnubQG5nce8YI95oXWFzPm0nZMC5Puc085EEYkJIGXU8CyYY6mDPKav8y52GJWlv
         jB3A==
X-Gm-Message-State: APjAAAW7dYznAKCu9+tQxoa812mH264AIGZak4vMe4PuVPMhw3lKMqc8
        1ZYu2qWekolOJyBEic2kgxApwxOfjMS43BX8082Bc8V8CsIU/Rwg7MjmBUberzLDogAqur898lH
        KwzhOEC9CUq+qcyBOu/OC2Q==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr105239975wrv.9.1578239955353;
        Sun, 05 Jan 2020 07:59:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmEjoTYwcL07PO4pxrSWxYiW4XxA/mVvxs6chBNaO4zCMMkvtLx8WFBp3GkOiqnd9PMMbj9Q==
X-Received: by 2002:a5d:62d1:: with SMTP id o17mr105239962wrv.9.1578239955196;
        Sun, 05 Jan 2020 07:59:15 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id v62sm19764187wmg.3.2020.01.05.07.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2020 07:59:14 -0800 (PST)
Subject: Re: [PATCH v2 1/2] gpiolib: acpi: Turn dmi_system_id table into a
 generic quirk table
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20191127104509.10196-1-hdegoede@redhat.com>
 <CACRpkdZVPJyagQT4UwZDUHBvg0erFCwQumNKX9U3=AcHi=ZQGw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9d400cd-5a3d-9f08-bfd7-58a24e365e94@redhat.com>
Date:   Sun, 5 Jan 2020 16:59:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZVPJyagQT4UwZDUHBvg0erFCwQumNKX9U3=AcHi=ZQGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 28-11-2019 14:35, Linus Walleij wrote:
> On Wed, Nov 27, 2019 at 11:45 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Turn the existing run_edge_events_on_boot_blacklist dmi_system_id table
>> into a generic quirk table, storing the quirks in the driver_data ptr.
>>
>> This is a preparation patch for adding other types of (DMI based) quirks.
>>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> This patch does not apply to my "devel" branch, which I am about
> to send to Torvalds, so it will very soon be the mainline.

Sorry for being a bit slow with responding to this
(this mail got buried under a bunch of other mails).

> Could you rebase it and I will queue it up for fixes.

Done (on 5.5-rc4, which for gpiolib-acpi.c that is fully up2date with
your for-next).

> Also: should these two be tagged for stable? (I.e. a non-v5.5
> problem.) I suppose that requires backporting for -stable
> though.

Given that the problem which the second patch works around is somewhat
nasty, yes these should probably go to the stable series. I've added
Cc: stable to them for the rebase.

I will send out the new versions right away.

Regards,

Hans

