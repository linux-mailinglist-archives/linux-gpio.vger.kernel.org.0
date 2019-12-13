Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0927D11DFDD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 09:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLMIuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 03:50:25 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36647 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfLMIuZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 03:50:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so1766912ljg.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TGgb7xwhgScP+ifEx1vNfgq3tAn8rJOgb6ry9uS20cg=;
        b=objkV4PXcaGRC6MoR4cG6/mR3b7u4z4WM27nfvbBbflWIhpPa3OynS9PUftR8Nr+ew
         sxCoFCqJgdnn6bpGCn55nFrbny6jIIsNv4BW3i35xkjO4pzLHdA8iC4FNOEPSUXevV+N
         4BwBCXxATa6J6IozF42yIxaqT5pbGofnLs3cYsfbhBUa+DYIhmmL0DgKTMgfvWStB5zV
         Y5XceQ7TXee3FiW3dEO6vup+elwX5Um9TB7F87XzcHc5bN2XyiOarGKkwiDwdBuV82XD
         ULFNA9F16xN1LPVPs0Lqmbx1BWk5pDfDUbORtYvkAcNH8KUX0XvKn7CzrCrLu0P4ZlAy
         cpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGgb7xwhgScP+ifEx1vNfgq3tAn8rJOgb6ry9uS20cg=;
        b=AoUMtkr7zUOAL8+BYGVlpJUfTq5QPL/U/EveN3pKebBzpnAw6hEG5klvGoDZWUj8wN
         YizxivXWKqWByKKeuC94BdYkXhDv9lDIYgpw3u1yAf10HJYAlRC/CG2/osgaDVkfuXXm
         puVq6GvFz+lvTx1GV1xST0nXLPVfVWj8LzCS2N9h1uMVeFKTW6uUBT31aRWBgDaqcVL7
         j30/NZpiGPRfHG2/1jcxr4UaaFb51mCWnKLGQavrUkl+nM7M6opoxKsP7Ccj3itM000n
         +o15Plg1On1ymSjLrWJhuC811Onildq4kuOvNEn1kulB/er30JDmVDh57GDhMX8Q0Aaw
         PgHg==
X-Gm-Message-State: APjAAAXDXwJklAPocF0XisUAjPdyKL++Qp5YCtUf0rGcXqwZ7gTwc9UT
        O1D6fSztnHuXuP7S6uvoXyuvhzrSjjTeP0Y53SAhsA==
X-Google-Smtp-Source: APXvYqz2zgNPGMAvQfaiNvHxpSznCX04/tg0GeCVZSPwo2H7kSuIfZUvu+UYZEXnmdu9PEj35q7sRN9F/PMLgxMgiuk=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr8733783ljg.251.1576227022964;
 Fri, 13 Dec 2019 00:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com> <20191203141243.251058-4-paul.kocialkowski@bootlin.com>
In-Reply-To: <20191203141243.251058-4-paul.kocialkowski@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 09:50:11 +0100
Message-ID: <CACRpkdZjZjP4WM26tpjFiitrxHkVGPtpAOe5odhqw5QqRQvZ1g@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 3, 2019 at 3:13 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:

> The Xylon LogiCVC display controller exports some GPIOs, which are
> exposed as a separate entity.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
