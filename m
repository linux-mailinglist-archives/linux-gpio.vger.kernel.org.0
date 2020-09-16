Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8125726CCB3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 22:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgIPUs0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 16:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgIPRBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Sep 2020 13:01:14 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF971C0A889C;
        Wed, 16 Sep 2020 05:59:39 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id q13so10168371ejo.9;
        Wed, 16 Sep 2020 05:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LykIIjwDcAPlXpe116USPIGPMiw/gn67hYo/dfyuguc=;
        b=EPYT+N9pg6qQsR2GbJfFotejWklLP0rj8JOmihomV/mb/ET2IEoPdf9F4gI260Q6pj
         iW2YjRFunmacaut439pkVKHTb+K+Bsfgb2WE2cjgiPCtLqcMDAXtvxiDRJpPmxJuaRNl
         5RtTN7wxPptFnpPRrBOa9emhchndttrJkFwoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LykIIjwDcAPlXpe116USPIGPMiw/gn67hYo/dfyuguc=;
        b=iWTUj6Af7xMVhg4CvCSJcN+MkfYtsQCWa8bx5QcJ+aJ3u5aXSUyMH7CQ+INn2jFAy5
         0HgVeeJHtWL11L0MqWBfaV6LtH5o0n9uZCRKxc5Pdm9zA0n8MYZtQ9cZTXMBjo1grP1X
         raHfUCJKi1fHJNgAVU7VHhFSM37h1i/MtVmRWLruRyb0+SuM0kSI01WqbUZ8IQyt5tKS
         519nNr+DufBtcxSgckg7I/FgYaDt9y2rJ6/kcCU5+N/LFSa3a/p2ywiP6wDrWIqw1wap
         hqtI4reV7Z0RkunA4AqXlgD5/WNOJIH/AV9jsCL2d5ZkrOfhVrekHU8nqC/PkHPI72y8
         iWoA==
X-Gm-Message-State: AOAM530mQbi0sekm+4WqvuadKrQAYWIDo/Adtgl4Cq9tCgeZdvruIRCJ
        GeWIDrvTSg5rGh5rIxnEd4a+7ilNq2lEoeBGGQg=
X-Google-Smtp-Source: ABdhPJwrELSEtB2NvnOU4b9otvda3Yi7Dh3dlIzm9DOmSAaqun5cjYIE1611v65fJhzN7mxe3uxa4apYV9musqXRShk=
X-Received: by 2002:a17:906:fcc7:: with SMTP id qx7mr26579286ejb.254.1600261178452;
 Wed, 16 Sep 2020 05:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
 <CACPK8XdCkw7ix2J9WyOXDcwsMThXwQ62=E6cDLX+-9WJMsqrnA@mail.gmail.com>
 <CACPK8XeQWNTyS53M9PLwkud9RnGNp3j87X8_UXtg4ZHJrQqQSQ@mail.gmail.com> <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
In-Reply-To: <CAMpxmJW+PMV1+q66ywEAiZhrOu+kiSPXQCK0mTGLLwW-yfisSg@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 16 Sep 2020 12:59:26 +0000
Message-ID: <CACPK8Xcqu3UN3o=9pZ269O6pxLOra98jYxZqVL7sfjkUZ4Wang@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input &
 output sgpios
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Sep 2020 at 11:09, Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Sep 16, 2020 at 6:51 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hi GPIO maintainers,
> >
> > On Fri, 11 Sep 2020 at 02:20, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Fri, 11 Sep 2020 at 02:11, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
> > > >
> > > > Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> > > > corresponding to the 80 status bits available in hardware. Each of these
> > > > lines can be configured as either an input or an output.
> > > >
> > > > However, each of these GPIOs is actually an input *and* an output; we
> > > > actually have 80 inputs plus 80 outputs.
> > > >
> > > > This change expands the maximum number of GPIOs to 160; the lower half
> > > > of this range are the input-only GPIOs, the upper half are the outputs.
> > > > We fix the GPIO directions to correspond to this mapping.
> > > >
> > > > This also fixes a bug when setting GPIOs - we were reading from the
> > > > input register, making it impossible to set more than one output GPIO.
> > > >
> > > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > > Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> > >
> > > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > This series is good to go in for 5.10:
> >
>
> Hi Joel,
>
> I don't have this in my inbox. Did you copy me on this series?

I did not; I am not the author of the patches as you can see.

I notice that Jeremy sent them to the linux-gpio list, but you were
not copied. Are you able to grab them from lore, or do you need him to
resend them?

Cheers,

Joel
