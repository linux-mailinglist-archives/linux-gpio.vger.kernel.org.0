Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82ACC11D10E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbfLLPbv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:31:51 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34639 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729097AbfLLPbv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:31:51 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so2040822lfc.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ECIp9lV6kJ+VM+6W7bBk3Sdy+LzurMj7dRD2Wk/+8N0=;
        b=b/TELp6QCwaXPDO9kaxh1LNS6hl2y/m9h+qIZeOi/JE7x4Ws8x2zw0/PTtRzRfs2yy
         K8UswXohSzdNsWP7mWOSDld6pgtvcOpoY8/jYLYvxxvntzQ4rpmeSlcZV3+H6LlOhS7b
         v6U+gqlikaQqB8bJzmBmsEGMFL4yxu20K9mJNqkvPcQCbOvY1EANEeqtfIIon/R2gaHa
         VlhrDdjqVizCY+mEHoFxzKRcEjd96cmVJ6fuIgKXipL685jRgQjRJaFraVv2haoI/GJE
         qRAmbDDx67PT9FmuNVAi9DK8w7BiOKHsHcXm/HiRsA1mLqb5NNffqvRJk5lDBZIxg9Wv
         Ns2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ECIp9lV6kJ+VM+6W7bBk3Sdy+LzurMj7dRD2Wk/+8N0=;
        b=DyN47+5i84CBDTG2Zs0G80414i/tmmiY/rXFvLPt+r6dRbwxvOph2XvDEAtq7jmOCW
         40H3HKEFKIoDeB54FDUtCZv7BHhw9KbZ9m49KCBNRHxuxNRFUCDHMc9+qaktHnYvqKdO
         VVbvkdI9gWYOagu1UT2KOykhX4GrRQosbh7fIAWwaxUfrFgPo811MMGmox+GtvMOAE2O
         3Rj5hHVY5vvJC8OfdAAW0978Y3tI4GLvtdMtCBOXBhq3EVNEnOL79ZO2PvZ1RFmfNKIp
         2Q0x2gtRtT/zcJ7bTBC5Rai20XphtWqFe2hCNv3dXeytwL/W3ADX2Pa5OTO+IwW6d/ru
         k1Aw==
X-Gm-Message-State: APjAAAUTZC8mx/8rTpxJT7FEYRZQHGOM+BVlDzn7hr55JfXYA+Y0Z4zl
        HbSEPicmVt3FKbHpSOkrcnFbzjZTNTF/RKH4Dd2OGg==
X-Google-Smtp-Source: APXvYqw1PlfuejP1ZPxzLQvWLLSvj4Zx4f38wbFgrFKRxNPyTKCVACivic8/ENzEHqljQsQrx4I1syaFHSBrQG19/gM=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr5854026lfi.93.1576164708519;
 Thu, 12 Dec 2019 07:31:48 -0800 (PST)
MIME-Version: 1.0
References: <1575352925-17271-1-git-send-email-peng.fan@nxp.com> <CACRpkdaTLVNXd+-j_gkOfKnTk02XaZiMA_XxUeM0_4zZ_F-=ug@mail.gmail.com>
In-Reply-To: <CACRpkdaTLVNXd+-j_gkOfKnTk02XaZiMA_XxUeM0_4zZ_F-=ug@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 16:31:37 +0100
Message-ID: <CACRpkdYjCnx46kOuWXMZFme3emm1TugqjQPDctakOppAeCZvZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mvebu: use platform_irq_count
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "rjui@broadcom.com" <rjui@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 12, 2019 at 4:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Dec 3, 2019 at 7:04 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use platform_irq_count to replace of_irq_count
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > V1:
> >  Code inspection, not tested
>
> Patch applied.

Oops dropped again now that I see there are comments on
2/2 that warrants a v2 of this as well.

Yours,
Linus Walleij
