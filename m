Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BF9DEB47
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 13:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfJULpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 07:45:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38843 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbfJULpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 07:45:24 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so12451217wmi.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2019 04:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=umMsATXlWgFAfcuZOGKS3dhZXdI24Lzqqx5ELSjQOWM=;
        b=L2nU+xgCbN5LtkAhVSUAyqXKpaIpDb2NbqaWZD/9o/EUs39LUEO2TGEXCZnz/+1GMK
         vmYJLj9mwZ8wqiG/kirdJIyY//VurXZfTQCPxCtOY9IL1skWqhSDbep7FMWDaLf13PQ/
         K/qp+YDO47tUKlxjf4r2zecpRPk3YMUhUEBQLnU3Q0XHC57ZyUaPxmpuZHIIAQIzaN+r
         Y/Xqo9jpEBUc0N9HPFcmvN3EWnuoZGNRmYXpqVEg0baVbVZf+XMCdVLcukyYbTdNbr2J
         T9Lw2o/kyFrxYKTVufYqj0aVqDHuuCSO2Xl0SadOAKJWb8w3occPpbjoyIxp+cJPLyhh
         MHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=umMsATXlWgFAfcuZOGKS3dhZXdI24Lzqqx5ELSjQOWM=;
        b=R7dTNN3mmB4STIe1FuPQGr4UXPETZ55+w8SJhdCvu7pxpe5kiBwSCL6164gHn6yeWH
         6dygFtErYXLyUVSG29CtYIgspZNHqZOpd0j8qyd7JZdtmzaEsbhKYQaHZzns9kVOJuG+
         tRFxZF2hM83o0W8CAx9Qd1xUOSyrfT/7wp99mef3O855Z7252pPcAlg1MYMpd0NvpZaz
         4uULko0IhG1g58mdFFPc2uGNLGb7SsvtoiVrFiGH3BVxouYUzRQo1fTr4muBjSkX2HLa
         eAzxPCSvK5FQrNXnlyKItMkhLL/Y/LrQP47DiWorfd4gdC+zrraIxAw+q+P4egwmpzki
         CjnA==
X-Gm-Message-State: APjAAAX++EqzitOwjMfGSuUp9xcCX1uF008zHDRsMbKDDkTSAcEd+tAf
        VXiyFPWqFqJI1/9JMeKvMHNQtg==
X-Google-Smtp-Source: APXvYqxEr92jhtBT1uFAamq5FfTEOFtNLr64Fwysmfw5liFBfPgdTxylfL+k5nkA5UswqABKpIGI9A==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr6276449wmc.124.1571658322488;
        Mon, 21 Oct 2019 04:45:22 -0700 (PDT)
Received: from dell ([95.149.164.99])
        by smtp.gmail.com with ESMTPSA id o4sm24943791wre.91.2019.10.21.04.45.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 04:45:22 -0700 (PDT)
Date:   Mon, 21 Oct 2019 12:45:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/11] mfd: wcd934x: add support to wcd9340/wcd9341
 codec
Message-ID: <20191021114520.GD4365@dell>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-3-srinivas.kandagatla@linaro.org>
 <20191021104611.GZ4365@dell>
 <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1af8a875-8f55-6b7e-4204-ecedc1608889@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 21 Oct 2019, Srinivas Kandagatla wrote:

> Thanks Lee for taking time to review.
> 
> I agree with most of the style related comments, will fix them in next
> version. For others I have replied it inline.

[...]

> > > +static int wcd934x_bring_up(struct wcd934x_data *wcd)
> > > +{
> > > +	struct regmap *rm = wcd->regmap;
> > 
> > It's much more common to use 'regmap' or 'map'.
> 
> Only reason to make it short here is to save some lines!
> If you prefer regmap, I will add that in next version!

I doubt it'd save many (any?) lines.

[...]

> > > +static int wcd934x_slim_status(struct slim_device *sdev,
> > > +			       enum slim_device_status status)
> > > +{
> > > +	struct device *dev = &sdev->dev;
> > > +	struct wcd934x_data *wcd;
> > > +	int ret;
> > 
> > This is semantically odd!  Why are you doing most of the
> > initialisation and bring-up in 'status' and not 'probe'.  Seems
> > broken to me.
> 
> SLIMBus device will not be in a state to communicate before enumeration (at
> probe), so all the device initialization is done in status callback where it
> is ready for communication.

Why do we need the device to be up *before* calling probe?

> This is same with SoundWire Bus as well!

[...]

> > > +	struct device *dev;
> > > +	struct clk *extclk;
> > > +	struct regmap *regmap;
> > > +	struct slim_device *sdev;
> > 
> > You don't need 'sdev' and 'dev'.
> 
> slim_device instance (sdev) is required by audio codec driver to allocate
> stream runtime.

You can extrapolate one from the other.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
