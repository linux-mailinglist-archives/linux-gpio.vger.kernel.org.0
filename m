Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C7111E00A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 09:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbfLMI7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 03:59:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44572 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfLMI7X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 03:59:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19so1749969lji.11
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 00:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=neDwLTAD9jZBzNHCTpQNXqb55Q19dpVUnqxtm4qngC4=;
        b=vxcn/yQJtKa3gJABcbwws+zsCvWydlc4hiIlN9oHnNaSKTpm0zNd3gpSZO5lShK4Lz
         7ySxoBZZGyT5IiZTF3DrIFpn/9WuEgc0UolRO7BMf9GXSrO5NI07h63FPaW4jxPCtWOB
         I6SnDaSDk7AnavpFEBYYFZBUwEDPcQKoDKB3wp/iAv/UC2ql2i548auPCoNPhWAInw0I
         +tyTHKlU29ssg/GMIwqe/VMfmRUjcRPrtFbovPdBY4g84ap+mKqX6vsx2uC9nZQs0pP/
         MqyAg7GtGxi9QH3iQGXuAmmorV5vGfdgh/zqtwbWfmk9c2rI8MKy4OSuTlOREaAvuZdb
         2qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=neDwLTAD9jZBzNHCTpQNXqb55Q19dpVUnqxtm4qngC4=;
        b=aGBPmXZcMNRKtKqnA3Gg2qWILCQd03sfiQMRaUu9gJ76W/Ynm2WiYhQuQN2doVLQYJ
         97hiZowI6w5MHH2/Owqzn0qUPqSyVNR+OuhTYuNXpcYGCg/bx4iICwLJ5PKHvd8Vv8AN
         IPNfq4XuCyVQgpA1p3NxLrxJQKZaIebAcCQMIBzcAewoS23mn54igxpJRnHa9FjseD0r
         P0zFP+sf+fE/ELLd6186iMvm8XmDQHGoaKDkNW/KlZisWcSP4+bNUkmobnpHnokSJxGb
         S+I4zA7tNo2BaWFcHxH+b/pChxJXIYkAZaYVJqIeMKD6108BGqO667JGwgr/7xY26CUV
         5ZJA==
X-Gm-Message-State: APjAAAW/psCj3AxoYU2quCPDF0V/5FeeLshqDepw2mEriErauX03oQOp
        zeUmRDgjZzLq+RLsaOEWY5oMEMZIBZSbycc7U/Yo33YXRsY=
X-Google-Smtp-Source: APXvYqwZVnxTaJNmp0/febncjlgk6iuHq5jonrer+d7mi78Ma4GA9yOu/5k0S1c8VDfcEAJynShMKVgq8xK7fsF7R/k=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr8447089ljh.42.1576227561359;
 Fri, 13 Dec 2019 00:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-1-cleger@kalray.eu>
In-Reply-To: <20191204101042.4275-1-cleger@kalray.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:59:10 +0100
Message-ID: <CACRpkdbHGitYzwVEVYLUmaE+Qn0ix1O1bOSjoTJomf+h9b4+rg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add pinctrl support for dwapb gpio driver
To:     Clement Leger <cleger@kalray.eu>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 11:10 AM Clement Leger <cleger@kalray.eu> wrote:

> Synopsys DWAPB IP includes support for pin control. This control is basic
> and allows to switch between a hardware and a software function.
> Software function is when driving GPIOs from IP and hardware is controlled
> by external signals.
> This serie export necessary interface to be able to move the driver to
> pinctrl folder and then implement the pinctrl support which is based on the
> digicolor driver. The idea is to avoid hardcoding pins in driver since
> this IP is a generic one available on multiple SoC.

The overall approach is correct, just tidy up the patch series the
way indicated by Andy and we can probably proceed efficiently with
this. I will review the patch adding the pinctrl interfaces separately.

Yours,
Linus Walleij
