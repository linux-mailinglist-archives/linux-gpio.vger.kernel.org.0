Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E422D50BB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 03:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgLJCOg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 21:14:36 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44799 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgLJCOg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 21:14:36 -0500
Received: by mail-ot1-f65.google.com with SMTP id f16so3467566otl.11;
        Wed, 09 Dec 2020 18:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uvuESJ7aQViukX65KHwtf9YvigahbdIqwb8vH0OL0oo=;
        b=FVidFd6dQ33bLjFWWYt/McgGdLGuX7W4WkaphDhwKfxYk3QGkXDWURFmp106rMMdee
         Y1q7kKed3GhAxiQESHLdELlnhpYgLN50ZM+R3cA6ygKW3jQs0L7fR6SI0G2lkmRCi3qD
         0c/2WUQj4pspGpWltg2Ty6nVeFPt53IJ73kOho8XO2s8vJHIIfEANU1HEzcgip0PUe5d
         G+9QCSuvT3E+MK4V9iCpOCD5MusFLIS811RJfZv7hfv8an+1x3alUj4qpLpAgIVuIXt+
         HtljnAqiHqTUu7qC6R+G96udMSwKdgSzJx8SkHPrFWHgrTDYViRw+x7rJ4B/6oR6ftEj
         Rz5w==
X-Gm-Message-State: AOAM532KvMIhTFGxV7Am8jJlx/5C0RZmq7Lb57QC/vLLysO/tPVY0AiP
        y2oe1Pxu2eVEGgMyQBmjoshNasqKyQ==
X-Google-Smtp-Source: ABdhPJzIcVnXVUZa0YCcG+skcD1a0imLZZ3uG+dfjaLZBLb1EkuCvfHIL3HeYEu5S6eq85WTU6SvdQ==
X-Received: by 2002:a05:6830:1c3d:: with SMTP id f29mr4364041ote.47.1607566435550;
        Wed, 09 Dec 2020 18:13:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a25sm732738oos.23.2020.12.09.18.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 18:13:54 -0800 (PST)
Received: (nullmailer pid 1495814 invoked by uid 1000);
        Thu, 10 Dec 2020 02:13:53 -0000
Date:   Wed, 9 Dec 2020 20:13:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mt7621-gpio: convert bindings to YAML format
Message-ID: <20201210021353.GA1495778@robh.at.kernel.org>
References: <20201207081151.7489-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207081151.7489-1-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 07 Dec 2020 09:11:51 +0100, Sergio Paracuellos wrote:
> Convert the mt7621-gpio device tree bindings to the new YAML format.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/gpio/mediatek,mt7621-gpio.txt    | 35 ---------
>  .../bindings/gpio/mediatek,mt7621-gpio.yaml   | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
