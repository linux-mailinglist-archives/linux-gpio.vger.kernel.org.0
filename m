Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA652B70CF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 22:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKQVUm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 16:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQVUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 16:20:41 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED8FC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:20:40 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id w142so32120891lff.8
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cpbom2L5pT8fTspZMcOBAbHEy/6X0oOwo0CMzp2Uwdw=;
        b=Xb5zdmjG+0EgMK1NkvFrTNHa4CSyEkVkyPCK2S7H81dHTwkGzLWNoduVE2F/D3JTFa
         YYxZ3kC9ATmIvNNM3tB4HCDXefQkWLWvXlrGmRCxknCx5nZXGW04oYSAQ179KyA3j/Of
         /tfvQ3Ien2yN5tLoNsUa65OkUcUiGZtMY7e0KvTQ5nijwIz6VDcECn/Lnqy+qUs6uA4k
         bGPJZv1hONXYK/yWdbb0V6YFWzysFi9B00p2VLlzwXsfzgztbYl/llttAImXqjnaRiGV
         /rWi4QO1xDHbTWcVYdndY36UF2IYilsLAN4UJrkYB5ZRdUc923SuWxP5qmWhkbZWYf+X
         Z3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cpbom2L5pT8fTspZMcOBAbHEy/6X0oOwo0CMzp2Uwdw=;
        b=I4Sh02Zxq6O2aErknfuavzo9fXfssL5d2s6X1/tiJc2Y804PS5mhiIurXUKRV3+8gs
         HT3QA35afECaIl4eXDjizc63wN115p7ooBL1/8VB8XUDbzMvw2l+XppLlR5wqx6me7W8
         qhbjAE9DcCOYUCiWld1vvTbG7k/7AsCBuPs+WO4quZaQqnQLWo7sTBqz2W5UEVJm7jA1
         /wcaUNO0PFTRQrWCdtHhkux5vJbyToFneGDt+GYMxxBUmwFk6SyrVFj8CePcqJRDKHkU
         C7lpZjXXEhGdRkYuOogHWoXsli5swYNTOEdhJrM0/RJcLiyTYGajq265U9cXRJFN32EJ
         6VkQ==
X-Gm-Message-State: AOAM530+7IKA4LMqX0dCHAJFoaypyGBq3/Zk0TDRVkdhAp+AJHROZ183
        uqkqwIXiCjzjp3V5FASr7w9LjVS7GOMMjTxFKS7RF5MWX7c8kQ==
X-Google-Smtp-Source: ABdhPJxl0CwOJiOPGGvp5WiSYvbMCr7gVVTqGhzYYeCuPvlsUKVkAg4HekWHlCOz/tcOo9x7BoYm6gusZt+Q6rTjJW4=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr2309405lfq.585.1605648038556;
 Tue, 17 Nov 2020 13:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20201116154748.GA73963@black.fi.intel.com>
In-Reply-To: <20201116154748.GA73963@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 22:20:27 +0100
Message-ID: <CACRpkdbXmY5VvJv2DY+JzHg8b1kQvc5_phpNbYyBm0j2G8DXrQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.10-3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 4:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The following changes since commit f3c75e7a9349d1d33eb53ddc1b31640994969f73:
>
>   pinctrl: intel: Set default bias in case no particular value given (2020-10-26 13:26:50 +0200)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.10-3
>
> for you to fetch changes up to 5f714771d01e0e0d410f06d4d192fb27b1ca0edd:
>
>   pinctrl: baytrail: Avoid clearing debounce value when turning it off (2020-11-16 12:07:57 +0200)

Thanks Andy, pulled in for fixes!

Yours,
Linus Walleij
