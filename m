Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F7845E39C
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 01:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238729AbhKZAPM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 19:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352126AbhKZANM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 19:13:12 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AED6C06175C
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 16:10:00 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so11513223otk.13
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 16:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neIFIYHPjOUpNL3YRDeMbxvyjnBJ6P4UgTI+o3qYdYw=;
        b=tYYZaYR1+CccW6lhfaeZQ0QneHWCZxskvvmMmnwLYww8cUcnOjMq6uoaEQljsIyIKS
         BjtbswgDTARHt9oqn+Rsq5qvggq6vBcE6UPAWnlFACFr8k3ln9GU1JfVtatcTwcPd5Ew
         fKZfJqnaB3nf44Lx3HlDJaUE5nhT9Nd/RVbBUZMtUphqHDasHVCQ/WwB9FxwD5tiLUF/
         TukWZvO9qdQF2J8jN9Fh4yNE2KbIc6TG/AEsVsiGMOnbxPW/mrY4kOMaG0wenzjggFMO
         HDqxDLtMYiZ3+7j734mCPMdvVO+Dl61pA/A7bw6NRNheu4laChJcK2caBAJDUcoezex9
         DPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neIFIYHPjOUpNL3YRDeMbxvyjnBJ6P4UgTI+o3qYdYw=;
        b=lGcpoXSgbcJ6fpN/vRk8AjoW9hpGs8hGNVyBzXUgZXtJg3cJz1BDytCg0NYd922YvT
         vjHDWGBFi8ESaiJUnAxPpLvsaHLh+A13oXy7h8JqSC1ZwBcDfRJlv0xYC6B0NU6RxsKk
         UBfERMWWExsDt3nZmvyfO+UwA4qawxvA01iPdFfODpLP91S/MjqlRXuZa0kXR77Z0dnP
         YKslIZHMr/Z3SrxGqmn4ZN899ZH8iz/UKoiMv3r6qlne4AK7d7y8XiCwkVJSI8CHrn88
         bNVSEBMObkLF7x4/FSGKOqbg0ZwpcK98Vn3ImVm/iea8TiBeJzDcDOcccojbLid12WZd
         6i4w==
X-Gm-Message-State: AOAM532eRfbjOeIQRNJcjrnUCzvQ6w9BqsjPHz6eCOQolWlDx+GBME/P
        8GKUYodkYWeFot+btq3lKrg+LxzMlo8jvDi5I9eE8XXaL3s=
X-Google-Smtp-Source: ABdhPJwgWT/e+0czvS3idqkKSoKYVIDQJsSLxdv8T3m5T5PstA7wAP74pbo77sscXIt8r/ICaUlySf3h3M1mipxTuu8=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr25707913otg.179.1637885398027;
 Thu, 25 Nov 2021 16:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20211123155144.21708-1-lakshmi.sowjanya.d@intel.com> <20211123155144.21708-2-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20211123155144.21708-2-lakshmi.sowjanya.d@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 01:09:46 +0100
Message-ID: <CACRpkdbOG7AiZxMoP9azYzHBEeOvNVWt9-ArYiP=BBswydRDqQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: Add bindings for Intel
 Thunderbay pinctrl driver
To:     lakshmi.sowjanya.d@intel.com
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        tamal.saha@intel.com, pandith.n@intel.com,
        kenchappa.demakkanavar@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lakshmi!

Thanks for your patch!

On Tue, Nov 23, 2021 at 4:51 PM <lakshmi.sowjanya.d@intel.com> wrote:
>
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Add Device Tree bindings documentation and an entry in MAINTAINERS file
> for Intel Thunder Bay SoC's pin controller.
>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>

This patch must be Cc to devicetree@vger.kernel.org so the DT binding
maintainers can look at it, can you resend it?

Yours,
Linus Walleij
