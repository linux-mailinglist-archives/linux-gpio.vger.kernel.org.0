Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C05FC3C3
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 11:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfKNKNt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 05:13:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37171 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725977AbfKNKNt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Nov 2019 05:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573726428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a53Ydq+aH2LKzD//Y+TJ+HSP6hOxvXXCC2aTaMVmZ58=;
        b=L/TZ0qUiJ5ASJ2D5tcaADsoXV269kcevS9yf/QWkq7ZzXPVADcaBpNtOxM0nZQh9Mk7JGr
        wUwNTDAadfzOgyJuXyMJcIu3s6wdFLjhEcKvr/XFtT4ojLchSxvk1pXmtmBaMttYsLkdbT
        /hcjEjQB1aKj+MqLp9yj4z3uZeVPVUI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-DtN82zYnNAe-YTzMYG5ksg-1; Thu, 14 Nov 2019 05:13:45 -0500
Received: by mail-wm1-f72.google.com with SMTP id y14so3630162wmi.4
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2019 02:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vSmHParZB6JYehXtY9NprOwMmU6fr0JasU3pThGPyJk=;
        b=olPV/HcDhiOoqk+XOo/0rPzQh2S31uuM7gaHacjmHWt+0uTHNBS5wtm2dkMsE7UMhW
         5cHUMtVBKqY6fyhcl6KhqaysPnwH1O7dTmEGHkT4nzQ0uspZY+5knK35xpGygdrZiHPD
         ExYkf1/CZvHfMSXomSikyeuljwwAXk6VVX5Y4YIUPtK8uajSzn7La1LGkpLOgLeljNa5
         12ElC1BEDoRZCbXend9rpB0tnzbUzMb+0oH3A4rU1u/BJCRReAti7DKXxfYQd5pOKuTi
         l/3caw7MPX029K+2NhWCni6HA/m1LSPFVSdPO0HxsxvXc0JZhWrCNYfBY+c3S6miA8tL
         wcKw==
X-Gm-Message-State: APjAAAWeLlPa6gtGnmF7JsTUpr1SE/T7PS3PXhCt8WdRHo5otAs5R2c7
        /dFtCPwAfUqiZfSHWsNq93T8a1DvEAjlzz9gVFNFiE/0tl57E+GVkkv0N6sUU4jD5gAbQcWeDTw
        hqF+uRCKMdB9FOsZ+4BE4Lw==
X-Received: by 2002:a5d:67ce:: with SMTP id n14mr7238684wrw.67.1573726423928;
        Thu, 14 Nov 2019 02:13:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdVuoOYYF8UVn4I7LrvyeuyRdpSl0NauUCG6q6YdjAsL6J80NmVO8yGSeFa8MWanIWyn0gDQ==
X-Received: by 2002:a5d:67ce:: with SMTP id n14mr7238667wrw.67.1573726423698;
        Thu, 14 Nov 2019 02:13:43 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id a11sm5778358wmh.40.2019.11.14.02.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 02:13:42 -0800 (PST)
Subject: Re: [PATCH] gpiolib: acpi: Print pin number on
 acpi_gpiochip_alloc_event errors
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191018195208.94405-1-hdegoede@redhat.com>
 <20191021091124.GK32742@smile.fi.intel.com>
 <f3294033-8105-8c26-a8e2-3ced55276fdb@redhat.com>
 <20191021132345.GT32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9fb1f06c-b641-f2f4-fa60-8bad57cf87d2@redhat.com>
Date:   Thu, 14 Nov 2019 11:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191021132345.GT32742@smile.fi.intel.com>
Content-Language: en-US
X-MC-Unique: DtN82zYnNAe-YTzMYG5ksg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 21-10-2019 15:23, Andy Shevchenko wrote:
> On Mon, Oct 21, 2019 at 02:52:13PM +0200, Hans de Goede wrote:
>> On 21-10-2019 11:11, Andy Shevchenko wrote:
>>> On Fri, Oct 18, 2019 at 09:52:08PM +0200, Hans de Goede wrote:
>>>> Print pin number on acpi_gpiochip_alloc_event errors, to help debuggin=
g
>>>> these.
>>>
>>> I'm not sure which one is better decimal or hex, perhaps Mika can help =
me, in any case
>>
>> They are listed as hex in the dis-assembled DSTD.
>=20
> Oh, now I noticed the potential issue. The pin can be 16-bit, you pring h=
ere
> only for the case when we have evname. Maybe do something similar in thes=
e
> messages? Print event name for pin inside byte range and value otherwise?

I'm preparing a v2 now, together with another related, less cosmetic patch.
I will switch to a 16 bit printf format for v2.

Regards,

Hans

