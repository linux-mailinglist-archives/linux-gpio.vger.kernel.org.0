Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38EF647A37F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 03:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbhLTCP1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Dec 2021 21:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbhLTCP0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Dec 2021 21:15:26 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD6AC06173E
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 18:15:26 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso10751196otj.11
        for <linux-gpio@vger.kernel.org>; Sun, 19 Dec 2021 18:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5h2KtcdPv4y3SmM2InmueE/jIOkvBdjenQb53tW6148=;
        b=cBz4mUamnc7CUE7Ih+IjPPfzhfBNJT3KyyvkV3qZpgW6EuQhCh/mJ7JI0tGzfWkPBQ
         cawyvcHPm6Byz3w2Po4WAg13M2r8VqieV/yN+xTmIcs7HhmkWvWLNDqi/6RFDfYhNX5p
         EbuxC514XghPW4Zo1HzZK/Q9O8H+oXXgXySOH4qnwe78n7GCvJ8MqvpP64xDf1hJVhd4
         t4YWCQ30Te2/v3pHOIyUOv4AX1dHxZZdWmPPUgFspQy/GLmLBv1dEk81D4vd9K7UamXW
         Uex1RIBASXN8I/HaNiArw6ZCHZQqL8oqb9Qg4sxUJnBfIRGfjBGl3m3Et0IS/4XlCnZf
         Vekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5h2KtcdPv4y3SmM2InmueE/jIOkvBdjenQb53tW6148=;
        b=3p56gv0u8a96i5YDZacNibfUJ/c79m0WmNoFHhgI237P/q68s7l5GZQJx2aE3xlHTg
         w3Iei3i282/sJeQhiYDYPcpP6WFdLtAGHdS9q2rOZlXGrxBgiez6M71QMv76By6BGyLl
         J8Gbfdcu0gI4tdZ4ljbkk1FFHrQTRF3Gz+oDQ4kiruwmbCUe0BKZaNI9fKiTGyqZuXuE
         3WPxcuVOgkgi9W5a56Gr5xT0I/G8LfjgKq9IaOYzRGolDsoZlk1d8jrMOsJhNuZKr77d
         D1pVkX/r2H1tsZV6OAVwULsgKxKw4aAcN1FPR/loIydh3mcRK9bx/h4tYHrKxe1kRXI/
         XD3g==
X-Gm-Message-State: AOAM531K2CQHBVfHq0owab2+X0oMBIKRofYInqf29pIy358j5ImkznZs
        HryB0VzNUAnFY50Yv0mWCBjxRs3EA1PEry9HF8ghCqaj2TI=
X-Google-Smtp-Source: ABdhPJxVAFt48JolAeGMsaufCVGExDvCPz3S/Yp8XmDDk3CKAwtkfbSRI4yVpcEjwc04TzWmalvEs7oFGVMBIadtX8c=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr9557267otl.237.1639966525423;
 Sun, 19 Dec 2021 18:15:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639736856.git.geert+renesas@glider.be>
In-Reply-To: <cover.1639736856.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Dec 2021 03:15:13 +0100
Message-ID: <CACRpkdYVuyBMvo4MnKzwfzv88-d1mu+jW_XZ9jRChSm21=ff0w@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v5.17 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 12:07 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 7c50a407b8687ae3589c740d2347d9ae73887889:
>
>   pinctrl: renesas: Remove unneeded locking around sh_pfc_read() calls (2021-11-19 10:55:21 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.17-tag2
>
> for you to fetch changes up to ea7e26ebe6a90fe7962823a70ac91f010df71239:
>
>   pinctrl: renesas: r8a779a0: Align comments (2021-12-07 16:58:02 +0100)

Pulled in!

Yours,
Linus Walleij
