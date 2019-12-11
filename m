Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC2B311A887
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 11:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfLKKDZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 05:03:25 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34258 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfLKKDZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 05:03:25 -0500
Received: by mail-qt1-f195.google.com with SMTP id 5so5784805qtz.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 02:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9cAOkUmumX1baWPx8mq3cUq6Rwz3U0hfDddkRl9OQAQ=;
        b=aMd/OWlqZFzVIYrC+5D3onezrFpfiY4lwf7ZzCS9YYoEonUgO1FmDUptCXo1djU6bW
         h+QaDHb47NJmtyOD3WXT4eYT/6dSgxYeNQHtHWgTNwBGc93BJslZj5h3bItsM/Sp0elI
         s2kIkrYn6Z3mrggJns1IHJaC0pNM5zoNKf0zLLWf8OVHFADMNfNyRw4oCZFvJZ/eyjZQ
         bSuJHAkRw5ur5UgivinXLJhcnGlp6WfQuaTeZUFVJ0k1JT8bShEN3ZlpuIr87RmikCLQ
         CqS/SyxpwJQEnUaaRRAAt20VRZ+wWw+zHWEy7Lyy6Kot8b2T77DKtGpG3Bvkmknv4nET
         1qxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9cAOkUmumX1baWPx8mq3cUq6Rwz3U0hfDddkRl9OQAQ=;
        b=I49reR1z2s9N/p2qNl2VBJW2+FAMeNvhiRv9EtmNSCoKp6I0GvAb08pGJBdj+2zD9m
         RtcIRcd5mjIJxFNcYABrztcpqQucIFu+QHCRv6eyyyyXk9TCaLxAiYnM2fr/nZMsh9uB
         8nps8XWAJe81K28/xpllVNl1USW4uFHM9zo9pW+Jz+/pfh2UUCw9QF58ENmA8NdOpR3p
         GUmFRz5xDRpl4yqokNNpnboF1GE8w3A3SiIQUCpYEhSZqD6SRQs+YWKshPZ8/CKXIQo3
         f8UGNCvM9iqZ9ch0w3+9/HcQTb1jyqddQ+X95kfOZaNiA5B0PQYwFLJSRHkbgjsIPS7R
         BFQw==
X-Gm-Message-State: APjAAAV2FNoQLLQeTqHeo6CIPFFb/grLdZ5R2zIWupPTIuN49FkNSnJf
        MtjqwYQEB9spQKP3whV8CTjmy7TGPyqEADvAmgt2aQ==
X-Google-Smtp-Source: APXvYqytoucRYG6syAs7nvi4fXL/HwMswDafJP5Ndd2GpOVbJ1lLN+murfZoUtXD9BpSNF0ppyVWKopA4zeVoqnfgJc=
X-Received: by 2002:ac8:5208:: with SMTP id r8mr1934293qtn.131.1576058604073;
 Wed, 11 Dec 2019 02:03:24 -0800 (PST)
MIME-Version: 1.0
References: <1575451330-11112-1-git-send-email-peng.fan@nxp.com>
 <1575451330-11112-2-git-send-email-peng.fan@nxp.com> <20191204100925.sjp6cztozlm5qm6y@pengutronix.de>
 <CAMpxmJWMSnTB6JF8vOCmQzE3swWhbx8uwNEzU=qf49L26QCDPQ@mail.gmail.com> <20191211094954.qk44xv3uh33rgz7z@pengutronix.de>
In-Reply-To: <20191211094954.qk44xv3uh33rgz7z@pengutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 11:03:13 +0100
Message-ID: <CAMpxmJVSe9crFabywAdeEWWRYmCW9cE2tRcKBb7eyfKuPV9RXw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: bcm-kona: use platform_irq_count
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 11 gru 2019 o 10:49 Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
>
> On Wed, Dec 11, 2019 at 10:30:33AM +0100, Bartosz Golaszewski wrote:
> > =C5=9Br., 4 gru 2019 o 11:09 Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> napisa=C5=82(a):
> > >
> > > On Wed, Dec 04, 2019 at 09:24:39AM +0000, Peng Fan wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > platform_irq_count() is the more generic way (independent of
> > > > device trees) to determine the count of available interrupts. So
> > > > use this instead.
> > > >
> > > > As platform_irq_count() might return an error code (which
> > > > of_irq_count doesn't) some additional handling is necessary.
> > > >
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >
> > > > V3:
> > > >  Use %pe
> > >
> > > Great. Note that with %pe there is a dependency on commit 57f5677e535=
b
> > > ("printf: add support for printing symbolic error names") which was
> > > applied during the current merge window.
> > >
> >
> > Why would %pe be better in this case? The function returned an int -
> > why convert it to a pointer?
>
> The conversion to a pointer is (currently still) needed, because there
> is no printk facility (yet) that consumes an int error pointer and
> results in the respecting code.
>
> Somewhere on my todo-list is an item to fix that, but we're not there
> yet and so the best option is to use %pe.
>

Fair enough, I wasn't aware of this new format modifier.

Both applied.

Bartosz
