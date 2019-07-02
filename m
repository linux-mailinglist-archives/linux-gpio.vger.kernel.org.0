Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC155D977
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfGCAnx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:43:53 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39117 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGCAnx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:43:53 -0400
Received: by mail-ot1-f65.google.com with SMTP id r21so31981otq.6;
        Tue, 02 Jul 2019 17:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3GdscGqh/egdkRhC/e2+dFv4bjbb+RawTDhOEItQGZY=;
        b=hQ/EHaWPZ7DY6zXD5ep3cjow9hECIwRyxvYLhtRiOBnmmGgc07CsbysXJM7KQ5D0kq
         v7RpavAzYWdsV4rP9goQoZVFa28nRw40Jrew9a5It5qe8BzaiDMBDkEvcRMbP/rnM/yt
         NZg2liIbBRDRGNSdUzeTiAmOfB2N4a2x1UM/lMkbWbIeDy0smc0cZyYT7PdOhFXCONj3
         QxE8EmaexpOpMJalIOkz8PdnU6PT3tYXOMbkI3wmqDBaV+YFYgMWfMUCQzUaku9zuh/J
         QQAJYqYW7hQ67WWIWtA3APhoa8Az1S4OShZIEyNLDXDFS9VXYk1w+EmP0cQyyLCIpKn4
         N73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3GdscGqh/egdkRhC/e2+dFv4bjbb+RawTDhOEItQGZY=;
        b=ash5rukF5M2sOvPiP0tnjYSulfJLHvA4rB/g9Un4kkK7evT6/ilyjQuSbFdLaTAnuT
         YUSt3PqKhVWTQyN6hvwlaeLZve6HQmvp11JCNm0qyEiTyg15YRJ3/2nTR5d14PBpZvQN
         y+kFhp00fGC185QKVdi3WKQSGkWQbXI2fJYhArxhqhHjpLU/JtB3favnntRDIachh7YW
         601SybL6FkmIHT9JmeWfYzVgm4S2wrtlmIRcxs36Rx1sv5EvVIIr9abOOJGyTVprS7Tu
         jKCa7Z6bOZ2dzeRJ1EP+zpy7TTUQvJjGowJGo+u0bwRJ+uzevTu+1pDsfLNqrfoydVv+
         sEBA==
X-Gm-Message-State: APjAAAW8A5bTYYcbaoarGTv+P/Nqkv/lX3awZsA3LQuG62gzwd5Beuad
        hKWk2oQahxES0i4bA4zgfU0T1/PRmrizJXXJrUBy3w==
X-Google-Smtp-Source: APXvYqxsQ6td77BH829BNXfHoHJ00hWmFYkW/r/LgoW6R6eBpVJaBoDXXEdJFK4UmadzhQd7n8KvCbYnxfBy39BYuX8=
X-Received: by 2002:a9d:226c:: with SMTP id o99mr25378901ota.42.1562111275781;
 Tue, 02 Jul 2019 16:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-12-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-12-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 01:47:44 +0200
Message-ID: <CAFBinCBg57gh1x3CKs-YrCvTD0WR2s5zVGWtycb=RGqMiQ-VgA@mail.gmail.com>
Subject: Re: [RFC/RFT v3 11/14] arm64: dts: meson-g12a: add cpus OPP table
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Neil,

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the OPP table taken from the vendor u200 and u211 DTS.
>
> The Amlogic G12A SoC seems to available in 3 types :
> - low-speed: up to 1,8GHz
> - mid-speed: up to 1,908GHz
> - high-speed: up to 2.1GHz
>
> And the S905X2 opp voltages are slightly higher than the S905D2
> OPP voltages for the low-speed table.
>
> This adds the conservative OPP table with the S905X2 higher voltages
> and the maximum low-speed OPP frequency.
have you considered all three as separate voltage tables?
you're other patches are assigning the OPP table to the CPU in the
board.dts anyways, so it's easy to use different OPP tables for
different boards
