Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAC3D3888D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 13:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbfFGLJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 07:09:07 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:38183 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfFGLJH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 07:09:07 -0400
Received: by mail-it1-f196.google.com with SMTP id h9so2074756itk.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 04:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CuFVs80agBK+t28DynbWcbR1IyT1mk+D5vYDwloILM=;
        b=TdDFfVALonHX25UwQFJtO3sqMmxd/dQyZBgp/JwcYPUWeG71JDVwDE4UIQ2zzdgc5h
         dS6sD7TXQTrNhZgbe6vc89B0oJlEfVeFHTdgM7pabd7pXzAloyA4I6xjWJ32tLY4v9SB
         XErhCOyfpCrz1O8dZ0S2QmvcoQno2io1gB+MqsWQNlM0uWb8j3Ie/zxtmP0b4s+VFgjj
         8MNcjuzKe1OIfJnWRs2VKKz/R3kePhUnXNmnc0G28W1fs82oPuHSA9zPz/gdP2ZbYHUk
         rdqUIgMQCfb2qK4GOCFwy7rdt/k3SIxnkx/jmn6pnKkqWuk4aSUW4MSh2izkB5s6kacL
         4c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CuFVs80agBK+t28DynbWcbR1IyT1mk+D5vYDwloILM=;
        b=JabX4E+oLOUlG91gwvuffKMpEXGeqthHN29WPO52H56wfJOAe07D1pNIRtZfhb3xqz
         lXwtEOssPR1BW5p4Vb2ZhqHmZmezfmdAlflceoMJ8cH85GXC3IBLhMN8+X+K/n/aGnz+
         r+7bc2ChQveeJGZQQc02xQujebwOIjmi79ZwaymR47E3bSjZx4R7vCPOZPXYU0aYqcxl
         gBUnBJC55/1uXe4JDZksuDRvTpCGYMCeST54XEg/v4J7n4CtHCeK+QVIGYbHB31kVFj1
         ca6yTsCg3sz3HblaOdTDD2HvAI2CtitEjiqP1cZGP/+CqJagAXroxp8lR6ZjVn7Jz2NA
         ZQrQ==
X-Gm-Message-State: APjAAAXLVw5GzHmiZrpHTsk2AAQR1eng3jCYCGk3UuVxhLlTIeoguxcy
        lRQttl7TQG0o9B4/rfNrvYzV0ObQJJZnSJtFYDa44w==
X-Google-Smtp-Source: APXvYqy+u89bT+ToKVXbGhc20GyNGrWe3C3FoDT3WJNZnupiXCWuif5gv3m1UKEtSYyHF3MfamtT5Xh10NJGnyKbIMU=
X-Received: by 2002:a05:660c:44a:: with SMTP id d10mr3330139itl.153.1559905746503;
 Fri, 07 Jun 2019 04:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190607082901.6491-1-lee.jones@linaro.org> <20190607082901.6491-2-lee.jones@linaro.org>
In-Reply-To: <20190607082901.6491-2-lee.jones@linaro.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 7 Jun 2019 13:08:55 +0200
Message-ID: <CAKv+Gu8UZOKxfkm8Wsc3JB_OYNW08fDp4dBS_7L41GLztcx_Pg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        wsa+renesas@sang-engineering.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>, balbi@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 7 Jun 2019 at 10:29, Lee Jones <lee.jones@linaro.org> wrote:
>
> The Qualcomm Geni I2C driver currently probes silently which can be
> confusing when debugging potential issues.  Add a low level (INFO)
> print when each I2C controller is successfully initially set-up.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0fa93b448e8d..720131c40fe0 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> +       dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> +
>         return 0;
>  }
>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
