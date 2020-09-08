Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAC526217D
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 22:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbgIHUxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 16:53:30 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:45308 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbgIHUx0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 16:53:26 -0400
Received: by mail-il1-f193.google.com with SMTP id q6so221336ild.12;
        Tue, 08 Sep 2020 13:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D4zd9nYkhVJuhvgahq/dyIESgw7OrwqNF2xcvkGb3oA=;
        b=HW+7a5BepnHyp8gc83ouOqVuEzTuDPhkyv4LEPtDWKpxt1GSkgqbgpfcGBQEFQLNQq
         AAi3717yDThM3lJlZEq1yaYlNKD62S69/KJHDiS5hQv7X17tQn5jBbTgwIWnsIo+6cg5
         P3xCnuQu+BneJxe9Z94mQ1tdvrwryWSNn99Vyy4NaM4d9r1PLueuCmNgkJdNexMvMtCZ
         NqtLy9rFMRsOcGkIfdwaYwVzeoSibQt88jrauogjERFISUnqoU3/CM7KWtajeAh8Mhbc
         XtraV+pC6ICVF3s3cnOzFXD3pjVlkDk+iouc/1Jk4PZ6jRU6pCECEBRKi44CsMnse/iI
         Soxg==
X-Gm-Message-State: AOAM531NOchLN3EMvMFmeKL563FiqKTABs5TiNzSotiWFi3PnrQN82G4
        iKpSyjiIuKIovRq7GUk0Ww==
X-Google-Smtp-Source: ABdhPJwn91P1U6BXedZqItCeJqUIbPJFo/NE2iCov8xmdElXwJI6fUk2ZHGPizmZ4E2yNwgo3U6nyw==
X-Received: by 2002:a92:d906:: with SMTP id s6mr595831iln.152.1599598404868;
        Tue, 08 Sep 2020 13:53:24 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i14sm198645ilb.28.2020.09.08.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:53:24 -0700 (PDT)
Received: (nullmailer pid 900544 invoked by uid 1000);
        Tue, 08 Sep 2020 20:53:23 -0000
Date:   Tue, 8 Sep 2020 14:53:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH] pinctrl: rza1: Switch to using "output-enable"
Message-ID: <20200908205323.GA900491@bogus>
References: <20200821111401.4021-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821111401.4021-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 21 Aug 2020 13:14:01 +0200, Geert Uytterhoeven wrote:
> For pins requiring software driven IO output operations, the RZ/A1 Pin
> Controller uses either the "output-high" or "output-low" DT property to
> enable the corresponding output buffer.  The actual line value doesn't
> matter, as it is ignored.
> 
> Commit 425562429d4f3b13 ("pinctrl: generic: Add output-enable property")
> introduced a new DT property for this specific use case.
> 
> Update the RZ/A1 Pin Controller DT bindings and driver to use this new
> property instead.  Preserve backwards compatibility with old DTBs in the
> driver, as this comes at a very small cost.
> 
> Notes:
>   - The DT binding examples already used the new property,
>   - There are no upstream users of the old properties.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc for v5.10.
> 
>  .../devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt     | 5 ++---
>  drivers/pinctrl/pinctrl-rza1.c                               | 3 ++-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
