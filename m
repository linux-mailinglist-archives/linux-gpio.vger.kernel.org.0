Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5691C0254
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 18:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgD3QW5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 12:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726411AbgD3QW5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 12:22:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4F8C035494;
        Thu, 30 Apr 2020 09:22:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id q124so2959543pgq.13;
        Thu, 30 Apr 2020 09:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6hCrcx7D1IDeNZAz3WM653SH5Zf1li3FyaYMgWSZV10=;
        b=khVobuD+wLTE4Vvd7irrCNwIATVVxx7BODKqed/nvfb3jaKN0Q9GDkfdJmkhc7NFFi
         w8e9KCeKqgbrVN7D5MeL8v7DwyUWF3UXnx+2qFFr8jxS3Q1qN3Czf/7pnXcEWeSW9kSw
         pHvra7EV+7IMRR84eg5q5QRCqs3ewkhsDaetsNTPPoXhVUah5c+ktzzxfFa30qRmlC9T
         FEZi7+WMls4qiMh6sCWMMndyRyUu49dWtGkVIR5rmheWxu5SoZR+3gCDqtM5wrNWHzG+
         5qeQGGheakucxv/8CdAu3JAU2xM3xwKqG8D+U5cakfUfqFHjL0yxCGcRR9YVaY5xQi4M
         lY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6hCrcx7D1IDeNZAz3WM653SH5Zf1li3FyaYMgWSZV10=;
        b=cXZcqAeHqdsLTJOXVIn473z855RioLib5eK+GvFsTCfNd9gY56Flu6hozlnl7bQR0Y
         fgTAkn5NxjXTUtkTBurvXxl5PGbXvZHOssGfpCwm3iGc/P48ewfrx8uY27n/qMDsLjEO
         S9l6g+JEaKtJ4mqziv2dRwafvv0qw35ZdFsIkslg4qZ7DrQ11k26ccv3vWbjtUwk7p/o
         5gNcI3Fs9HymBLDREBaIGjBi+CMnDUPU57xixK81FxMxeXt4TaLeE1C0n5oWid3lYaeT
         SLUTACorYjj3re4JqCzVNsguWz+dVH2tb00DqHhx5s5g9mQLFjiQd0cMeF0visg8zKdN
         SjjQ==
X-Gm-Message-State: AGi0PuaLLHwSO0rwydCdZQDhpSbWzNFr4PLp7eQ5U23r7mXaX6XWpft5
        rGSyG/Uhk5TSr+u86+rRKa8=
X-Google-Smtp-Source: APiQypKil4wboZhZaqbn4ZNNa/Myyh4nU79jYWxti5AstyRCUBDfoX54ExdlU3opgxCQm7GlLRShow==
X-Received: by 2002:a62:158f:: with SMTP id 137mr58768pfv.219.1588263775318;
        Thu, 30 Apr 2020 09:22:55 -0700 (PDT)
Received: from syed ([106.210.97.7])
        by smtp.gmail.com with ESMTPSA id 3sm258099pfo.27.2020.04.30.09.22.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 09:22:54 -0700 (PDT)
Date:   Thu, 30 Apr 2020 21:52:46 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     akpm@linux-foundation.org, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <20200430162246.GB7107@syed>
References: <cover.1588112714.git.syednwaris@gmail.com>
 <ea25f5cbe03a3bb4bf5d976b004d87c4bab178e3.1588112716.git.syednwaris@gmail.com>
 <20200429101742.GE185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429101742.GE185537@smile.fi.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 01:17:42PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 29, 2020 at 04:37:41AM +0530, Syed Nayyar Waris wrote:
> > This patch reimplements the thunderx_gpio_set_multiple function in
> > drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
> > Instead of looping for each bank in thunderx_gpio_set_multiple
> > function, now we can skip bank which is not set and save cycles.
> 
> > +	const unsigned long bank_size = 64;
> 
> Shouldn't be rather definition?

Thanks. I think you mean macro definition. I will incorporate this in my
next version.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
