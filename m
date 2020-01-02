Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB36E12E997
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2020 18:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgABRz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jan 2020 12:55:56 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40618 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgABRzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2020 12:55:53 -0500
Received: by mail-qk1-f193.google.com with SMTP id c17so31942275qkg.7
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2020 09:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VvBGSQnAvkp/z9KIA70+zCZk+7dfOwKatcr0yFpfC/A=;
        b=XlJSSg0PEd9Gwmxem87SMKsdC8/nyuwJgJetjj+6wVGVCnKrWFyeFioR7mYgpQavrM
         e0QUGQOff54lsBTdbtLjAY0Zmbt5jVxbxXT1vFtQuK5lNshrEwoMZs03ZLhXY1uDYCS3
         pdTIs+x8Y//CNgCZvlQgQYKsUP2clxzBxg17R4GBbXXWM9etsIyhUePTVXUtcIVGnyL0
         dciGDiEHy+22i0FIpVLIyx2U0ga23gxv+VDL0hPYu5Laf2hseSFlRhnV6jwnFVWLgvgN
         3+JU/Cplv3wj4GGb1yOf+AwzY2bj+sBw3BmodXdGCcX/kP7XlX6jAE0apst0m0N6Sn2n
         kRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VvBGSQnAvkp/z9KIA70+zCZk+7dfOwKatcr0yFpfC/A=;
        b=XhZVYV6iwqkcvKNnHRqOB9ekvt9RTP+SVOlt3qULeBGMrta3nz1WkXCvWi6u94ogTd
         rKTFm9Dut9PV2wId1SKB3aUmlvejcVLjEuuogNbm6oSoFriNfLJt8XVwMat2URr4/geb
         wF1iaPhOqvkxkai1AOy8rYathEIOh1JABYZGIjbMwGh8Z+jm2rJn+Ek/FFY1i1KVzjjN
         H9ExUGAzxJLcfHF+zMaXyAcH6XpTwBl1ZtC0fLPB3GVrps8JMXmCvzCAhb9ke4Qzl2AI
         MOZQ9exSbqeycglkChAuZi1DLABRSu8DBv+Gd2jmw5cPL7TqNC4uY9BRlhBDjFNVG2BW
         mhpQ==
X-Gm-Message-State: APjAAAWJxiHG0KUPMrbgu2oeL7xI20sVbR8xORrmNoiKlmTP3EnQWYxA
        mDxHXshTA43LjATmruQ1Lvm2m6rkMLMaVxQ+pTxWuw==
X-Google-Smtp-Source: APXvYqwIJ8jhqb3Pxo1nnqStMC/FyAlTk/mLSjRyqYHHLaEk1gII8LrtnY8U8YO2gxgz8yVgYmIVIJ8eoCcUZqkXdhg=
X-Received: by 2002:a37:6255:: with SMTP id w82mr68484592qkb.330.1577987752601;
 Thu, 02 Jan 2020 09:55:52 -0800 (PST)
MIME-Version: 1.0
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com> <1577362338-28744-8-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1577362338-28744-8-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 2 Jan 2020 18:55:41 +0100
Message-ID: <CAMpxmJUgALt6K2m2iAtR9xhkFaDDyESpjqu11EivK-ottVuZLQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: zynq: Add pmc gpio support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 26 gru 2019 o 13:12 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add PMC gpio support.

Again: please provide some background on what PMC is.

Bart

> Only bank 0,1, 3 and 4 are connected to the multiplexed Input output
> pins. Bank 0 and 1 to mio and bank 3 and 4 to extended multiplexed input
> output pins.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
