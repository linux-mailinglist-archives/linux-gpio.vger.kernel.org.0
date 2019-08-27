Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B84549DEFF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 09:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbfH0Hq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 03:46:58 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32792 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfH0Hq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 03:46:58 -0400
Received: by mail-lf1-f68.google.com with SMTP id g9so612784lfb.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2019 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFOqKfbpfyZwn4Lyu2FeqhkpQf6JFuziIop7qSWTXvo=;
        b=o20jXDDPPvxsDErqPFhPbfNrq2zsAHXv/blUGUUzxgi9ZujS2x3dWAXkVTJkZvSiRp
         XLQYJ7cS5xAsRz9QN5DVVevEEPm26i/0CDuG/bH+j0WidzzWVNm0GhjLFyUPOgmrYO/I
         d0Vj52vxskMPnsYGqKcvsL0A08TxjsahAWGQR4FPYo3EasGLcyzAbeIh6v/tZj5iEoOQ
         6dsrGi1rLGZQLzn38pc2y8nOUx8Lea9k+lhUEt/HKQ9lqrfux/gx5pPdZYOvDlpS7a+w
         P8BmixbZNLImDZeI1aWMxY+C0H1waPmA4soCZRh42waMFt94rl1RNwb62jC4CFsKfcrF
         RBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFOqKfbpfyZwn4Lyu2FeqhkpQf6JFuziIop7qSWTXvo=;
        b=bBKmrmQR6AXPTMOjBhKQi9SKKjTLvGYtKUr+WBPamWJNyqEIxsTVCmm9D472lgnTAd
         FFb232t8Cu+P2eUQV6VO3fxc0eBL+gx2sVbQK9pD7fGRqutYsV5mllQe6mMQKE/js2PY
         H2B8uxkQaETUsUO1mffZL6aCrp0NGoHSHBuLxLFlsuM6sK6Ilg/7c6U3unlKvA8haT5Q
         PTrc2KWdzoizxOv5ubXxPf+5/agcrjWqD890gaYnW9p4BvR/Ybv3g57TWffcA0dV2/qo
         ZTq9HHxu8cy19Giazhz9bBMF3vf1c3u7DAx5Ta8KGwEDhrlt3kEUN0MlVI1/oJcJCVja
         H8hQ==
X-Gm-Message-State: APjAAAXhmXtSjR2K9QoPGFhk35E/Oc7vYgJtgMxE4KF7huXi5xX26cIH
        59kUDoJlWf01bZ24zuwSXXZCoYnbBt/ZMl8Y0hJqUw==
X-Google-Smtp-Source: APXvYqxixoiN4Btq5D4VdRTz8xdDlhBGXd+FvALGAPeghizFIx2u8ZlMTzyPN6AT9HwLGk6zEvIAWZ7sUfdYixXZlD4=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr13672672lfi.115.1566892016527;
 Tue, 27 Aug 2019 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190805101607.29811-1-miquel.raynal@bootlin.com> <20190805101607.29811-3-miquel.raynal@bootlin.com>
In-Reply-To: <20190805101607.29811-3-miquel.raynal@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 27 Aug 2019 09:46:45 +0200
Message-ID: <CACRpkdb4m9RJ_e_ykWu2-FEOXP3X3K04TX5nPFjo482iY15j+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: cp110: document the new CP115 pinctrl compatible
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 5, 2019 at 12:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Grzegorz Jaszczyk <jaz@semihalf.com>
>
> A new compatible is going to be used for Armada CP115 pinctrl block,
> document it.
>
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> [<miquel.raynal@bootlin.com>: split the documentation out of the
> driver commit]
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
