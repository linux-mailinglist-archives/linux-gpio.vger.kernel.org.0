Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8B048CBA9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 20:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356720AbiALTNp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 14:13:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24221 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356887AbiALTL5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 14:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642014716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+5zS5i6xjQwctOAzle9K6FkmylE95eVgBt9lggrGihI=;
        b=NsKnzg3G68uedLz24S6nEgWbSMLmGnj2H+fguoVUj0M91Zl2/eyFiCN9Cha78CtoURDrBM
        kH/t7+fozdCwV0aeDtXr6KNNpOu3z5TLT4HFElDfQw5ZN36A3eM3J/TQFPqn0hvPryIaSi
        rn2US6IHyV0Dm/4YdDc7H8H/djedOHk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-WTNQ305GMJqenJZlu3Y-Dw-1; Wed, 12 Jan 2022 14:11:55 -0500
X-MC-Unique: WTNQ305GMJqenJZlu3Y-Dw-1
Received: by mail-ed1-f71.google.com with SMTP id b8-20020a056402350800b003f8f42a883dso3108339edd.16
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 11:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+5zS5i6xjQwctOAzle9K6FkmylE95eVgBt9lggrGihI=;
        b=Y5fX3VT8XBrYKx2+wD3WNUpnD8sridOgTVSBrFJx3hk7jrCwxMBTqzuDr/s6wSSSnG
         0x+v/IMuxSzReYO9cQVqjLsIkgPzWoFOmsJkPBRNdDBopbC+pOdD3gUgd1jnBEqwCAZ/
         2VGLqsC2ZKzdYbjuX+Y3Z7f1dbn5Iq3qi1sCHmGZ0BSTypHmZ0+/QW9c/sZhjC45IZ2t
         Zxz6TGHYWUmYZOFF0TqodpeQ7u1YyrbdVzCoH9mQZ+TRl9F0czBOKfZBOYLf/EElH065
         i4GKNgoBKHjE4/wXvmKSIBE3B8qZ4kEf112kQVnNHXqX8QJvbgKqWDok8rqI/clCRn7r
         DBmw==
X-Gm-Message-State: AOAM532iRfj581AgjF0zZtrA/OzxVT3ppIAbaHyhbtqYFyobSOd5XBfG
        bnLkcKXRXa7Y74f8j3k16oEGWyo0JTP68/rsCBfIU/PeMAvqBv6SZ80WdaTN/uaZ/4uAPBC+8Gu
        zGJEYS3GehhgCvPMMrtvZ0Q==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr978626edd.6.1642014714016;
        Wed, 12 Jan 2022 11:11:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBBbTc0YJDZzHDv/M3s/aVP5IC6+tSIFh8FjAcVnf+SjUwr/+9dz3gPhhS84V5PBzwJt3PqA==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr978610edd.6.1642014713878;
        Wed, 12 Jan 2022 11:11:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id c8sm247087edu.60.2022.01.12.11.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 11:11:53 -0800 (PST)
Message-ID: <5f7246ea-ad1a-dc96-d063-6dbca2c87ecf@redhat.com>
Date:   Wed, 12 Jan 2022 20:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20220104164238.253142-1-hdegoede@redhat.com>
 <Yd3rMkD9cX+6Bt9b@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd3rMkD9cX+6Bt9b@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/11/22 21:40, Andy Shevchenko wrote:
> On Tue, Jan 04, 2022 at 05:42:38PM +0100, Hans de Goede wrote:
>> Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
>> an interrupt line as unused") made the code properly differentiate
>> between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
>> to GPIO pinnumber/hwirq mapping.
>>
>> This is causing some boards to not boot. This commit restores the old
>> behavior of triggering hwirq 0 when receiving an interrupt on an
>> interrupt-line for which there is no mapping.
> 
> I conducted a research and, on the board Jarkko has issues with, all
> mentioned pins are floating.
> 
> [    3.556875] cherryview-pinctrl INT33FF:00: interrupt on unmapped interrupt line 0
> (I believe this matches to 76 below)
> 
> [   37.287821] cherryview-pinctrl INT33FF:03: using interrupt line 0 for pin 81
> [   37.371456] cherryview-pinctrl INT33FF:02: using interrupt line 0 for pin 22
> [   37.389548] cherryview-pinctrl INT33FF:03: using interrupt line 2 for pin 77
> [   37.407050] cherryview-pinctrl INT33FF:00: using interrupt line 0 for pin 76
> 
> Two of them are designated for SD card and Audio Daughter board.
> But in all cases is seems like PCB error, unfortunately.

Ok, thank you for looking into this.

Regards,

Hans

