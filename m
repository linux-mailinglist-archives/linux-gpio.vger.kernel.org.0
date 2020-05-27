Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17B331E4305
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 15:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387518AbgE0NNY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 09:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730210AbgE0NNX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 09:13:23 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80883C08C5C2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:13:23 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id b27so14208891qka.4
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W8Wp5Vcg8Shxvh02rtp//fSQyOO7mc0Dh1ryTtDSaFY=;
        b=eYHFnwj6M3RYQoPnToNTdlvWzrJHt6QqlRhV6QOEklF/5+0ZPGH1i+KTumI9se/Ix2
         apiYbl7kNvdL0fEO0Zq3pWFqxLiHv0FMBuBQPSFoZYh5uV6Bx3RmVGTJ4obkRF75SA4k
         fgTG4uo5clo7aH2orbEXlocGnNo2Wed8Xdd+lIGwms+6T8tFdES29KKEn6pZQvO5sPYL
         7XJe2MPPEzR+czLk+z7LgAamSzJomKZiSudFBq3GX3wkf3WIy/UK6DnQ/Olb2NCRFjRg
         xeVpocblb+dg+LDjU7TWx9hrZZikipwgAqZ1e/8enLmO7FJIsDeiyC5Hp2Q8ifAedI5x
         KHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W8Wp5Vcg8Shxvh02rtp//fSQyOO7mc0Dh1ryTtDSaFY=;
        b=qnk5IHK71nryWXJWpNfpUZtPugRjIEPU9d9HXFjyc//jl8OghJl0FTQoot5ZRFLfxI
         oAovXdxWlJbT24XqQs2yEbPAwxRtLwIAV1VS6rj4GSxrd4+A8BCvXtf0WTohwht8RpCU
         dIK1SpApE4zPT3Lw+BVpINnCcLTmZio79fQo8EyBD6DShpDz2XpzD/VqC8DC6SQIrA+T
         9vk0emRpX4NvWQTjxAGKBKUVG54n0yvPTbWRWlEgxtRCpu5twuUa9vzPLMKFV563eha/
         ZhhbmxZ3pIk9/JVKuDQRxEYYSJ7+Hjcn+yGMg4m7VhdjxvrQzZD819Fig73cPJCGMLkY
         PWMw==
X-Gm-Message-State: AOAM5304I8SjLuG9kMbb4LkHI1+wUWtfkzl1dUUZK75/zIBY16ly+bbS
        h1zZdFvVLLKlYXWqjXSNIh3cCR1He7EZtcGFL5uc2Be3
X-Google-Smtp-Source: ABdhPJxofls6X6p3Yv3wostc+q2QUxJw61VdkyuBZpGV8cnknebyv28yszuoypfJfYqH3rjbtz6hFW2WYFfbHFCZUck=
X-Received: by 2002:a37:dd6:: with SMTP id 205mr3768475qkn.323.1590585202733;
 Wed, 27 May 2020 06:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200520211916.25727-1-andriy.shevchenko@linux.intel.com>
 <20200520211916.25727-3-andriy.shevchenko@linux.intel.com> <20200525175819.GH1634618@smile.fi.intel.com>
In-Reply-To: <20200525175819.GH1634618@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 May 2020 15:13:11 +0200
Message-ID: <CAMpxmJW71t5Vy6q+wdRO1dkmZbeDKZcP-_9W=CKXX69A866n8g@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] gpio: pca953x: Drop unneeded ACPI_PTR()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 maj 2020 o 19:58 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Thu, May 21, 2020 at 12:19:14AM +0300, Andy Shevchenko wrote:
> > ACPI_PTR() becomes a no-op when !CONFIG_ACPI. This is not needed since
> > we always have ID table enabled. Moreover, in the mentioned case compil=
er
> > will complain about defined but not used variable.
>
> Bart, are you going to apply this one, or should I resend it as a part of=
 v2?
>

Ugh, I already sent my last PRs to Linus both for v5.7 fixes & v5.8
updates. I'll let Linus pick it up once he pulls from my tree.

Bart
