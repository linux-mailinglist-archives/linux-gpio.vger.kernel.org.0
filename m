Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90075C94D6
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 01:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbfJBX3k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 19:29:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46716 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfJBX3j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 19:29:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so451012pfg.13
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 16:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mfYTRE2wrHnGHdzN9pNRX0i1wlfEpry7vj/JNYrQ7CY=;
        b=Mf3QWc+S+bv5pPGAm5l5TcASwdcoob1IpAJzIYmCUhXcHc9GZtCIr3XT5pjbAuSPTS
         AWmeLFS3b+jY913B1ysUu3DmViojEU2i9R/tFiFtAV+95O7xfx1ymyUlCoel6td6Eh1e
         Aeti9QCjKm2ld4obHKXX8u4j/MNnSQabQF1YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mfYTRE2wrHnGHdzN9pNRX0i1wlfEpry7vj/JNYrQ7CY=;
        b=oxTLp8OtcdJCSvOSDmKYAjFkOhuYVxHxDPbTxMw/HS4OdKLOVMuVEIv5LMn4FHWL61
         Pm9P28yoG/1s3bTKlJ6EwdZ3/1kFjSfYLKnkKNt7S6CvWGWJYO1r1rNXdQFmzDeca5H4
         sjhR95a+RnTKKMrSxhfi24HxI6P56nsYV+dwVy5+BerIWxnFdQRtxNnPmPQrCsSR0Tb3
         WYdpnMzNG2Xq+ZLlLqOE7QcBGdvIQ8xcYslKva2e9uesPn3L8/VQq7TuDG9Vnhxzv1Fd
         fsfO5rkonlkvR5V4OavI+aJKJp/6xvSmYJ5c3uhbH3KtJajgFqQs/HSiogqUQaIt22NH
         z9kw==
X-Gm-Message-State: APjAAAVNLjQdrAg6mlpZ+pVQYuZzqaVmDJPzs6pWTbz+FDjubWJjvPG2
        PcVVqkTVx5mpXgWNfBs/WCd1tZt/wjmz+A==
X-Google-Smtp-Source: APXvYqwb1v+OFwGH/X+Zf8U8nxSjb6n41/d9STpAf2augV7Q8TlFtC9GLo/vHrIL44A4Hqi6BErSww==
X-Received: by 2002:a63:e14:: with SMTP id d20mr6038229pgl.33.1570058977001;
        Wed, 02 Oct 2019 16:29:37 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id l72sm342214pjb.7.2019.10.02.16.29.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 16:29:36 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: iproc: improve error handling
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20191002220034.2034-1-chris.packham@alliedtelesis.co.nz>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <045d67e2-5618-3742-5519-c4fb9518c118@broadcom.com>
Date:   Wed, 2 Oct 2019 16:29:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002220034.2034-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

On 2019-10-02 3:00 p.m., Chris Packham wrote:
> platform_get_irq() can return an error code. Allow for this when getting
> the irq.
Above matches change in 1st line of commit.  Please add a Fixes: tag
for such fix.
>    While we're here use the dev_name(dev) for the irqc->name so
> that we get unique names when we have multiple instances of this driver.
The dev_name change should be in a different commit to keep things
bisectable.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Noticed this while debugging another problem.
>
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 6f7d3a2f2e97..c24d49d436ce 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -853,12 +853,12 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>   
>   	/* optional GPIO interrupt support */
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq) {
> +	if (irq > 0) {
>   		struct irq_chip *irqc;
>   		struct gpio_irq_chip *girq;
>   
>   		irqc = &chip->irqchip;
> -		irqc->name = "bcm-iproc-gpio";
> +		irqc->name = dev_name(dev);
>   		irqc->irq_ack = iproc_gpio_irq_ack;
>   		irqc->irq_mask = iproc_gpio_irq_mask;
>   		irqc->irq_unmask = iproc_gpio_irq_unmask;
Thanks,
Scott
