Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2169935930B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 05:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhDIDgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 23:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbhDIDgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 23:36:00 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 061EAC061760;
        Thu,  8 Apr 2021 20:35:48 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id i9so4603058qka.2;
        Thu, 08 Apr 2021 20:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VW/C+2LLet/ldR+i+V3eCTvpTJBdjFtGmR5udw1qeLQ=;
        b=kf/yhUgzKhxJK2p+6wg/izoDDT8TFZB4rkZhdAkJoNXFkTR7yODnvd33p9egVGYtph
         gbjuS+5GR0hjMGkDh2zU1fwjhgdqLPt/a/aFHME6YguBsLD7EVdtdN+p5QMtBp8FPzS0
         KrAOJQ7t3AKlSkWQfGGwRPGIXSlG6ftCpd/p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VW/C+2LLet/ldR+i+V3eCTvpTJBdjFtGmR5udw1qeLQ=;
        b=Ul9Ncs0V+01fJgvRNVAcARlWEe1mqtl4v4kG0QQPstncixw2rZJvRffDgFgPDJdyKP
         C/jP7TfYKGr6DVNpkQBi7vYaCJrn4qcmgplshbVkjI8fxjPxnJ6s3fzUtjrBG4j5UaK6
         O62fO0fsweF3q+Jn8NvV5Mmwce7ASlg00PAn1WXJzjFsfsE/9j1waMLkedx48vhw2fxK
         vJ35aC7uDeKnMpiG/SEO3duvAMjDRijzeI1K4LlnvEIfDorcNLL1tjTBO7kg5QYSYfvx
         1vnIjxa6JBqd03VsND0FxrwUK2fKcWBYb9UA5QzRO/G6ur0Qxb4dxA+XGMBipcwQh9P/
         J2eQ==
X-Gm-Message-State: AOAM53367fuPZrQgDA5svigGiUZfQkpzV2goEbj6iQWvfqTH8AMriSbP
        v/KNXFh5u9qQXl1UkfEsW5FAm+3/AdvQjFz3ZrppOEm1hVA=
X-Google-Smtp-Source: ABdhPJxle9zTiCZMcHgQmCbwnJmAkb+TEoOlJ7KMtbFw35LN/7onMEAKpvQn37Vrs7E0ALx7tpeNrdmUUNmbjGlTwlo=
X-Received: by 2002:a05:620a:28c9:: with SMTP id l9mr11766768qkp.55.1617939347264;
 Thu, 08 Apr 2021 20:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au> <20210319062752.145730-3-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-3-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 9 Apr 2021 03:35:34 +0000
Message-ID: <CACPK8XfkvBA+9_WFb96oEa4F1vDPd90hG+M2Y-Ek=Xt5FUFqmQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Corey Minyard <minyard@acm.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>,
        Haiyue Wang <haiyue.wang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
