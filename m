Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7558F13C18E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 13:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgAOMrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 07:47:07 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35339 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgAOMrE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 07:47:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so18397208lja.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 04:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKM41qfZK+I1YPOs3sE0ln+ytjb0AeE1CS75B4GClME=;
        b=gNMuhELwoO28aS9RrTIh/9249e1lPntBbdbAhxIt/a5SboIutP1c//C+mVDqR4q3Z6
         /pMkgdWk4sIKijEfs9JvArrTWEUpuvIMBbByausxTy30f0TEnOA3SY2E9UGpF71fPWs0
         vXtSTf9z1wONQDaLg03dtE9BQyn7/rBqnuAUWoy+1YpuFMnKLbokY+nXxC/aexy9WA8/
         HlzSf1FzshN7h3ZBGJctu3Z0b65JD05cTf8n9JlFEdl+Da3o9yKthGB6O/uWsWvpswo6
         EdjeFs8bpAwDrR6d8llwIytZHYhrCokCkbVLuXwYq60OKSkFZFHVIHr3zsX/YF1Lm910
         ZZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKM41qfZK+I1YPOs3sE0ln+ytjb0AeE1CS75B4GClME=;
        b=r9BpbJyC8CRa7JUfUD1DHVyWf/R1m21P1/4PoPXtOJq1OSqCD7m+COElEJVIT6mtDb
         luF4UclnAsVorTONtAXCrSNmVI0IL2ZIVNY7t6KnHXVizhPTAgM3WB/+LlHW4kJDCob0
         9LkixrcfrJjKVOAm3AVeTrRXChtW4wY1tbbb2OxtAcN7kQNq5/IjnhKiFS7tf/vp81AS
         tMM7G36Wi4rwNp7SlhEnfMjHkK1/FN8P1exdJLkiKOfI99bVCtbnlQ7IEEeWk3S6hzh/
         cKVNqqSvjsAncXfxFD0cFmzMK9M+8ygXTGuIztO+kVOJovAuwkdneuwz/JE1X9aam9k9
         ixEA==
X-Gm-Message-State: APjAAAWeqSm6W89QI/pjAMvxcMLyX8S6QnNGr5mv1X8uyijoqwwpaSSg
        bsHQ1AU6Q+s/glRbqLEeXPOf4CVXrYO8Gt9FeKiBLg==
X-Google-Smtp-Source: APXvYqxgC8+7LaK6QdmhvvjkFCM2K1oiJ6yj576t1oav2aAPfmEdhF224oj2nleQBgwhKi4di3PdkxDOsJLznvwlhHY=
X-Received: by 2002:a2e:918c:: with SMTP id f12mr1683852ljg.66.1579092422193;
 Wed, 15 Jan 2020 04:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20200110035524.23511-1-rayagonda.kokatanur@broadcom.com>
In-Reply-To: <20200110035524.23511-1-rayagonda.kokatanur@broadcom.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 13:46:51 +0100
Message-ID: <CACRpkdZhEQ9-d+NSB0++EEbLs3RQxfRHVubuqB-SPv130YW-SQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: iproc: Use platform_get_irq_optional() to
 avoid error message
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Li Jin <li.jin@broadcom.com>,
        YueHaibing <yuehaibing@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 10, 2020 at 4:55 AM Rayagonda Kokatanur
<rayagonda.kokatanur@broadcom.com> wrote:

> Use platform_get_irq_optional() instead of platform_get_irq() to avoid
> below error message during probe:
>
> [ 0.589121] iproc-gpio 66424800.gpio: IRQ index 0 not found
>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Patch applied with Chris' ACK.

Yours,
Linus Walleij
