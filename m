Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A112F21C64F
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 23:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgGKVHm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 17:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgGKVHm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 17:07:42 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3310C08C5DD
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:07:41 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id k17so5169434lfg.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2020 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4nruq+oFiOvqyvb4/VdyM/ZTJbNZf/NdW35w9sc1Vw=;
        b=JkFrPEBfH8dagE1gbcrczR+NaJRYTz6akXcZnsC2ggF2HTLUZaJhU0SQhevq7SR9A8
         TOJvCa3mY07asVGgE2VAD20RElrOPt6KCtSjgGMlvTB3YKaQxIMxfIDiEDcggO6YGOdz
         PM5yAGQkvoDKcKEQOJ344MZ0oFVlyliO9Vsii66zWJ2UdnmumhsVl6/CabNCg4sCK9GX
         GgwXoF+gE/rmqAd9/bYsBcnF0GogprDeJJ17LniiVoWsnHw/HV8H+hvJ2m+wvkEULTEa
         n6mGiKnXpvUMGeTuKpKWzKhSeJRyMYXXYcBkceT87oGMqAFowaOLvj5q82JYPQO0Yu0F
         0mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4nruq+oFiOvqyvb4/VdyM/ZTJbNZf/NdW35w9sc1Vw=;
        b=bywcjlE0AQnmo4L55wyYMa4YDyzlSWPw4iqN/nfELK3NGXbZnrnGiL+EuZhPU4ToBd
         8S/QjTIO8Ism108Rp69gSSCPZfWVnc36szASdsEsTuW/9M6Cu4EiCQVR/aXVhvaoK1zZ
         QlMdTifuGjyxsFVprybZIimwiXdj6xDAFvLPEQeyXUA6OEw19jVDwtDiPq42P5rRGo9l
         AdBaRx9rBYItUsxJJVci6jFiSCSN3rXVB+zi8XrmGXh721k8Fw8sC7NsnHl7w98+7KjU
         ahSgQSZ7zUwLRtQiDBijzqMknW5P77xiMlUHvIvd3AZwg0570FCmzLnSbXhRQNif6SMN
         lAFA==
X-Gm-Message-State: AOAM533MT70YvDSX76AW6Jshat2k5Z1NtCS1VC9Tre0pBzmh0nKRONr6
        EY4a2K9mtIe7KgCQtmcFBTPw1j4WmsySu1OMg2G238bYDNw=
X-Google-Smtp-Source: ABdhPJyDiDsK12IuwKtw/dVRn5YAY+IfXPlqFWGCjxLbFu5B1b6OC79zeGSpRTe7ZBdq9RgfyCwrSSqQp7SJJDFTsQE=
X-Received: by 2002:a05:6512:3150:: with SMTP id s16mr36960881lfi.47.1594501660354;
 Sat, 11 Jul 2020 14:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
 <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com> <760595a8cdfeb0156d5180ecaeb2ee4487f50cc7.camel@alliedtelesis.co.nz>
 <86c009a8-05c4-40a3-daef-6d9e848642a3@gmail.com> <db96187e25342cd36133cde64ef742e03325c8c3.camel@alliedtelesis.co.nz>
 <cd40f919-f8d9-cde4-6cc5-f523e4973c3b@gmail.com>
In-Reply-To: <cd40f919-f8d9-cde4-6cc5-f523e4973c3b@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Jul 2020 23:07:29 +0200
Message-ID: <CACRpkdZRQq3EbibSWcKnTp6+iFJACeaytQEX+zR69Y_4LMSkYg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Mark Tomlinson <Mark.Tomlinson@alliedtelesis.co.nz>,
        "ray.jui@broadcom.com" <ray.jui@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 1, 2020 at 6:44 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 6/30/2020 9:37 PM, Mark Tomlinson wrote:

> > That was one of my thoughts too. I found someone had tried that
> > earlier, but it was rejected:
> >
> >
> > https://patchwork.ozlabs.org/project/linux-gpio/patch/1516566774-1786-1-git-send-email-david@lechnology.com/
>
> clk or reset APIs do not complain loudly on EPROBE_DEFER, it seems to me
> that GPIO should follow here. Also, it does look like Linus was in
> agreement in the end, not sure why it was not applied though.

I never got an updated patch. My last message was:

>> so you mean something like this?
>>
>> if (err == -EPROBE_DEFER)
>>         dev_info(dev, "deferring probe\n")
>> else
>>         dev_err(dev, "... failed to register\n")
>
> Yes exactly.

Patches welcome :D

Yours,
Linus Walleij
