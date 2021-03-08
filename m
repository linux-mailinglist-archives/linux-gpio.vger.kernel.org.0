Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E243E331A6A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 23:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhCHWvG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 17:51:06 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:41040 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhCHWvG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 17:51:06 -0500
Received: by mail-io1-f44.google.com with SMTP id z13so11817727iox.8;
        Mon, 08 Mar 2021 14:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HXX7OmwTXq8Mxz7J2pgtKBSYweiLlfyjRZ2fcB9mYjc=;
        b=cKi4lbb62vKWoQkRQQVcD/fwevcC0mmyHWqeruY192DS8GXhAOwHFSker8ozKpkQCi
         TBaFGEFy6mGdvdndyOgPZNH4cjkLNRjHqC0M4UvRRpmNOf0WTZfo2wpwra1AndUBdkPj
         xQjf5PrvySc/d+G6X9/tZkXiW+81+0tOCQ0dg4CLlB7B56PVzlLJmLjd8whE7JG2zfmH
         ArhjVF8kWjzUiMXIUiiBQilVtFgFwbJ6HTFDKYYvXfgzRhP/b3kP55ndukqBuuD+eoSf
         kYirm77j8Dnh53aocdUHrFGL2Qi+uO1Xi3YHmEtS1F6yu2TRSoqcpNAiw34BSzEwcuBe
         ue9Q==
X-Gm-Message-State: AOAM531cBJ153I0GcNDGdDOQnhEEoKpyugfPM4j6d7LEz8vTxFRsWBta
        4dic2UBSeAR0bGAaFtXFYA==
X-Google-Smtp-Source: ABdhPJxXMgrTDytUaVEUEwpgGbyZtDFO4fYVDxxWn8exAGB145I2koC96Tj4SGh+9nMojw0xSgKvdA==
X-Received: by 2002:a02:b890:: with SMTP id p16mr25274554jam.138.1615243863387;
        Mon, 08 Mar 2021 14:51:03 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id y20sm6990494ilc.18.2021.03.08.14.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:51:02 -0800 (PST)
Received: (nullmailer pid 3096169 invoked by uid 1000);
        Mon, 08 Mar 2021 22:50:59 -0000
Date:   Mon, 8 Mar 2021 15:50:59 -0700
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 14/15] dt-bindings: add BCM6318 pincontroller binding
 documentation
Message-ID: <20210308225059.GA3090256@robh.at.kernel.org>
References: <20210306155712.4298-1-noltari@gmail.com>
 <20210306155712.4298-15-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210306155712.4298-15-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 06, 2021 at 04:57:11PM +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6318 SoCs.

In case it's not clear, the same comments apply to all the binding 
patches.

> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts

4 versions in a week is a bit much. Give folks time to review things.

Rob
