Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9050070DA9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 01:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730968AbfGVXxC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 19:53:02 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36218 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbfGVXxC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 19:53:02 -0400
Received: by mail-io1-f68.google.com with SMTP id o9so77985029iom.3;
        Mon, 22 Jul 2019 16:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HaUvZHRPCOC2S8HOXJy0x3pda31cOo40y2gnBhVmOj4=;
        b=LjQ+VKbwGJ+tG1ibBwpd19UKa//pbbbToV8tpBCaKvoKLcpugReskAhDaRGT7jbrRS
         Gxa8WVAb1aHm1jYOD4pFIrsm7JUFIU69NDGCU/UGYIyJRiaV0lC7lHGi5OKrXz/+eaOu
         7WFVzVIv6qkDhJZq25aVZPpFxuCLnF4bpA3GFSbr7w505l1jHii0WLfPrGm4P2/VxQ1t
         02I6oFCY09GC3/YqMwNFicjtr7eB0VbtJXhMJg+9DEPB/2WPLVdQmkVS4xlwLmtSHPzN
         cdHgv1G3hCzbrGmk58cMkW3iJG6029ZM4ag6cM1H7H5W0ArW971nMqX4zRf6n66aJ64U
         5I6g==
X-Gm-Message-State: APjAAAXmK2nvZMaAyTkpggfh0bD363hmlAnq/l8s5pN6Et6nJOxOZYyL
        3fZXOrWcuYK73RQ51nytuw==
X-Google-Smtp-Source: APXvYqxzZ6w7VsTX+lZvTdQtthtWohq+ukDLYC7IcHxx2PzdPFkCaSWEUxCSOKgJMJvjZ9AO2AlA9g==
X-Received: by 2002:a5e:a710:: with SMTP id b16mr72912914iod.38.1563839581403;
        Mon, 22 Jul 2019 16:53:01 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id y18sm41470824iob.64.2019.07.22.16.53.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 16:53:00 -0700 (PDT)
Date:   Mon, 22 Jul 2019 17:53:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        gpio <linux-gpio@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: msm8998: Squash TSIF pins together
Message-ID: <20190722235300.GA24879@bogus>
References: <503b2ae8-ead6-70cd-7b21-ce5f5166a23a@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <503b2ae8-ead6-70cd-7b21-ce5f5166a23a@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 04, 2019 at 10:57:06AM +0200, Marc Gonzalez wrote:
> TSIF is the Transport Stream Interface.
> First, rename tsif1 to tsif0, and tsif2 to tsif1.
> Then squash all 5 tsif0 pins into a single function.
> Same for tsif1.

Doesn't this break backwards compatibility? If so, you should say so and 
say why that's okay for this platform. In any case, whether it's a 
problem or not is up to the platform maintainer(s). 

> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Changes from v1:
> - Reword commit message for clarity (hopefully)
> - Drop unrelated change in qcom,msm8998-pinctrl.txt
> - CC DT
> ---
>  .../bindings/pinctrl/qcom,msm8998-pinctrl.txt |  5 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/qcom/pinctrl-msm8998.c        | 76 +++++--------------
>  2 files changed, 20 insertions(+), 61 deletions(-)
