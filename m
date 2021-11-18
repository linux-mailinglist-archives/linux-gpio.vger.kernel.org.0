Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5DA455D32
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbhKROCu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 09:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhKROCt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 09:02:49 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D670C061570;
        Thu, 18 Nov 2021 05:59:49 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f18so26562986lfv.6;
        Thu, 18 Nov 2021 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=GS0d8tua36F4ykAnmqX5JdXOpEaJejd8S/VM9fSjwY0=;
        b=gsz8ygoZM+2asQJkwNUZC2fKYZ7XIHi5Sg5+wRU/zaFA8cvvecy5jVJTJENllNfTaz
         Zi56Aj0U0D4w7fLg5Hs0jFlV0juZ5Na3f6/4Jq64EGOS7o0m05sPQy9Fl+nEKn4Ahebk
         Fu13f8LrpSTcCaukzWlljYICche7aSHBfeUgrkVIk7fVJVkOztiWdtaZnfbZohICHiED
         0Bn56MJ54jKLkqriSR7iS+1coxNAKjVuNvwxDpjGfjNwrH8XZPX2gvtrsL+1vq9cYqIB
         lF1aFedToEhEq8aQXdnKPFctrau8WSMF9mmjebKApy9u46VZ8CFQ2w2D/vCZ4ddbRFHO
         KHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GS0d8tua36F4ykAnmqX5JdXOpEaJejd8S/VM9fSjwY0=;
        b=3v7BHp80YLtKMJur37mV0q2D7WnQ+x4Asx+yqY8r0DKvN0bOEX/RnihAU7cLOm9L41
         2wieoZ73IOcesZ+L0EhHEXV5qniymTKun/Awx97+4LMwKkuEfzyV748wj5ryL6zTYvMB
         6SFw8qdEy3+aZL2v7eWw9I5VgT1e9ePluEE7YGB1OMsvwSAlBpgM8XOyzqJxNwq63AcB
         5Ng4rLlu+3YW69ih83t4UIF5gZ3eOl8xjkl/sgT4owbQ9YOLO/mEQkLFSBVRyW7B3MaC
         eCnDPCABNWquHeSGxDbu19SbUOUJe5UBugLnRGhDWr7V7zjd/GR4+IuK6WtyY1KbUFXa
         jTYw==
X-Gm-Message-State: AOAM532TqdwPt9jF/9PVZeVyyjEW28WKSBU1b7hbI+mnHSpB3OzXuC6/
        6kArrrmO7msGpTwqUrNyuzw=
X-Google-Smtp-Source: ABdhPJxfFAGlHR9lR8In3CYOluQJt3l/04KIkR7yx2Bm3MDjXux5CrszW8sGalMgGP19LFc8RuMFAg==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr16865910lji.143.1637243987454;
        Thu, 18 Nov 2021 05:59:47 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id g8sm340618ljk.81.2021.11.18.05.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 05:59:47 -0800 (PST)
Message-ID: <c128065a-6039-6469-4c4d-f35e02ff4f54@gmail.com>
Date:   Thu, 18 Nov 2021 14:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 0/5] pinctrl: allow storing pins, groups & functions in DT
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <CAHp75VfckgE9VNkYTiJfxdQu66-DntUNOT7ttHr678Rt5fwmFg@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAHp75VfckgE9VNkYTiJfxdQu66-DntUNOT7ttHr678Rt5fwmFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.11.2021 14:52, Andy Shevchenko wrote:
> DT is not the only one,
> 
> So, I would like to see some kind of roadmap / vision on how this can
> be useful in the ACPI case.

Unfortunately I don't do any ACPI development and I also have zero ACPI
experience. I'm not sure how to proceed with this. Does ACPI have some
tables that get translated into DT-like form? Can I emulate that and
test somehow?

Anyone else willing to help on the ACPI part?
