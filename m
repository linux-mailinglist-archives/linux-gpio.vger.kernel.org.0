Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6CCE182DE2
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 11:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgCLKf2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 06:35:28 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35561 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgCLKf2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 06:35:28 -0400
Received: by mail-ua1-f68.google.com with SMTP id y6so1913068ual.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TrLadEtBvTVTVcBt3bopoSIgtuqLiK80lSH0hCVtfuw=;
        b=AXUrdTEbrGYI5Xa4Ju23OdXl2u4/hn8Syww7t4gl9THWvx6gPnACLJY0G+ZZnH81k3
         0qwMvbk5hWX+9SRuMreq0nve73Nc8/z7mOlf+34ddgh8XY2R9dL7WErn6ucyPRVc7wkI
         NgdjiV+vTXtpRQVWxatTxy1wc4+syToipQlg6RS97EvmbkoBdoJy4qNK3Tha1rze0oQk
         kDHLu4CEBtTmENhdb8SV65B6PgIWzXZ7jLloicG+YrtlH5NCc2CHdBGNMLPN9urYxvwK
         qb1hGaEduoyMC6FW3igtSCHds2fNMy9Om+Ws5IZdilgLlM+JTcjkxUAwM5JFIW3jTvEp
         ng3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TrLadEtBvTVTVcBt3bopoSIgtuqLiK80lSH0hCVtfuw=;
        b=ApVIrijPqrwN7z0Yq6V6MGMRCV84zzGdQzWznDhA6RzC/uFFQuwrDW1Fli8AN5a5aC
         WL8nLehaGVqDTnwsJi1rktmLK0W247G6X1Y5guFAi+BRag1Sle1t5x+mrJ7pdTeLeIH4
         mDNuXBdKTuvn6aLx2I7et2puhaaE1o8TeV/U0mR96IRrQ/wCNb8iK53dFGdZmCqmux8j
         +RyKgzS/am093HUL1vAoe2Y+gOaBfFzuETBcw+ufgQzvFKX4CK9vIqi9vcGNtUSffiHN
         7G8PshIGYamOcztqhCfMJTGTq14hUrsd+YAF254K4dV0j2Sj5x6GniawUsDPbWfZVeiS
         Meqg==
X-Gm-Message-State: ANhLgQ0lJdhpo4SxDjfiM9Gdn7exbVkfpYI3jQqVOtdQsmbji5um6d5l
        7ijoCvAU5x+QB4NZDe8hec9z8xdahpayddP4e/h3hQ==
X-Google-Smtp-Source: ADFU+vtKh6Tm1Tefnj39I5CELsyO9aID4vrqwBb2PwnEmqiy2XUQJMfPp0mRZY2GNyGTBRSRMxcIADvnaASG/aVl10s=
X-Received: by 2002:ab0:5ea9:: with SMTP id y41mr4333595uag.10.1584009327849;
 Thu, 12 Mar 2020 03:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
In-Reply-To: <20200224094158.28761-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 11:35:16 +0100
Message-ID: <CACRpkdZSooH+mXbimgT-hnaC2gO1nTi+rY7UmUhVg9bk1j+Eow@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

I'm struggling to figure out if this is the right way to count
references for gpio descriptors.

I cleared up the situation of why we don't want to add kref
to gpio_chip in the previous message: I think we got that covered.
(If I'm not wrong about it, and I am frequently wrong.)

This mail is about contrasting the suggested gpio_desc
kref with the existing managed resources, i.e. the
devm_* mechanisms.

devm_* macros are elusive because they do not use
reference counting at all.

Instead they put every devm_* requested resource with
a destruction function on a list associated with the struct
device. Functions get put on that list when we probe a
device driver, and the list is iterated and all release functions
are called when we exit .probe() with error or after calling the
optional .remove() function on the module. (More or less.)

This means anything devm_* managed lives and dies
with the device driver attaching to the device.
Documentation/driver-api/driver-model/devres.rst

If the intention of the patch is that this action is associated
with the detachment of the driver, then we are reinventing
the wheel we already invented.

E.g. to devm_* it doesn't really matter if someone else is
using a struct gpio_desc, or not, but if the current driver
is using it, it will be kept around until that driver detaches.
No reference counting needed for that.

So is this related to your problem or do I just get things
wrong?

Yours,
Linus Walleij
