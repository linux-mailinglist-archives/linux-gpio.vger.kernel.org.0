Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6378F1595
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 12:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729671AbfKFL7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 06:59:35 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33481 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728610AbfKFL7e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 06:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573041573;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dCyjv+mdsmqgKNNMF9Mdj3Kc9TjEhApB6HTK8I6ivx0=;
        b=RuhYc3oBtL2Esm3TMM0xxphGRiQodetTLFPTY4Qip7YuJnH7if+k9gtF0H5o2k6CO/w2iR
        egzpB2HXvatu1k4SiLGoLGX1iYXU8YExvzqmKY7EyMILqGanM8+nq58mTbGS+RMrCEV6M8
        C9HhweoSmcEuAMd3QB57O7CrMv/WkTg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-m2NhYKZzMoyJs8ayHxWtrQ-1; Wed, 06 Nov 2019 06:59:31 -0500
Received: by mail-wr1-f69.google.com with SMTP id e25so14031672wra.9
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 03:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sWQ7sVQMIvGf5rIQG444KivFBtTmv/Hcnz2zLfRE+ZQ=;
        b=eyKcl8JtZQS0TKpjwNldgDb8MIGXF/zqsYHp+FAnA4iFbrqV5beja7YWzjY4KOkGRy
         HWh+WybpD1cwWwxkO0uCSzUbiD/PijjSW4Lccq+vzdDgif4syDg6xz/nqwOv6+B15kLN
         XGDhrHDxcw5+ELTBk5QpHdFuvcw2c1NVuZA7FeZ6vUqVPORGrw6zdYYWU/a2RJYCD7/L
         XbAFnZX0LJTp6TFXZ7uqV1dSVitcSm3JOa7DbRBYhlouHzBL2oU/2NdVm95+YAvA/t+9
         eAcS4USnQkt8JK+29FFgdGEBR+m30n7SdJ77Aux3RCa5QmNSMaQr3F8pdXwUWW5goIpQ
         2f6w==
X-Gm-Message-State: APjAAAWrQHz4ZYDcUHXEeFsfPnfhSvpmAtsgoxswh+O7qy7PvgFGsmDk
        ZMsDUzrjrbp5b5/1FQDF3Ppal7Pimdcj5K/yhBVlHL3FqwLl+epT44dpqxB7KRoSPwWrkEOuH9z
        jXiOKrwF3+znOSB47swCDYw==
X-Received: by 2002:a5d:4201:: with SMTP id n1mr2178156wrq.372.1573041570381;
        Wed, 06 Nov 2019 03:59:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxQ0lI+9YEGhBqaQu1/r4on90SlxTr/L++9e5XRdPI4JVbOPiNMn5vSr/Dy95oavC/Zq/i7g==
X-Received: by 2002:a5d:4201:: with SMTP id n1mr2178136wrq.372.1573041570110;
        Wed, 06 Nov 2019 03:59:30 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id 11sm1819447wmi.8.2019.11.06.03.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 03:59:29 -0800 (PST)
Subject: Re: [RESEND][PATCH v2 0/7] gpiolib: fix GPIO <-> pin mapping
 registration
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <eb623262-29b3-31cc-01e2-6da9cf1c1f20@redhat.com>
Date:   Wed, 6 Nov 2019 12:59:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-MC-Unique: m2NhYKZzMoyJs8ayHxWtrQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 05-11-2019 21:35, Andy Shevchenko wrote:
> This is the ordering fix for GPIO <-> pin mapping registration to allow
> delegation of IRQ chip to the GPIO library. Two drivers are actually conv=
erted
> to use the new callback followed by switching to use of irqchip structure
> inside gpiochip.
>=20
> The series has been tested on Merrifield device (though no AEI) and on Th=
inkpad
> 10 where 4 events are registered, one of which has reasonable amount of
> interrupts coming from battery.
>=20
> First two patches are definitely good for v5.4 cycle (and have Fixes tag)=
 while
> the rest can be applied for v5.5 if I didn't miss anything. So, they can =
go like
> patches 1-3 -> v5.4 (gpio/fixes) and to gpio/for-next and to pinctrl/for-=
next
> patches 4-5 -> v5.5 (gpio/for-next)
> patches 6-7 -> v5.5 (pinctrl/for-next)
>=20
> Perhaps it would require to wait next v5.4 rc in order to avoid dependenc=
y
> issues.

Given were we ar ein the cycle I think it is probably best to merge
everything for 5.5, but that is not my call.

I've given this a test run on a BYT device, and it works for me,

So patches 1-3 and 6-7 are:

Tested-by: Hans de Goede <hdegoede@redhat.com>

I've also reviewed all the patch and the entire set (so 1-7)
looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

One related remark, I notice that the following patches which were
in -next for a bit and where then dropped because this
needed more work are missing from this set:

"pinctrl: baytrail: Allocate IRQ chip dynamic"
"pinctrl: baytrail: Group GPIO IRQ chip initialization"
"pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated callb=
ack"

IMHO it would be good to get these landed too (could be done
in a follow up series I guess).

I've also prepared and tested a set of patches on top of
this one to also "Pass irqchip when adding gpiochip" for CHT,
I will post these right after this email.

Regards,

Hans




>=20
> Changelog v2 (resent):
> - fixed cover letter
> - resent with ML included
>=20
> Changelog v2:
> - added fixes tag to the first patch
> - reworked commit message for the second patch
> - added baytrail conversion
> - tested on ThinkPad 10
>=20
> Andy Shevchenko (6):
>    gpiolib: No need to call gpiochip_remove_pin_ranges() twice
>    gpiolib: Introduce ->add_pin_ranges() callback
>    gpio: merrifield: Add GPIO <-> pin mapping ranges via callback
>    gpio: merrifield: Pass irqchip when adding gpiochip
>    pinctrl: baytrail: Add GPIO <-> pin mapping ranges via callback
>    pinctrl: baytrail: Pass irqchip when adding gpiochip
>=20
> Linus Walleij (1):
>    gpiolib: Switch order of valid mask and hw init
>=20
>   drivers/gpio/gpio-merrifield.c           | 76 ++++++++++++++----------
>   drivers/gpio/gpiolib-of.c                |  5 +-
>   drivers/gpio/gpiolib.c                   | 19 +++++-
>   drivers/pinctrl/intel/pinctrl-baytrail.c | 64 ++++++++++++--------
>   include/linux/gpio/driver.h              |  5 ++
>   5 files changed, 107 insertions(+), 62 deletions(-)
>=20

