Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E64F3E8A84
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 15:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389287AbfJ2OPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 10:15:44 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38231 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389279AbfJ2OPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 10:15:43 -0400
Received: by mail-vs1-f68.google.com with SMTP id b123so8825205vsb.5
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 07:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2CJkMB8W25QC+LmwHZCR/dC2OeYvdCpp2yKraECtwkc=;
        b=erCRbeIBHUu53eIreClKHV+uY6SMssROpbDKJZMSC3l+mDep04YpyeFnPKet5PX5N1
         K6d9GL7q+TBbHhpf38xASFO/TXfXIgOnQd+2jwtbABwkUzNKRv4crlJCQ5sm33YkfEj4
         u0npQzAAraEWJu+naiJKHKuW/DZPeUOAf7F1bBLeNGslfkb7ZIPfYWSV9H/PfDxih3hV
         coNmtYtFiskJu7ap8vyMmzTx37J9AxaFbD9LknHJc/hx3PVruIT1Bbo9+aHjnSy/QjoV
         6LB1xAnri/kSOeQaJ0PsMW1btfvx/BA9yOxpu4tBlBCWlPodHSRXiAFe8R7+Kv+9rPOU
         vfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2CJkMB8W25QC+LmwHZCR/dC2OeYvdCpp2yKraECtwkc=;
        b=TibGAVWR6puw641wxnHOuyyKI1iLTigf7Ds+8HzIbPsQzd7tWbJwPjT09rbnl+B0T5
         key5yRNmaDrYRIvNnx49nJi4k0v0ZtLBj7IDUEfiNc7fx6FJmhfB2TvfBnsQgqS63Md6
         MfbRWUrhV0fUww+az7m9NaBxLrUzE4XX95JJ+A0bRkbUFpzx/cZHvE/y8B26ALb8bQYI
         X5DbxzWoVI5vbxGtpyivurVhrdTniVFyDOlQPOtqne12KDJ0r6o9ScU63UvAqT/8QF2q
         3x37G3QVkHGL9pquWoueaExIjv9uOddHOWG7v7/BdG5vpuHVj0+yHRYIosucifJ91BeV
         DUlg==
X-Gm-Message-State: APjAAAX1xOpiDS50EG/H5jcfrgWrOIraovmq+38gKR7r5AzjXXCcQOeZ
        Hli44jrbW1+jxvcLCtMe7P0C0FKHELyh1j21/1TOZg==
X-Google-Smtp-Source: APXvYqzrRPTOdVe3rVj/q8mFjvCWiOOTxiTZFSQn4yLUcuktimo2dgWY3hYMbxvwByEex6FdTHrCbR8bcgRkCp0CTm8=
X-Received: by 2002:a67:fb5a:: with SMTP id e26mr1980049vsr.200.1572358542448;
 Tue, 29 Oct 2019 07:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org> <20191021064413.19840-5-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191021064413.19840-5-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Oct 2019 15:15:31 +0100
Message-ID: <CACRpkdaZFr+DAthpoEeJgMeqhQfMbDNcd9dVQOEhqfqP6MmP=Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add entry for RDA Micro GPIO driver
 and binding
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 8:44 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add MAINTAINERS entry for RDA Micro GPIO driver and devicetree binding.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied!

Yours,
Linus Walleij
