Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639BF372491
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 04:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhEDC4r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 22:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhEDC4r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 22:56:47 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D113C061574;
        Mon,  3 May 2021 19:55:53 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id p12so5409003pgj.10;
        Mon, 03 May 2021 19:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=plxuiWjREPBGYzhCFdcJhcsHK+v+FpYSlzvBlR1/nm4=;
        b=WoHmLOXu/aELN4S8l/5TBVI4YrhNCvzfwIzzDOVVDA80qIda8YC+33JefeGLPPDzys
         vzcfZAvwQ3/lYUzY9POSdlMA7d0ifN4rvb7D2+1Zlnru0jUsbXFdhXE7xqz4NPbGgpYa
         C/8st6sSZoZGqYZc21S9nVR6VRfpGbobUdp5r4TRLYFR/lA8Iy4Pr1Wa7rtfFybjUjWS
         tIBqKCR/B5ASsasi1jb14eOqjlNg9ec3F5+uDgrMibrmdtXhIEAYRnxMu3e9mN4XGOhd
         uG/zclNI+tEmqu8InKfYlt1zenByxVppkt1QxB1sOGlOuAyEYwmprmdxaar2k7ZIgKFo
         ILBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=plxuiWjREPBGYzhCFdcJhcsHK+v+FpYSlzvBlR1/nm4=;
        b=iiU7oOmIsMKs0b5GtUGLJyBVwiHIJVQlVSB6p79m6nqEwwpnE/tAUsrq2tpBZa5tqR
         Emzp5VnZuJT4brEhBFJ+KcSFDkfBBPN9ujPqRXKoRCPwnePnmnEnqHHtJGqFEA0sr8rH
         Noa4GGizoWZ0IfzxSJv8mnV75Z7ZUGnNj4UGcaoYxWsNFSM2qHDkbvUoMUCaHg1bzciR
         NQYHV5yLKyunkzXdilc1PigMF56bc3EMGbTfwr+tAdr7Da+n20hj/pKShw7mc92J+OLO
         7mQiKmngDJjmVgHCyuKnH1ln291wpq3MCo0i5Xm81XQqaPWT5VewArOv+OAG3Ts8y966
         kzJw==
X-Gm-Message-State: AOAM530pW99KQ2mMVwFDTAqDCangpkJElyiuR9P6QxPkeCMunZvPAt8y
        /liqitoR9XPKhk7rYm1rsY0=
X-Google-Smtp-Source: ABdhPJyR06EKXkyNorNbglP6maAzAnEoRxWZkrxwZICmhIEkn1WaUgseY9d/BhorQ7z+u3xLcIk+sg==
X-Received: by 2002:a17:90a:ba16:: with SMTP id s22mr25180758pjr.12.1620096951889;
        Mon, 03 May 2021 19:55:51 -0700 (PDT)
Received: from sol (106-69-187-97.dyn.iinet.net.au. [106.69.187.97])
        by smtp.gmail.com with ESMTPSA id f15sm1251807pgv.5.2021.05.03.19.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 19:55:51 -0700 (PDT)
Date:   Tue, 4 May 2021 10:55:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20210504025546.GA13356@sol>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 03, 2021 at 11:05:26PM +0200, Uwe Kleine-König wrote:
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
> 

+1 on clarifying the naming.

> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.
> 

You use active/inactive here, but then asserted/deasserted in the patch.
My preference would be the active/inactive, which has more of a level
feel, over the asserted/deasserted which feels more like an edge.

And you still use active/inactive in the descriptions, so now we have all
three naming schemes in the mix.  

What made you change?

Cheers,
Kent.

> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> I already sent this patch back in July and Linus (Walleij) liked the
> patch but asked for an implementation. For that I added the second patch
> now.
> 
> Best regards
> Uwe
> 
>  Documentation/devicetree/bindings/gpio/gpio.txt | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index a8895d339bfe..1061c346a619 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -196,11 +196,16 @@ Only one of the following properties scanned in the order shown below.
>  This means that when multiple properties are present they will be searched
>  in the order presented below and the first match is taken as the intended
>  configuration.
> -- input:      A property specifying to set the GPIO direction as input.
> -- output-low  A property specifying to set the GPIO direction as output with
> -	      the value low.
> -- output-high A property specifying to set the GPIO direction as output with
> -	      the value high.
> +- input:             A property specifying to set the GPIO direction as input.
> +- output-deasserted: A property specifying to set the GPIO direction as output
> +		     with the inactive value (depending on the line's polarity,
> +		     which is active-high by default)
> +- output-asserted:   A property specifying to set the GPIO direction as output
> +		     with the active value.
> +
> +For backwards compatibility "output-low" and "output-high" should be supported
> +as aliases for "output-deasserted" and "output-asserted" respectively. Their
> +usage is misleading for active-low outputs, so their use is discouraged.
>  
>  Optional properties:
>  - line-name:  The GPIO label name. If not present the node name is used.
> -- 
> 2.30.2
> 
