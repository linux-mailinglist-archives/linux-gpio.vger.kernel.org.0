Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 723C0D9341
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393767AbfJPOB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 10:01:59 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33691 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388087AbfJPOB6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 10:01:58 -0400
Received: by mail-qt1-f193.google.com with SMTP id r5so36281481qtd.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n8D7GWcuR2D5yJzftWOZuP7OGBCEWQ2Nv8330rDKYmg=;
        b=dnhcrGZBhMNzuT4xbNGse9Hi6m6R2P2mJfVUllKARjVw5I1IW3bUBIJF21X9ghv2r/
         l5+mWeKlT4khiAo6ircZ+0ZuvkISZ8dApHcl1Q71Bx+w2BNGt5VmQQjXumuOa4zPGbmI
         wTcWoKyjSg/Sc6nU9+wu1fKFR8lMlNb/E6/rjfVkl2A5qICOPD1DKkWovrK+FfuS9x/L
         J87kjFpH9ZS7cTjHjxUh5sfXeA02Ie2+Z4eqov/c7Mn+uwfqn+H6uGCMrMLaw7fEQJJd
         9e9Rk/jBQmCMkwQsqV0QVgsn01zsABYHdS2AMEVh9jWyvGN2ligVIeAjdOnc05dELJYq
         1QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8D7GWcuR2D5yJzftWOZuP7OGBCEWQ2Nv8330rDKYmg=;
        b=Mn1+yCmlYVEklIsuxabTxnD0yvmMWVj3mbA1ZVOBrWvgRKywO5gpI+wSd/1GPsOhub
         QEj8QNv0NTx3hAGe1EeW9rrYdY3CPoK6X2dj8QRqfTIeEQT1UKj8nniOz9OI3EOYg4r4
         s30d9tk1xbsVU355/bkGAPvPikEJ/pFj4Ht0QShNxFH6qY4ve5IcLZJIoO6B3tPQ0Zpm
         Y5NG74SOeZ6nQ+Z2AoRgzEVxUJ+0dm7K71z/eKc6CiHyOIfnOC3ljxFsxXKIqEbGUblb
         VRtj/4hcn3OEhrqY56rVEixDbYLX+Tpt33ffYf0ZEvr35AyuzNw3j4OX2MU1vOnf80Wm
         LGNw==
X-Gm-Message-State: APjAAAXhXVD6ki2oKIndu6ErS8xAWB9/chHjp+zFiGwhSF5/5qZtnF3s
        vrLPRms24FczfrzDyNypgrHkazIziype1+gBdAh8ag==
X-Google-Smtp-Source: APXvYqwFAoVique9IlI8XVI03OPafdgTa5LZeWmuVfGHhzZH0lbDGYUovz4iroQEJzuT6Oha6I6BaIQz57cvrFNMpAk=
X-Received: by 2002:ac8:2a38:: with SMTP id k53mr13452139qtk.387.1571234517898;
 Wed, 16 Oct 2019 07:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <8ae52263b0625c416461821c457e6789b67170b6.1571228451.git.baolin.wang@linaro.org>
In-Reply-To: <8ae52263b0625c416461821c457e6789b67170b6.1571228451.git.baolin.wang@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 16:01:46 +0200
Message-ID: <CACRpkdb6iGs=+EksqfTxuyiO3PBXpuVMOPhp3fFCJ8tqZ=-8gg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Add CM4 sleep mode support
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, bruce.chen@unisoc.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 2:24 PM Baolin Wang <baolin.wang@linaro.org> wrote:

> From: Bruce Chen <bruce.chen@unisoc.com>
>
> For the new Spreadtrum pin controller, it expands 6bits to describe the
> pin sleep mode with adding one CM4_SLEEP mode, which means the pin sleep
> related configuration will be loaded automatically by hardware when the
> CM4 system goes into deep sleep mode.
>
> Signed-off-by: Bruce Chen <bruce.chen@unisoc.com>
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>

Patch applied.

Yours,
Linus Walleij
