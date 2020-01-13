Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49AC1139AC7
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jan 2020 21:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgAMUeT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jan 2020 15:34:19 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36104 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbgAMUeT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jan 2020 15:34:19 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so11671797ljg.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jan 2020 12:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L5btG8+rDtVkHFSsWTVsc0YN5eY7jgmCtlCqNwE1Iys=;
        b=N2PrwOAdsbaBW3XZzD4fjuiU0y1qsP6DSHHfbXBeiVSodYZAmT4Pj+fQBtVT0bgt+Z
         YeA1QyTXs0lKv5AcCOtdvCsLoI1bxHcPYIh+qNvvaohu4ga5ktE/YhmQq3umz+b+RPgd
         yFmcIw+Mc/fyLDB5qabO+mtE6exPsL3D2t4m513tZbEz6u8nvVj48gxyLWv/uVK92R1I
         lgnBlrkSLTKceAD3xy6fBfpSk7hoDseJA1OHaSHJMS0lR6TPNwq4Q0JCZf7NfKtexs5v
         tlBoXN+i5VEOeEQURjIjx8i2Zil8UTf2L/L0QKC2jTZahnS7FkTr6tJMDRRB1qSBN8UO
         92VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L5btG8+rDtVkHFSsWTVsc0YN5eY7jgmCtlCqNwE1Iys=;
        b=MUzHrpw8rqTDj0GoIfPENshfPlhAn3eeZ9CQqpxiKvx2zSWNDofY11aDvjagqS4+Ub
         sXORZtdZZP1jkKpzkgMx6rMLqjROmnTOw3aJpHbG72/Jhkdi2spETaU+Po2M/WDb+yDJ
         iZArSvNV1Yh9c0HT1xRxCa7GjwEIaWIsTt1EUV3YeO5BgW+Zo/2ElfjPUb/3R9AFqIlk
         0ardklq4rAvQO3eogpreLpRVkj1ZwoeqlDxydFUYAe5RVd4spdwka+9c3gNakw6PNN78
         8EwadIMYEk3Ljk+MTGCoxzgItx8u05npotoR6UIRw5E0KGNxw/FkCf76MerDzh6Vsc9n
         zVEw==
X-Gm-Message-State: APjAAAV+NsooN82y/VL+LmLwfYJW6YpxsLs/GGAz7wPWs9Ui2BoYe2LJ
        wiDpxbWSjv0CslT1LJ3t/wC4BLx5MhehdGmWZdS+QA==
X-Google-Smtp-Source: APXvYqy+h3uYVoEzWBBQzoSiJFi+QF3mEdOYnavTCKS59kG2E1X+rTKCRiOgNC7GE/c0qcOMwRXUKAR5syrQRB9414g=
X-Received: by 2002:a2e:3609:: with SMTP id d9mr11389552lja.188.1578947657486;
 Mon, 13 Jan 2020 12:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20200108104746.1765-1-m.felsch@pengutronix.de> <20200108104746.1765-2-m.felsch@pengutronix.de>
In-Reply-To: <20200108104746.1765-2-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Jan 2020 21:34:05 +0100
Message-ID: <CACRpkdZYzjcq3+NwSHL3pFVjo4ZugJjDKcjVGePUtmZ3OqCw9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: da9062: add gpio bindings
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 8, 2020 at 11:48 AM Marco Felsch <m.felsch@pengutronix.de> wrote:

> Add gpio device documentation to make the da9062 gpios available for
> users.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
