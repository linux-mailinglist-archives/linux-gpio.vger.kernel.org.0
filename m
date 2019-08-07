Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4636C84BF8
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 14:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387433AbfHGMrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 08:47:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35636 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729408AbfHGMrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 08:47:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so85426325ljh.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 05:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lpl1se61ap+ZejSxmdOkypwlEcu3obK4BcH8VfHUlNk=;
        b=ihFrCL5lZs8ycFm7bQncDVE0s35b0Yrbkfp1SA37FaAGye1IyBnGT14EF7+Qx7mXRt
         2BUS3zczviL0HRYUu5yjIo/JXHYZCtngh156+BWpKfAyJ1PhwIHS2xBE9Xc0Xg08xD4c
         kIppNb2BwvocrFdpzbuOvMj45iKqt09auPbZaK8taxaUg4wacVnWOmXik8+JeUPx2csa
         CMXD5vn+xq/IZJyMs8/a/3owUAezmoyFrbUsr15vf3NRbEKdUEl3CrPhtYnkb+cGVZxi
         HaK16rNlm6l3cjn91eFx7N5/RvFn3nNFeAqmJ8+Am0/GuoBrn+zCVU6BIIf5bMQT73XV
         v5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lpl1se61ap+ZejSxmdOkypwlEcu3obK4BcH8VfHUlNk=;
        b=Lcd7usmcENNmS+a2PqoBaIZopYzS9TD7KF4alN/cEhZEvjsNjLSRRBWajuXft6Hy2d
         XPkFKdQFw2Oxa/panOHnaEPtMOBGdGZgVxL4Yhjk2YKGMr3fRXOyhPAtoR47rw8MNvXY
         d+L41blrekmG0C9COMQqGFquYFCY9zzQojvbKdwoQxKfLGZ+bhD8/Yp2aWEM796QCpX3
         Ss3Os+r84hsDFhy22GyB6G6C7U6xtMHR5BVBk4rSK3DwJ9o7GvO5GsifEQhcSFq/HzVN
         skJ0BjnUORHAQtpkF87vgYWY21e7ocC3+qf/TpKKHmRwAYgeGaikokxOZqHwpnHGHxjL
         odrw==
X-Gm-Message-State: APjAAAXBpf2kXDiAUdhYxauhPRhahgRwH3KbJG0hxCB3+hVaZFssNAJj
        alR6a22FoQxQjMit0lAA28FBSVK6Y/HRs48gKs7Itg==
X-Google-Smtp-Source: APXvYqzcR1NAhAYYmAXeGpoe4pLb9QvXJ3FeuUgQBsWp1dBnPcreoJqYePaBmIa0z4ZkzF9nBR7rVHvyaSC+YC/S2wM=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr4801970ljg.37.1565182035311;
 Wed, 07 Aug 2019 05:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190805101607.29811-1-miquel.raynal@bootlin.com>
In-Reply-To: <20190805101607.29811-1-miquel.raynal@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 14:47:03 +0200
Message-ID: <CACRpkdar5jE116CcywYxLR9JKWunRusJjNw7f3C0SFK4-4+dNQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] CP115 pinctrl support
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

> This is the second batch of changes (out of three) to support the brand
> new Marvell CN9130 SoCs which are made of one AP807 and one CP115.
>
> We add a new compatible (and the relevant support in the pinctrl
> driver) before the addition in batch 3/3 of CN9130 SoCs DT using it.

Waiting for review from the Mvebu maintainers.

If it takes too long just nudge me, it looks good to me.

Yours,
Linus Walleij
