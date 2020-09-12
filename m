Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0CF267967
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 12:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgILKQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 06:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILKP5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 06:15:57 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0731AC061757
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 03:15:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so14537956ljl.6
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 03:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjpiL8urXAnTFAVO+8GiICWg+iw3QUy3tHni9BkRczo=;
        b=MBHfoAjUqf4woWSnRdAcuxjYv33XADoFtAFkOO3qJ5xVIxmnb1T3Pyg253yCD+NpgP
         mEk2h9Lb2095Wv7HJaicIPbAzNAItE6vaH1XnyvUjjlHBnX7xe0C6FhpExhRZx1+P/nx
         PSjPMLBjorq8ZDEWXmTLzu0ris0OkzZZDeai+bSpvExDrdUPRQ4uEX6CkiwYztB6snOu
         sN1HXRow6j8jDCUIR7b3cuc7jAbpQwibVodevBe12WvrVX4YLRYGUrF7yzsy79DK9j05
         fBgxc+eZmC8OBx7jkPGXWJ7Owibo8+mq4e4+CA5WG7CWMEw8L3Bl2KPOSensBREmew5Y
         eCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjpiL8urXAnTFAVO+8GiICWg+iw3QUy3tHni9BkRczo=;
        b=N1RGBDJjNztUqpbnoqodPhSvnwst0lpAs1cRAX8uDtUG0tcIAleaGdgGFXqx2aezJW
         IqXpuybdd+BBeO5ZlI/0I22okfw+klL7xLMXhx1oJA6imbrjBD3ojjISx6nYY7StEnoZ
         jXlIldRXHNfeULkuAJbVnCeK5390N6m1KZaMqZw6NUePyi4ZtOLTl8/HMQXlI1//09Qz
         lkioh9P3rYlES9oyFrKW5CQcYpgJjbtRr5+4oXY6N5mNCYcKw3nwU72C5cjpziim2qrs
         e78rT1CeeT2GyHRoF8N5mss3Lq28Yn6enlMakLsSIjtQcXgN4xejxPOQ8+6flf85kdxl
         K2CQ==
X-Gm-Message-State: AOAM532vrbBzVhlPHIQa2C2YXcqGYXO1csMNvZR6XRgqSQ4K2ezNZgWL
        IY1nb488qaiicfCnuFocBaSArea/u/UJFTvG1uskrQ==
X-Google-Smtp-Source: ABdhPJwssAD5MX8soX/Gyh8wLeblUTI/YESMVu+/NN0tgiA4ZMs+m5cRPX3MEADA9aOXlOa2ltm+n+lSiAnt6ahfLuk=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr2388725ljg.100.1599905755340;
 Sat, 12 Sep 2020 03:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20200830224311.36994-1-rikard.falkeborn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 12:15:44 +0200
Message-ID: <CACRpkdbwVLNbabGjwdcKvcKrTWup1PQhoHPivQE2S3ZiPfNV2A@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl/actions: Constify static variables
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 31, 2020 at 12:43 AM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:

> Constify a couple of static variables which are not modified to allow
> the compiler to put them in read-only memory. Patch 1/3 is probably
> the most important one since those structs contain function pointer.
> The patches are independent, and can be applied in any order.
> Compile-tested only.
>
> Rikard Falkeborn (3):
>   pinctrl: actions: pinctrl-owl: Constify owl_pinctrl_ops and
>     owl_pinmux_ops
>   pinctrl: actions: pinctrl-s700: Constify s700_padinfo[]
>   pinctrl: actions: pinctrl-s900: Constify s900_padinfo[]

Patch series applied,
thanks!

Yours,
Linus Walleij
