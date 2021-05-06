Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6CE375A34
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 20:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhEFScq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 14:32:46 -0400
Received: from mail-oo1-f50.google.com ([209.85.161.50]:38512 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhEFScp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 14:32:45 -0400
Received: by mail-oo1-f50.google.com with SMTP id h9-20020a4a94090000b02901f9d4f64172so1452491ooi.5;
        Thu, 06 May 2021 11:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oGGa0szYJtn5EJ7bBQYGJtU6zY5PCRxd8R546Llej+w=;
        b=ed51Q1FbRcf7RX0Fid51UU5Q3mAdS+OJJ57gs7tYP409K88ubsvLH8tknxiNIsvjEz
         DLdAKW7l4qp39ZWf7jecbM6Mcgs5BErRD6IbNc+aG5oQzc8ACDVUS/enV95Akk2PB6yk
         xyqGKlCYR9ZUzbp0z+J54yZVmTf2B7BMyPXr86FLtFB+teoKhMPKg5AnqsSFWclKZKKu
         lBbxwLhtazEwDzYrEhvzkdDHi4N3JvN392hq8N6hGAag4JV+0zkxQAA7b9Vq1wBfcAP/
         oJhXQi3u+6d10dIm9kSPXkX6NobQog2hmmlMf3yuMXuVtiM33oGM8m6MGoWS32NPgGo9
         tTcA==
X-Gm-Message-State: AOAM5323gkSWStmIe/0GF6zFbzbeEyPItAujtpUru2oKsOMRx+15GJUl
        32FGCkwtoAWA/0EA19qCH3t+b98A3A==
X-Google-Smtp-Source: ABdhPJxZFR7SUvRUOxoQAMwpxS8RVEp+c82SIST6moTYVnQTEXDtjOvNWpS+gRu2Gdl1Eh7bdbaFcQ==
X-Received: by 2002:a4a:a4d2:: with SMTP id c18mr4594306oom.4.1620325907152;
        Thu, 06 May 2021 11:31:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x24sm718944otk.16.2021.05.06.11.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 11:31:46 -0700 (PDT)
Received: (nullmailer pid 599287 invoked by uid 1000);
        Thu, 06 May 2021 18:31:45 -0000
Date:   Thu, 6 May 2021 13:31:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: introduce hog properties with
 less ambiguity
Message-ID: <20210506183145.GA594619@robh.at.kernel.org>
References: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210503210526.43455-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 03, 2021 at 11:05:26PM +0200, Uwe Kleine-König wrote:
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
> 
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> I already sent this patch back in July and Linus (Walleij) liked the
> patch but asked for an implementation. For that I added the second patch
> now.
> 
> Best regards
> Uwe
> 
>  Documentation/devicetree/bindings/gpio/gpio.txt | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

The schema in dtschema will need to be updated too. Really, probably all 
or most of gpio.txt needs to be moved there if not already. But for now,

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index a8895d339bfe..1061c346a619 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -196,11 +196,16 @@ Only one of the following properties scanned in the order shown below.
>  This means that when multiple properties are present they will be searched
>  in the order presented below and the first match is taken as the intended
>  configuration.
> -- input:      A property specifying to set the GPIO direction as input.
> -- output-low  A property specifying to set the GPIO direction as output with
> -	      the value low.
> -- output-high A property specifying to set the GPIO direction as output with
> -	      the value high.
> +- input:             A property specifying to set the GPIO direction as input.
> +- output-deasserted: A property specifying to set the GPIO direction as output
> +		     with the inactive value (depending on the line's polarity,
> +		     which is active-high by default)
> +- output-asserted:   A property specifying to set the GPIO direction as output
> +		     with the active value.
> +
> +For backwards compatibility "output-low" and "output-high" should be supported
> +as aliases for "output-deasserted" and "output-asserted" respectively. Their
> +usage is misleading for active-low outputs, so their use is discouraged.
>  
>  Optional properties:
>  - line-name:  The GPIO label name. If not present the node name is used.
> -- 
> 2.30.2
> 
