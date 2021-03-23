Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB1C346C5B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbhCWWVl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:21:41 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:35405 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbhCWWT3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:19:29 -0400
Received: by mail-il1-f173.google.com with SMTP id 19so19621027ilj.2;
        Tue, 23 Mar 2021 15:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=56R6uQ+eEGuXAKBtCegxzcu/omDRIGKn0PIoANxTJY0=;
        b=NOiVHpW5U1DLWxWhaGgrTKPgVjMoudxrQfAntds4xSIJBB1MaTlR2IabfIXLTuHd1F
         avEYoCKUf/FZtsLyodK2RI4K1XB1YiiE3ma2r1+Nxtc1IsJBfh3Oc4yzhort0L8Po8uk
         RMb5Lr3vfNNsRpHZT8y6nXdEQiqiikgPiEcMFhSmXn3WGbkfmAWHVfhfRLYWxXjOdAYg
         RTQ4Dq39ovE4VDMS/phjzS5Q+OQJF3fWkW/2XUpxcwqKM2fyzMS5+XK9cJ/SI7ETxBK+
         Rj7ylDcd6PecR22j64X8w3QwNXJKTTzrimCM8YWTM9xj5ORV9KNOjSOGXhMb6IS7vDUC
         ur9A==
X-Gm-Message-State: AOAM530rJeEUu0C9c0Rig/zQ3z0QN51YgOWlLyxMWjTEBord4ZOaZZEI
        juYt38Ne7fGlELz3ZGij3A==
X-Google-Smtp-Source: ABdhPJzrywiDMsymFI9TWW8n1IA4IxULfT29lZ7Kyp30BvF3+Pvw4RaygbqwmahMRdXgQmjjpXRffA==
X-Received: by 2002:a92:dc49:: with SMTP id x9mr285399ilq.281.1616537967323;
        Tue, 23 Mar 2021 15:19:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n11sm88739ioa.34.2021.03.23.15.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:19:26 -0700 (PDT)
Received: (nullmailer pid 1444136 invoked by uid 1000);
        Tue, 23 Mar 2021 22:19:23 -0000
Date:   Tue, 23 Mar 2021 16:19:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 06/22] dt-bindings: add BCM6328 GPIO sysctl binding
 documentation
Message-ID: <20210323221923.GA1434856@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-7-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-7-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 03:37:47PM +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the GPIO sysctl found in BCM6328 SoCs.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring

For future reference, not a useful changelog other than reminding me I 
looked at previously. Assume the reviewer doesn't remember what they 
said and give a hint as to what needs to be looked at again. Unlike the 
commit log (because I can read the diff for 'what'), here you should 
describe what changed.

> 
>  .../mfd/brcm,bcm6328-gpio-sysctl.yaml         | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

