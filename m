Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E5D1406BB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 10:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgAQJpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 04:45:18 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42718 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbgAQJpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 04:45:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id q6so21922148wro.9
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 01:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6JQdJ/Z+v9/vjiZPLWiEeVG/ezp4htSKwWzwxjsSWBY=;
        b=SiiK9OBCwsjczoZlFB2/PbwNzt65xXxwp/2hl7vVy8q1P15e9nwVJOriZ3rt0vu/qk
         ANr7muK6mj79J7aTxzA9hT1uExPNqHVYmvmysFg2FuWEESIUy+VwvZCgW01kwD6FkWd2
         Wk/fEr8phJJCBqm2ojpU4ia4vYW2GLbAsR+jEt5+Uzqa32WFXwRCzxucl6lUBzM9mQDF
         fu6q71nwuUmVqQfkQh3DvFtvX7MtNouyOZbbQ9QfdfACDbyC1VYMBR3nNC1LqoUi7rEf
         O2RB2yyoVHSO5jlmx9Mo39RNV+mZMQ2EDJ4XEBPju+SHhg9afGmpKwCIAjThGhEevGcG
         BZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6JQdJ/Z+v9/vjiZPLWiEeVG/ezp4htSKwWzwxjsSWBY=;
        b=n0SwYoXiKMxM2KN3Lzrx6D498S9pu2YygWDQEfV8nn+xBqzLmPmCulodBPXAG1eNB9
         /wX7VGYgcLcxO3zhymEFlQFbuM7I3eD0pPsklK/r3b82bcF3wRSrNkeQUHhYFGdHFL0X
         3jRCgibj5SCEWk2NyR3pYlWjGZfYxe8K1x6K84orNxDdCPdT8XdbDcm9qAf0bAxLWoSs
         gXI5TelOTy3yVoqz6d/zbcA2JhO+qJvZzLAc6sgb5ckp11LNRTXLGfl/vSlK/F7Ivex6
         x1QC9HsXX6hXxsvvZsPtTfRPvZyF91YPaRAMGA+h5pj+jfmqjrm3A//uPuzjfO4uKRUL
         KuPg==
X-Gm-Message-State: APjAAAXNH/Hy7u50dExtOesyW4FYKS8SA5rz/BenZQabk0WI2voRIng+
        LHTl6u6ao/QK/dzo/P4uXnkTuA==
X-Google-Smtp-Source: APXvYqyEk2ExDz5kQ4m2E2esP3TuVG1PMbfYAl7TrlI8nt7Maqc1sYLr4kN4JskI44nke/OUXtlSEw==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr2159617wru.350.1579254315991;
        Fri, 17 Jan 2020 01:45:15 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id i5sm8814345wml.31.2020.01.17.01.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:45:14 -0800 (PST)
Date:   Fri, 17 Jan 2020 09:45:33 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, Adam.Thomson.Opensource@diasemi.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: da9062: add gpio bindings
Message-ID: <20200117094533.GA15507@dell>
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200108104746.1765-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 08 Jan 2020, Marco Felsch wrote:

> Add gpio device documentation to make the da9062 gpios available for
> users.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> Changelog:
> 
> v2:
> - remove sub-node documentation
> - squash gpio properties into mfd documentation
> ---
>  Documentation/devicetree/bindings/mfd/da9062.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
