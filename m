Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0895DED51
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfJUNTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 09:19:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33702 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbfJUNTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 09:19:32 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so5206644wro.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=IzXM9qRz/JzRTDA5ooE2NgWm+U2lHG9aYE8mnLThYtI=;
        b=q9YWvNv9ifnEpmf4fcGn790DbawpBkhYQbpIVJg3hYiigRmAsjCJXHurvRjsJbr33y
         GKAj9CRq9suFR+sT8bkXA66eo/oOwaQ8tVIgh8xTeyUwi3LXse8r+RohW9AKTnYXoZOJ
         G30a0Fwt09369m1iUluNcYAKO/M8Hjw81Wl0xvLiTo4rpxSjJbUz8GYnKERP1UGsco/V
         1AQp5U49KV73xRt8DhQWnoscHp1SDZ4FmHCi2q/M7u0w1ekqC+6fe7vPC9M2+U4Tu61t
         wRem0MnPSHUthaSTQfUD8G9zahBK5zqx0/4Wr/SUvo5wn0J5soLVVBwAEM5zeqsGdw05
         /q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=IzXM9qRz/JzRTDA5ooE2NgWm+U2lHG9aYE8mnLThYtI=;
        b=Gl1eF0i7NTn3mjMigKG+tx/I0ndOJ0T0GREN4pduJdB/tI5OUl9qm8xiERYxv14vjn
         00sbbNXhkD2JYYK4hb+SaHVsfnPC7WyJZ4rkdLAlce+jgsWm9iyU/6lOZlLoHnHG6wdt
         92B8elpsj/ELitxKxHrHWb6X0+mKkgpapH2doooTe3jY34kwWZbfZk9/dWe2CUdM15Q3
         Fz/0IHv/xN6APIDJTw5PP4WKpEwt2d1+DndMPgxe8DLPphzKj+dYyaBF2aE561Rbn4wb
         c4QjRhIy6ZPBe54GCvmqbTH1kckeMnnr2vBZFS/8ovgXDoyfqEuCCMGJVYE4296YLx7g
         T6Rg==
X-Gm-Message-State: APjAAAWlH6DdF74HK6efu4SBZc/gHTXQI81QjnCnAq1rXD7Q3BoYr1av
        vdzPDxXwv0Idl/sdReDseuWQQjVZiR0=
X-Google-Smtp-Source: APXvYqzT82vjBtgcUeW0B+ywGszX0nXKvrB7d+PAaK9wi8U2cK7Uo07kUF1C0Fq2aDGrCrxNy/dEjw==
X-Received: by 2002:a5d:4b8b:: with SMTP id b11mr5442650wrt.78.1571663969894;
        Mon, 21 Oct 2019 06:19:29 -0700 (PDT)
Received: from dell ([95.149.164.99])
        by smtp.gmail.com with ESMTPSA id v10sm11291181wmg.48.2019.10.21.06.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 06:19:29 -0700 (PDT)
Date:   Mon, 21 Oct 2019 14:19:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20191021131927.GJ4365@dell>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
 <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
 <20191021114520.GD4365@dell>
 <38dde3d9-8d7e-7dc0-7cba-137b43cea9d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38dde3d9-8d7e-7dc0-7cba-137b43cea9d1@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 21 Oct 2019, Srinivas Kandagatla wrote:

> 
> 
> On 21/10/2019 12:45, Lee Jones wrote:
> > On Mon, 21 Oct 2019, Srinivas Kandagatla wrote:
> > 
> > > Thanks Lee for taking time to review.
> > > 
> > > I agree with most of the style related comments, will fix them in next
> > > version. For others I have replied it inline.
> > 
> > [...]
> > 
> > > > > +static int wcd934x_slim_status(struct slim_device *sdev,
> > > > > +			       enum slim_device_status status)
> > > > > +{
> > > > > +	struct device *dev = &sdev->dev;
> > > > > +	struct wcd934x_data *wcd;
> > > > > +	int ret;
> > > > 
> > > > This is semantically odd!  Why are you doing most of the
> > > > initialisation and bring-up in 'status' and not 'probe'.  Seems
> > > > broken to me.
> > > 
> > > SLIMBus device will not be in a state to communicate before enumeration (at
> > > probe), so all the device initialization is done in status callback where it
> > > is ready for communication.
> > 
> > Why do we need the device to be up *before* calling probe?
> > 
> 
> To Initialize the device.
> And SLIMbus device registers access can not be done before enumeration.

I'm not sure why you need any hardware to be enabled before calling
.probe(). That is the purpose of .probe(). The only way in which I can
see this being a requirement is if information located on the device
is required in order to do device-driver matching.

In which case, how was the .status() function matched?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
