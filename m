Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD371D3AA3
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2020 20:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbgENS6F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 May 2020 14:58:05 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41966 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729861AbgENS6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 May 2020 14:58:04 -0400
Received: by mail-oi1-f196.google.com with SMTP id 19so25472576oiy.8;
        Thu, 14 May 2020 11:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Jeu+pUdvy7geYpROrsQEfwRIHXKYojtjQhLqBTcP6M=;
        b=B1pR1xaZBqyoPaTcQfH2ffNG5jhdOyboQSOCeU6a3znZSA0xbfp6IWb6Pg0QsHdVIy
         27xEf+YQODcdryS4NaMl6CkNgpwphAPSs324ME+OHEcGkYKqXUNpQtuTCxEPjOVWT0TH
         2VjABZYqhYWRExQzQ0k3FtSiktTQ+c8sYm97t9E85hoz73uiMZwsfYICFMci785gFtVd
         gN/A7v1L7NSU92yJ1fhsp+Jnk0UbUzyaTsaSHA56hsLytJsX3Znyud1SmNKArV9k6cpv
         eOfAouU/nTFcNer5PVRtZgW1hyksNnVS6LIl8zgKNLINk2+PLU/uKh3wQUrnUkRCPJ6p
         TCZw==
X-Gm-Message-State: AGi0PuZ9HfFfjB5JovXjAPaVnPUY5fLP3hlELlkZvc2YgtS1vk+hWlaU
        EuMYElc7KSUTPVJ5JGVHzQ==
X-Google-Smtp-Source: APiQypKgvewB8Pvp5nCvCQGDx9kDR5Wg6rNaAAicjD+8CjJNf/8fTMB3InWXqRqr3Bxm9acLcN3WDQ==
X-Received: by 2002:aca:4f02:: with SMTP id d2mr31586078oib.88.1589482682702;
        Thu, 14 May 2020 11:58:02 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b6sm973167ooa.47.2020.05.14.11.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:58:02 -0700 (PDT)
Received: (nullmailer pid 29984 invoked by uid 1000);
        Thu, 14 May 2020 18:58:01 -0000
Date:   Thu, 14 May 2020 13:58:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: serial: renesas,scifb: Document
 r8a7742 bindings
Message-ID: <20200514185801.GA29933@bogus>
References: <1588794695-27852-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1588794695-27852-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588794695-27852-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed,  6 May 2020 20:51:31 +0100, Lad Prabhakar wrote:
> RZ/G1H (R8A7742) SoC also has the R-Car gen2 compatible SCIFB ports,
> so document the SoC specific bindings.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> * No change
> ---
> 
>  Documentation/devicetree/bindings/serial/renesas,scifb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
