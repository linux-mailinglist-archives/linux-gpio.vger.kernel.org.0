Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF37E21DF3D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 19:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbgGMR7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 13:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730198AbgGMR7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 13:59:42 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A2FC061755
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 10:59:42 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b6so17555112wrs.11
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=z7pEtA5iBAOAbSW9+7JuABPqZcvxnVfZbw6mRnzxJ9E=;
        b=WPUYVKreDkf9yZMNMiDL5g6kVqFWZrvS3YFLZ1NOCtcnJ6+GNJR08CXlJtYXuNxZY7
         yC7bXj/XqZ7RXv3VBUUYYAOXIaUZcY8CCOxK3BQV4xYBKG8nbNx1bVjoxxQp0swraKzV
         SGt+WqKlPgmNRiyEBxYFFTM8PbRGheqZFmIb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=z7pEtA5iBAOAbSW9+7JuABPqZcvxnVfZbw6mRnzxJ9E=;
        b=l7LuRf5gJuvCisMJn6rZSkHgCYAtlPgFsW58BFSjDgT/WDTCenW+xE44hDmUwResw+
         ZiJ5R8I0jzJcBV2BWO6kuc0LDpqTWYu96TS0ozaE+K1mZEl7OoiKA4EG4aaxZ0Z6xFtJ
         fUqFIe4IBIBCD9ixHm9wrkXQT7z06lK9imIE6VCDBASNdRb1bBuWSjxzYHj3PfW9hCH3
         Fh4lEt8FojOSqKw4qw+NzuzRRkqe3MnpVEmJ5OmpfMh4BKfZA/3bLQAIdGnbcrs/LAlG
         0GIzWvnLPAHmGWJECXsGVBT087sfSYc4AF1VH2rV9hYe+AHPqnGHTGT/YsdQHzoeHyNr
         4hCA==
X-Gm-Message-State: AOAM530Rzy44PAyAF0ez4gmfKgzwYFXRWONSgHmaZ9cY1crhfyGKvDy0
        bqcIjTrwSKs/zn2FJbmdf1rtYw==
X-Google-Smtp-Source: ABdhPJxytEog4tJTCrdDFG3RCmZbbR4xRA/Mc59ogBaI4ze5XCZJrx0bTcdW+mmLhfgjFEbK3B3kVw==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr618419wrp.412.1594663180760;
        Mon, 13 Jul 2020 10:59:40 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id b10sm444242wmj.30.2020.07.13.10.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 10:59:40 -0700 (PDT)
Subject: Re: [PATCH 03/25] pinctrl: bcm: pinctrl-bcm281xx: Demote obvious
 misuse of kerneldoc to standard comment blocks
To:     Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        YueHaibing <yuehaibing@huawei.com>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-4-lee.jones@linaro.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <62d7a3e7-c96d-8cf9-da22-16f8eae05def@broadcom.com>
Date:   Mon, 13 Jul 2020 10:59:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713144930.1034632-4-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

thanks.

On 2020-07-13 7:49 a.m., Lee Jones wrote:
> There has been little to no attempt to document any of the demoted
> structures here.  These are obviously not kerneldoc headers.
>
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:65: warning: cannot understand function prototype: 'enum bcm281xx_pin_type '
>   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:79: warning: cannot understand function prototype: 'struct bcm281xx_pin_function '
>   drivers/pinctrl/bcm/pinctrl-bcm281xx.c:89: warning: cannot understand function prototype: 'struct bcm281xx_pinctrl_data '
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> index 71e6661783006..9ab1f427286a7 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
> @@ -59,7 +59,7 @@
>   #define BCM281XX_HDMI_PIN_REG_MODE_MASK		0x0010
>   #define BCM281XX_HDMI_PIN_REG_MODE_SHIFT	4
>   
> -/**
> +/*
>    * bcm281xx_pin_type - types of pin register
>    */
>   enum bcm281xx_pin_type {
> @@ -73,7 +73,7 @@ static enum bcm281xx_pin_type std_pin = BCM281XX_PIN_TYPE_STD;
>   static enum bcm281xx_pin_type i2c_pin = BCM281XX_PIN_TYPE_I2C;
>   static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
>   
> -/**
> +/*
>    * bcm281xx_pin_function- define pin function
>    */
>   struct bcm281xx_pin_function {
> @@ -82,7 +82,7 @@ struct bcm281xx_pin_function {
>   	const unsigned ngroups;
>   };
>   
> -/**
> +/*
>    * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
>    * @reg_base - base of pinctrl registers
>    */

