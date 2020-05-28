Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57DF1E53F6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 04:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgE1Ced (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 22:34:33 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46712 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbgE1Ced (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 22:34:33 -0400
Received: by mail-io1-f67.google.com with SMTP id j8so28319109iog.13;
        Wed, 27 May 2020 19:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n/FH6mJ3fikdqE4Zcc+b5bEIYmcTN5k726IIFViGyw8=;
        b=FnNfNJ/XDdrHN6zNsoA/ynN072qhJu1oq/gguPHKnIQw7ObKzhz+HaKuKB21X0EVKP
         jju+0+LMNaYQEIF0sy2qMGCcjFYZSV9f3GIM9axfkzfVGSr+RGFXjhT4OyNDcDbt1bde
         Ih2JMYPL1qnko1NMyDrhJYgNUVZw/K9AP+y2rUZ3fuCVDqru39BTwre+YwTNWvAesPUI
         8izRt4exD2Qf5/lNsKKsTMgq4vl+JX+LKNTQkGK3Mbvkp7/6NYqla3hPDN7d0z7z/ruI
         0FijIGpKTCfMcVeZsmxUmsdkSZIvaDpWBDdyLzUgXEgZvOJGim6b6NmVHGBR/rMshg5h
         nrSA==
X-Gm-Message-State: AOAM533dmIDZ3ZqQ9r/1ORvgTcPiqUa1pucw1EWjSq7HgG8QhL324Ko6
        FQYEUnMdqk/iERMnuRGx2CD2ej4=
X-Google-Smtp-Source: ABdhPJzlRpRHQMmZDZLj/tYbF7cnyKdNiYI4MRq2hMn5XR8oW8DZfDevLNinGnIjZkv6csK9kUeBLA==
X-Received: by 2002:a05:6602:2ac9:: with SMTP id m9mr710941iov.68.1590633271819;
        Wed, 27 May 2020 19:34:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id l21sm2658506ili.8.2020.05.27.19.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 19:34:31 -0700 (PDT)
Received: (nullmailer pid 3250747 invoked by uid 1000);
        Thu, 28 May 2020 02:34:30 -0000
Date:   Wed, 27 May 2020 20:34:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, mcoquelin.stm32@gmail.com,
        linux-stm32@st-md-mailman.stormreply.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/15] dt-bindings: usb: dwc2: Fix issues for stm32mp15x
 SoC
Message-ID: <20200528023430.GA3250641@bogus>
References: <20200513145935.22493-1-benjamin.gaignard@st.com>
 <20200513145935.22493-16-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513145935.22493-16-benjamin.gaignard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 13 May 2020 16:59:35 +0200, Benjamin Gaignard wrote:
> Correct the compatible list for stm32mp15x SoC.
> Fix the name of the stm32mp15x dedicated supply to be aligned with
> what the driver use.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
