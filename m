Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDC73313A9
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhCHQpD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:45:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhCHQoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 11:44:34 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03375C06174A;
        Mon,  8 Mar 2021 08:44:34 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id mm21so21624813ejb.12;
        Mon, 08 Mar 2021 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k4yPiipdcGeKd+M/IZAL87Xyy/rETZBOWCxC+IVw9EY=;
        b=a0MSuRDkaXpy6rJQgBLcag52i53ajjIP2lXtcVG04NGykzbH1mSWchF3n1w0t8KdZF
         IDvwoHtgnS6ZOsnadl0CH0G6Q9rKjesXBO6sedeYjU2lqkRFzcyI/BtpDSKSN+Gxto+z
         +QVm5+57l6LEu1PnbXA5tHAwLhOhiO7qZBWMbKyuJ+8QMEKyljX1+20l8BrQqKdx7gZQ
         lJb/TlN55ZG7In7tsH7wTyXQeC3MLGIyuFlXPBBgHXG8CLJIm7jCIKR85RvfYIIrbcQq
         noSCfZkDhJW1XN4ti+fgbcnfqUAkxE8OhWqXckaVARVMlrs2VICEhk1gnlOmdy2V8ucO
         mazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k4yPiipdcGeKd+M/IZAL87Xyy/rETZBOWCxC+IVw9EY=;
        b=g+p2nmg5z8ib/Wc/+erOOS9IpMFOWhwZcKQHuT6kRpu4Od6Ei/LTfHPnlKuaC0eNrZ
         E/tjE7Y8WVdZPKy9qvSBvlOyoJ8llfRBuTCD+nnvhjbzbZfeW1lf0N62z3awvcnvDptV
         EkY+4OX/R11id9RjNMCeuUsBP6GGo98ew0Lj7ZxqwZppx7cKkBVVmtQAzDE8MQ6r+Mur
         lObY5As5HoeMeqi/lbWhhde+QElHdl5rvivN8G38o15nrrhm+n3JxMwX0fcRj9ubo4Hr
         hZuIrQrNQ+w2y7v4B8ymwlYqB2rQWGLM7Y51sZ4tZ/dFH11sJJc/VWnI0DnA/LQ5PnuT
         y3Eg==
X-Gm-Message-State: AOAM533iwMiUl0woZDXdCvatIJJJmQaCVcYcugEGM1ZdrPstWyDF+TeU
        CCjWUIeTBDwCFwadN+u+9e/0hnTZz2r87w==
X-Google-Smtp-Source: ABdhPJwd0EOoQBdIPXD7CX7HAz8i2NRT3+8TLA4QBvP2duKDmuPv8T10eXelR0sSLk166dnfzjLvWQ==
X-Received: by 2002:a17:906:a44f:: with SMTP id cb15mr15636323ejb.420.1615221872351;
        Mon, 08 Mar 2021 08:44:32 -0800 (PST)
Received: from [10.17.0.16] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id p3sm6889878ejd.7.2021.03.08.08.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 08:44:31 -0800 (PST)
Subject: Re: [PATCH] Revert "pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance"
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com>
 <c306b082-f97a-96d8-1291-78ff14c4ea88@gmail.com>
 <CAHp75Vd9N_U7NobAwpYkqGoOCVNYbBSTkZ1vpgziOfgAf=c0wQ@mail.gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <84a81a3f-cda4-6d0e-ee4d-700b4223b2ee@gmail.com>
Date:   Mon, 8 Mar 2021 17:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd9N_U7NobAwpYkqGoOCVNYbBSTkZ1vpgziOfgAf=c0wQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/8/21 5:42 PM, Andy Shevchenko wrote:
> On Mon, Mar 8, 2021 at 6:34 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
>>
>> On 3/8/21 4:35 PM, Andy Shevchenko wrote:
>>> On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
>>>> Following commit 036e126c72eb ("pinctrl: intel: Split
>>>> intel_pinctrl_add_padgroups() for better maintenance"),
>>>> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
>>>> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
>>>> should be there (they are defined in ACPI and have been accessible
>>>> previously). Due to this, gpiod_get() fails with -ENOENT.
>>>>
>>>> Reverting this commit fixes that issue and the GPIOs in question are
>>>> accessible again.
>>>
>>> I would like to have more information.
>>> Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
>>> output (when kernel command line has 'ignore_loglevel' option) for both working
>>> and non-working cases?
>>
>> Sure.
>>
>> Here are dmesg logs for:
>>
>>    - Kernel v5.12-rc2 (not working): https://paste.ubuntu.com/p/HVZybcvQDH/
> 
> Thanks!
> 
> Yeah, yeah... Please, test my patch, I am quite sure it will fix the issue.


It does indeed, thanks again!

Regards,
Max
