Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2BF2614EF
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 18:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732055AbgIHQlB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 12:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732021AbgIHQhR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 12:37:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20BEC061A13
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 07:04:22 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z1so19304239wrt.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8M8FQZb2HgpFZLZz+2kHkv7PQ6hJJGgLuAcXeYJHXoc=;
        b=AUJqw5Q5yIKjjHv+TlphEapfGqGOE84LTkY2zdyRmrMCZc4UN5YC2gkzDw8k0vGBgc
         Cs7Qk83LMgV1TESF82VJ5kAJMn0dMUMkUDY+W7j02XikANSGY+Q5vMIg1bXFdpVU702p
         JpMtWNealLQk01KqN+ZWJF9EN7XmeVpCS4XuBlniZDTYtXI3FFvIfpE7OunsxJOYAvkj
         OKfewt829N5WohHh7McC0bRqVQDay13XKTzmxsGafZIAawYUqLmaZ0ivQKWBlUoAMXEo
         4D0NcBfydlPrudfK8LsP0K4eh5sKjdtBeSEV/jsf0BCwLordxeK93nP6TJ6FV7R5+i8w
         tvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8M8FQZb2HgpFZLZz+2kHkv7PQ6hJJGgLuAcXeYJHXoc=;
        b=Z4Ncu37XLP7hewJXqew2sENs2MrTnaDl5ZVntsyyF3hWWMtcC1qAHrS7QnCyzatZhP
         aox1BXrtSTT3ynWagDeQ5s1QYv8NVO8VcPARRhbi/Xp31et1FxRFd08auNbgpSye+sJN
         UiTkD/uKAfNGod33oGihi9BsoJDD3jVvmznwkfmztry55l3s7b3Mvn3cklu9WEZFNIM4
         vx7mfuVI3LgwVhZ9H89n8neOOtP1JJVKZvvKPnX2xF7QBz8b4Li7BFEeiuWWX5dfkFks
         lFQdD+6Zswg0/b0ML0RKfUWTNZjC3Mx24UiP+eUohD8tRGhcMqt0UoO7qdTymQGkxJ2Y
         EYTA==
X-Gm-Message-State: AOAM530vQz20HnA3vc66FxGO9YK5mWrTJxdHPm2enas53/sG8CXAaIdz
        /YnUxQ7FNShMLo1Vcf3CL38CPg==
X-Google-Smtp-Source: ABdhPJzm2yDttST5j8TaF3B2Cm917dhqrg3b0B96Ye1IYiXRwc7ozDdXKCLbFqn5vdgCfieZFk4ipw==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr28758614wrn.394.1599573858090;
        Tue, 08 Sep 2020 07:04:18 -0700 (PDT)
Received: from dell ([91.110.221.179])
        by smtp.gmail.com with ESMTPSA id i11sm11288646wre.32.2020.09.08.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 07:04:17 -0700 (PDT)
Date:   Tue, 8 Sep 2020 15:04:15 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     dillon.minfei@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH: V2  2/2] gpio: tc35894: Disable Direct KBD interrupts to
 enable gpio irq
Message-ID: <20200908140415.GW4400@dell>
References: <1599118222-18990-1-git-send-email-dillon.minfei@gmail.com>
 <1599118222-18990-3-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1599118222-18990-3-git-send-email-dillon.minfei@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 03 Sep 2020, dillon.minfei@gmail.com wrote:

> From: dillon min <dillon.minfei@gmail.com>
> 
> On tc35894, have to disable direct keypad interrupts to make
> it as general purpose interrupts functionality work.
> if not, after chip reset, IRQST(0x91) will always 0x20,
> IRQN always low level, can't be clear.
> 
> Configure DIRECTx to enable general purpose gpio mode,
> else read GPIOMISx register always zero in irq routine.
> 
> verified on tc35894, need more test on other tc3589x.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  
> V1 -> V2:
> Add DIRECTx register configuration to active general purpose gpio mode.
> 
>  drivers/gpio/gpio-tc3589x.c | 18 ++++++++++++++++--

>  include/linux/mfd/tc3589x.h |  6 ++++++

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
