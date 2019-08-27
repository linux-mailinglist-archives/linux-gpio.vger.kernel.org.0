Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE719DF13
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2019 09:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfH0HuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Aug 2019 03:50:05 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42029 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfH0HuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Aug 2019 03:50:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id u13so4482789lfm.9
        for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2019 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8ZPnzIzwp3dPl5EFI/1g9MYzH1aSuoZopYt/nP5q80=;
        b=YNYgBIyRPbSylY9yVS6fq7ufI5mIEOPQwSSIxhWCaFS6EppIOFX8+8R3WzVvbsdkTv
         0dWBrvkU8dkIYNTLDM2+P2zpmD8+2MUTxYM2RjmAc42BnPuE9BL/yzqmzDc3E8Gsjszv
         cWYnPdPljPLcBHEjO8obgZBS70w3HCWfiXX3HGC4cJjgpMtMuDJjpczks4lFG791PBtV
         OVukTj/HICDHCW/KSGHs8dxdAfWwx5Xk2wwm5oq4OgeRMFgsG0XIx6C80ajP5JtnKehu
         b/wAdpEeVxeMZBbi7rqbmOEshVQT9D38kWNcrF/+w+jQ9Qy2pagW/3OWXzrlaqjGcyhb
         c+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8ZPnzIzwp3dPl5EFI/1g9MYzH1aSuoZopYt/nP5q80=;
        b=AcdExNJT3mcIIfNDKuqUstsfy4l75gM2LLI6mABT2BKVxL84UJx2wG/W3enXGSX2Iz
         Nncg2AspkuMylPnYMe+thVKRO98mMDUanUBjfySpBQo1VaZ3YJ+NfHNYpyzSFaVX33/t
         H0EotiTWXCW3ts1yojjXDxjw1I1WSNW2ZvfqLtWy6awr1s+TnHCpkfzP6tk2GM1ExZmY
         4dTRHl9FmXF0UCbmCbrrVaQRDyDUQcgnaSpwwa5zSEHZ4KwX9y4mIhmZXuOqGzuF/SLg
         Rkg9uTdug4vz14Rd57issNT+p9SYD5GHifW+dSrsot/WfXvm7PFiefHEtxMtIR1GI2By
         jU0Q==
X-Gm-Message-State: APjAAAUZ5/xqAo9Hx95GiG+XCmOqN5dy4UByqsrHXN9EwijZvOIBtTCp
        zAkCcVwSttJbqmIKKl46rdC0DGKoKxXJo8dyOu6eEw==
X-Google-Smtp-Source: APXvYqxQ5kTmN/fXTcZ+sapT/n4YUo9Fiby1B6bZg0qbOjRVjoB/nX0hNjZmjRwzPSP63fisdzPHEwGUuyid++LnJyU=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr13681194lfi.115.1566892202913;
 Tue, 27 Aug 2019 00:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190805101607.29811-1-miquel.raynal@bootlin.com> <20190805101607.29811-4-miquel.raynal@bootlin.com>
In-Reply-To: <20190805101607.29811-4-miquel.raynal@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 27 Aug 2019 09:49:51 +0200
Message-ID: <CACRpkdbaQjPeDKhaP75aOGtnXEf6DVVmUAdxbAP8PLSAJPSdAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: mvebu: add additional variant for standalone CP115
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
> With CP115 standalone modules, all MPP configuration are
> possible. Handle this new possibility thanks to the new
> "marvell,cp115-standalone-pinctrl" compatible property.
>
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> [<miquel.raynal@bootlin.com>: mention the new compatible in the
> commit log]
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Patch applied.

Yours,
Linus Walleij
