Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B5F55E05B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238721AbiF0Lxr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 07:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239074AbiF0LxR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 07:53:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1697DF5E
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 04:47:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so5443098wmb.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=INtcSWuYJqZv/51emZbtl4GZQaiJjf0FK2Rx9NjjvdU=;
        b=lXdwJ3T0hWwRd2FjZSZn9NLejvaZP+hX41vR+vG5z+fZjvrrydxxOLj1Mni1SG4T7y
         Qe5BcuNLmNeZK/FS3GCOOf7x+pDpbcUgJxr+V6XrdkoUNaSn914ItjglppuYDkfPvMiy
         zytYCkt0WQaCqTxpSMo592v4DxD5Hx+tQoZjbuwc/DFTsnQlp1GFxT7EOXhVdjxvQlTQ
         Fo4M12AvXbbyS7Ws7mXh98rG/Ya9pqX80Gr4tTZKEL8OAe3xNpLc9mOK3hf9A+XHLuuA
         AkjiwLE1Z67hLAP8huWWKsZh7jBohB5FQNIhzUz32SHG+Q1ftRvvGmykPeRm3NkcZ35g
         ZF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=INtcSWuYJqZv/51emZbtl4GZQaiJjf0FK2Rx9NjjvdU=;
        b=jndWLu8n/V367tfz322k+KJBkq4eIGM1ta+0ALx1Gk/2WnhW2cmzMRJ9q/3pR8WVhz
         AFHg74SP13yjyYepVUyuCGfKcOhdaqNgMXh+2z76khGp34WETVx+rjIR+3Kj8Ykv9Rkc
         ZafdiO/Lly+CNcvnXeld2mXvrHLoATbJ1UfRWW9UEIZ6qfpUk7VP6MSNgVCJMoG3v+3x
         gGmOousTaCUs0MHEx4yTnO22NzkOrpv3dP1EldGrcn7KXme+TGtPfaL/LU2ElTiQ8UZC
         l02Le+pQ0eLTZb+o0uBnkJf8tDFdVlfAqWNHKcP6u6L7xtPsYfpqoG4XgTeZN59P/odU
         17UA==
X-Gm-Message-State: AJIora8y0HSVy1Ktfo8czbuGOUb83QZ4+zmr5qINxNM20OtSsyZmqxCe
        o47KPL6ZWZV4bnOto2mz83e8Lw==
X-Google-Smtp-Source: AGRyM1sxv+0qF++QDNW/7QJglg4BElyh4Bi1+WA1w2r7AwtDUgy4amACvWODEcwnxlDOf3dBJq0Zmg==
X-Received: by 2002:a05:600c:58e:b0:3a0:48dc:defc with SMTP id o14-20020a05600c058e00b003a048dcdefcmr7554631wmd.54.1656330462296;
        Mon, 27 Jun 2022 04:47:42 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id h4-20020a5d4304000000b0021b829d111csm10478996wrq.112.2022.06.27.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:47:41 -0700 (PDT)
Date:   Mon, 27 Jun 2022 12:47:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wens@csie.org, jic23@kernel.org,
        sre@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        lgirdwood@gmail.com, lars@metafoo.de, rafael@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: mfd: add bindings for AXP192 MFD
 device
Message-ID: <YrmY292D/0vfIO4j@google.com>
References: <20220603135714.12007-1-aidanmacdonald.0x0@gmail.com>
 <20220603135714.12007-3-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220603135714.12007-3-aidanmacdonald.0x0@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 03 Jun 2022, Aidan MacDonald wrote:

> The AXP192 is another X-Powers PMIC similar to the existing ones.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
