Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A1E62BB9E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 12:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239251AbiKPLZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 06:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbiKPLZS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 06:25:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA7EA191
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668597246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AqO20RkBmPLk/Zsbvz4xja2ZPkggecsj1kg48NugNtU=;
        b=EfzzCqKlkxVEyNEaCHkS6S4TmJn6lIa6DYKie8iy59STVh8XIJFc3pR+ILx8y+JwA8ZPA7
        2/GapYp6q3Wh0Wvk1tbBm5bpqManbZ03ZcthLvkVffpUVpluct8WVk0n+RupIi545z04qU
        DeUQTZpdapk7xOUAR2BWVnUlrEAAV8c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-wEXL5J6AP7aF9JwPEBwcUQ-1; Wed, 16 Nov 2022 06:14:05 -0500
X-MC-Unique: wEXL5J6AP7aF9JwPEBwcUQ-1
Received: by mail-qt1-f200.google.com with SMTP id c19-20020a05622a059300b003a51d69906eso12580686qtb.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 03:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqO20RkBmPLk/Zsbvz4xja2ZPkggecsj1kg48NugNtU=;
        b=ol+DnyGxnpKnH85XfojSCOXRaJa1Ye4sNoQC8qlmCPfseQC4DehHxXqpCfOP4sAmRc
         /BDE64qMHjtcf7Yv4dyLulBDlZCx21L9/FV1FLQlPKJ0h17VlVB7wdlMZsXcsiXRVywC
         AwL0VNMGP2JeGRq0YYA0uqrfCvGX9eA9kk4civMXbnkgNPe972XBiOPoVPLBi/+pmx/l
         L1mOluMWqI6m9+QQblZQHitn7dD/kn0Zku7clxx6nV8xVmutVafEVBFdBV4pEcTB+dxg
         NhqGwtm3IHCcUCkD9jSMThuLQiQA77RqU8IJcZZQqkGBUHfCBgV8/GUngsYyRo2q4CEj
         yRaA==
X-Gm-Message-State: ANoB5pl7Rl2j7UQYfToM1p+11I4L6habSaEtgCoIAipE0tj6GEWYkI5D
        VFy7c1qRsUlPUxCTtrk4q05qXXu9w/LrQJtVyce184qXFnrr4WAcUwS0auZoPwtJk21fdQPI87K
        MP3QXQ0WrLjXqQqydzloLIg==
X-Received: by 2002:ad4:450d:0:b0:4c6:5a5f:3063 with SMTP id k13-20020ad4450d000000b004c65a5f3063mr6024306qvu.4.1668597243594;
        Wed, 16 Nov 2022 03:14:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7zVoHnSML4pkn3Q4Eh7xfnZiowbK8L5hFzRTrOFF/MLKTx3usbbcLq0D+RjcLq4PE4cjVYNw==
X-Received: by 2002:ad4:450d:0:b0:4c6:5a5f:3063 with SMTP id k13-20020ad4450d000000b004c65a5f3063mr6024286qvu.4.1668597243332;
        Wed, 16 Nov 2022 03:14:03 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id g6-20020ac870c6000000b003996aa171b9sm8427814qtp.97.2022.11.16.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:14:03 -0800 (PST)
Date:   Wed, 16 Nov 2022 06:14:01 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, psodagud@quicinc.com,
        quic_shazhuss@quicinc.com, quic_ppareek@quicinc.com,
        ahalaney@redhat.com, echanude@redhat.com,
        nicolas.dechesne@linaro.org
Subject: Re: [PATCH RFC] gpiolib: ensure that fwnode is properly set
Message-ID: <Y3TF+VbE5yFlz+OZ@x1>
References: <20221114202943.2389489-1-bmasney@redhat.com>
 <Y3S5sZIVi2DPua0p@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3S5sZIVi2DPua0p@orome>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 16, 2022 at 11:21:37AM +0100, Thierry Reding wrote:
> On Mon, Nov 14, 2022 at 03:29:43PM -0500, Brian Masney wrote:
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 11fb7ec883e9..8bec66008869 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -678,7 +678,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >  	 * Assign fwnode depending on the result of the previous calls,
> >  	 * if none of them succeed, assign it to the parent's one.
> >  	 */
> > -	gdev->dev.fwnode = dev_fwnode(&gdev->dev) ?: fwnode;
> > +	gc->fwnode = gdev->dev.fwnode = dev_fwnode(&gdev->dev) ?: fwnode;
> 
> This doesn't look right to me. Looking at the documentation of
> gc->fwnode and how it is used, the purpose of this is to allow
> explicitly overriding the fwnode that the GPIO chip will use.
> 
> So really this should not be used beyond the initial registration
> in gpiochip_add_data_with_key(). If the above patch fixes anything,
> then I suspect somebody is using gc->fwnode outside of this
> registration.
> 
> Looking at gpiolib, the only remaining place that seems to do this is
> the gpio-reserved-ranges handling code, in which case, the below on top
> of my initial patch might fix that. That might explain why MSM is still
> seeing issues.

That is correct. The Thinkpad x13s laptop uses the driver
drivers/pinctrl/qcom/pinctrl-sc8280xp.c and
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts defines a
gpio-reserved-ranges property. The SA8540p automotive board has the same
SoC, however the DTS we are using doesn't use the gpio-reserved-ranges
property, and why only your original patch fixed the issue for this
board.

I think my patch should be removed from the GPIO tree if Thierry's two
patches work for everyone.

Brian

