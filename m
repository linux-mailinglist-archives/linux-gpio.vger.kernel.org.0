Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCCEEF28C2
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 09:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfKGIKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 03:10:17 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44853 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfKGIKR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 03:10:17 -0500
Received: by mail-lj1-f195.google.com with SMTP id g3so1166719ljl.11
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 00:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WE8xCDiVryFP2SyMGkCl6+wfib+yeH0xJXm+EjvJ0MI=;
        b=Mqitt8uWZM/359dhlujYiyEEwVm8doNOiA0X+Te1heF05QPc4Mc93d3qZiusBLlLVE
         G5ZNuDOgvHrvWBqO9j+l5EMJZBw/LEPOjIJSNJ/AnQzUz4PfyGIa/9/4LY4zfOEgX7dO
         Afrk2Uysxf/AsZ4bKNc1iBM6scRNUiHwwgCmfLBt9iWsqrUCDP5x2ejh+CiBjFxZqc/3
         GkckIfClcksxvgTqgYVtJeN+ETIyBA/Lu565bN8bmcQXeFhhWv0A0A19vDOK6b0y/3xa
         /nAUBXd/Dxpm9XIVHgobEq3a5wGNu8C84h1NFYzg0UL6nreCfy9kCXi7O8vY03Z+H9MO
         d+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WE8xCDiVryFP2SyMGkCl6+wfib+yeH0xJXm+EjvJ0MI=;
        b=d6P7R8TJ8dDHcQ5EjrQ+n9Aebusy47vV7exjipJieIIUEP7j/txPtJ0rri++aXp9FH
         qO5bZhk8FnHq2mlVE+FUUA7HRD9wHu4W/9dNl7qz95k5XrV5+Aiwvbw+Q2uN2yOmT2cU
         9AAAdU0gX+B7SCQ90v8VdPfeq84YwYP7U8OIyFRbC/qfrJhJ3bZU1nWGWfDQef+bZFeH
         zhuavvGro9/t3ge3n1mMojpBCG5LGTcFMfzmG43rfkE3EWQZe3sv2Eu7+iS5InqMoJI6
         2/TxyyNHZm83O4DYM6FS+ZH/elyP59AwYFJdPY3BNq6FKbLMWcQudP0RYtX6d+Nzo4Gp
         J3aQ==
X-Gm-Message-State: APjAAAX3VbvrvvQcimq6KfuLnVs6sn/47rutzaIt1sQ5fj46EOQGnSQd
        uPW+x3byODN0wdleQnMThaNMjrXnR/Di3sVFu3z1UsXdm4w=
X-Google-Smtp-Source: APXvYqzH8TdwnDpIpOs/u9nJzcVupEDZhGjPa6iVHOrzpJYhNYHzKeAWXkLFpB8YOcP9YFmIzEfUsILmFPd0/cRMCVw=
X-Received: by 2002:a2e:9784:: with SMTP id y4mr1343857lji.77.1573114214165;
 Thu, 07 Nov 2019 00:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20191105020429.18942-1-warthog618@gmail.com> <CAMpxmJW0ZDUAn3WMTYaRrZZj71f6NV+-nxsZ=JS3rF_8bkXTuQ@mail.gmail.com>
In-Reply-To: <CAMpxmJW0ZDUAn3WMTYaRrZZj71f6NV+-nxsZ=JS3rF_8bkXTuQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Nov 2019 09:10:02 +0100
Message-ID: <CACRpkdY8sz2+pM6DrUdWVD5W7UpsxQ8yHfeZFWwfjTTFbyhiyA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 5, 2019 at 4:05 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Ok, all looks good now and since Linus already said he's fine with
> this series, I'll take it through my tree for v5.5.

OK good we get it to -next through your tree and I await a
pull request from you for these.

Very nice work from everyone involved here!

Yours,
Linus Walleij
