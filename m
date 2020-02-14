Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5721D15D5ED
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 11:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387427AbgBNKlh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 05:41:37 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40749 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387409AbgBNKlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:41:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id n18so10177639ljo.7
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I84A/i8tcPKxxOGbCK9A8uezoeqh4sVjuwMk9nGOQlQ=;
        b=ZI+0qXsAcGpAsFA7BAHC/r2eJz4nN4Nx9/qkAEpIDDoDDtOyybIt7BDzE47CID6Zb8
         KXMmlcs3o1Q8M593QyBQoHhzPwoHNJQ4zGVhk7KfRX9tHIalJEZU0yATHyk4H/6agSXL
         gAMP09pjFClhtjllFq78QJmvRKdUfZKjsL1rCKvnAleNtFLlFGT2Cxjz1mlJCSsta0b3
         KKKJn1DNPsLayW72dHiVAOekjpBBMiBKWClSc+KnprNG9aog6lHLlzp6poDAdhIOlyGk
         baBAuwWPvaTk8SFcwHvkkyo0+c+PEW9bquP2Fw+2ouoNeThdQv+XG4j0dW03YIobBLEc
         Tq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I84A/i8tcPKxxOGbCK9A8uezoeqh4sVjuwMk9nGOQlQ=;
        b=QwRF2hFdqjEk+DoKSl4k8O4Vl6cjhEWU1gjBViYupqjwIqeMzydwsvNmr5bmW2RgWX
         SSAv6nYKqd6Ufvk3MdGjYjuaiIjcHEp4ovGPHReuo8H3znurONh+3j3hqZq8GvWyRsOT
         SzsrGGQI1lB4VGJB9jA0MrBcc6PruCc9DA9Exgefw1ArTqKOF4yoOgmufAmeLc3pDAoz
         PPFTdSm42yzyY+w1n5U9d9cG1sUp2nHrjxIQI9Tata/OgIlBhy8/4aLkLtUxCqQSlm09
         9sgjweZxXFkhGoh4WyClikZD1mYpCnXguDMz0CgQQoHRGhDDsdspBjTblPpC0LkTkPMm
         QWnw==
X-Gm-Message-State: APjAAAVBQqyPBDqUh9WkKRhQWNnyEE/21E9abRWV2dCqKfEenJqtnHNn
        ZnlFKdygS8KjdTWJF5GmfAXII7F0ceW4HvIONPi/eQ==
X-Google-Smtp-Source: APXvYqz8IjNrCqOb2DDhLjIqc5YDiIKJ0wbJLELLFODbj8iR64pcK9T84Q6voECeqUp1U7eWp+sJ9v+o6dnCBu0XMxQ=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr1685747ljg.168.1581676895494;
 Fri, 14 Feb 2020 02:41:35 -0800 (PST)
MIME-Version: 1.0
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:41:24 +0100
Message-ID: <CACRpkdYzf0FjBS+GbErPK48QMg92aGX58szQB+4WHqCYk5Gv5Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/6] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 22, 2020 at 7:53 AM <light.hsieh@mediatek.com> wrote:

> From: Light Hsieh <light.hsieh@mediatek.com>
>
> 1. Check if gpio pin number is in valid range to prevent from get invalid
>    pointer 'desc' in the following code:
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>
> 2. Improve  mtk_hw_pin_field_lookup()
> 2.1 Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
>      search.
> 2.2 Correct message after the following check fail:
>     if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
>                 rc = &hw->soc->reg_cal[field];
>     The original message is:
>         "Not support field %d for pin %d (%s)\n"
>     However, the check is on soc chip level, not on pin level yet.
>     So the message is corrected as:
>         "Not support field %d for this soc\n"
>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>

I managed to apply all 6 patches now for v5.7.

I had a big problem extracting the patches since they get base64
encoded and for some reason git am cannot deal with this. I thought
it would but it doesn't possibly because of custom headers in the
message.

I have to save out the base64 part of the message, decode separately,
then paste back the result removing the transfer-encoding line
of the original message.

cat mtk65.txt | base64 -d -i > scratch.patch

Any tips on how to handle this more efficiently?

Yours,
Linus Walleij
