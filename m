Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49441EE388
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbfKDPUc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:20:32 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45474 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfKDPUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:20:31 -0500
Received: by mail-lf1-f67.google.com with SMTP id v8so12503036lfa.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WWIcS6Kmcinpk4nazH38gksGZeb2V5O9XJjjx6H21Q8=;
        b=zc1uRzF40CpT6LkCRwwck/CCCxwcxTrBQVaJv5/aHXhXLsGWCoT60D3wxJkb0QrznY
         K54Xuuex7dbG1qBAFgp1gf4crcrXjrajNMsPHoTCOpaH93oqP2l6NpmAe128gLDaXXLg
         yzaGFREMiBKw0T8NTU9AjwlQsv9MiITfUUicI6ryR/otQbP3royH+MiBCg0UxfLbMhxc
         mzYGabnkXYbzgX0uXlqdxdijf/dy79voiwy9F/VF5G0eUCumIdOAuWdfHZRo91IoiFXH
         yIUgxMzrthfkDeLoaFN8V+/OWHmE0LrSLCmL5fxIATQWB40ZPkfE/h/vUMZK/ORTKvJx
         LAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WWIcS6Kmcinpk4nazH38gksGZeb2V5O9XJjjx6H21Q8=;
        b=jFb4x433zZ/FLNWsnvP7S7JykzL4iQES2LNf6NHzTos4aSGljTAw1xIJo5+wssVfmK
         kiKZu3YKzKqWl6dOz/sZ3PeYkXz7QLgxIK4DgHjIPIDo+FH/3r6914krXUo9p6fbp60N
         EIFisw7VDPq3E75HZeVzsh8w2ANTgpriVEIuY9jGg4mDkEaZo+6QVXg4HG1IdMZAKxsy
         e1r7MoDp8hJdyjV/lD00ZoLsTuG+rROunTPmKZOB8TZfQoP/IJfSmcF0jLTjEMpy+BW6
         ZSqnzTr+vGNd7TVFB1gNcYiRIKm3uFLIbaFDYa3UQ60ZVi+D/SGIM19jYEtTPfvIsIoy
         +YjQ==
X-Gm-Message-State: APjAAAX0LU18j2pDcP5E9Fll136W0/fHDnzTbk3m4iiJ8YnQG8qMdDsN
        ZKmMKi0gQI6O62w7rzhW/5KMlSMSt2o3vfIC5fWg+Q==
X-Google-Smtp-Source: APXvYqwPjUaJnzHm1yNiOffbukbBDzPd9LLjWB9u5Xvz7aYxG7tWRntIx7qmsDoGrfBOfmcGRICRRmKGUue7Gnrqs2g=
X-Received: by 2002:a19:ca13:: with SMTP id a19mr16886127lfg.133.1572880829843;
 Mon, 04 Nov 2019 07:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20191104001819.2300-1-chris.packham@alliedtelesis.co.nz> <20191104001819.2300-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191104001819.2300-2-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:20:17 +0100
Message-ID: <CACRpkdYnUbNJtLcLtZXcL8s_Cq64Q85pyy484J4ZvobAODLOSA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: bcm: nsp: use gpiolib infrastructure for interrupts
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 4, 2019 at 1:18 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> Use more of the gpiolib infrastructure for handling interrupts. The
> root interrupt still needs to be handled manually as it is shared with
> other peripherals on the SoC.
>
> This will allow multiple instances of this driver to be supported and
> will clean up gracefully on failure thanks to the device managed APIs.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>
> Notes:
>     Changes in v3:
>     - retain old irqchip name for ABI compatilbilty
>     - add revew from Florian
>     Changes in v2:
>     - none

Patch applied.

Yours,
Linus Walleij
