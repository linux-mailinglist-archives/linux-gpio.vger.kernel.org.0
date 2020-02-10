Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 761941573C0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 12:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBJL5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 06:57:02 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46201 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJL5C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 06:57:02 -0500
Received: by mail-lj1-f195.google.com with SMTP id x14so6760852ljd.13
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 03:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lW583paiCfpMgRiEXdM9EN51KZZBUiLdOFWRhHxfZ8=;
        b=RmimTSDq5DxQ+5f2ia+swXigpIwk4ASfYdFmoPoewCpLkxiRq9vZNSRSNqE0T9bPru
         Lt9pzdUR1LJ60sggW6GHZzTCbmzVucwpCpVtma9ZT330C8aCNevDCy/63GC4limP3NPE
         Uz7Y3ej9h/YoGfr9jH+TSw/9/Yq84a6dW+wMk3YP5sqgojyFLq2kS9ABFqqSmBvdZjMn
         ceac84eqoh5MrGp61IKcTfsrJxxhnbfXamnXZPtj+h7tSi9iTz2ZlSY/v9IktfpF3ILS
         6PfEQ666udYc6On/D3s3NsoCfYh4eHU5hWoqUt1+NuhpoE3GGpgvOab568vxOPgVw0bU
         wALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lW583paiCfpMgRiEXdM9EN51KZZBUiLdOFWRhHxfZ8=;
        b=DW7p5F/lBDtUq1zEXxZ7dqWNNdJ2OBcMev4XPb35kwZRZWiuwWtYMELasCT9R9jytn
         m+Mk+i9dbFrMFibIWcy3iHOpwwgnMpPTvtGNbXrWDl/iHxHwezdwh970HmpW6ActrUll
         8lGe2tYIG3DJGbzpDjDcORjNBsCeBl9lyDIMgeAA3apYqP8CV051hd7WC3XwvIvtpUHb
         TK77R1CmMqjRWDl2Tt1wZHydyT4MnkpDjO4hGLt6yLHac27YjB1CkeuF+FsX4YcSz+jj
         ZzQeoCLPhvn8VrOR5Tnw35h6/Qe5Evh7X4ozOw9fwM2kW6FA8O9ZZQ4QqWu24aXrNjzf
         rd/A==
X-Gm-Message-State: APjAAAXMZYbHncQGFYvpwH4XgVa1YkzhynkmibZDAxpW60F025qm0ZJF
        XBGbAd3CD2eff9F48a+FUvvjfADnpf1DTxs0LmYtSg==
X-Google-Smtp-Source: APXvYqyeynsCryhHLjUusAVm+uu5NgPhXJOsDtgV4PdLet2swVT6jubwwMkukZ7jnNKOSQ5kxjqdywwJD+jIEsUFor4=
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr678667ljo.125.1581335819023;
 Mon, 10 Feb 2020 03:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20200204171838.GJ10400@smile.fi.intel.com>
In-Reply-To: <20200204171838.GJ10400@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 12:56:48 +0100
Message-ID: <CACRpkdbHNsruBbvnLpAhLHvYvY55VTaVWdi1YzomB61zGGKzyg@mail.gmail.com>
Subject: Re: Avoid kernel.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 4, 2020 at 6:18 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> I started cleaning up kernel.h mess and noticed that GPIO subsystem headers are
> highly utilize kernel.h. Can we get rid of kernel.h inclusion in this cycle?

Yeah patches welcome :) I might not have the time to fix it myself.

Yours,
Linus Walleij
