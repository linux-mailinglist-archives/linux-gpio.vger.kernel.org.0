Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52ACD2A7BAE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgKEKZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKEKZ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:25:57 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5278C0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 02:25:56 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 74so1516706lfo.5
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZXYpUcHXnk29q0iXnXVF1m4qzks3JzlHDUDg4qGSWM=;
        b=xUNEMxU+oIFKuSUBXs3OZRa4rjz4U53r2b7DNL5g5nw02FKw9AA1XV6Cil+Pw212Dz
         713HD94UUK0vtS/lPE/9eSxCxlCpbMaWixRJQgACwGq9yqLiHqXxFgFAf588XFdezvBu
         13gNZ1ejls7FrlF6LpU4GHFxJDLQuZ6Lq0hfKky5QEW1z45jI2o2A1yiGkXFDtkmoHFf
         kK8xAppnBcg5vd3hCdtn/dJ+OGCy2Gz/h74RlvDvKc0sJCmj6njz1ZqEKO/Qc8mK3t2W
         hZgjqlJ4/T8hfWvQoDRXGZqoCUWYc45aK34iZU8Kcgxj0IKzSWIBfGNuJkUoAgVQe24G
         ifqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZXYpUcHXnk29q0iXnXVF1m4qzks3JzlHDUDg4qGSWM=;
        b=dEV4xmidihTNl4XCUZeAJ1VcFuifmFcl0CjjZMVLesVf6LQe9eWFSvnvaj5cE7oTWg
         8JZ2wxOW6FMixyy7nlbaxWQOs8BDatj3Gwh+c3M1WgSNN/2K1lEYRTYtssr2f40AdHlC
         uHsFReZPH/B/Kp8TukLFo7wCe1uNM/mYQ6WF7ytBzvUsvKkaEbfKybUoOfso83GiZrwB
         IKVFF44K8YCKnB+cfIPzmQ1ZV7n8+yuZNogZActKAd2SQqijJaknglaeCJcsqFqYdCwp
         wkNtsRXx8Bc679wDhNY8NPWkVpHbdaHbK58WsZS9XhZhHfVIY4/e6yYrn/mBjV5YV2H7
         08sg==
X-Gm-Message-State: AOAM533xXKSPWjv6Tjb5HZ+yDysMO531sw/Mt9bs1Lf9oOw8/Wl9PlDW
        8rKKwrjLLGd/Ub8hc/4l4kHXxhbP081dwKonU0v6Bg==
X-Google-Smtp-Source: ABdhPJzcSl1hw+q9dkvwTMUc/KZLeW+yUu2A0bMFIP+cz29kOiNYmZhpvR1N7tvOhc4hhoQBs1CZ3idg4TnSeYxK5a4=
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr664955lfm.333.1604571953117;
 Thu, 05 Nov 2020 02:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20201009060302.6220-1-mike.looijmans@topic.nl>
In-Reply-To: <20201009060302.6220-1-mike.looijmans@topic.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:25:42 +0100
Message-ID: <CACRpkdYLDUURK5yFC5UDZ3trQ8vN4pL_0zpU_FrgfhRUXibnLQ@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mike!

thanks for your patch.

On Fri, Oct 9, 2020 at 8:03 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:

>        - nxp,pcal9535
> +      - nxp,pcal9554b
>        - nxp,pcal9555a

This triggers my OCD. Putting B before A? Please make it alphabetic.

No big deal, but...

Yours,
Linus Walleij
