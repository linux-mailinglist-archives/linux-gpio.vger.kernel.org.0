Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8878649CE1B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jan 2022 16:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236135AbiAZPXj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jan 2022 10:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242797AbiAZPWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jan 2022 10:22:41 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FCAC06161C;
        Wed, 26 Jan 2022 07:22:40 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id f17so26385488wrx.1;
        Wed, 26 Jan 2022 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FviLrQkCsJVY66DcQYmSOXStFC1ZeJMY5L+q++TsbLw=;
        b=iayd+iNmW9wlQqK7Equ/0gDV+6rsOYcZ6sCb1cbM1TforyOWMUJrdQMXV52+HAdxYG
         FJx5K2tRyFuc3dXgg+qeQPTlYDM85S75HZb+CYrrIz6Ap65xuHGRccXR9wkax9zCP8Yo
         Y4E8pciw0OTBw52S/bRW5l1mxQSqvHbFsSVu8wIYNTYXW+7eodqj2ZSmUV1XnZ3FuVdn
         AalAK/Bn6GojY0Z4ndO6j1HtpSCO5lXXfXzWf7aott2G/dldlGXrhVCEJCLvLx1naQ6C
         1pXRT8GS/dO3X41XQGIYKgBBNGrb1sYCWp5MApjQlTeNCpSzh59HuoLV6MlW1/gucXj/
         ddDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FviLrQkCsJVY66DcQYmSOXStFC1ZeJMY5L+q++TsbLw=;
        b=aoumyimOn6Uqjp55Hflpqygmaepee4vlsglyf1ZEM4pOpogDxtA2KuGBiGs3jCTzOf
         sxWvn/6OqufSp9Mz/FItKDTmC2zcOghYSFs3xJd1IMgFAY7nbMG60n8ITlaj2stiI/uI
         fYh5wXsJWx4g5W+7MjqYi06+BWm3+Sw96Cq6txEc8uROeCf8fL6hDJR5MUhLQeFqzct7
         CjiMAyfFbG4KBWdFf8WlH9HD4Kz2N5gHY8iWOL957DVrxdfDMSVrPgKnyV8keW9yVChu
         1mztI7WVuAG+eW2Pp/HM6jw04sWp71mNuLEFwaYBdU5soO00yYwzylP34EyDR0pnaF8x
         6ptw==
X-Gm-Message-State: AOAM532kSOEzXMajG/HbsDemyhjhqainT8toyCyNYxWiZ6X0cU1MqCAZ
        MWwLn3K8vXKZXoLP2GSgGp9nFqro0Gw=
X-Google-Smtp-Source: ABdhPJzxp+geoofOQCKKc0yi+8cSVXQryt7Reg5UqHY10vd45BR113XwOoUIF68OF9sbgEWRP7u9kg==
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr1853007wrb.261.1643210559251;
        Wed, 26 Jan 2022 07:22:39 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id u3sm10157385wrs.55.2022.01.26.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 07:22:38 -0800 (PST)
Date:   Wed, 26 Jan 2022 16:22:35 +0100
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>, 5kft <5kft@5kft.org>
Subject: Re: [PATCH for 5.17] pinctrl-sunxi:
 sunxi_pinctrl_gpio_direction_in/output: use correct offset
Message-ID: <YfFnO2+/3J4pxoa+@Red>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f536cd8-01db-5d16-2cec-ec6d19409a49@xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Le Wed, Jan 26, 2022 at 12:02:04PM +0100, Hans Verkuil a écrit :
> The commit that sets the direction directly without calling
> pinctrl_gpio_direction(), forgot to add chip->base to the offset when
> calling sunxi_pmx_gpio_set_direction().
> 
> This caused failures for various Allwinner boards which have two
> GPIO blocks.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: 5kft <5kft@5kft.org>
> Suggested-by: 5kft <5kft@5kft.org>
> Reported-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> Fixes: 8df89a7cbc63 (pinctrl-sunxi: don't call pinctrl_gpio_direction())
> ---
> Corentin, can you please test this patch to verify that this fixes your
> issue on the orangepiPC?

Hello

Yes, it fixes the issue.
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
