Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34AED6AC353
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 15:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjCFOct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 09:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjCFOcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 09:32:46 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D543526B
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 06:32:13 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id g6so4071619iov.13
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4Vf/GiLha2pSMEvHIjTJV0zZlY5SiXWt3VfrpMrw9Y=;
        b=akI6SHo4UJOJ15vKtoKaKVWZDjqLiMQrYqiz9yK2znfMNqFK4ZNR/ksznBNBf+sYGZ
         wFiwV80v6XjP0xnV4Zo/yrV7W3OvcTOxpdqlhqy9aahYJnXZQu7CuZ5wLKEXruvhkuMg
         lfRLcvkmQ0Pyxegt7pORtURmRjYweBwBu68RtbHu4mg+jcB20yv0jDPtIwblscxLO80I
         ZknN80aOg9vREiOdnnQlDsxTnag7VXil4EZpZ8rLQ15V4ZaW3XA14yxk262JvyazvyFH
         ew6SQeN1L2Kpn0ueeTvVbfp3LzPmBlGZcQJnr6ZHS8XrF8Mhk2BBkxou7Cr8B8ZFmFcQ
         58JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4Vf/GiLha2pSMEvHIjTJV0zZlY5SiXWt3VfrpMrw9Y=;
        b=XPZNRU3mFxVMkt2s56eSzDF0L9jWbMcMrjyks877t9WtlB+Pnz8Xyx971paDHrAb9b
         eXwf4M6NDd292glRIBtbAzlPmHpkk/bFtMMWe0uuTbfBBb3g4PavVlb2EMD3YlWqYTb+
         ch82Dkym2U7B5zG3h3kryMxLT2CBqTnCiAsyjpwZm4/SvS9FbEWptZBhYCQBe3Q9/cn5
         5Efyfvk0OBs/Gwg5AQxFOwyvuPtNy7+9NWXg5rLsomd6JysWd9gI9Xnd3nS94rPaAQUJ
         WpXkgQEtbp5dv7qOR0bvV4d7omKv6xfYJObdEvdjZTFAI5oGMX16dQPNAUtFX8GvZRlk
         x71A==
X-Gm-Message-State: AO0yUKVkLjx7nl6xPktaqKqMtu02azgXDcM4Eigvct5G6J1ZK22FXTur
        a5hD2m6bPm4CZoDtWSo+N9aetHp5c0wutjgBVIFkfXUHjPVIw/UC
X-Google-Smtp-Source: AK7set/n8BLSpbkCEy3a4qm95upY/2HMv3F6GdIP+lCqGyyMSVbkr0y4BuVYE7xyzvcDBhJP5Fr9x0ECyU/7lNdQ1Dc=
X-Received: by 2002:a5b:647:0:b0:932:8dcd:3a13 with SMTP id
 o7-20020a5b0647000000b009328dcd3a13mr6562490ybq.5.1678112538925; Mon, 06 Mar
 2023 06:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20230228065618.2686550-1-xiang.ye@intel.com> <20230228065618.2686550-3-xiang.ye@intel.com>
In-Reply-To: <20230228065618.2686550-3-xiang.ye@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 15:22:07 +0100
Message-ID: <CACRpkdZ4iiN-zeJautqk==kcUh1cRdyrhmeACEBppPYdJwA=Xw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] gpio: Add support for Intel LJCA USB GPIO driver
To:     Ye Xiang <xiang.ye@intel.com>
Cc:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 28, 2023 at 7:56 AM Ye Xiang <xiang.ye@intel.com> wrote:

> This patch implements the GPIO function of Intel USB-I2C/GPIO/SPI adapter
> device named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA
> GPIO module with specific protocol through interfaces exported by LJCA USB
> driver.
>
> Signed-off-by: Ye Xiang <xiang.ye@intel.com>

Check my comments on v4, with those addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
