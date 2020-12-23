Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6162E1A6D
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Dec 2020 10:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727990AbgLWJMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Dec 2020 04:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgLWJMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Dec 2020 04:12:40 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFF6C0613D3;
        Wed, 23 Dec 2020 01:12:00 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o19so38564099lfo.1;
        Wed, 23 Dec 2020 01:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XFjigln4FKhgb2yIXE2C0J2CsGpFVKMdVWcpF0Ui4TU=;
        b=TklSgVAzH/5XWc6hVeGg8HbJLOVbQgHj7zpU3m/yaCW3eGNZWSxu7qhb3GZU3BpiiT
         K/ByUjLMbkQg5H6G9I/Ptj9IhfG9ftHgJ6bXHUAH2mpnAMfxWpkgv3CsUuKOtbsD0SdO
         h53yrt9MMFQ0PmB9H+m9gO0uKhhklrbPr3uo2J0k3DwH5h0qSTNGsvrFzvshUyZXWVlV
         w+RaEzIBNZwsH+8N1kj1Hh04ZrPapLctZDY1mSNyhfPaF/X9crogp2kN8e40YyaF/cyg
         M3LkM57wx/fD71SbpOMh8QB/FSGSXxZ4o1mjka1dNIM4VfzS6PCZalCl67Yxp0UKxhbk
         LYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XFjigln4FKhgb2yIXE2C0J2CsGpFVKMdVWcpF0Ui4TU=;
        b=dNRQbby3hV3HHk6XGa4/qCAR9yLVfjXnWw2hEWy02eblpYugFzsJKgFywMZSawCTof
         3Z0S/80bjQ3czRkFJl1gohNMBxjaBN9Vm0X4+wjsrpwL3VUF0VnJOO/IekV166F59gTO
         XgWF6lzbmbbrAsQvv0iRKUc26DikOOzDGjTMcIXQLeJ/pyPRpFYzevKN4xpKZtrtkL86
         hReFHlm89SjBlGefbyDhJUBX5UumuGYhYHyxISSwCKuGhDYmx8cLgtkple8g4ohg2D7x
         1ejFW+1wQ/y/kKx1COeqEvURT9sVWGNxVd2ZUCiTr0b+RBXUsZUgJ6tBzVHWw8iZs5Kv
         n+Iw==
X-Gm-Message-State: AOAM532/DnKlMd9pnfTa33k5CIZLPwjvs5HwFIZ7l7q7Kup30JdsoGQv
        lgQS3RqXMb8PsDMmwe39LHzWFg5o8Yo=
X-Google-Smtp-Source: ABdhPJyqar4/Leg3kRFU6UESwT5ecbO/hvVyt88yhLPOGmpVyyWDJDLg+XfsBnMIPP0ZkrDemekotA==
X-Received: by 2002:a2e:a414:: with SMTP id p20mr11484857ljn.98.1608714718416;
        Wed, 23 Dec 2020 01:11:58 -0800 (PST)
Received: from [192.168.1.100] ([31.173.83.145])
        by smtp.gmail.com with ESMTPSA id l13sm3082926lfk.296.2020.12.23.01.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Dec 2020 01:11:57 -0800 (PST)
Subject: Re: [PATCH v5 08/12] gpio: bd9571mwv: Add BD9574MWF support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608636139-564-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <dd8b06d4-5537-8aab-c83d-e908cbc71c05@gmail.com>
Date:   Wed, 23 Dec 2020 12:11:50 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608636139-564-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello!

On 22.12.2020 14:22, Yoshihiro Shimoda wrote:

> Add support for BD9574MWF which is silimar chip with BD9571MWV.

    Similar? :-)

> Note that BD9574MWF has additional features "RECOV_GPOUT",
> "FREQSEL" and "RTC_IN", but supports GPIO function only.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
[...]

MBR, Sergei
