Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286D83E5C4D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Aug 2021 15:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242039AbhHJNyq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Aug 2021 09:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240411AbhHJNyq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Aug 2021 09:54:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1A2C061798
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 06:54:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id p38so14170962lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Aug 2021 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jwWuIJqiBzpe1+2G6GtRorjiBXRmpvLNd3Ic9h54t+Q=;
        b=W8fomkKIUYVT177erd3QXdCb9N+w4GU7xEHCTq5V+/pLfs4vtKwHrQWVUWoJUa0WKb
         yROIoySSTQNgzo/gwzIxqRF0R5bfQS+nDpd4VtEzC7ELr7a7smTBhEYmnBQS7iU28eFl
         6/XmILEUsrPbVSQo2USlm6N8PSX516JZiNcZJXsvUVhtLxfMxR0eLAOF6GrZr45uhpYA
         i7Yq+yxNWPQ9DzLISfpIM6HOHFoZYWG8HkNOCTHmLhZ4GupDBs4AmopLoCHgMdalRbIB
         DLdHvCypgf5HJo3jpK3W4lZxDXnfAGL3udivEZnwKrCtcdQJBxxszPhgqQXRt34MHJsX
         q8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jwWuIJqiBzpe1+2G6GtRorjiBXRmpvLNd3Ic9h54t+Q=;
        b=Mg0mwBBTEGx4rRPpghenm9zZQ+FQO9lmE2zqIZpx7IrD1bYXDVOjT6E3K8e9eMfCd+
         NqFSRTvV+/AMfntUaxNIr0qAuUsrj1rc/4G9aS8Dai/T8Tcemd+zkSm5gRxEKUzXumHS
         h+qfi8eGEp6uORgxNwA66xpYMjcuqbidNgUnvqwXlVsxpEpJNEU42I1CwPlp4MZSM55k
         MZBIEGTVegfvoBH/qbk9bWBvN1aQyBEc3wxfI7U2ncAHHxpIbuxtfajcnSq4/N4LzDVo
         gaQGRZpT4ma3jwWG1Tiw9++NWxdXKfIWv3yVRW5TO+OEkF7Nu9uEtStCnkYKypH/7NSy
         qylw==
X-Gm-Message-State: AOAM530BQFf5ku4gbXnZQk1IoAEFFv4h1hps0kxHEKf+eB2tKzWDCC87
        tH7XZEK4RvA5ESTLrARkVcvKC3atu6cbGGB4rhfKEA==
X-Google-Smtp-Source: ABdhPJydL53OBU+42r6QKcJIZe4IlQ/SoqsP/bpkjgaMcCdQZB8nlKWRZ68tmLNyMtyFuqJpiUzbjuD8656QAXWk9KU=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr21366821lfi.649.1628603662266;
 Tue, 10 Aug 2021 06:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au> <20210723075858.376378-5-andrew@aj.id.au>
In-Reply-To: <20210723075858.376378-5-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 15:54:11 +0200
Message-ID: <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] leds: pca955x: Use pinctrl to map GPIOs to pins
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The leds-pca955x driver currently assumes that the GPIO numberspace and
> the pin numberspace are the same. This quickly falls apart with a
> devicetree binding such as the following:
(...)

Honestly I do not understand this patch. It seems to implement a pin
controller and using it in nonstandard ways.

If something implements the pin controller driver API it should be
used as such IMO, externally. This seems to be using it do relay
calls to itself which seems complicated, just invent something
locally in the driver in that case? No need to use pin control?

Can you explain why this LED driver needs to implement a pin
controller?

Yours,
Linus Walleij
