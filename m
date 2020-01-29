Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F6E14C878
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jan 2020 11:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgA2KCp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jan 2020 05:02:45 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35660 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgA2KCp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jan 2020 05:02:45 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so13650432ljb.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jan 2020 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NMxi53oQhLqzBIhRfkCNH6OHdDETWpd2dLEfkOHx2Uc=;
        b=Oi4ghENtW6WcAZoWHyXkSoZL6u7K78YhV9BGUbXfC6h6iBLme0/mQHB5Ff2rNV0E6B
         On7RkAea/ORZqEDHsxpTTRJ4e8w4Dr/ZSGZ7EuaRWqhlipZW+SzN7agWqJvr30hjw0mr
         maGoxAwSH46ouE/d+AHJD5+unObzitFq5uiQ5dTuteai1qfGVsL1Gdvd7/eWX0HdFQfY
         XjtoTXtzE0WnVZ/WjTsHYubHx5SVEI0eHDsG4NvncsMPBujwg7rToS4rRJfF0yOv0Jp/
         YPoUAOBGsgvdON/p45jmIfTn8+EifTTXAmFTcc8LILl5rDhfg9yLO4+GcHBkGZGHHpVp
         wZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMxi53oQhLqzBIhRfkCNH6OHdDETWpd2dLEfkOHx2Uc=;
        b=bfUI1QTKovSIB6DihCzVZOf68suyABe0k4SCnQ5VYTULN84bomQr+2NwH5W/RiVMl0
         vftZE/4okCS04gbpUWK9tUnLMTbzmLT75/GuvRueMXCE7SlAn5n4w/D6GiDg73bnUdoE
         5l9tFfWl8Z7cDpA52m8gWTEveQhOp20+bLVDzWSDXwTuN8dJHncqViQ0YDr8Rd7IH11u
         059zVrpFrtK0+qdw9WzYypM+WkB6vpuP4KaNutrhLYxU9FAuaLbnzDCQ1TxdmLpSsgrN
         P0fjZhD3pebimnJ81GEDBoz/vQgbflptTWI9Aosjv73UvjIoH+2zX4GwqpfiFj0LQEUC
         yhqg==
X-Gm-Message-State: APjAAAW72wNAjH7H2IHiAYodzXxWLusZ4lwOWHE3pyAi9077ea6wimF/
        7gHEI4HXSg6UHPiVhCVq82GPm5dFvBj1XAkmDCcjgA==
X-Google-Smtp-Source: APXvYqwETGQUBQ9evnWRAidnF08QHwkw7wCuB5Ih+rKtEwQzqb/TOP2aY3kVf4fXyMdZkgiY/Zpkwkp5E9sI99kmEjg=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr15670925ljg.168.1580292163302;
 Wed, 29 Jan 2020 02:02:43 -0800 (PST)
MIME-Version: 1.0
References: <1580189061-14091-1-git-send-email-yash.shah@sifive.com> <ecb0e9404a3f6256a7ba1fe48b5a1471@kernel.org>
In-Reply-To: <ecb0e9404a3f6256a7ba1fe48b5a1471@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Jan 2020 11:02:32 +0100
Message-ID: <CACRpkdaQWB6toqVoPZCO=pfnMBFW+hXc027azu92NdOMqR_qNg@mail.gmail.com>
Subject: Re: [PATCH] gpio/sifive: fix static checker warning
To:     Marc Zyngier <maz@kernel.org>
Cc:     Yash Shah <yash.shah@sifive.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Wesley W. Terpstra" <wesley@sifive.com>,
        Atish Patra <atish.patra@wdc.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 28, 2020 at 2:21 PM Marc Zyngier <maz@kernel.org> wrote:

> Linus, do you want me to queue this via the irqchip tree (given that
> it is where the original bug came from)? Or would you rather take it?

I can take it, I just need to get my own changes for GPIO in first
so I'll apply this past v5.6-rc1.

Yours,
Linus Walleij
