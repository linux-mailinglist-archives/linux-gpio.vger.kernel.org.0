Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B41E2CFF57
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 22:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgLEVny (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 16:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgLEVnx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 16:43:53 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45834C0613D4
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 13:43:07 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id q8so10679781ljc.12
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 13:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=700HkyTVIFp9nZiWIVsyfYqFVm65sXEMC2ghItegDYE=;
        b=YafReqCUo5/xizSfSIS3eP6fIPD2UUW2x4UkHHsy1SSLo8OE8qcD9agG/wfCEVdrAG
         SxObFlizYVZ3nb6EqQyXyKNsVjQF6A/GwwsFLTbqirAR4miX3Em8ffTq7XUGZiIe5uT0
         uxqUeG/gaUj+pmjrQsHQrtxKVaeZHzld9tPg4ZGin61fb166k92rwaWcNR4o1rN1tnwV
         7hJj3ivRoqBOwgfqvdyGFgaNMIoFzKCXO2FgHx9F7hF28iGduKGjHT7llzihQF+/dF54
         T8D/ADXwaIOUnrxzXrz3RNTCbpux8yUVY+6aXwNRnEtMGuWBO0ZcoLRT1WZE5XacEm1L
         8c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=700HkyTVIFp9nZiWIVsyfYqFVm65sXEMC2ghItegDYE=;
        b=PzWBhb/xUFZH+w7hnR/7Rfr6hK7XkzC9uzD2DI5T5rZ0wW7JGS2GBjmbnC7pg7AtEB
         jChhnSJJtQGiSj111hwlSKAoKIFnlo8PAOsucPPzRDcPyC0995m323FrH28vjjmGRbiN
         QCfWoDsgezON/B0usl26WcsGUifBXSJf21W8fK0kPAZQGIOSPtM4Vi/MH23doN+9tOxb
         WnSGEO7Yg5dWycsluAUD2EsBBhIAQ6cwPsDSHAE7PHL/ZXdRCXUokEjLEXMEYUWtAiHz
         wzPT8JFmVwfd2X8Ic7edxskpJ4jHg6J9GICrLSWZYR9f1GzUimeJkOUSJUUJ6bpDCRMR
         4P9g==
X-Gm-Message-State: AOAM530JtGZFoA+p+2wKZj8WVy+xZB0wEqN1z+gjzyZKiElmaGssVykS
        cRpu+WVT8hEgJWHdRdU6X4dypTrZ4QZbzG4CSWlYqg==
X-Google-Smtp-Source: ABdhPJxOBXULP7OBc7vXFcwbfQDybB9Vs66oJlYkEGsjHLd3VRw9w9OMx28IXZxfzQVww4oMJ5ir7VUoAimLdzmSMDU=
X-Received: by 2002:a2e:998e:: with SMTP id w14mr6262208lji.100.1607204585830;
 Sat, 05 Dec 2020 13:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 22:42:54 +0100
Message-ID: <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     SoC Team <soc@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 29, 2020 at 12:08 PM Daniel Palmer <daniel@0x0f.com> wrote:

> At the moment the MStar/SigmaStar support is only really
> capable of shell from an initramfs and not much else.
>
> Most of the interesting drivers are blocked on clock and pinctrl
> drivers and those are going to take me a little while to get cleaned
> up.
>
> Clock and pinctrl aren't needed for basic GPIO to work (all pins
> start off as GPIOs..) and it makes it possible to actually do something
> so this series adds everything that is needed for the main GPIO
> block in these chips.
>
> Changes since v3:
> - Remove unneeded "gpio-ranges-group-names" property from binding yaml.

OK finished!
Patches 1, 2 & 3 applied to the GPIO tree for v5.11.

Thanks for the good work!

Yours,
Linus Walleij
