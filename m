Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE976781F1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfG1WJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:09:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38912 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfG1WJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:09:33 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so56573335ljh.6
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FX1hpidhvVd2B1jpZNjhTE/QLOo8ZOGtRfMqnoho3GM=;
        b=WSHsBcXZ7JERbbGCMkWI5YCfQg8C14MBHZJm3Hue5oF7J5DyqJl6tQpVbngQ8q52c8
         2ScdHTPvRGepFlQLYPWxw2+AXctL99KLBkHSFQ8O4PukhjvxlRN35e1Mbo2a9eAsRy1L
         kJeMT5pviW3zV/uCvwdcsc4DwJCul8jcDjVvLZOXt+LUuxErTKp4EjWHWw8RditvsrEk
         Ql1emScyRfzwoGqoycMYh2gQ9ULJv2iQuCMF5g1ImxA1dcbqvRfi1uanPOPq3N2SLAHn
         ak5s40rLE1mfZYkTU+iKfp8r8S/5/BMctQsqsZ8htKP912yknb+5p451H5XxfSf1/42x
         1cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FX1hpidhvVd2B1jpZNjhTE/QLOo8ZOGtRfMqnoho3GM=;
        b=OV0ul3aEOUuJKBdM5XmyjarevgE9vN06tWI0rGHFHNJDsQG9/6nq3RV/4UeobxHJqX
         uu//wQ2H/t8TT4VU5Gt6+l9+NGVF3dzeBqcK24cn4rvEvnuH1a3Ad6do3wAZmudSX7zp
         6WrVyGaGuuYgzbHUe49aVByeqMZ9vg3t+Tk1syizMFuO+ByXEprpnbCHhlSg/hfs5wiR
         RUWQZQkOFOwt7UGVHfPQ0YFhJb5ht2O17dda98vNGRNH5HT/55dZhg277iv2rmXbi+j8
         Ta9tp4w5wKacyJD2sAD1kl71uceYDVWBVfSxV95XeuwX9wyuI13ENGq2NnNQJJtQ9Ycd
         Tsew==
X-Gm-Message-State: APjAAAXaNauvikw/dD2Bn9fgL+m+bItNRNnm0XZdjo/xxydFsvQBAi40
        Q1bW+DM1/KzvHn/J2zYqFFg1KMHzAsdS6WYRs744kw==
X-Google-Smtp-Source: APXvYqywJuBj32EcmV1j+DhpREz2WRlJ8AJL77FsJDcPL2Uh+1cobshd9SxF1ulQUi38gPjw1BTeSgp8v1gBCV2YbpE=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr8043666ljs.54.1564351771778;
 Sun, 28 Jul 2019 15:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190606010249.3538-1-bjorn.andersson@linaro.org> <20190606010249.3538-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190606010249.3538-3-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:09:20 +0200
Message-ID: <CACRpkdbSrGq7ma2ywyQ89N8PKQWLVUiz8NqE4iGyctyENcBKSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scsi: ufs: Allow resetting the UFS device
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andy Gross <agross@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 6, 2019 at 3:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Acquire the device-reset GPIO and toggle this to reset the UFS device
> during initialization and host reset.
>
> Based on downstream support implemented by Subhash Jadavani
> <subhashj@codeaurora.org>.
>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I agree with Rob that just "reset-gpios" looks better.
Otherwise:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
