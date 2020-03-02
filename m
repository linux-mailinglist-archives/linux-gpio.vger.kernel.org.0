Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F5A175623
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 09:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgCBImd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 03:42:33 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42318 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgCBImc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 03:42:32 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so10742279ljl.9
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2020 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g29XyuwOKIs/sEqqYbL4oYNrFf9RHLiVPNCz/UCehWQ=;
        b=e/pUlbcQmcm0oyU3Y02zwylI4JrIeXc779uRry4j8hsXzctEL1xDwKZ72PpcJERVpR
         JMdOrU3ejtO0UqlSL4L7q72XGFWKL6mCkYBaz191Astmalsh4dpNWXmfq82ObYeNs4xE
         LaSyWROJ/uo9K3VFd//AHUI+H7f8SJJaxM4uCpmgB0Nn9Isw5WsIKHNUQvYaiHli7v0H
         12bebEYKkd04dwjWcG2JCGtlj3x3g2qpMBT/3cWbQSHNBZCgZ+1tx1MAF7BJc8u05UJR
         Xa9qrJfOfzPWu8FlGhcWZrNSYhC3knLoUA6Uuo0Q0LXre0ggFjj1RFTyNtJoj+PJZPp9
         9Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g29XyuwOKIs/sEqqYbL4oYNrFf9RHLiVPNCz/UCehWQ=;
        b=ntw1cw3DSvLz+QZ3NK6zdm6vaEjcdK/4c03z5yr/Ix1L6ZlKUUNka+2Z2YKlKGsCGH
         fEFsMkarr4xyqD77N04OrCn7U4H7J3wP5/riA7Xuk97i/9a8/slV/nZQlxrIwnmfO1xZ
         79a6bBNXd3+NOAqLdZHh+DbESbKALa0riVXD/v50XSeDyMS+pYHzKMbHxuJ8cFaHGd3E
         x1ObZXqUeEpdosWzGEuxTIJEGO7sdgydH/GK+ho6bAnZ0DV+Lzxn0/9c1bLqafy1XSxF
         /56ydivrYrhnwhv+FSu9gwFTnQsrMXWVwCGdUQpRCOFE8asx+faOc32GBzNDsAkn9rGl
         Xh0w==
X-Gm-Message-State: ANhLgQ0S8iDpydSVLxS4XBfuaEWS1Dzw56R9Je34ipnP5zreX4AP/tBt
        icxMNdxI+Q4STTQQRRv42iJniYF+cozSPRDfPeyoLw==
X-Google-Smtp-Source: ADFU+vt1Kci8gmkDhxlBgMDvyCvVWOL0VcOHJ/mrOCVqKw9mApHmYjif5ezTZ7tN8fRIiZstU7VWpvTxnPc4wH/TCqM=
X-Received: by 2002:a05:651c:2049:: with SMTP id t9mr10777873ljo.39.1583138550738;
 Mon, 02 Mar 2020 00:42:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582913973.git.hns@goldelico.com> <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
In-Reply-To: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Mar 2020 09:42:19 +0100
Message-ID: <CACRpkdaP59S1uzGVKTHkJAyv_jSs6GQY1KBxgfrvmPq2c74iGg@mail.gmail.com>
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> From: Paul Boddie <paul@boddie.org.uk>
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch applied to the pinctrl tree, it should be fine to merge the rest
of the patches in another tree since there are no compile-time
dependencies.

Yours,
Linus Walleij
