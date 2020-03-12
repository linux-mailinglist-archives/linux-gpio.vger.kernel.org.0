Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD72182B1B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 09:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCLIXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 04:23:02 -0400
Received: from mail-qv1-f65.google.com ([209.85.219.65]:44359 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgCLIXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 04:23:01 -0400
Received: by mail-qv1-f65.google.com with SMTP id w5so2161207qvp.11
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P9izz9GwKEkmwA2CN2dI9HFL+pLvd99ZgSLtApoaeDU=;
        b=XdThVGVLJ8fCTlPp04bt767nww/R0JNiDAgMPRu09nMpRox4DHlFpxcQWyDiIzhi4l
         zPVbbL4xp6o5xCpctS7Jp/3wRpRJ0j2+c141ucsFPPZ3W/hCO0WyUNj59CUWyKWUbpCr
         ceV9QtJMukXVzTgsXjnC0BIyprWSiwrhx5yp6mZbqXTFDAYTZ43cmbHSTcodDP8d1Y/K
         u1Kv5F3EC1oaAjdZLlagq368xSL7t3dTHl7DcezV1iAJSdaZ4v0Epmd4C570b1Ec2YZi
         /Db/T+9bJl2eydi+gBR8XLQvTZ7bd020wd8IQb/8d11ruupX0FCBQYpAd3ggUotu2DJd
         W7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P9izz9GwKEkmwA2CN2dI9HFL+pLvd99ZgSLtApoaeDU=;
        b=HjweVts7rJCD6jJrsKeL4jiAef4H4CoKIKsC/G1Y1xoSOp7Ut29w+6CSKtGPxeCwm/
         AV/6J8o+JYPO6TalPYv5Pgb4hzueSFklQmmRwfotpCzAc1B9ppGo2n4zCKai+8WGLPtB
         vzUYAmxIKnQqloFytjTLPm636Or0sgDMRx9ZzHRgghjeYFy1qru+OXMcWKsPzP0QJUQY
         HDiXN8UhTO8iHPmfxl7wLhuodP/VWLd3IKJiWlNh7EGXfhTlragFbHGH9raJbTrDIAMO
         BigmhprbQpKOqZQTRDUSOZiD6+vYSF6KBSnBNcJvNyAA2OI1/e7XGHM+ZSO8nUTxKtny
         Tb0g==
X-Gm-Message-State: ANhLgQ09E4Zpil75kLRaNPAamfRxp+BNYBmQzJ5Jis10DEYzyH+b5vfa
        xqtnTLxAYNeGjugPXSnKFopZfoLmh11qeurKnd0SJw==
X-Google-Smtp-Source: ADFU+vsJMDMQ1KzRZrYFym7/k0h4j5yi56oLBBmOZI8IRsJ++T2KNTs2w7I/VIUzjgv1K8oDQuyP8jHKibG5FlX1gps=
X-Received: by 2002:ad4:5429:: with SMTP id g9mr6058767qvt.134.1584001379162;
 Thu, 12 Mar 2020 01:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <1583780521-45702-1-git-send-email-opendmb@gmail.com>
 <CAMpxmJXNQQTxRWZSP0RZTUuefAk3+AeDMVeVkgERy7f9X=CBsA@mail.gmail.com> <7fcc5cb2-5fdb-d1cf-e55b-c0f2d407e072@gmail.com>
In-Reply-To: <7fcc5cb2-5fdb-d1cf-e55b-c0f2d407e072@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Mar 2020 09:22:47 +0100
Message-ID: <CAMpxmJX40tfNUqrqDwa+GEGAD9QuLym=jLi2MPuQX-FZS2Z9sQ@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: brcmstb: support gpio-line-names property
To:     Doug Berger <opendmb@gmail.com>
Cc:     Gregory Fong <gregory.0xf0@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 11 mar 2020 o 20:03 Doug Berger <opendmb@gmail.com> napisa=C5=82(=
a):
>
> The label names are viewed as a convenience for the user and are not
> necessary for the proper functionality of the driver and device, so we
> don't want to prevent the driver from succeeding at probe due to an
> error in the gpio-line-names property. The bank->gc.names member is
> still made non-NULL which is what we really care about to prevent the
> misapplication of label names by devprop_gpiochip_set_names().
>
> In fact, it is expected that the device-tree will only include label
> strings up to the last GPIO of interest so the ENODATA error is
> considered a valid result to terminate any further labeling so there is
> no need for an error message in that case.
>
> Other error results are unexpected so an error message indicating the
> consequence of the error is appropriate here.
>
> I'm not sure which aspect is confusing to you, so it's not clear to me
> how best to comment the code. I can hazard a guess, but if you have a
> suggestion I'm happy to submit a v3.
>
> Thanks for taking the time to review this,
>     Doug

No it's fine, thank you for the explanation.

Bartosz
