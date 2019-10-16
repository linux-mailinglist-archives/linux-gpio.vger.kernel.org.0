Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F50ED8FB4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 13:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfJPLjT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 07:39:19 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38905 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfJPLjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 07:39:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id u28so17187231lfc.5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 04:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U44zrrUEGPIKyeOF3bZO4ezT9IQ+ohS6tJrNxnkfoIw=;
        b=cDtS4Ct8KuWqEQHwFav9PV5/jOHM+PFzylmEbTUwCHv8M5H22ez/ZvgXU/AlP81CIn
         zUg+2LXILvxP4B4af9Kxb2/A2cnMT4tmyYdBWfqseP7P4MYnum45g04lADPpkCG69UnW
         vVA8/Qv0SaxwIKNR7jbBx3KlHfXludJgao831emYBXLIV8pjFPNqAnlJR/ZTIiewQl+Q
         owRk7DdyytF3GocIiBNMbCCbV4/lySf8+Vw2fA9MPyUxsbRyTQu6J/8HzTSPD7gGvkIJ
         RAri2J/k2MjTmbHWeksU8eTZLkYqYQvybVdg29MIySSnluDQq8VkQSOzLvpC47pOQgTM
         cn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U44zrrUEGPIKyeOF3bZO4ezT9IQ+ohS6tJrNxnkfoIw=;
        b=ojknR1XkYsa+wAymbdR2dcZmEW+fVcB3mzd3zIFPzUEtHB9oDy4wvtlSrzS2MOYTpa
         llRn6iYDxBNsFrC02angrmaUTsr88W9/V7tPNe3bTONYajpgzmBXUsdGmdy7Tpqv9m89
         8uJJ08YmJa4IjDtPzykQ/ZA8DHBLdAcCNTkCcpusEpGcdiRvVxh/g7KiXxkYtimZ8m35
         Ry3FnM27BPqGWOniQoe5klvHPEBB0h4rDvdsTe6AXjK6E3JgczzQlJFLh4J/YzIcc/Zy
         IYeYJ/IPbwetdSSCXtSVlbEHfoQumjqhzVt0TPbxZdgv36ehzUfL8mHNDUARWYJEzqpF
         hTUg==
X-Gm-Message-State: APjAAAVBnApVsD2TtNXY+ZxYziu7UAXF80Mf9OBCq15fgTyqDgGAGJa4
        80ygyXsbTSeTx8JD8qJlxKJ+AsOeHtSL+UGuqj7PMQ==
X-Google-Smtp-Source: APXvYqzfCYDzmJNrYkCLjNO3+528qx9sXazaTJ4hMTfKdtkfJD7qb/QPqfw0WxRQrluNmVoZn4BGeuPjiL8sr+GDC28=
X-Received: by 2002:a19:22c4:: with SMTP id i187mr5079447lfi.152.1571225955627;
 Wed, 16 Oct 2019 04:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191009091606.17283-1-amelie.delaunay@st.com>
In-Reply-To: <20191009091606.17283-1-amelie.delaunay@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:39:04 +0200
Message-ID: <CACRpkdYGAAU5nrMgobQNo_CZyAHdee5owGqTPYcy6D8DYt_Xjw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: stmfx: add irq_request/release_resources callbacks
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 9, 2019 at 11:16 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> When an STMFX IO is used as interrupt through the interrupt-controller
> binding, the STMFX driver should configure this IO as input. Default
> value of STMFX IO direction is input, but if the IO is used as output
> before the interrupt use, it will not work without these callbacks.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
> Changes in V2:
> - use gpiochip_reqres_irq and gpiochip_relres_irq instead of calling
> explicitely the lock/unlock.

Patch applied!

Yours,
Linus Walleij
