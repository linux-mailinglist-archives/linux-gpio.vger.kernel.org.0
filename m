Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59309DF07
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 09:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbfH0Hs0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 03:48:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34508 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728726AbfH0HsZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 03:48:25 -0400
Received: by mail-lf1-f66.google.com with SMTP id z21so5890251lfe.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2019 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aveC+J0Emg70L/B1CFCLvjS1bg6ZD6IQEoHlPzidU2A=;
        b=bW88/I9JXEKxT3chuNfwZrt8FeUG3zWSuZesoGgtpHpXTLtbJOFd/DU/mBh+W6VzSs
         by9Ao2XxYZ9uGyUmg0K8e53M3Yjs7NJ83vm5SaDncrWKNB9TqgHG22+Q0en4/i9wwH3x
         6PpT4b05IFeJWKYyyD2rVraNSspG3sv0/ZZfijfhd1RNco5hpGRnKqV5+N5yrdg25YgJ
         Bnb0WDlUcF0y5leW8CpioPlFc+sB5i6orfMKIUJ0/2PPla7H9UoWPpMlMW+SfRtEoKFo
         Xcj+RfMC7SQIPLPXDMkc8/XM8x18LlxuVRuYvC7023xhmnsoFHKXM6T9rABZhapzB5P0
         T3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aveC+J0Emg70L/B1CFCLvjS1bg6ZD6IQEoHlPzidU2A=;
        b=RFZ+/B3EX5SrTZLCFC9vi2eZOgG1/3FK8i27dBwf0365xOiWCX7JVrXjuMj1/X6CkO
         JWOWGLq+r9jgNI+IeUBWfW4VG6HnQvl/wE/6gxPurJaobjb9LchrK/bErtC7PH3XWm2C
         K9T29QvdUC2YvTCryxywztN9pknh6A95+00pgiyRzRqMPv2tHGX0eW39zbN1t6YkbMFQ
         LcyENjpOsmUhd1omZM43jmuu0NKD6C58hcmV15fGNbLu6H0yiYURJiBatc8HbTOdjS4C
         mT5sreDh3YBzmB6ThMmJZ+0SM7rLxYw9BE5eof1+tngNcrAtMwPiG5ttSmoRdxrwmjPs
         2JiQ==
X-Gm-Message-State: APjAAAWrfk00xxsOu23Koc4m0gyz4g9A72NzObIeFOTOtekBQ98NOap7
        K9w6AX0JqX0WFmZYyOY242/5wCOYAIyWan2qQEQjJQ==
X-Google-Smtp-Source: APXvYqy92ggM9A9QQ39Z/XAAwL5t1r1hkGmphw6DxMCCSZvgAh3WXo6lhfeAobnylDIIR5NiUXp+qWcOMrVSnuSl9Uc=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr14124035lfn.60.1566892103825;
 Tue, 27 Aug 2019 00:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190805101607.29811-1-miquel.raynal@bootlin.com> <20190805101607.29811-2-miquel.raynal@bootlin.com>
In-Reply-To: <20190805101607.29811-2-miquel.raynal@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 27 Aug 2019 09:48:12 +0200
Message-ID: <CACRpkdbHvCUF1zkMUEcQJPmb=V8VudhU-JN+M0fRZ0tyA28Htw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mvebu: Add CP110 missing pin functionality
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
        Yan Markman <ymarkman@marvell.com>,
        Konstantin Porotchkin <kostap@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 5, 2019 at 12:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Konstantin Porotchkin <kostap@marvell.com>
>
> Add missing definition for function 0xe on CP-110 MPP-62.
> The pin function is Data Strobe for SDIO interface.
>
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied.

Yours,
Linus Walleij
