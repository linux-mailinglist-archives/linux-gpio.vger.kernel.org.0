Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27ACF22B054
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 15:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgGWNUW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 09:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbgGWNUV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 09:20:21 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA169C0619DC
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:20:19 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id i19so3241323lfj.8
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h5cjN/ArrOT+SU2XjBSHJvP6yQc3qN6Wi8CCivRg2Z4=;
        b=ZIklItY1VHV8uzX/5DeSAuq8RFRtlThGT+GIFQMHPGcdBHMGU6NvLpEax2cWs8P6ls
         PNjbmKvBUO4f9DSVDXIYuz9fUPijmW/l8daaiqy0sqqzeXranjQZS0Uepn0aioaYYtl5
         ztC35RoYiW6tbudfX1LY9HL2dSZgRMRZ6617IfY2EgkblqbX/aB/ehNeGjVllikGz55T
         30A/IaOdVbjHe3Ym0XlJ8rwfkKq7TLfUFtYeTVYPSUpUbQE41gXKAGGvQKWGAY4CNyCv
         x9GlpcO18u18CCeJZXFuhcEBhLMxokbai8UMlHOBfBHKWA+SBi3lJq6f7yllZVU3ZLV2
         qtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5cjN/ArrOT+SU2XjBSHJvP6yQc3qN6Wi8CCivRg2Z4=;
        b=RKF5QjCcDCUD20tzwSrtGTs10IU2MHMXygHJ45vk77RBJZ11+jYi2kZRO4fcyM83tQ
         VvkImh5Nooevc3aL5CEScMe7bQqhTn/UaFNWUDw5YQ7lOstro2J5RyDALI7geDyhWPcM
         vfwby5BkHjuHUFbD+VZ/udeQRSBayAdacq3nPxVjXm5vVPPreB9DMiF3Fxi/8uWv3YWW
         Cnw7Kf+QrNvM6TQ9yrtdL+kiP8h4K3siLyTFbL0fVLwFsk50evWKeBAqd8cZ8rhGJUc+
         GgLw6uoJSgTbQ+k1/rCvSL9IhlCdnYAEIrzvvc8Un3v3/ExcbkM5nvE7P1mJWz9GVm+/
         e5yw==
X-Gm-Message-State: AOAM530b8mx8R0GXmf2xPR60mxn5qTXLdi0gXp8JTrTtCcpX/ptlHpTI
        F3f6P8TkxYsdy/vr22f79iaj9DcFMRsqda1Z8NqV1cEymzs=
X-Google-Smtp-Source: ABdhPJyysHHdEAzrPwZMCPgLooL3Yy70BEt6ZdCnNnKy/t8d+QmtYn+XgGpvNWNaIM+UCe+nOjubYDkX69B0/wcC65c=
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr2241086lfi.21.1595510418410;
 Thu, 23 Jul 2020 06:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200615124456.27328-1-alexandre.torgue@st.com>
In-Reply-To: <20200615124456.27328-1-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 15:20:07 +0200
Message-ID: <CACRpkdbWUop6hyKM80zxaz85oQ8BfDLCtxBTzjOypnDpUm-a4Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: use the hwspin_lock_timeout_in_atomic() API
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 2:44 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> From: Fabien Dessenne <fabien.dessenne@st.com>
>
> Use the hwspin_lock_timeout_in_atomic() API which is the most appropriated
> here. Indeed:
> - hwspin_lock_() is called after spin_lock_irqsave()
> - the hwspin_lock_timeout() API relies on jiffies count which won't work
>   if IRQs are disabled which is the case here.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied, sorry for missing this one.

Yours,
Linus Walleij
