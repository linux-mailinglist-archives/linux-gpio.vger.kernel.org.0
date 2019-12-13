Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE5511E21B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 11:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLMKhj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 05:37:39 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37985 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfLMKhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 05:37:39 -0500
Received: by mail-wm1-f65.google.com with SMTP id u2so1015479wmc.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Q5ocr36Lob8hEeIWs3h/05wUQjQ+K9T4cwQK/71/Rho=;
        b=ozjhT9LxrWoNn5+kruUUFRJPWCwFQD0DkqHF6Ig4DOJUCO4vI+jtZUQZFLC2js49Sj
         NuIOBOuolNM2SxE5kENSvIQHZVZRPnvKRv3Hx/vkcThIr+nL7ktfGwQ7jJwPTo2unwfB
         OQUfDXRNh0Ag9DDGGB2CsSkLxrYZE77mzjH5UrY3CfvD7oEkKgJ87NTH6Nx8n06x93Sk
         UZw1bAbky2AcB8TR3mH6K2fC7FZnS1vzNig4nsvlpaEXlqhf0kuVgWg7qghUcYdupMbU
         v4EWB4P/w6SgSSSdN+d/U/bWZJfcB50ezKAIXZkFvJ/3Rr6L5ZKWYal2yyIa/FozQmex
         z+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Q5ocr36Lob8hEeIWs3h/05wUQjQ+K9T4cwQK/71/Rho=;
        b=E00gfus5Rync/BxKwnMgbz4KBT0lIS6/+XplCCGw5c/Z5USfGel47MxFH4GBcR5RLW
         WaGukdV9OmppLGDSZrzd6pM19mzM107PnRjeOiAu+AC/lj5OtKZ743KvKwQaoL23/LIs
         /K7JrSQ857dgFe3BuiVwvDZDJ8diw0H69oTItnY6zqbpjyW3P7igZofzsvqx30y6v85e
         BsaPKFyq46mNjI6SFdUn7kZqjOx4AjH0W823nUEi9DhauWEmvak+SxsLm9c0rieNPbR6
         h0w8PQHGl9KHwVfDaIktXwYTMpYhP0RteYqexN0q8CztT6Jr5ghG+ayzJdsnau38qoJu
         ZYyw==
X-Gm-Message-State: APjAAAU6kwu0LRYORztSmr1Vq2xPExpMS8BCm6Ze3LolxWQqcB0fAXDS
        MXssZ7NgNlVMIk78vvpu1KxdBw==
X-Google-Smtp-Source: APXvYqxnyCKPIUq28BfNLWLn/OmW1/9wwqrfPkgBDBgdwgpsg60dQCt7fUIEYsF/ccJNzGARb9NYQA==
X-Received: by 2002:a05:600c:2488:: with SMTP id 8mr12247781wms.152.1576233457453;
        Fri, 13 Dec 2019 02:37:37 -0800 (PST)
Received: from dell ([95.149.164.71])
        by smtp.gmail.com with ESMTPSA id y22sm3999712wma.35.2019.12.13.02.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 02:37:36 -0800 (PST)
Date:   Fri, 13 Dec 2019 10:37:33 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [RESEND PATCH v3 2/3] mfd: da9062: add support for the DA9062
 GPIOs in the core
Message-ID: <20191213103733.GB3648@dell>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-3-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212160413.15232-3-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Dec 2019, Marco Felsch wrote:

> Currently the da9062 GPIO's aren't available. The patch adds the support
> to make these available by adding a gpio device with the corresponding
> irq resources. Furthermore the patch fixes a minor style issue for the
> onkey device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/da9062-core.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
