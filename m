Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B525346CA0
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbhCWWXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:23:47 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:35601 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbhCWWVU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:21:20 -0400
Received: by mail-io1-f54.google.com with SMTP id x17so8161068iog.2;
        Tue, 23 Mar 2021 15:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J34joxCchwIRvqZCGWf9gjCTrugPhj1klH5Qnz6wgPw=;
        b=dshd2hppzbJ7A3TF1x20axIuRQI54Kp9zH9ZAn8IoJWaXX9zjjR609mTmE55KShkBK
         kmnl+p/GtbNcNZaHqyO4RnX4lEMiYAu7WnM66shqwTew9xuanK7deWlYm2ZwT6NUV8Xg
         MAPrcY/cLz7TgvjXhibAdz3hmzZuD0bdR29ZB7h2aS5iuxfijVY7Ql1xpp2hZEIUJ9Lp
         hGzwsL2xpqS6so1WqMTT51kRSTqknZZHWvMK7m+0D3QdgiCm3XYlY2+R3Q1T5s1OLtpn
         zIMpmyPsqKW+pzq9XAqDEGYoVcLIzbYcq76bfKcOuMw0o+dElry3ddcVjgWvMyLYVzJZ
         CrYw==
X-Gm-Message-State: AOAM531JNbgrPvud1XbLRFdfkIWNsM0dO+noLDZ3Rz/muwDZkvPSCVVh
        NfpJpBfUJxa8xKCymp0KEA==
X-Google-Smtp-Source: ABdhPJynpOmpgY8xoxoBq/92F4p3nBiK7cayP3cQCzjLPkh2fKo5i8Ev0mocGhs40Pznhr8Zd/ZXtQ==
X-Received: by 2002:a02:3304:: with SMTP id c4mr208247jae.68.1616538079056;
        Tue, 23 Mar 2021 15:21:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id x24sm91704iob.28.2021.03.23.15.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:21:18 -0700 (PDT)
Received: (nullmailer pid 1447542 invoked by uid 1000);
        Tue, 23 Mar 2021 22:21:16 -0000
Date:   Tue, 23 Mar 2021 16:21:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 12/22] dt-bindings: add BCM6362 GPIO sysctl binding
 documentation
Message-ID: <20210323222116.GA1447482@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-13-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-13-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:53 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO sysctl found in BCM6362 SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
> 
>  .../mfd/brcm,bcm6362-gpio-sysctl.yaml         | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
