Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B381277EE4
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2019 11:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfG1J6V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 05:58:21 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38107 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726082AbfG1J6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 05:58:20 -0400
Received: by mail-lf1-f66.google.com with SMTP id h28so39925206lfj.5
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MsmPMvNEdE/+CaVmYals2fkAWGS05U+0XvqfczgdYk=;
        b=A6H4EHb8owjFLAmKtesVsURGlBcOtedOZD/gLWYQNFMKoBLwC8v2vbQfldC0DEmrYl
         hWo0zkZug78OOqK/4hUNIt5DsYh+NYzgL4Wd9/WlLRhAIz0XYj40tXcCE5R6QHx8AF7i
         P6Fvp0OxMlvf903kOBluhhMRSHRzgc08RiA+xkXzDyFImbweOayL+NpH8I+GzZmkCdgk
         Ni28XajAAMGQ1BBsTuueBo61kmVZP1EKeCilxCsgS227ubB2uxaZ7xRqec1ZkJOpqeIG
         hlnIpBAs3pjzp4MX816L966bHH+9p6OShIOBDzBdFUFbpOJ1guZWBjyyl92r6/bYOiuX
         GFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MsmPMvNEdE/+CaVmYals2fkAWGS05U+0XvqfczgdYk=;
        b=DOH8rK0syMDXTSgfZoF8fXsArFrlT++Sho8syLZr9xMycS7GceT9KEKsnr/f0UwHK9
         j5p7gpQP9vmMYl2O1ufPR2X+lR/PdtpHTQQSJoJrziYQZZIkQmuFPZy63okW0UwwJ7SF
         0zqFf03URu7Y0jbrqo8dIJWGib3qxufbdnoKkQlYU7SKWjZXlZ9EHZ/3r+I3/6zsPlDR
         rsDasroh4fwxV4PFYSEDFpMJ1bALhR401ATVEivIda/dB1tNvExRgK5mhlm7qUvzaX54
         N4NWnQ2pCDu47086B+oc612+jMDRbjtGVFvU/Wc3CptMUhsSyv1ift1irwPAAYIwTjyU
         qa4A==
X-Gm-Message-State: APjAAAXuhFQV2zimkkfbReqELy+ED7MPrFfHzZer7TZU4C7hVRxBSrYi
        jPlMA+jgKV+/SPZj3R0LKu2aMA0+fsBRVIET1DjNZhkE
X-Google-Smtp-Source: APXvYqwYDUarIwiPKZLRBIOPqr92S5R7alFFIKPFZUs1D/w/qhFPEXKDMDmZd4l3F25HBwhvAoAJ3cGaJQcEgr9G+3Y=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr44730714lfg.152.1564307898402;
 Sun, 28 Jul 2019 02:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190626093418.6263-1-linus.walleij@linaro.org>
In-Reply-To: <20190626093418.6263-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 11:58:07 +0200
Message-ID: <CACRpkdZopsThNSzaYfWg0C2mNwYHDqJu+8pjhTOjaKydkQWWow@mail.gmail.com>
Subject: Re: [PATCH] unicore: Drop pointless include
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 11:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> I can't see why this file includes <linux/gpio.h>, it is not
> using any of the interfaces. Lots of things are named "gpio"
> in the file but it is an irqchip driver and has nothing to
> do with the GPIO interfaces.
>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
