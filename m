Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464D912BBAF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2019 23:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfL0Wro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Dec 2019 17:47:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44650 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725306AbfL0Wro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Dec 2019 17:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577486862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rSnj7H1B3NWu+D/Hqawoc3PIHGYDDd6CVWrGix3Owek=;
        b=gPIHrVSs6/BZYYwsvV3eTBe6VVxkHRgvH7MtdMtu0zmtDNdIx5/6+1/nQlt+0bSEYj4er2
        YcPNAhBIxItrabDyfSyyQoADgQ3Xa/h51guB5r8Jx9U9vfyLSHYi9927ixM2ZvBBbhnf2I
        x4hB9gGmC8OgJRY2BopL9EtVpav/raU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-T62Px07NNuWug37gdSyxJQ-1; Fri, 27 Dec 2019 17:47:41 -0500
X-MC-Unique: T62Px07NNuWug37gdSyxJQ-1
Received: by mail-wr1-f71.google.com with SMTP id c17so8340104wrp.10
        for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2019 14:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rSnj7H1B3NWu+D/Hqawoc3PIHGYDDd6CVWrGix3Owek=;
        b=lstIxIkoWpFlLnylz9fllRKpgJl8lhbxzAhNXHRebm7ghzXCJWX8nQOTmKKYJiCmIf
         OtZpdnyXeOx5NDwawUaENQNPuCgLDvl9bg6kVArWTS2pjSOBOH9hCnlQebTXVy3dalzL
         nvmraTMXpc+wf5ssxdd/bDN7UNY/b59j/Jlf33S7+wE/ynBxG2VvKvebIm8xvKrnlfk3
         w1BZ66sKPvCyiOSjirgezka4f/UXHBX4k9kLSN5REaBdY1kYe1Lq7qMTjtrkJWmT5rrZ
         m3ou7qAPj3A8FdU5MYWRIEWhttd+4YqNTcTAlnTEIwls25SUGylUQ+MG7qx78SiZNRpW
         31gg==
X-Gm-Message-State: APjAAAV1yxvb94lBMOvT4F8V3f386ZuKB/ALF+YNsSR7npDtkKD+E73W
        d9XUqAN0X30B/nDY9+QtrXpkGCdK8ZraPiwOPo4BCiC/oyxl+MSHX+zJwumvYpJvE97qhNFU8ZT
        yXp7zlUHFpp6pe5X8tvf7Lw==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr55030293wro.281.1577486860207;
        Fri, 27 Dec 2019 14:47:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxl+YQ1B+lEizCw3KFw9gTGuVkFDNul/t/BJGu27B2XogZSlO17lVCfX/fcxUtptgEwHSqZhQ==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr55030282wro.281.1577486860015;
        Fri, 27 Dec 2019 14:47:40 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id n8sm36484869wrx.42.2019.12.27.14.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 14:47:39 -0800 (PST)
Subject: Re: [PATCH v2] pinctrl: baytrail: Remove WARN when setting direct-irq
 pin to output
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20191225132812.90889-1-hdegoede@redhat.com>
 <20191227141220.GA2628@lahna.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <acafef49-bd32-6900-01d2-f6adccabe201@redhat.com>
Date:   Fri, 27 Dec 2019 23:47:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191227141220.GA2628@lahna.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 27-12-2019 15:12, Mika Westerberg wrote:
> On Wed, Dec 25, 2019 at 02:28:12PM +0100, Hans de Goede wrote:
>> Suspending Goodix touchscreens requires changing the interrupt pin to
>> output before sending them a power-down command. Followed by wiggling
>> the interrupt pin to wake the device up, after which it is put back
>> in input mode.
>>
>> On Cherry Trail device the interrupt pin is listed as a GpioInt ACPI
>> resource so we can do this without problems as long as we release the
>> irq before changing the pin to output mode.
>>
>> On Bay Trail devices with a Goodix touchscreen direct-irq mode is used
>> in combination with listing the pin as a normal GpioIo resource. This
>> works fine, but this triggers the WARN in byt_gpio_set_direction-s output
>> path because direct-irq support is enabled on the pin.
>>
>> This commit removes the WARN call, fixing a bunch of WARN splats in
>> dmesg on each suspend/resume cycle.
> 
> But this is still something we don't expect to do normally, right?

Well on devices which a Goodix touchscreen, of which there are quite a few
we do. And it seems that Windows allows this.

> How
> about changing this to dev_warn() or dev_info() so it is still visible
> in dmesg and possibly helps future debugging.

The problem is that we hit this path everytime we output a value on the
pin. I guess we can change the WARN to dev_info_once() if you prefer that.

Regards,

Hans

