Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB0A2C0DBB
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 15:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389187AbgKWOcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 09:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729794AbgKWOcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 09:32:07 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51742C061A4D
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 06:32:05 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id r24so7868151lfm.8
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2020 06:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CD/fQep9OsiPNeBueraAPkoryFQ/vLrFoZEixh/G32w=;
        b=B23wlcJH+h65Oy3GOsnudV95X0Xup3PY4Z8RpaKih0qYIno5amPc/+FdCSVJCj6m7U
         8U8Pc7tLOLeXQkimJ5BOKLLYdzMTmGR+/plmRepLBDr6vuYU1c4Mss1x0/fqA4+xIO5O
         DsLfCP0jzl9hGiUvhnjb9IeViXxf9lypNpl4Tx39WdghoKy/UHxw1Yl46bX4WyB592y9
         A502hG1TQCbr0E+LfKAT33rIDSzTpRb/yTlhzNJnGbqJx8uYS3ZWMfbKuP3fXYlFyH8w
         TVajzuVtjqWewR1h9+QMQrbQG6boxLL7a19eUG8WZSGhP74kfchf1B0xdIG3miKTt9Qg
         4D/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CD/fQep9OsiPNeBueraAPkoryFQ/vLrFoZEixh/G32w=;
        b=kd9unsuxbB1tCgYAQ2sfh6aL2XY+Oqal7VSWOCzwl+rxD2YMK+A/Y3YOYBoCT4gKAZ
         rL+MrVADK58Ts2tCn0KZErbb0lVuHgjyr7ylA8cNIQSgQzcCUE1EVB/pAAdZjlqu94Bl
         LuHEKNi+SeDcjItkLjPHqsxyBqYfbgKsQbZxFz7BzrcgoPI60Cx4SZbZZuNs0TJk4OvN
         8f7aWy2gFd8KV5aORDLC19m6h2B64FdIdG0T7HEHoKQypx1h/U7KuIxrtrb+1gK1FkNr
         weBFyIgLMoDEbKiomRVVl6anmTOmDIU1ZPelwjPt8E/QRaxyRGmotGWeZxZRf5HB7xht
         ZarQ==
X-Gm-Message-State: AOAM531OMeFKubjkfERlK/xrz6Z0s8eZKLd5qXXlC3vs34MGWK0KuTFO
        Vy9ABtrMqkz+FJZ1XICQmMyt2KQ4ERJoTySvGHwt0w==
X-Google-Smtp-Source: ABdhPJx3/GiTdrK6xYxnUkNa0bd9c+GF88T8obU8aOlbCwnyfO7IZEeHl3HBCCg6OK8iuW/g1BPwo3ZtShcB2FSBm3k=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr12620380lfq.585.1606141923819;
 Mon, 23 Nov 2020 06:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20201113145151.68900-1-lars.povlsen@microchip.com> <20201113145151.68900-4-lars.povlsen@microchip.com>
In-Reply-To: <20201113145151.68900-4-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 15:31:53 +0100
Message-ID: <CACRpkdaYHTTXC2gEgtCvDk9N8AqWeUyFSXyWp2aiEd97hk55fA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: sparx5: Add SGPIO devices
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 13, 2020 at 3:52 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This adds SGPIO devices for the Sparx5 SoC and configures it for the
> applicable reference boards.
>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the SoC tree for this machine.

Yours,
Linus Walleij
