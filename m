Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011952034D0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 12:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgFVKaW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 06:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgFVKaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jun 2020 06:30:21 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E47C061795
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 03:30:21 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id q5so3713057wru.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2020 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OJZ8ufIPKsqB5rJhxxmA58THKC8gBVaQJxB1BylSHW8=;
        b=hyTPcZ3p/Vj6NBYTZuHMAibM2O4uw5XyIDy98N/mJFvWAkzmlmsgkmIdoUWbpc0r7k
         98uhYZM80THFf+l8shd3BDY8336XLBaz70LV/2bAqqu305gf8YTAYYdWus/Y+V0+47iu
         Rr0HhXfrQyZGE13X5i5Vz+p3VGGkd4eDwsfkgKGa1dnHotEE8Fqp/ZVTKsKQeY2V4iG0
         xi9713viZTF66cHzHcR8S6hrTHw99znvETu7lqsDPBE37UYcZJ0JmPSdcKPUUSHZlV4x
         ZE2v+946/9xzxcKSOfXLVBxbi/C+rNRFDVDrcILhe0MTGy+7VPon/dfW+RTZ9tkVS8G+
         TsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OJZ8ufIPKsqB5rJhxxmA58THKC8gBVaQJxB1BylSHW8=;
        b=c7WzdELigYyvswSjuZyDM/gMzA691fqyX7G/YXA0oN1EuoKmbMeupIONOGs2mo8mDO
         Kfqs2ge7AmRNsG+1RRk62Uh9W+mlm/AsqI2wXw84ycxwGxFZmKhO2vkck2aZYINnPAgu
         0/ZArnyWfDrG/vxzIL9Fp+PhzAzaHQgiZw16HDb431AOIsylZw2r2At/nkB2e44mv3s9
         qTi5cki9IUwcYs7hSLMblsUz6i11wwwv0f/npIE2vD/hW7DZjW/lZFNq42t4Y89s03ui
         GdoxPY+0r/gDRlXIi5YWVGv+nevfOuM6YxVUTZcCsS0cmSt6p+4ncu5yZjmnGxNZ8S97
         M4CA==
X-Gm-Message-State: AOAM532owkvQxgmuWYStDRaDfOkTkPKGAiVuVgUW5DjQzBKlK6PnxZq8
        B2CZ0xdSVHf/paP+7LEb3tLKWRJ0pgA=
X-Google-Smtp-Source: ABdhPJzbZyR4CNtd9Ju/EbDUWI2mZigkJb8SK98Z/hYKtkT3onVWzAgyoX8RGlVwB7JFNUi69uXTIQ==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr17702175wrq.140.1592821819859;
        Mon, 22 Jun 2020 03:30:19 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id d9sm17210004wre.28.2020.06.22.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:30:19 -0700 (PDT)
Date:   Mon, 22 Jun 2020 11:30:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.co, alexandre.torgue@st.com,
        linus.walleij@linaro.org, amelie.delaunay@st.com,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Message-ID: <20200622103017.GS954398@dell>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200220162246.8334-1-benjamin.gaignard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 20 Feb 2020, Benjamin Gaignard wrote:

> Convert stmfx bindings to json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>  3 files changed, 124 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
