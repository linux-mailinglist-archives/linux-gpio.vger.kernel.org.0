Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E3E165B68
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 11:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgBTKZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 05:25:59 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41484 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbgBTKZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 05:25:59 -0500
Received: by mail-qk1-f196.google.com with SMTP id d11so3014939qko.8
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 02:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1rjvByHZQlMhjuCjov0yod+UTGqrYRpU4C6ciuXo5jA=;
        b=CdzKYncWBcR3FH6IHEtYZ0S+4IOaHJ8BZumMqmbBM5KnI/rVVZtzcF95PvC9a4YLpE
         Umlu/ONx/RIa9VNI+7jEUtROC3vC37mEt7oDRUXC4e/5Q56CvkXZIpmeEPyITPBktM7r
         IpA/e4dXSUK7R4QRt79HUQgfaINm2xY/BSLeayOyZ6Jrt4HyvVappn8GF7mWsGhviR1/
         iBtjL0jEkDQFbsFzp4XqQ2dcAzTDCI9YHs1SDGurn3nNo6gv4jLJq/F/iK6DB5lOpSdH
         5wwaViz71p6RdAGz4t4ZHl5vyX58i5/HbEXkIfquHEBaVoLvCFdqYNHfPVwi3ww75gfH
         gYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1rjvByHZQlMhjuCjov0yod+UTGqrYRpU4C6ciuXo5jA=;
        b=nfXw3Q2vAAVPwn7cLseot3/LppapA8AKra+ts3HPjKEeJjL+DNTHJsML3H1Kg9z23/
         ulle6MHfkLd9HgGr80TEz8Kua/rIqkm6ZbD16DnNRJr3GROz7+cnl6xz+bX50WDxDPgi
         dcjAOz6TqNR5bI8zI9utCIBjG1l6Ai3su3ftxhJD4h39O1oOOe+Xj3/MjUGsCFUafY9r
         BS6Bn4NZM++oPkSr0qiL04A3b1TkjRAYm66GQEdSz/oV9ucsCkxqfk8mZODc7qCZPcG7
         4/1ZdIHKRQB9M1z9ATCB8iS5MmiCcm/lq1TBs0e5mauqUwnUSfTiYYw5+5pTIHUJbImh
         +0TA==
X-Gm-Message-State: APjAAAU+f8ADUsS3a6SZMXnbkavux10Y0s/uVpDLEpmWrm/iJI06jDGr
        PE49m11j6FyXhbQIFm4i2pDgZBKUdm71qQfM/P0Djw==
X-Google-Smtp-Source: APXvYqxR/dbvUf90qEuyfKeW+D4uBvlJHQinz1rXJBsKijjqfrR5Ujk5GurPtgBSmU/7aaiZPFsK04HuHH3vVOvHces=
X-Received: by 2002:a37:8343:: with SMTP id f64mr26249549qkd.21.1582194358643;
 Thu, 20 Feb 2020 02:25:58 -0800 (PST)
MIME-Version: 1.0
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com> <1581942793-19468-3-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1581942793-19468-3-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 Feb 2020 11:25:47 +0100
Message-ID: <CAMpxmJWi4izL5MgZ3vkE-a3e0jR3nhwUax4mSxQF-Z_r9vjLUw@mail.gmail.com>
Subject: Re: [PATCH V3 2/7] dt-bindings: gpio: Add binding for Versal gpio
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

pon., 17 lut 2020 o 13:33 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add binding for Versal binding.

Please add a short note on Versal here as well - don't worry about
duplicating commit messages: when I git blame the line and go to see
the commit that introduced it, I want to get the whole picture.

Bart
