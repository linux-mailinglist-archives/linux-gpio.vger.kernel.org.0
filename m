Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F175652772
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731108AbfFYJEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:04:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36551 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730865AbfFYJEb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:04:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so15455052ljj.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rhBjmgTFiYbfZZESWFQ8f7valPKPixUWhzHoz12+ivw=;
        b=GqEjpL8FHzMdySOuqZoN9HZ/OkZx7WFMmzNdnwrGpQ+jCqyaej++1ThsR1ZV5rjHoB
         ZwcNL59UKwVRJBRlevU81FuITNrJ929IPiuGv3ysff62ONus6boiXH6VfC/JbaiKuEEp
         zGkt42Fm+sEkxLPKPfSvrAJeJC9ft+j1lC8xswbhuCJrpCnqLjdIUMvAyQbGNEVhjEKG
         WOVSloHSmWWSXZlSXL+oZ6HQdczouaj2LcA5iUTWEF0XpHMSiHKOuAxM2U8RLIn0UdXl
         uxQengVbdXro7sXTxTB0+hJ5nrO5LuZuV0RaUXxGvOEMj+vgvWMruSFCcULQ4Zpf8FnF
         i3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rhBjmgTFiYbfZZESWFQ8f7valPKPixUWhzHoz12+ivw=;
        b=iBwA5FV+LhRMM2eVExF4ItMIGmyHeFs0vm5wMwj4XhlEkICw/62PIET647oZme6CGN
         rHcKlkN7KV8FKeukJ8mTEvPhnbVrf6pbB549k4Yc10lrnJj1IWIORb3EfVdG0TIC9l5/
         7s12Le1gTghuYsaVg0yJzInTcAZS2Y4QBNtSxwkOQFiOx5Avb8Cw7W/QhgTNfzYOMDo/
         7mKTy/rCTIGldq6v9z5OS7jAAOKmejmB5rEqPJIFPEkpjyOuL1gIeH4zOBFvhEeclDqD
         FTmUjp3/RVnxlV956NB9QCGdXJECiEtN+50iRAStWfkcC3uPhpI7+bm8HlqM9rQ/olt2
         ytzg==
X-Gm-Message-State: APjAAAWFk3kGYFr89Lfz2O730/HFPjrW/DzYyqXbRH93Le0AdybL+hUB
        hfVlkMJL8sHzvyLTZMnuzEnctMiXEvi49SiISnnSJ28C
X-Google-Smtp-Source: APXvYqye7HuIOF5YxCSm4sBtOJdPFIUuBv2Fl2N7KdeZdnjWH1VOEEmCjLP5M8RahTU5/pd3UgjGIZJRBiP2FVhZEY8=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr43756285ljb.28.1561453469329;
 Tue, 25 Jun 2019 02:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-1-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:04:18 +0200
Message-ID: <CACRpkdbcR5bcBRSx_21nq682Q+N+XgmYHS4wCVQVqdAiym1D+w@mail.gmail.com>
Subject: Re: [PATCH 1/7] drivers: gpio: rcar: pedantic formatting
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> A tab sneaked in, where it shouldn't be.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied.

Yours,
Linus Walleij
