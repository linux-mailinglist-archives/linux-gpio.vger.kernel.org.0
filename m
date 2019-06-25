Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B07550BE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfFYNvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:51:04 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37704 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfFYNvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:51:04 -0400
Received: by mail-lf1-f66.google.com with SMTP id d11so12707267lfb.4
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NFgue3oKymAnPLqWEpKiFYxZqxdbMA1mAsgv3rYLpoE=;
        b=PdLfNuRX8o0MT8u/xnGoKn1MWuT+NeXfGGOEg8LQPuO8qtlaH+6/U/Se7HOmQPGW/t
         nhuOnnNj/Ur1cPp9pkrCWbCm946AeCXnyEcwO8F6uGppaYNGrImtYwVg4eqyZuYx4nw4
         VzpiyXCGGe1cmSCebquOcabusXBnFKLKt/BvnEHk5Iq9Ksp049DCVXNqpV90gE4KpAF6
         jIdbmoHFwr2O+yKyF5xOQ6KSyCo6vEP2VXoqEQKBLLqYGiyMWASrpQRYV9T68FD2svRX
         SLceTYFCOde44PwxP8DvJvoE815KPjsYOzE1qmOXi23IUTqltqJQloZd9osx4M9Eh944
         IQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFgue3oKymAnPLqWEpKiFYxZqxdbMA1mAsgv3rYLpoE=;
        b=RVQREmK23YZXLkOTh8wTt5Lu9KUEew1N3QQWTk0jiBAKPs2xju3ySDzWTghkSlBuyf
         7ORejt6D2bnHpIYq82szDYvdcFn20I/p1voZS1L1m1D2Jw2r7oH9xZ3n7VemG5vrbDj+
         0t+iO6DfsganjW9Q6ME3Na9Sn8HVvqUrt9M4jBhcD35tW9NdtN0nFCKHF1xN+lA7iqzQ
         8N00VxPg7zhx8i21dqHFZutWDfC7BfJIF1Dtz+nYi3Iam9/5wbWD/LJRtVxR/SxVGn/l
         GY784h8MJRS+c35EMwQVEs9UrcRGEcgbQVSCl5Eao2VQoE1JnkxLXyIH/xspGwqpbIiq
         7KXg==
X-Gm-Message-State: APjAAAX+Mwng1qRvc+YGe7RGRydGJVamZ2axV4sKpb63pcH4Pou5mNOI
        k6ayrzmUbknaxdJk2K6R51MDSUpO4lz84uGgIAXWQA==
X-Google-Smtp-Source: APXvYqweuybTOeTfqTGsuOJxjLKJ6DVhGG8Um8M//OczH8cF/Z2EL92nk9R9z1tbGk4bZ7C0ouYVRfKXJe75pfgJjXU=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr25254433lfm.61.1561470662286;
 Tue, 25 Jun 2019 06:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-2-drinkcat@chromium.org>
In-Reply-To: <20190429035515.73611-2-drinkcat@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:50:50 +0200
Message-ID: <CACRpkdZd+0_7xqaa05mqNzNxDC1kKmEv9LLRoSVYqTmO=+3iGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Ignore interrupts that are wake
 only during resume
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 29, 2019 at 5:55 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Before suspending, mtk-eint would set the interrupt mask to the
> one in wake_mask. However, some of these interrupts may not have a
> corresponding interrupt handler, or the interrupt may be disabled.
>
> On resume, the eint irq handler would trigger nevertheless,
> and irq/pm.c:irq_pm_check_wakeup would be called, which would
> try to call irq_disable. However, if the interrupt is not enabled
> (irqd_irq_disabled(&desc->irq_data) is true), the call does nothing,
> and the interrupt is left enabled in the eint driver.
>
> Especially for level-sensitive interrupts, this will lead to an
> interrupt storm on resume.
>
> If we detect that an interrupt is only in wake_mask, but not in
> cur_mask, we can just mask it out immediately (as mtk_eint_resume
> would do anyway at a later stage in the resume sequence, when
> restoring cur_mask).
>
> Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Patch applied for fixes.
Hm a late ACK made me miss this, sorry.

Yours,
Linus Walleij
