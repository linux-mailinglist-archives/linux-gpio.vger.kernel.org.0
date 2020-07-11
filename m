Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F104F21C652
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 23:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgGKVJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 17:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgGKVJN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 17:09:13 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E277C08C5DD;
        Sat, 11 Jul 2020 14:09:13 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id q17so4126744pfu.8;
        Sat, 11 Jul 2020 14:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I6qyTl8usTK05vhPRM/vSGS9Fx/GmblS8rLEZat533g=;
        b=Uq8FQrTLfznyqkMlW3l/6oHmfOeq5DuIgspsoe7bTTW0SYSjdJF4FWd2lBv+IvtkjT
         rvyydUup60fVWHFHfrlnA1ICs+Vo9T1NsoF56OPF7hRYWypGunjusmRQijHNCD2PdLAs
         FtqKh2zG26/0SyhgYPGMkntgLOiFpTyLut9u1SI1in5+Ti74QWpv19+mbePyBQLttb+5
         qtBxf4Gb1fkmKLVgCrXFpdoZiNQIbH6Rsyx/wBidiLgB7ZligiwDiimeKRpVYosfJe7s
         Nnb08MhJ1HCdPJtWc9O7E0uPsVl1o/CpeVzoSgnWQ1uW3I/xEl2bYwr962kMMTvuH1w2
         A3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I6qyTl8usTK05vhPRM/vSGS9Fx/GmblS8rLEZat533g=;
        b=b1+ZJSaOERMpj/hyaRn+bgtIUIl/bHOEXNHi0A5lv/NJviCq7TmXqurqJabu38lp8W
         sh3dKceIz7v+CLi1tfR65xaS4pwrTnn8lxOkAq/uj3suW7H6BFdOSn69Lz/qiawj5BuW
         Qn5HQa7QzFmc4HX5E8q7iJdxEthbPkaK4GLoDbO3pX9Q1WFklY9nOHDjeNyv2nksNFzn
         mXaiP7YpHQ3/uWNBg26xdUUAV6V30DWsmqmbm/URFL34k8XYyQm9DmoyEefxAw3F1n+W
         H9uc7XRiMcQZ29v4zWHaU4Bosq7YlnBlSdZNag5sgZNYrkjVnIXAyuhi0nJ3zE7crJ06
         n+oQ==
X-Gm-Message-State: AOAM531GvWkJLFnZFLHIfk0Jxc9VzDGYYN2wf5uHM67MvoZJQkP89S0H
        RNSYU2o2vkOVnVomjgszYBpE622U
X-Google-Smtp-Source: ABdhPJxa6yJ604gvFdDLBd+onDl3LssbJeQPwMoBokJqvG7LyALwv3JuRGCLdYJghO6BS8Kx7xb99w==
X-Received: by 2002:a63:c34e:: with SMTP id e14mr61251555pgd.55.1594501751929;
        Sat, 11 Jul 2020 14:09:11 -0700 (PDT)
Received: from ?IPv6:2001:470:67:5b9:108c:a2dd:75d1:a903? ([2001:470:67:5b9:108c:a2dd:75d1:a903])
        by smtp.gmail.com with ESMTPSA id w18sm9197109pgj.31.2020.07.11.14.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2020 14:09:10 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
To:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
 <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
 <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
 <86c009a8-05c4-40a3-daef-6d9e848642a3@gmail.com>
 <db96187e25342cd36133cde64ef742e03325c8c3.camel@alliedtelesis.co.nz>
 <cd40f919-f8d9-cde4-6cc5-f523e4973c3b@gmail.com>
 <CACRpkdZRQq3EbibSWcKnTp6+iFJACeaytQEX+zR69Y_4LMSkYg@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e5d97c2a-95fb-e02d-029a-c19ceb1b166f@gmail.com>
Date:   Sat, 11 Jul 2020 14:09:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZRQq3EbibSWcKnTp6+iFJACeaytQEX+zR69Y_4LMSkYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/11/2020 2:07 PM, Linus Walleij wrote:
> On Wed, Jul 1, 2020 at 6:44 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 6/30/2020 9:37 PM, Mark Tomlinson wrote:
> 
>>> That was one of my thoughts too. I found someone had tried that
>>> earlier, but it was rejected:
>>>
>>>
>>> https://patchwork.ozlabs.org/project/linux-gpio/patch/1516566774-1786-1-git-send-email-david@lechnology.com/
>>
>> clk or reset APIs do not complain loudly on EPROBE_DEFER, it seems to me
>> that GPIO should follow here. Also, it does look like Linus was in
>> agreement in the end, not sure why it was not applied though.
> 
> I never got an updated patch. My last message was:
> 
>>> so you mean something like this?
>>>
>>> if (err == -EPROBE_DEFER)
>>>         dev_info(dev, "deferring probe\n")
>>> else
>>>         dev_err(dev, "... failed to register\n")
>>
>> Yes exactly.
> 
> Patches welcome :D

Not sure how useful the dev_info(dev, "deferring probe\n") is nowadays
given that the device driver core will show which devices are on the
probe deferral list, maybe we can turn this into a dev_dbg() instead?
-- 
Florian
