Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A98815CC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHEJrD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:47:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39797 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJrD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:47:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so78682570ljh.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8sk9UOgMv74Tq8gh4EKPMGREgjW17F3amqWf2s9aNUw=;
        b=yB8AakaIO5UMqTrX8xWBHYgSmDk2KP/XFlvu2es0aKDB9pu2yzjvUa46AQwppw7xyN
         heYgDloKMQeXAuosc2Lsr4qXk6frDb+/5X1ExPUf1WbFz89VsrRPsDcpb+4YBFFeyOX3
         Jv8nYfAhcQwjMDol/bp8sNdDvuaStvyRXn3zwj6/3MFzTOfIIxRalFt8CgXviBPcsCt+
         c61RyO11IP73jnwyAJuZCK9FHxJrvYZiBYFTFf9eN2tfjtKrYy100Ox8q6io5bJ3Va+6
         B9+JkQMUNYbR8lIIoylT8/ZB90SHikhAMt5FsmlYILNdVPbUOsHGbVJ7Tsr83jpd+5K9
         Y1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8sk9UOgMv74Tq8gh4EKPMGREgjW17F3amqWf2s9aNUw=;
        b=JrU+OcICTVhPImpj//vpUKulzPflTM1QPGTkHe4SbvACQLG5Msrq1T96nvr81Y7whq
         PuuuzS5aCf16V7ZFzKSnavzXcVq/s+EebD4aT/vFOS3Yi5Sl1MWCYBPbrVGi6B9EvG05
         1k3f/weHM9zpdPLiN1NCq31Q3NeSJnUZ513EhS2qycoN5QdUkSv5Y1GFADyzlCBc5New
         wHDvzjDIMDG4dXzyqF6hDxVyilqJHb3V9jh0oBa7oVhTL7kNRwEp2vED6jCoaPjFbKc3
         907MDkPLDT0Z/VF3Sx/8M9UNTNFMDtr4NXV1fH5kqFM/+UJDw73PTiU7vH2P2om9by+A
         o7hA==
X-Gm-Message-State: APjAAAWia30dM73BT6HwwhMarS+vcTAqHIAtybyUG2BcfUQsq4E8x5TR
        /HrTk4YHn5W84VrVkhX2IQF6/FH53HyVNZ7t95R2ZA==
X-Google-Smtp-Source: APXvYqyFl1EA8loWE7X1w/AzTmOWs5+Req3DzUwuE5I6qw0esXwcWASW8Ie1KZBiYlMGfd5wUqKfSoM0R3v4x6jBYDA=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr29455646ljc.28.1564998421666;
 Mon, 05 Aug 2019 02:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190722091015.20884-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722091015.20884-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:46:49 +0200
Message-ID: <CACRpkda9FjDmvC2XQJeJrvHJFSWofKNp22aVP-h7ZGApsZAS6Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: madera: Use local copy of pdata
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:10 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> A local copy of the pdata exists and it should be used rather than
> pulling a fresh copy.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
