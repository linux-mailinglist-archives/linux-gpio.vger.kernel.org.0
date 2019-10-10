Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21848D21FE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 09:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733224AbfJJHlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 03:41:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42040 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726991AbfJJHlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 03:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570693300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=an/3YZDrgg63J6aM7TOx01kgKpBG1/CZTH8SS76Boww=;
        b=emWy5asppS1c4hQwouXXyzMV7clQggEcm/rzvWa06+1tOIrtBdYzTjNB58OmD8prIQqYWV
        HVKsbTKzIxR3rmDiEfzGeG/Ku8BUuZn8zSXPt7V580q5kwJqDuxbSjfDGJ2h4kJcy9c/N/
        n2Ze/TPRqqJKZYA85Q0VrZxyqLppHjk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-yPx3Hr1IOcGH8otpTGu80Q-1; Thu, 10 Oct 2019 03:41:37 -0400
Received: by mail-ed1-f70.google.com with SMTP id 38so3039133edr.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 00:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v8z3Xgu8heGOaK3VBOy2Vr9ysRHluoO5CiAy8Awndu8=;
        b=mB7uRs2KngJ3lW63e8yyGn/y+JqLvkn2SGZXgat/xRHrbIaQ+qDCn/+6eNEs82pIHs
         Gk/17oI6H0fO9/Wmsd0RI7V2XEEIM5fHpnoywq6DP4sFrQUshiAfMaqEAD8+k8g6fNZC
         LznBbs//4vT9MepPZLlelHjWs8j97Rmb48Yx/ITZGyuyEENCc/4bse0gMOLvN11mvEwc
         Y0QIVn2HgcIpZFDnhLOLkxUYP3wpbxV4M63NWTy/gAVnEOYDrAkFkJ09absHYp8UKdXv
         Vqs8O59HMnaWLKqySwgKLX4U3YNYoSx3oZFEDEMGtYXCHpmMSpo+fIsAsIMUXtDu8qYP
         oLeQ==
X-Gm-Message-State: APjAAAUCCfRNw5mg5YsMk7Lyhj4BSh+AIr3in8391fORN61SHbla2TmD
        ye6HpD3UiL9dEge07WOqribqVoQJo3VS85nL18v+BkpB1pEwiOncs3eZvtTLoikQGz89diZJp8Q
        G329fVuzVfDDZfIrsQL0XdA==
X-Received: by 2002:a17:906:70c7:: with SMTP id g7mr6977322ejk.9.1570693296111;
        Thu, 10 Oct 2019 00:41:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSAUGRvsb6VnfkEO87SeNjg5Pbb+Pytrk3vKKvJiP3pr9xhHqH5DLqbxyQzWOtlUqCNkP3oA==
X-Received: by 2002:a17:906:70c7:: with SMTP id g7mr6977307ejk.9.1570693295905;
        Thu, 10 Oct 2019 00:41:35 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id rl4sm567687ejb.27.2019.10.10.00.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2019 00:41:35 -0700 (PDT)
Subject: Re: [PATCH 2/5] gpiolib: Initialize the hardware with a callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20191009165056.76580-1-andriy.shevchenko@linux.intel.com>
 <20191009165056.76580-3-andriy.shevchenko@linux.intel.com>
 <44c7e540-5390-78df-26db-7251866ac6ad@redhat.com>
 <20191010072304.GL32742@smile.fi.intel.com>
 <20191010072622.GM32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <088f0d5a-1d1c-1868-038b-db01a509d106@redhat.com>
Date:   Thu, 10 Oct 2019 09:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191010072622.GM32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: yPx3Hr1IOcGH8otpTGu80Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 10-10-2019 09:26, Andy Shevchenko wrote:
> On Thu, Oct 10, 2019 at 10:23:04AM +0300, Andy Shevchenko wrote:
>> On Wed, Oct 09, 2019 at 09:44:31PM +0200, Hans de Goede wrote:
>>> On 09-10-2019 18:50, Andy Shevchenko wrote:
>>>> After changing the drivers to use GPIO core to add an IRQ chip
>>>> it appears that some of them requires a hardware initialization
>>>> before adding the IRQ chip.
>>>>
>>>> Add an optional callback ->init_hw() to allow that drivers
>>>> to initialize hardware if needed.
>>>>
>>>> This change is a part of the fix NULL pointer dereference
>>>> brought to the several drivers recently.
>>>>
>>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>
>>> Hmm, IIRC Linus Walleij already added a callback for initializing the
>>> mask before the irchip gets initialized which is basically intended for
>>> what you want this callback for I think ?
>>
>> This is not about the mask, it's about hardware to be prepared before en=
abling.
>> Also init_valid_mask() will allocate memory which won't be needed.
>=20
> If you think this is not a proper approach, we have to revert all three p=
atches
> now (*) and think about better solution.

If this is not about the valid-mask then this approach is probably fine,
sorry for the confusion. Lets wait and see what Linus Walleij has to say.

Regards,

Hans

