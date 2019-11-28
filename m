Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9773A10C997
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 14:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfK1NjY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 08:39:24 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45423 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1NjY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 08:39:24 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so20060690lfa.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 05:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=D6I+KTtT5RrNfHy8HpHYMT8VJs7SJnMqAJdYid/7wUs=;
        b=S7EvmoCibbEzYx4xPT50J8NUwH/UMgvuVazKBvgS4zza0WtWGyRCvCa9WB0DDo/hEz
         G1LYwoBExE7YLI7D+UDPPe97azpnDtR7nZF+AL6ZQl9vtYN4gXE9QA07mQY1sEF0FViN
         gUoh4lR3UKPkFf2l4AZjz/U+Ym4YxfYABShVh8NHMnvdQM1yuvtz3zPQbaUypD/44PNS
         x1CJRsFsxVUNAxi6/GW2m/WLDk/SjNQVpI6qPgITf8yOxoIZLa6HQACdu731z7tKkEFf
         9xWKoMcYUmInatclY86KOmBz1ClgA0FPDWy0YPsgvEgwABbvaGQvo5iqlM0lBTts/BlG
         H2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D6I+KTtT5RrNfHy8HpHYMT8VJs7SJnMqAJdYid/7wUs=;
        b=XNaLTVnB/BV/V1SHy2s+XhHfR88L+a2GayHoUswe1odjrpzyCo1kCvQ/ASgWL9twjV
         kvg5rbeMejfoqD7TplQAXaWxSO7d6F8+nPiIGa+G5Ym6QzSIWew0cXRkzSESmZJFZXmo
         nE/IAO6/JuvaaBVTEJihznqcm50VVIT5lvHDkSyG6lRNqWaADJaBskH1N9ONOIU0APYW
         LGfS4+nm/VEuYY2VXc2cXvr077UwF8W3sa5OzLrMN3krRQaK5NLOzi7s10vztWgpDHOT
         wQzBAH68Y+T2RQEzLiOM4EWYCEyi2Q9pPKOun6nr6dvoOyvJZ+m0vnSRoPrgU4ZMI/eR
         jiiw==
X-Gm-Message-State: APjAAAWvrVB27AdrKWQbpQo0htbH87Z4dzfBYEKtQWSDsoCnyIxX4QC3
        36Sjq1vsTupM6aEMZp4qVZA5VKmn4e3SLIuMV1B6Cw==
X-Google-Smtp-Source: APXvYqxmlz69tEBni6zXCDozi9A2S9iyrzZrXFUiEi/GPCF1jeCwI9TC1gpKuquuR4/Kv2cZ5E8a8cVfVuetJqrnSG8=
X-Received: by 2002:a19:c84:: with SMTP id 126mr18591776lfm.5.1574948361862;
 Thu, 28 Nov 2019 05:39:21 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR01MB3521489269F76467DFD7843FFA450@HK0PR01MB3521.apcprd01.prod.exchangelabs.com>
In-Reply-To: <HK0PR01MB3521489269F76467DFD7843FFA450@HK0PR01MB3521.apcprd01.prod.exchangelabs.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 14:39:10 +0100
Message-ID: <CACRpkdax5H0ar3ujKDohXvDZAXPWNWFKE1_AX9tn1FEOv5Yteg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc8xxx: Add platform device to gpiochip->parent
To:     =?UTF-8?B?Sm9obnNvbiBDSCBDaGVuICjpmbPmmK3li7Mp?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "zero19850401@gmail.com" <zero19850401@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Johnson,

On Tue, Nov 26, 2019 at 7:51 AM Johnson CH Chen (=E9=99=B3=E6=98=AD=E5=8B=
=B3)
<JohnsonCH.Chen@moxa.com> wrote:

> In old kernels, some APIs still try to use parent->of_node from struct gp=
io_chip,
> and it could be resulted in kernel panic because parent is NULL. Adding p=
latform
> device to gpiochip->parent can fix this problem.
>
> Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> Link: https://patchwork.kernel.org/patch/11234609

Patch applied for fixes!

Yours,
Linus Walleij
