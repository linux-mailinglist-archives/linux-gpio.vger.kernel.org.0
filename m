Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE00C8AE2
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 16:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbfJBOTU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 10:19:20 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35393 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfJBOTT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 10:19:19 -0400
Received: by mail-qk1-f196.google.com with SMTP id w2so15150023qkf.2;
        Wed, 02 Oct 2019 07:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=gLUrmfx/jj76Kop2N5IqJrGqd6xXvr5f/fK/MvQJB5I=;
        b=VuEm2Vv8ba/YaIAYitXJEHRyOrxeh0s/x1+En6Y7V5yJ8pXbHJIvHfoDsTXmZ9la7I
         Ip0ZIa7OtHQF0iSrjJzjc/Xx8X3ehVI8jWogaUPtk7khQCW0syTacLWsmdmhqD2HWtYN
         kcweY82GHXdNGphB7db9+E0aq3vTN7kPfG0zCZoRmZlLJiyt96LxgDqttXzjjT2nhQl8
         SrAm6ou3NXWu/j8RJLwosiU7YuX0efQ5hBxCXJeQ7/4vdGDAKGZwusvxjXOcjMVZZ/Bd
         Xp7jPjCLfqntp4Y2WjP9MNL0kTWazHB2eaDG7PeSfScDgL0eNs2m37cZ+iqEnbYeuQL3
         mjsQ==
X-Gm-Message-State: APjAAAWnhf8yqqIyhXbSYYJ3dzEbRW3rFX9Zy18Eluj6tjw92SivUEMk
        HGJNM+rsv1sExRZBg4AYsg==
X-Google-Smtp-Source: APXvYqxGYsVpZYl54CE+HZk8nSduDUYyC53TCANmYaAFwMF5Fj5/Lc2c1Gtmf2OXKhtDuLsnn2jmBw==
X-Received: by 2002:a37:8382:: with SMTP id f124mr3895023qkd.218.1570025958532;
        Wed, 02 Oct 2019 07:19:18 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id j17sm14577297qta.0.2019.10.02.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:17 -0700 (PDT)
Message-ID: <5d94b1e5.1c69fb81.483f1.b3cc@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:14 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add DT binding for r8a774b1
References: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 23 Sep 2019 14:27:48 +0100, Biju Das wrote:
> Document Renesas' RZ/G2N (R8A774B1) GPIO blocks compatibility within the
> relevant dt-bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

