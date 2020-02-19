Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02FC01649DD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 17:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgBSQSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 11:18:13 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44587 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgBSQSJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 11:18:09 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so945723ljj.11
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 08:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FNIeeJsk5kS+/MNQiQBqWzPS8Hc6Zxgn+ktiCE+t/lw=;
        b=aBSVx+8CRkbeLq8O0iXiBkO3p/l/2sIBUrlpB4EZuNuT794r8Cky2bj3/mLP0o7NIS
         t/GNOUwYKG7SQqJfmMyOIODB4SVZwBWdaW9mb3hZ6Srj/mWOGa/M76b219nt+ofWdnnz
         l8YoS6J9OAzKBUPte8XoLiVAUwfYiH/Ybme6CmKM/fQloZCg1BCBSS1hxbo5vt94wYDF
         wi0lsZTkHc4CxlUSjQEAAHGk4WXxigdfP+E8YPreaG8pIZD1OgoOeZ6z+OFiOUIlR2sq
         aKrNjvjgJmzQgu652ErrkkNmpNN4hy84IYrGAJbCTvvw7HmFg55X4aNgWUq3fQSVFT5l
         NHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FNIeeJsk5kS+/MNQiQBqWzPS8Hc6Zxgn+ktiCE+t/lw=;
        b=VZwNIHk0JsRY0mdP7KUhmjBdfZOooxdscWAnjP9PzySDTh+mPBn/s09ddwByzE0ljS
         DFnFZ++R+cAdBs4txhZuvcc55dkKU6jV3zAy9yufqwj+jhxPo6aybKG7i+l58WSgkZmw
         ZQM4jMJxw+P4l0yWd6khK3I+ZLm7eBKGexkCCz9o9rlP8xhBKSgsQjaSBrEyy6xvkt6J
         94gvVB4H41MLiy+miwMwBi6dowQeSvSu/We2Qq1QC0tBp1BvTaToifrCkxJ4134fqMiT
         bW6zXw7h55RgMuYp2mAk7/xmVE20WBnQ0AFFof4A49lZRdKwhWrTxzxoXaYeMwRWENfP
         hrgQ==
X-Gm-Message-State: APjAAAVCj0dVPQNhexxMeOvvw/2bsgVlM2ba1cHpeXCW2z267JZC3b1j
        j+1xZ62S4ldd1xYrzlmH4gDy9BYwOVy6yYH2gLhYgQ==
X-Google-Smtp-Source: APXvYqz5+N8/IcBMuJha1sjwR5W6tlYYD0yG0sdk9Zg5a202hQT2/SIsxkI/6w5AHuyFS6gous52gqNq9cvuBXJcR+0=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr17031085ljc.39.1582129086032;
 Wed, 19 Feb 2020 08:18:06 -0800 (PST)
MIME-Version: 1.0
References: <20200108104746.1765-1-m.felsch@pengutronix.de>
 <20200108104746.1765-4-m.felsch@pengutronix.de> <AM6PR10MB2263733CA8E02F39A647258D80310@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
 <20200218110712.7wllleu2w5myphyb@pengutronix.de>
In-Reply-To: <20200218110712.7wllleu2w5myphyb@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 Feb 2020 17:17:55 +0100
Message-ID: <CACRpkda94cDdDuuJE+j6-d=TcwyqQV6Ey+26oHM2TT06Rhxj8Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 12:07 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> gentle ping. The mfd-code and the dt-bindings are landed in 5.6-rc1 but
> this patch is missing.

Patch applied for v5.7.

Yours,
Linus Walleij
