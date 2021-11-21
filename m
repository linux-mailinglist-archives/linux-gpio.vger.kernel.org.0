Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D528145873D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 00:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhKUX4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 18:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhKUX4d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 18:56:33 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0701C061714
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:53:27 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so26196724otk.13
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9W5p5whI+4F47zRQnYifWlZJ6t8BWUsimLLZTEAtvPQ=;
        b=lRikxVHQ88YEq8tuytQtGEQs05tnJVDB5dLU5JhLaNAi/aansTa1hZNmO8dikHspd5
         bzuk3mcmRmOhaQ5/liTLA8AGizNaOKC5kGYw9eCVLzInwKEWraYE1DyUp849Op2sa45w
         awlFi9zpxqH5DUzerjZ1/gupff81F+r9IbpVlqNOGEoj+jMk7XlUq0qDQlGrzvCHfnzd
         2F9lidZnvBudxRQzQn4Qu7wyaTTy4UNFb5Wd3OAu/goMqC8g8TM9/k51GJScqp9FVDfx
         gU7u+fT/bLUDOfo/YQ445hDJIEOgDvfHOaKAEo+qL8rwL0kex/QGu0M/fIHAmirF6S0L
         wK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9W5p5whI+4F47zRQnYifWlZJ6t8BWUsimLLZTEAtvPQ=;
        b=GFoVEp5jif7XL/uAaA3zDtCzK4L6ZcuICN+5kHqBOq2AxOmD9X9S5+SJjkMdlnJkPD
         IK1aDMhvNTXS1mA15TBbC7LNO1JTT03zw9MQ8QU5NyuD9by/28rlpWiO2qgOl1ozrPAx
         IUI80UnTX95ZPUsbOmx1w0JEemy+a2m8NDpyAMD3VBNea5KDfokOiGXkUM0TzNNrGe8y
         3I4hUshEFoG6cv45FTUQmXlD4N+uA/TZR975n3oyRKSh3CsYbf0+eGZlpymTNfGupRch
         NUDBmsVdJpRAvUFf8wIxP165QLI4H3FJ3mwYQTnV0hZYJuZ1pgxkiS2gWkU0CMth9Wgr
         2xOA==
X-Gm-Message-State: AOAM530ZfeoAhhqkFCN7/avuvJ3M6injN70DdMkfMlhKK500AHO5PuJY
        TQeLowOA71GK4zZ5XccwCoC6fwM74063iOtXHhS0pQ==
X-Google-Smtp-Source: ABdhPJykKhLtTLKNimMjTZRcY38XOoC/BlDR/rJ2BTxQTORvnZe8Q7rHMq9A7oVL57trNbpFc7GGxbcL8TbxAm0XDfw=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21551880otg.179.1637538807056;
 Sun, 21 Nov 2021 15:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20211118132152.15722-1-zajec5@gmail.com> <20211118132152.15722-4-zajec5@gmail.com>
 <CAHp75VebQKsSJYxK9Fi0wEhGfpR=1HZfDsVuqV8BCG-UrZDtVg@mail.gmail.com>
In-Reply-To: <CAHp75VebQKsSJYxK9Fi0wEhGfpR=1HZfDsVuqV8BCG-UrZDtVg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:53:15 +0100
Message-ID: <CACRpkdbQ8fEfWqkb+R0xDPAdeenWQKmXqtO49Hfh7V84Zqospg@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: add helpers reading pins, groups & functions
 from DT
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 2:58 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Nov 18, 2021 at 3:22 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:

> > +#include <linux/of.h>
>
> I don't like this. This shows not thought through the design of the serie=
s.
>
> What I rather expect is a proper interfacing layer that you fill with
> options that can be provided by corresponding underlying
> implementation, e.g. DT.

I agree, the DT parts should land in pinctrl/devicetree.c in the
end with an opt-in for ACPI & board files. I don't know if we
can use software nodes fully instead of board file-specific
helpers at this point, it seems to have
grown pretty competent.

Yours,
Linus Walleij
