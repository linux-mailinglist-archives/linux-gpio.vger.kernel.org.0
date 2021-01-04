Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A87E2E9804
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 16:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbhADPD4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 10:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbhADPD4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 10:03:56 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B940DC061574
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 07:03:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h22so65071427lfu.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J5beBNHMdA1gHacbQ7KCPabulppTZo/UkkRxhQq//fY=;
        b=jURit9OvneWs286wGYUSCwSZ1SOW+Vz2YfUKezNZ/KZnM4F4Hey7qTMZl+Pj6sDy0W
         MOtVRCWuRQqeS3YExg4Rn6SjbIh172IEEGNzyFw7K8BB0lh4Xf3qsk/fwQ096OKPjAJD
         Hu+Xsb3BslA1XieKFl8l78GSqIaG8Zg5LHvOI+o/bK4HJAV8brnBQN419hQFenE/kZKB
         L1nIZXIZhm/Fm2vxnrGctwsWKJu7Eic3nf72YJ5dqb0fX90oSeKIys/ufXlsy6tEJKt5
         qC1j6VWnGVAcAZDCDUdqa3oMvpkpJlViZTqmPg5l16Q6+W9d5v7iNdfOyuy2QM8TJwUU
         1bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J5beBNHMdA1gHacbQ7KCPabulppTZo/UkkRxhQq//fY=;
        b=cRFbNYZKbnHYjloqPfCvyl3zy+FkdSH+4grCCk34ww5z3mNu6HLErubwNWrLktrtIn
         uYZ+nPU1GhpORJErA/LQ8xDxhw3KCCCIe7+CuICRFN6SRgmAh071STjoOvk2oZnGsuP/
         xwg9hZ7XbCHvhOinqrGVMNyWmx3glkir3HOQ0lpuH1Lgu0x8wAnlZ+6HFZFhxf7P/EIx
         LE7HN3wFrknkTbC5cFyTCMhEArYBK6Y/BReYsZqxlzFCr+dB9peT9+IKRZbYAzFiz5A6
         J0ZePh0+nZgO3CWL28VJR76/cggutuMn9XHWLXLPyuniTgkwFYQY/oT6TK9qj6QbWUOx
         gpMQ==
X-Gm-Message-State: AOAM530IT7YPqnf4qZcLbJOpgosP8cCbuQe0kWnyoekRiqVRGO/wbMkE
        G4o4eDP7OJUy+K6euS9s8RH5F/DuWb6WyKatXToUYg==
X-Google-Smtp-Source: ABdhPJyZSo2vs0ioHFInq7433TP/qFV0Cym97cE+YK8oE3Vt6dU5J9kjlu2ZUe6YMN1vnxvH5jtR/kIkKY9sn+ZeSec=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr34335495ljl.467.1609772593270;
 Mon, 04 Jan 2021 07:03:13 -0800 (PST)
MIME-Version: 1.0
References: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com> <20201217024912.3198-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201217024912.3198-1-billy_tsai@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 16:03:02 +0100
Message-ID: <CACRpkdbLG5Sc8JjonGjDdJraStoz7PfQxBEb5ai_gktV4whzdQ@mail.gmail.com>
Subject: Re: [PATCH v3] driver: aspeed: g6: Fix PWMG0 pinctrl setting
To:     Billy Tsai <billy_tsai@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 17, 2020 at 3:50 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied for fixes.

Yours,
Linus Walleij
