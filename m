Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F673B33DF
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 18:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhFXQZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 12:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFXQZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 12:25:04 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAFDC061574;
        Thu, 24 Jun 2021 09:22:44 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h4so5141853pgp.5;
        Thu, 24 Jun 2021 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3/3dGj2HIX+HnqnTIkrn2ymOpUkKJX2RUtpja3yGqZg=;
        b=gRbh80efko0UHOzbtOODSQmAQPa3cEFTibRwGo4GbI0vOB6X3QYXefkM+qbGgWQ/SQ
         0EkZrMQVJUkam/mC+LDtc3pKzYHXmhERmg+A7WgL5rV1aJNup7HM2a42gwicG5z1no9w
         GY2DTBeg8c3vwsjll9bioaTkmXthn8lAGWAUM/FQtUCxhjoFLJ+/i/j5Q5cjsPe11GQT
         Y63C4wOdkjWcE8MDjQckSWw/STHK7EfK7P2i14xNYRJheLTzeTwLZwSGTs7q32tT+Yhn
         3b5QaI7qQp6l9yRd2dKxjylnY1jxoKkcdL8T4oBO1qgVWPtzC6K83AE3wwmorN1yZqg0
         kiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3/3dGj2HIX+HnqnTIkrn2ymOpUkKJX2RUtpja3yGqZg=;
        b=NTQuV/AY4jotca/EfCNeNISYTLJUjvErcJya5ETbVFvgpdPnwAhKmpSgq7sQK8zVEk
         4xwanDDTUmcK0GvzErwNX7iYxNhEbKD16y+U51x/u0XK3nmaXt6NbDXI6AC3exrjuhKi
         MdhRaXgm8zLm7KqPKpn94ww/URTaPZNgc8OmTqvGstM2ttp3fTPK8BJdApJngsihcUy/
         VvOKiZBzJKVXZQCE9sf/CKQMPPSQoKdY3qR/epldoKISjjM0ilVe97UW9SQDoYTUJztW
         cwSD518r4pL2BCv9KYYYdT8fjea0sVCUKvfjBUYp0lusJB89It9Nsu/G5VtTm7LXRkpq
         xeZA==
X-Gm-Message-State: AOAM530S5FwPH4uhSbADKcK2ScJceeI4Q+k6DQRE/zqxIllTheZ8EObN
        Cjiq/Z9ftk+uZ9rRqtOHw1iruta7PPWIdg==
X-Google-Smtp-Source: ABdhPJzxUpS0cVQifVC2919L/lkBqcK3L+x0bKhuPqlCJT2jVwG39zL+ioypFc9OPObDNA0CbFq27A==
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id 26-20020aa7921a0000b02902cfb55b9d52mr5735259pfo.35.1624551764017;
        Thu, 24 Jun 2021 09:22:44 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 201sm3374506pfz.125.2021.06.24.09.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 09:22:43 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: bcm2835: Replace BUG with BUG_ON
To:     Jason Wang <wangborong@cdjrlc.com>, linus.walleij@linaro.org
Cc:     nsaenz@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, phil@raspberrypi.com,
        iivanov@suse.de, linux-gpio@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210624064913.41788-1-wangborong@cdjrlc.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7dd8b65e-0f89-9aa9-9eab-6cbc6c9495bb@gmail.com>
Date:   Thu, 24 Jun 2021 09:22:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210624064913.41788-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 6/23/21 11:49 PM, Jason Wang wrote:
> The if condition followed by BUG can be replaced to BUG_ON which is
> more compact and formal in linux source.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Although I would rather completely remove this BUG_ON() and replace it
with a WARN_ON() instead, no need to kill the machine for such a
problem, however unlikely it is to appear.
-- 
Florian
