Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2837A12DF32
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2020 15:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgAAOwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jan 2020 09:52:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35473 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725872AbgAAOwA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jan 2020 09:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1577890318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9gqQr/+c9pqV5pQvS4YN/PwQEOwT63BT34eIfRYUFd4=;
        b=A9lMINMNJjTN1vp6ZDFG5I7aGwXZ8o01nqPStRqPTxYL3MQHOaI8d3HP2VlH6C5MPtort0
        CWEJmr/ftp/jUv5xkJsD9Uy96fwjcqwKEdoG1O5ttf13DiXJp2SqyL1CsZ/X0NsrV1DsoM
        uC/RDFCV0ZjmAUQLGkxOpQWHuPeqBt8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-uBK7dj9WM8mqLHu-42niCA-1; Wed, 01 Jan 2020 09:51:55 -0500
X-MC-Unique: uBK7dj9WM8mqLHu-42niCA-1
Received: by mail-wr1-f72.google.com with SMTP id i9so4113231wru.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2020 06:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9gqQr/+c9pqV5pQvS4YN/PwQEOwT63BT34eIfRYUFd4=;
        b=OfWUdDBbspxSO/ktWXBi+CxPGYpekmhSFHZYkNuH85uEGG/hrCa3TxUWjg2JU0xwr9
         yxc87OQezVcQjoPaURHbbFm6EWWgTwzwGT/bvCVb1OW52wHYntSWGt4ZaRLIzxrvc0i3
         fZ41xSnqSe23K2xfRtolO0R98oFHuVk7SGaqA+m5os6D4DSr4IL7Ktz3TAuwXwdAxZ2n
         Jbdf6dDSSxgjFdIjgLsixs7YLNtxlPhUAukUI6I0dHeoN1F21NYOO5+xojGbz1j8SZPm
         qGTttFS7v1+xyWrygTIMdkIDJOzeKGWMfGLteIgJiv0dVZ9SatdSFZvKAQD4xMvWUbv+
         Y3EQ==
X-Gm-Message-State: APjAAAWGpcDqr4c1NevdABCN53ClrGPRFvKUQKjzOOFGQOCH5Au7YPlR
        ol4P+SI8O7fMiKkINqzVMfVuz1H2sZoE5JU9ulackl8zn7tz+7R/ax+a/xYjLPXbLhIgwqjBhqe
        WrzqMlUq91XmS2XKmWSpo/Q==
X-Received: by 2002:adf:f288:: with SMTP id k8mr82138639wro.301.1577890314365;
        Wed, 01 Jan 2020 06:51:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7Dj2aGS6ChUGPgxfcCnqaDTOZ3W5KDIc9GFjuuirLshpd149g1xVtsfAnqadyi+tNp8Mn8Q==
X-Received: by 2002:adf:f288:: with SMTP id k8mr82138621wro.301.1577890314237;
        Wed, 01 Jan 2020 06:51:54 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id z4sm5657541wma.2.2020.01.01.06.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2020 06:51:53 -0800 (PST)
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
 <acafef49-bd32-6900-01d2-f6adccabe201@redhat.com>
 <20191230100844.GC2628@lahna.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d56d3764-e82a-4969-6579-d4d3a17a1d3d@redhat.com>
Date:   Wed, 1 Jan 2020 15:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191230100844.GC2628@lahna.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30-12-2019 11:08, Mika Westerberg wrote:
> On Fri, Dec 27, 2019 at 11:47:38PM +0100, Hans de Goede wrote:
>> The problem is that we hit this path everytime we output a value on the
>> pin. I guess we can change the WARN to dev_info_once() if you prefer that.
> 
> Yes, I think dev_info_once() would be fine.

Ok, version 3 replacing the WARN() with a dev_info_once coming up.

Regards,

Hans

