Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD882E258D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 09:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgLXIwc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 03:52:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgLXIwb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Dec 2020 03:52:31 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C0DC06179C
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2020 00:51:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r3so1555727wrt.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Dec 2020 00:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qP2XO0ngR1ghr+fNEQtPmScgoXBcnPP/lIItDhCDK2M=;
        b=Iryp6kYWS3NXejOjSaJPJiIIH/0NoO/EHvJzVCFh0J8O+x0zDFnTSiuQnH/zFl7aP/
         xYQyvKNouvqduGnBh1KNTvINHBT5gH8fo/ieCBq1tAORoDt+64+ZQJS3sXRQ7L3YaW+E
         m0JA3O8kFRi4Q7gbDiakahTEejtUdVxrl3LTetORs8b4pQHaEQ740DUG3V8stdAFtw5f
         JXTOHKYTA0AupqarG3Ju47KQrtW3gC5H5KaKvXPVU+Bzdr0/ZfzXtmv5NCuAQcNeSgWf
         aRNYOxDnOFvu1x9nbZRFeOKSZIN0XWUJO3orCcHTnU+i6ywFuKki+XgVGfddShssVsLg
         gRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qP2XO0ngR1ghr+fNEQtPmScgoXBcnPP/lIItDhCDK2M=;
        b=EZDrjsFQW3d9moHxTRQoqyOQR7xnnBSbQrpvD9TPbsV09OmLHc///gImdHv1gFyUiA
         5B6ItvRCLE3/IhpSTiliU6InnwvVG1YOOAE86B5kL71xYE3gttZYNR0exRiSGpknTlzr
         ksDVKsiGP3uywLHteJ9WSlZNMITJd9mWAbj6GBGBLM4JbNx05ItKVuZsBdbVz3moW82j
         eEJh1mJcBDzF9Ex71GcuFX0/otnv2HrgeQPoN+dBlktEXfXxB+PpwMlYTp2TcixjscGC
         3paS0qh/TSggJGiLEcT6uW8RJBX4rsuP8hgSU+wQ7jieqyGEmypL2lXrYwy8LyTCxPUh
         4YgQ==
X-Gm-Message-State: AOAM531k5DLWdFj7y0IomKXsk3B5syymfE/6WXEi5wA/Udxd/h1oZVwa
        nILA0h4jgD+WMJBU3/nEwsT4AA==
X-Google-Smtp-Source: ABdhPJwMWyYathVI8voQEL5w+ZGTezLUadtdsVtsEAYFpKlLaXykiPJDAwHZ0o6p8CQ/DkLr/RTVPg==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr32512895wrq.78.1608799909968;
        Thu, 24 Dec 2020 00:51:49 -0800 (PST)
Received: from dell ([91.110.221.181])
        by smtp.gmail.com with ESMTPSA id w13sm37720655wrt.52.2020.12.24.00.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 00:51:49 -0800 (PST)
Date:   Thu, 24 Dec 2020 08:51:47 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 11/12] mfd: bd9571mwv: Make the driver more generic
Message-ID: <20201224085147.GH681741@dell>
References: <1608793457-11997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608793457-11997-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608793457-11997-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 24 Dec 2020, Yoshihiro Shimoda wrote:

> From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> 
> Since the driver supports BD9571MWV PMIC only, this patch makes
> the functions and data structure become more generic so that
> it can support other PMIC variants as well. Also remove printing
> part name which Lee Jones suggested.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/bd9571mwv.c       | 77 +++++++++++++++++++++++--------------------
>  include/linux/mfd/bd9571mwv.h | 18 ++--------
>  2 files changed, 43 insertions(+), 52 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
