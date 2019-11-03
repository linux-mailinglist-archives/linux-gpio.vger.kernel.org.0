Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B108EED65C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 00:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbfKCXUH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 18:20:07 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38987 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbfKCXUH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 18:20:07 -0500
Received: by mail-lj1-f196.google.com with SMTP id y3so15592426ljj.6
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 15:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVpcN1vOdXs3wwhH+wrUa3RKCmoO3R8+a8ZB0f/AmFQ=;
        b=vYEVAhXlokOFcchNfSd+V2JmCbFdTJYbvhwaDedCzoFLvtj/YDjkH2J6fS4zy3hjCY
         qefgD/I7cMWurxOGbXoJERkCxJIgrE516+LJyYBlUqFQrh0cJ84nEZwuVoNtZ5ZUPPpO
         mqmECtStI09hzbCh3jYmpXbJCQMvbPG/TPUhiJ+MzdvIPR6xxCQWdjTArl89XE7eGWxI
         DCsqV9f8aY3E/lAXiwf4vcPC++iSRJ/SXB8nGa3e8MuJS56vcsrNGIUfEB6rBK1p/IRe
         UD5a/66390jHlTwMpnaM0AV/1fXQrM8Ulp6eCpL5FASsHrfuoLzHf8CjkyGG0Sp3zbZ+
         AIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVpcN1vOdXs3wwhH+wrUa3RKCmoO3R8+a8ZB0f/AmFQ=;
        b=Zm39xiFGG8YYp/lAf1X30HPmJwvA4cS+66THm56aA+WJqF2bcJygYSwd9kjr0QWtPE
         LdXyJdC1cfdX2Z65cXBfWnJKb0yMPPvlfifq1Db9N1M0FpUIhwGjh/3cMyHdd7JMSyW1
         vJ+39PZP7l4nmuSUTSot0iQeSWyl1VAtsQUeqywxghlaIv/+JQV+m8ODvRBfHmFK69vK
         Lu8T8SHAmhBhO+G7/MygoC84f7um6mItX7j1E0uws8P4nbb5geOe8/TwJBUQ0HrHOcrL
         OdMDGPQFtQCEsDIcdFgo0vs5xxZyv3vKqqIxipvTnC4okJsS6Tyj8CMQx9GYUw9vmVF7
         Q72A==
X-Gm-Message-State: APjAAAVIkD8+pArjXQthPH4NNRx3MGDdwk6AyKmP5rP4qq1GswnO53zG
        ZhXF/RPa5iF7ssOCjCSsp0PZi9MeRwXNwDiptW8hWg==
X-Google-Smtp-Source: APXvYqxTxFkdLmpGie3z+n1NoTiUXGL0EZTOt83bLBNwDXdy7iOJZES3zs0O3WqyGV8LxjgkqUR638pDafjAOULX0gI=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr16639653ljm.77.1572823204990;
 Sun, 03 Nov 2019 15:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org> <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 00:19:51 +0100
Message-ID: <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] dt-bindings: pinctrl: qcom-wcd934x: Add bindings
 for gpio
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, vinod.koul@linaro.org,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 29, 2019 at 12:29 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 52 +++++++++++++++++++

The bindings look OK, but remind me if I have asked before (sorry then)
does these GPIOs expose some pin control properties and that is why
the driver is placed under pin control rather than the GPIO namespace?

Sorry if this is something I asked before, I just get too much mail.

Yours,
Linus Walleij
