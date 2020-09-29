Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B058D27D91C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 22:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbgI2UmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 16:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728972AbgI2UmH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 16:42:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F919C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 13:42:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u21so5155020ljl.6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 13:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h3Ga+GXaHWqM1SSiAmGnTzDtW87dgB5SS1X2AtSoYXA=;
        b=w3/iDm2PFW3fbDKMGpQOBaH2T4oOcHIPglQUCvY49mVadEh7l3xX9LxvvAFVgEbOfx
         A/kw9hjH+4pwryFRBXDgHY4DXDO9nhVP5elFWl0TfKEeKKVDHGWDq8kbQKE5wljX+UAx
         6SfF5PQgc/mvTGmOBg91VkdgfSIbFeCaPJV4WqQsJx1gaCsghyMjXhgiZq7/eAyDdZhi
         qw/zGDx4zcThur7wlLxbfu6xPVryI3FdgeQJR27f+4K+jbdA2RozGLBwkWdTysKYFREg
         vD2SoT9tR2TqsDJ/6+fMt9Zq8drS387LO+OGB2nAifcaRoZs6Eps6nMM3Z15k92WetkA
         6siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h3Ga+GXaHWqM1SSiAmGnTzDtW87dgB5SS1X2AtSoYXA=;
        b=RGkgJieaRYe2vgN1Xd8lmDHV9tPfo5PQUco40ihnVeTjaI2O4oNjIuz2tcyHXWfz5O
         ecV9Sj8IYo/+vtN2mz1vWl03YFNiDzNz+J9D/jFaUv5585mIkRyBjAXiGPCa2R/xCeaK
         NN24zz+cQzlgU14hfmzsTivX+kflo6KYz2RW1UTWiyJJcDZdCWYAcrzmFN9e+r3wiumA
         fz4Mgcg3Ax6B2K6tIkP1ifARkSHW0FjDBnxIUOtxheIcLlyWald1Xs1NFVlnhdYfABKQ
         A9LRe8gJ3DfP7HMdvgh6QkFxuMDjEQfc6ECNRx8IvA/3Kc//jwkMhE9+Dp9KZgBhvLut
         I0tA==
X-Gm-Message-State: AOAM530FzPFEXefCuS9RwTOvoffzzO24A08wc9zSu8c4rYQSwXXFk9Q1
        8Rf1v2rfayUkmnkeQusb1MoEeGi57t+O4fwO92AfkQ==
X-Google-Smtp-Source: ABdhPJxlHO8fgKKXLbQPn+RNsP1AA22vJBqXR27uo8CmPTrI41l9k6j6HehIx/C6LRgRROAFD9skpfhD5m7ty2v4URw=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr1839815lji.283.1601412124938;
 Tue, 29 Sep 2020 13:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200917131257.273882-1-eugen.hristev@microchip.com>
In-Reply-To: <20200917131257.273882-1-eugen.hristev@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 22:41:53 +0200
Message-ID: <CACRpkdYuCtS-M3LXOL3u3T1faH0-G5gHyjHVbeXPrhvFYX6Y_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: at91-pio4: add microchip,sama7g5
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 17, 2020 at 3:13 PM Eugen Hristev
<eugen.hristev@microchip.com> wrote:

> Add compatible string for microchip sama7g5 SoC.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Patch applied.

Yours,
Linus Walleij
