Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08D4711D151
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 16:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbfLLPsQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 10:48:16 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38617 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbfLLPsQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 10:48:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so3049222wmi.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n8vF9XNoq8z6lGj5X7N3vW0Qdo3VLesTtOSH5vM0z9g=;
        b=tWDQHCzjEidxQRC+S3IK6O7tlY/wx1abfeFkrfPopDd3QnLtcJm/2dSOfbn4oBuHob
         r5oqnlemPeEejKOCEADPAyAr0Cn6ISp7836+r+o8bI0ZppfhowGu586AmRKCjlF4XovA
         Gan7Xv/WYJBpQPmip9CyMywfOCnw5YFEkNw+lfBkNsZ97VqUaLcFuP++4ZBfVBdkqyAu
         iS+Zh6cT5jmUAdSFEM6h/dQgBqqVy8JV17rG7osun1xfooVf1WiWuhgYi2xxuuO7fAvt
         SfVBVpVTBZeLFibk13ApL2uYWHGl00qSzJXR1iTJMR2XPTEkA6tAW2o+iWHF2t/b+41M
         +f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n8vF9XNoq8z6lGj5X7N3vW0Qdo3VLesTtOSH5vM0z9g=;
        b=jrzrPpxqJUyGYQce+6VO3EG/nrqVyvlojRW86E2V1WefS7U16k8WAfohNOSZtv8Qfp
         +ndMY8V9c3jc2x6vqMv2tYLHxmynR4m6G0joMHMgbZj+rcI65hw3CEgQY1unMoBNU34b
         UwDxCvJkdMiOkcPiw0bpgFF309Hz3ymc96KaCxmqY+8IP1FANYlyr52bFXLiflMoCWsO
         J5kTdr85mt9Sw504m2Cx5c7ECdChWjf9KHDjolFHFzHCBWhxUFlIfSSKaBCEQAqKRCBV
         qQ86ta3bsktQvEn5jLQIfVucjOW2TC9YOM9bmGNM+EKOA681xhwK1IXN5l0/uNNgpvoK
         F3Xw==
X-Gm-Message-State: APjAAAXejb+Oi2ckMYx+pj57wYnhvK4Nq3LJ1MzNeRS0G0i9xhNV/7Q/
        aIoLrRIJ4ACX+gCPN7nRMkrDRA==
X-Google-Smtp-Source: APXvYqxOLMy2RQ678Cljt3+lFrWx65iFon1zUH2zHDgdT62aQXQwwk5Wxg4qyHDQTsa3N8dQjdgobg==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr7206712wmc.2.1576165693930;
        Thu, 12 Dec 2019 07:48:13 -0800 (PST)
Received: from dell ([95.149.164.71])
        by smtp.gmail.com with ESMTPSA id p26sm6519960wmc.24.2019.12.12.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 07:48:13 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:48:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Add DA9062 GPIO support
Message-ID: <20191212154804.GB3468@dell>
References: <20191129165817.20426-1-m.felsch@pengutronix.de>
 <20191210095115.kxvm7elfkiw2kdem@pengutronix.de>
 <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda0BCBj1LeFkWsjBPHi_4d-F+eu0tDLm9VrFbn1RyWkWA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Dec 2019, Linus Walleij wrote:

> On Tue, Dec 10, 2019 at 10:51 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > gentle ping.
> (...)
> > > Marco Felsch (3):
> > >   dt-bindings: mfd: da9062: add gpio bindings
> > >   mfd: da9062: add support for the DA9062 GPIOs in the core
> > >   pinctrl: da9062: add driver support
> 
> I can merge this to the pinctrl subsystem but then I need
> Lee's ACK on patches 1 & 2 as they are to the MFD subsystem
> and I think he will want me to create an immutable branch too?
> 
> As Lee is not even on the To: line I think it is unlikely to happen,
> so maybe repost, stating your request for his ACK?

Or any other line I guess?  Seeing as these aren't in my inbox.

Yes, please submit a RESEND with me as a recipient.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
