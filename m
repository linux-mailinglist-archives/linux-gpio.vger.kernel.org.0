Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3DF346C8B
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 23:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbhCWWXN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 18:23:13 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:36469 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234025AbhCWWUt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 18:20:49 -0400
Received: by mail-il1-f172.google.com with SMTP id t14so9781424ilu.3;
        Tue, 23 Mar 2021 15:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cLydPYtbWAtQJRiyZqnb2+i1fEITes/uYw9vRF1AObY=;
        b=X7EKjPwu4YIQg6OS5dB7lT9JkEHKBqb5bO6ZsOsqLeV+AGoCzIMVMihkKbTP0FptH9
         wbdhjRKrIr0OiGfvVex5axIayx1kwvYOM01B+bFHc3jOVLJXptfwZwl+KxLMuBBU+woe
         cnjuPhJEC/YStFcZTCgwtFs61yfSAk3TEP22UbalGQhpiZyZY5B2GENWlCan+2+84wIp
         uMJ5JSjII31cLJjH65M5hNSt8XyYd0mniRe879uoTeAYpMvwCPD2IHcI37uOezC5iTVM
         A6/6d0fOrNsZoSiepYwcEIuw1H5/xIIyQaG9PbNqwjpYUO/erao+lE38MUR0BmA03kyN
         vtPA==
X-Gm-Message-State: AOAM533V4zQ7k53XO1YLgg8KzH2XlhqtV+Vs3mt9FNa8Nl1x0KpfnU8s
        phVDnEogJfDivw2+SjjCxQ==
X-Google-Smtp-Source: ABdhPJy434KpQN9BY/swUwsRNRfvZ/m+FV0SmBXCbu0BP6ZaIi8I9KeqnTdWX9Zc2uoKWgKpXQAiCA==
X-Received: by 2002:a05:6e02:1a68:: with SMTP id w8mr323503ilv.129.1616538047769;
        Tue, 23 Mar 2021 15:20:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h2sm90001ioj.30.2021.03.23.15.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:20:46 -0700 (PDT)
Received: (nullmailer pid 1446593 invoked by uid 1000);
        Tue, 23 Mar 2021 22:20:44 -0000
Date:   Tue, 23 Mar 2021 16:20:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v8 11/22] dt-bindings: add BCM6362 pincontroller binding
 documentation
Message-ID: <20210323222044.GA1446541@robh.at.kernel.org>
References: <20210317143803.26127-1-noltari@gmail.com>
 <20210317143803.26127-12-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317143803.26127-12-noltari@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 17 Mar 2021 15:37:52 +0100, Álvaro Fernández Rojas wrote:
> Add binding documentation for the pincontrol core found in BCM6362 SoCs.
> 
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v8: add changes suggested by Rob Herring
>  v7: add changes suggested by Rob Herring
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
> 
>  .../pinctrl/brcm,bcm6362-pinctrl.yaml         | 206 ++++++++++++++++++
>  1 file changed, 206 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6362-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
