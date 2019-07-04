Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F229B5F421
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfGDHv1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:51:27 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39532 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfGDHv1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:51:27 -0400
Received: by mail-lf1-f65.google.com with SMTP id v85so633235lfa.6
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5/t1Pq4fjtvcLYHWn2eTNAQKdGpYONm/w4e726AD2o=;
        b=O4uTuQXzTi05PNxuELKoN8YySR4TarAuYoh3/+OLY1ymWIHd9wIJgZJR8VEf6lowkO
         L/5aD5MHgp2wG+gp6YDrssCZ4xN2ZOaTwZ78qc7sf2QpJjNccthaYJcoRaAwt1zB9YuT
         +zGJA0GsjPx4aZ0j3cOV+QPhFcN5QALYqGYNKBUwzfAeH8AU4g2uLMgrU/4k7dYdHe3r
         BweXAmfl2SMTWca9PEIMwb8lEC85ol2LJgJlvIE4dNK+3NE9zCFYwV0ujOHPPbMNXXtr
         KWah7tLoxfyqg/JjfaXPpe2Q4SfLB+xIREOlwI7XQrXKiswAkwiod1IcUfr2IhupXwWT
         HUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5/t1Pq4fjtvcLYHWn2eTNAQKdGpYONm/w4e726AD2o=;
        b=EwXRbqFuWDubeykCNWDxkO9vTI9YfPDfEVK3qxshyveRFk7QynN896urizBmZQeyvX
         Lw8V4s+SwWz0cq9IoYGkr2PDXLPH8eeqa7PzmjUKt0pHas3zTpDMx0y5qMvotaDPIax5
         ShaB12kPNj3fe40wO3ZoNLQrLqzn+iVkFcxXC1UWxaVhvVk0WlnwF7/BgNwP2E31RVUr
         6M/poPXqJTJiTeK3WNBrXR2Uz9YkxnVUXzbIFoXxpgaqPPcGy8kRQkAsNaub83P4s5Kc
         d12c3T1Fru4HgkaQJbnE691e9/d0rr+RrblQZR8cNv5A4E//2+LOB3k1aQww7/ipgEd6
         SKgQ==
X-Gm-Message-State: APjAAAWiJQHq6NU6YGKimxnKfpaNmiWdj0H3PnTFjdfZ1uj5AdWLK+qD
        bMWkfioR2iCISaUxGVZQOZJ05lYbVR/oiJxf17zUTg==
X-Google-Smtp-Source: APXvYqzFGrztm/RyN+7m8AsA/ceF9nr1ovTUdxCL4iznYxNFLiLMi285axCr15fnPVFKd7h+LJ0ZySnkOPz5Q8tx2Io=
X-Received: by 2002:a19:e006:: with SMTP id x6mr332839lfg.165.1562226685373;
 Thu, 04 Jul 2019 00:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com> <20190703003018.75186-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190703003018.75186-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:51:13 +0200
Message-ID: <CACRpkdY8eMnyjQucuPGfbZPznwRdPQbk3VckwNFLFpbidDEuHQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: baytrail: Re-use data structures from pinctrl-intel.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 2:30 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We have some data structures duplicated across the drivers.
> Let's deduplicate them by using ones that being provided by
> pinctrl-intel.h.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
