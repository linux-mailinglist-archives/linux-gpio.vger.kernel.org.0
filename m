Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C01B1B9E1
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbfEMPYx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:24:53 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34051 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728351AbfEMPYx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:24:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id l17so12146484otq.1;
        Mon, 13 May 2019 08:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Exa3++INrIvsO/2wwFbAr/g8BRRRca3wv4ypTrPlix8=;
        b=Ilo6sAr75cJotXa5uUZj2FVEVtfv5xOt1s5wG9c24pfB3IgE0hiTLs57BQPQU5ajOY
         ACTvrSIlU5duB0LHdD8ELs0VOhNWkDNQoQG41FmROcEv3bSMtz9dxxM8UiQ8AQt6YMC8
         YGnAsl0+vISZCz8L3o0//5c6AdQFRlfmsqJOwNj4nOI4U+pIvkvrAJS6yG7U2AcFGCqO
         Ok9Z/knRfhR/6M9PL47a9LTLhNlOn2T0hm8MKX2HUmZKIoxJp9q0yKj235bz1Npjbs9x
         wsz/MHsbpU7F4TBCjueKRkfoGw6AOXi9y+4ewgR/gyJ9KnH4o+Iw89NZhR2lWxUZ61aU
         EfnA==
X-Gm-Message-State: APjAAAX7KMh4g2V+spZxEzTwkUudptP7VwbMnYq7YzfTXQBMBloWGCHt
        nMB41qtthQGBZORVTlgBNX9HdOs=
X-Google-Smtp-Source: APXvYqxD+j5Q4AEhVMyo/hXjCt0J0a+ijOKVDszq4Ce3lGoF83FSubFyFx1OarmubB6+GoPNGDdf3Q==
X-Received: by 2002:a9d:3f61:: with SMTP id m88mr16458752otc.147.1557761092874;
        Mon, 13 May 2019 08:24:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a24sm196287otd.37.2019.05.13.08.24.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:24:52 -0700 (PDT)
Date:   Mon, 13 May 2019 10:24:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: pinctrl: add a
 'drive-strength-microamp' property
Message-ID: <20190513152451.GA25690@bogus>
References: <20190510082324.21181-1-glaroque@baylibre.com>
 <20190510082324.21181-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510082324.21181-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 10 May 2019 10:23:19 +0200, Guillaume La Roque wrote:
> This property allow drive-strength parameter in uA instead of mA.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
