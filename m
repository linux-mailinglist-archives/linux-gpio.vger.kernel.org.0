Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970251B9E7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731259AbfEMPZ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:25:28 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36174 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbfEMPZ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:25:28 -0400
Received: by mail-oi1-f196.google.com with SMTP id l203so9653046oia.3;
        Mon, 13 May 2019 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yR8LH1UTSOR53HlMWiY3fqhsPbeoHCRdKQtWqDUvbtE=;
        b=SOJ8IuHT7EzZskDOb6sOowdwy/zxUlHbNX2r+gzy5wE8mQnEAcx2k4/vVdG6GVYJ6z
         HRQ74ImK1hPImBV1mOedMmJ7eVnTEG1Lgl0skabDaf9BHZpiZs4/TPgKGe25cI2hQ8Bp
         xinL9ZPF779gNDjOfCKT/bz4k/Xvt82+85lJBOzVmZ8pX73onbjesL8RtvPpQCt3YSlU
         vrT0RYP+ukWwPelHXKuGuOn4hmzynpY1OWnSmjS9DOYSmqm6gbW8RFFueEsinxlkZrYI
         45qL+Qf6WO8BK1FPreAlKuq99uBirZMcIPu12lOOh6jnVoNqRVqHsRtjpOHn47AAtuEo
         O/1w==
X-Gm-Message-State: APjAAAW4c83RENkjXCG57Lja4rCzUgXj1Rq4AQv6YXVUFXpEfpAXdA1i
        kEMZt1QdSro+70TSgmBsbA==
X-Google-Smtp-Source: APXvYqyDCnvry2vDAp1C4ugLHChFWp7RaybclhaNzP7J4oQYtwquxvbH4O3ICGW6/efwu871Ip/TpA==
X-Received: by 2002:aca:5e04:: with SMTP id s4mr758645oib.32.1557761127630;
        Mon, 13 May 2019 08:25:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p189sm5298317oih.7.2019.05.13.08.25.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:25:26 -0700 (PDT)
Date:   Mon, 13 May 2019 10:25:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     linus.walleij@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: pinctrl: meson: Add
 drive-strength-microamp property
Message-ID: <20190513152526.GA26772@bogus>
References: <20190510082324.21181-1-glaroque@baylibre.com>
 <20190510082324.21181-4-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510082324.21181-4-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 10 May 2019 10:23:21 +0200, Guillaume La Roque wrote:
> Add optional drive-strength-microamp property
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
