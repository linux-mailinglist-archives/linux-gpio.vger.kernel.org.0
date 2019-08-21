Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63007983B3
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 20:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfHUSxn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 14:53:43 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46028 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfHUSxn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 14:53:43 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so3027963otp.12;
        Wed, 21 Aug 2019 11:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=35w30kfg8waZGig5Tgp5myLfGxs2v26s2C8ndD5dbgE=;
        b=TkHm8wHG/DrKD8+PzQmZAWY8/Rf5AwrDYBzbFsMm4BWdtBz4J0usgb0gC3LOo9Z06e
         yrcLk2GpJMU1PN6Y4iN5ZibtEruDF5rpq6NlagG+N8jYr/UerqCqYUujU7wt1TBQkaMr
         qc8gGTnJU6YzJDyeZfKFI9hWbaiI0o6natn+nDHD5dRr/kzBB46KoUlzWlrTDKZk+ZQJ
         nBVWXShgqdA2p/joqJfburolacvobRRDw91eKD8kR1gwrE1/GOGjCgo2musvJd4fNUr8
         d282M1kwwEB+j9qVNdZfTbQ3P1XHgdazbPi2akxEgGNwmhPcW7jp1P0KelfI9Gapzpr+
         p8Mw==
X-Gm-Message-State: APjAAAVDom8bxwg0yCNDZtM1IkvG7/159BEFt29Z/MeRePALKfdjaz2a
        JAa4Vo+W8+3cuhtJEZthTw==
X-Google-Smtp-Source: APXvYqx6qzNVtFhlJaMG2/mMChFWJqtieUnJ35anReOkOofFGHrpDYvfpmmHired3qcAnjde3+xLIw==
X-Received: by 2002:a05:6830:1345:: with SMTP id r5mr11259617otq.158.1566413622284;
        Wed, 21 Aug 2019 11:53:42 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d27sm8061374otf.25.2019.08.21.11.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 11:53:41 -0700 (PDT)
Date:   Wed, 21 Aug 2019 13:53:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: cp110: document the new CP115 pinctrl
 compatible
Message-ID: <20190821185341.GA29195@bogus>
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
 <20190805101607.29811-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805101607.29811-3-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon,  5 Aug 2019 12:16:06 +0200, Miquel Raynal wrote:
> From: Grzegorz Jaszczyk <jaz@semihalf.com>
> 
> A new compatible is going to be used for Armada CP115 pinctrl block,
> document it.
> 
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> [<miquel.raynal@bootlin.com>: split the documentation out of the
> driver commit]
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/arm/marvell/cp110-system-controller.txt          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
