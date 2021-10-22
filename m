Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CCF437EA3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 21:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhJVTbZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 15:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbhJVTbY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 15:31:24 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C9AC061764
        for <linux-gpio@vger.kernel.org>; Fri, 22 Oct 2021 12:29:07 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id c29so4536010pfp.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Oct 2021 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ATGEBm7LYbYTm8NP6Ez1dHPW6/7CWyNYtkNaL1fmxJ0=;
        b=lSkpHsxmfD0rBJCJWbZFFhd3PQ9wGSahEWn3CN1imdjPSM8U9xm6/VNY3BYtTnfrTq
         K91PwKdFf24rr27m/QOX9FG13XVyYRjD3bvBSeMepp8saRo6th7Br1m/5YvX2uBPZGd1
         FcVzZJyNZK0dnnVS5dplVABlBjRFFyEoS8H6/SDg7YBGqr7kChG7PWg6hP3rN9LILxOd
         j8kOgp3XkUP0Ov0S8ei2khZzlgGYTm/myVxe5zXKbrvMd78eJXoSCjynQO90+A+h/KxF
         PVVTyo+VvxZlmJ5QjU089jiSB6PrHNOnGPb5JpIUEhwzeGXwcy8ufOZ7tJBwr71F2uvk
         gJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ATGEBm7LYbYTm8NP6Ez1dHPW6/7CWyNYtkNaL1fmxJ0=;
        b=nYw70JxIWCM2upUPbUlEeJwR2NRNgyBrOX8lHOv46j1DmvGqpapjbPSFYr7AUPzeF5
         FxPZ3Yy8pOsycFXZCevwqPRwsfgC1MmdvYOwzrMchVgDZNtWkJyOl6Fm9ISqY4Oe8qNc
         D3UJkiZo59OXs6nhWzO0v5RVUB9Gf0gKy9Rd1sA0R4TYVITyuUB5rJzhjvHo3MTrtVsh
         nQ019TS/ZCKyyrBtZyQToq50oOOOeBkYxId711P2jzkp+dek1AhqOXqrwxQGS6hHKfQl
         nTjE201TDdXJ+jCyQg8DZ9oUp5g78V+dpbbu6Jrpxz7zDfI/M0GZYWxexdvnwrnxRq62
         /72g==
X-Gm-Message-State: AOAM530Un1lpT6w0UclYGj/5C/BURLUnN346ZCIBEih5S2xZZMEpYaM3
        J5V939eZ0LdLFpAShorP+Hw=
X-Google-Smtp-Source: ABdhPJzZU6/PBA7m16cZtPb0PimamPfMkF+8M5I2JD5yuqgonmSy6N8zhR8t8XMQ+aJxg4W9SgkXWg==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id p16-20020a056a000a1000b00412448c89c7mr1483753pfh.83.1634930946488;
        Fri, 22 Oct 2021 12:29:06 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c3sm3660763pji.0.2021.10.22.12.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 12:29:05 -0700 (PDT)
Subject: Re: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <20211014123342.174711-1-jonas.gorski@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c62f90d1-0b47-8894-b9e7-d79b720a2eb5@gmail.com>
Date:   Fri, 22 Oct 2021 12:29:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014123342.174711-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/14/21 5:33 AM, Jonas Gorski wrote:
> of_property_read_u32 returns 0 on success, not true, so we need to
> invert the check to actually take over the provided ngpio value.
> 
> Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
