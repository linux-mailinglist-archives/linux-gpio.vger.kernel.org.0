Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBDD1684B0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 18:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgBURSj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 12:18:39 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:38752 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgBURSj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 12:18:39 -0500
Received: by mail-yb1-f196.google.com with SMTP id v12so1449199ybi.5;
        Fri, 21 Feb 2020 09:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UsIdexAiALxzKyQifSysIO1fJyf0aP+aAU2c/dx1Ago=;
        b=To6LkkfpvlqJHmYlRMozaiXtoGHLEAmYsU3E6heV4YAFR7/YKMi7pE8v1JXTlEa2O6
         R+Hw9OPdOIMGk4DkCT34AmHveXtDgJURe3gPHl0gUAAajrMNmxSsdsUIdBNtg3OgseBZ
         tcH0zfBNri6UF+VWaD7gBcGnbtSVGPeO4Oho+qSnZ8Mlt+PZtATpnSDDXCPFE2JqT9mL
         lBfGEt3d+lDnm1ePque0hRtrK7ZlI5ooEG6kgHBv+w8rcxwYfuZ8O9vth1UAJxcXpq0L
         pdMi9zm7YvVDH7iml5SXV0q1w+bDTDgWuWZCaBavtOM+j9Bg8GfAZ3qjv9oRRAGhEKXI
         t9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UsIdexAiALxzKyQifSysIO1fJyf0aP+aAU2c/dx1Ago=;
        b=cqBUR4tftQEBYyrBXazgKXQExAGxvYSfSmVQBl/WUH0wFh2rMS6gjlTrHq+Euei2di
         tXbttUmG2hDtRQyHfjDxh/wrbGefMhSCRUAF6MKnnaffdir8u6w7KsmlSW5OUaqhw4yh
         Rdol6iM4gLqA/6UWVY0cesYVM2JCtu1I2yiXn5hcQoNzmeSCiRkkccPhzzB7H7N/v8sM
         OF/PlabmlyiKIftVxr4TesvC52uXM06zVrwEharRGnupk5pgt90GRu8D8EyNDk0pxasm
         fCLTmDmRoU3hIzAgaV0o5SENCWviOqqV57tUJ9vVVPSDqgAMVkjy2LvctlT/B8wCzAKg
         hpUg==
X-Gm-Message-State: APjAAAVIugGA0l08Dl2ehPIP4PHwRm5hpGyBREKrFKKtjMBtFJvBOiLw
        juU6qVD1Kp/tV+JxnnEW5y5kv0+n
X-Google-Smtp-Source: APXvYqzYl4tIDKLb+5Vh4OEpx2jOybgaIKpG0e6x+kgfOHhXyezWBSp7YVo6A6FOfYjvVDd8nnxsJA==
X-Received: by 2002:a25:9d92:: with SMTP id v18mr13049893ybp.176.1582305516271;
        Fri, 21 Feb 2020 09:18:36 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id 71sm1496317ywd.59.2020.02.21.09.18.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Feb 2020 09:18:34 -0800 (PST)
Subject: Re: [PATCH v2 1/2] gpio: of: Extract of_gpiochip_add_hog()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200220130149.26283-1-geert+renesas@glider.be>
 <20200220130149.26283-2-geert+renesas@glider.be>
 <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <d2b87102-fdf3-f22f-8477-5b2105d9583b@gmail.com>
Date:   Fri, 21 Feb 2020 11:18:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus, Rob,

On 2/21/20 10:08 AM, Linus Walleij wrote:
> On Thu, Feb 20, 2020 at 2:01 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> 
>> Extract the code to add all GPIO hogs of a gpio-hog node into its own
>> function, so it can be reused.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v2:
>>   - No changes.
> 
> Patch applied with Frank's Review tag.

I created a devicetree unittest to show the problem that Geert's patches
fix.

I would prefer to have my unittest patch series applied somewhere,
immediately followed by Geert's patch series.  This way, after
applying my series, a test fail is reported, then after Geert's
series is applied, the test fail becomes a test pass.

Can you coordinate with Rob to accept both series either via
your tree or Rob's tree?

-Frank

> 
> Yours,
> Linus Walleij
> 

