Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0331A6509
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 12:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgDMKLd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 06:11:33 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36614 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbgDMKLc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2020 06:11:32 -0400
Received: by mail-ed1-f65.google.com with SMTP id i7so11349490edq.3;
        Mon, 13 Apr 2020 03:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IHzUNdwPsTQhqLll3sOK8O3xrvJdBlinyJZ6YxNwq5s=;
        b=EQY2aTx9QZvn4hJbu8mvjayyvAl2zm1DV5RIyc+0eSB7YtkzKGD+3yq8EBkExqJRfC
         cNa3Bvq2oP6c1RYsmbxZqno06TGcD876gAyiW3kkTVlI8zTARvb85T23jnI/uoDpb/6J
         5LaVUJ6hVAkD3x3yJxyVui/7Cy5Dk06fEZsj4cKEPZ37YkGiqmY8C77mdqt//wiMQn5g
         FMJpjqyFUr6HBdGFFjtoMD3sOqU1FGdGnjwafaRAmYFGG/OFD+vgAP2TV2nCziB2BApL
         HCC3/9FpxxemsVpaYlACn+xh8fhbeCZBtUBf9o9mfCn8+Sc9WGmqY1jLwDgQ8idcG5cc
         6ggA==
X-Gm-Message-State: AGi0PuZlOxa39PVrwLnPR162rsr9V7Zesv/TSyDyJXUFdAxR2BW0wt8q
        Yi7ttTXpTGbbFRKWxVkj75i2SD4R
X-Google-Smtp-Source: APiQypLbUzeNvAIZR67vxpLwZzQRg3r3rXpBNYhH+Po0Qp1noxa7A8r1ABhf2bhfL8AcuoH9Rr3W4g==
X-Received: by 2002:a05:6402:1383:: with SMTP id b3mr15439537edv.217.1586772689922;
        Mon, 13 Apr 2020 03:11:29 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
        by smtp.googlemail.com with ESMTPSA id g2sm1307883edm.77.2020.04.13.03.11.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 03:11:29 -0700 (PDT)
Date:   Mon, 13 Apr 2020 12:11:27 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, kgene@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: Correct setting of eint wakeup mask on
 s5pv210
Message-ID: <20200413101127.GA10535@kozik-lap>
References: <BYAPR10MB3479E878C547053C6B952E01A3C40@BYAPR10MB3479.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BYAPR10MB3479E878C547053C6B952E01A3C40@BYAPR10MB3479.namprd10.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 04, 2020 at 10:08:49AM -0700, Jonathan Bakker wrote:
> Commit a8be2af0218c ("pinctrl: samsung: Write external wakeup interrupt
> mask") started writing the eint wakeup mask from the pinctrl driver.
> Unfortunately, it made the assumption that the private retention data
> was always a regmap while in the case of s5pv210 it is a raw pointer
> to the clock base (as the eint wakeup mask not in the PMU as with newer
> Exynos platforms).
> 
> Fixes: a8be2af0218c ("pinctrl: samsung: Write external wakeup interrupt mask")
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 73 ++++++++++++++++--------

Thanks, applied (with Cc-stable tag).

Best regards,
Krzysztof

