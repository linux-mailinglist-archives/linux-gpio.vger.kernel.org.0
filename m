Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFCF2C94F4
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 03:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgLACDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 21:03:50 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:44210 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgLACDt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 21:03:49 -0500
Received: by mail-io1-f68.google.com with SMTP id z5so31016iob.11;
        Mon, 30 Nov 2020 18:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Zy3hLt0xkkBgO7Nur8AYnrY8ZOOFFFXYaDalID7C9w=;
        b=GKM1IX/Ym8xobUV/IjNdOHdMBszOwNffarMHkyfd2glyUpT5Ajr3gSNyLPz1l8Wdf2
         sCpy+xzOtDHvcO21gAAprGthzFwjMA2DbPjgHmtD4av4a2e0XBh1QNQZVc8PUc0epj0H
         Gr49GuArWLU+nT3hVHClqM5TWG7hTVkx+HquA/mRbknmqKKV55v/qFDVWED2eBrvdG6+
         yYCudI0o+fv5CueT8I0mo0LtTw9eg71aMl9gGtvLlQPB7zTjSTkVGvwBJRnO0pS3xbc3
         bENfvNcAeDyc4H2VkowNlfLCifd5J7obDCdmHhwys/11kZr3J1b1LCwRj3MJmKrYop6Z
         gM8g==
X-Gm-Message-State: AOAM530qof8+947d+6lmyb9mCssJDNY/eaBAa57TqvR6YDmAcVwfJpya
        dG0pyEn5YsZNujEr5DBVyw==
X-Google-Smtp-Source: ABdhPJyJO19//cOlfXYuKkU69EBSQ7B5q3bGWe2glFhP12AG6qNZC3Z/SLpJjYEVdrkPAxDh5KMhzw==
X-Received: by 2002:a02:85cc:: with SMTP id d70mr658274jai.83.1606788188806;
        Mon, 30 Nov 2020 18:03:08 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 12sm215807ily.42.2020.11.30.18.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 18:03:07 -0800 (PST)
Received: (nullmailer pid 3484888 invoked by uid 1000);
        Tue, 01 Dec 2020 02:02:56 -0000
Date:   Mon, 30 Nov 2020 19:02:56 -0700
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
        w@1wt.eu
Subject: Re: [PATCH v4 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Message-ID: <20201201020256.GA3484800@robh.at.kernel.org>
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129110803.2461700-3-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 29 Nov 2020 20:07:59 +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar GPIO controller
> found in the MSC313 and later ARMv7 SoCs.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/gpio/mstar,msc313-gpio.yaml      | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
