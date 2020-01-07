Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4921322E1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 10:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgAGJs1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 04:48:27 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37172 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGJs0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:48:26 -0500
Received: by mail-lf1-f65.google.com with SMTP id b15so38430971lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=57yyaLukCeYKAR+EhYGKNLb0YJSXe31eGECRa1cvyNQ=;
        b=qtI5LJo3/WvWrVIOP518oxDc3sCuQZBRfr9C5k+6doCxp3MzxLMN6EKtFZgGos+b45
         LkDrzheTzcH8ElGC1D31coYR3J0ag0BydTOCnkr0keaP+7TP+453ZoSSijAkFO2Jn1ns
         DNdC6m9acz9YM+LvrQD5aWwTHN9J/0xtaN/wa6UdUP77zaUcnKO8GMK4A0X+UZtyuYfn
         Dojan9A7M8+5unJ7aoUrDc47Ap1APgA/gtyvSA7dLOqWIWFwN1g/8EJ7ozI0vLP2h50c
         GKOWEwNT6+mgWVJ7cN5Kj5Q8b64XwtQVqTm3ZukPYVhj6NAOIjZbqLym6VSOgAH+u1qH
         GQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57yyaLukCeYKAR+EhYGKNLb0YJSXe31eGECRa1cvyNQ=;
        b=jIPuiUB0CALvxucHnZyvvcd0k8IsnrcXXLxTSOtG8j3HpdbHITSmQ0lxXfP2+qveHh
         aw0ezVeAWhrobLz9vvouD1MJvsZDQNimswj2uE99HugBlhhRGq88GEwfZQsBe1UT2pzu
         VNPGYdN/ABPmCrK4QfPSPIfBoTxlHhaziGAa9AajwzwvF2OfAIQY58Dk4FrQm/+Iubo9
         jtCjF7ItP+N+SKMOAL8jlda/VNeBQYE5GiOgpQfLnYSrdmZaBQrGwz4dhVj3HlAturwi
         OfTGc8GDmbjXIMQV0dAFPC35jbuI0zllotvMVMFA0ymWJ4C8m3ASUTpxx+yJpISdNIlg
         KQTQ==
X-Gm-Message-State: APjAAAVevo3Br3mn7vFeMccA7oKpZd9QGF24Im+amaAtODdkosmJSl3X
        714NYBnsgUC6BBGu3878VikX9lCi5XUxhyKGjrReCQ==
X-Google-Smtp-Source: APXvYqwJ4NEleHWVj49bXWx9f2Reukpm63SdKPnvrbrbdsGZZiFUSvBsk8NVHRhgjrknGj8ifWCADNENNBxCswle48I=
X-Received: by 2002:a19:c648:: with SMTP id w69mr58882108lff.44.1578390504987;
 Tue, 07 Jan 2020 01:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org> <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191219103153.14875-10-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:48:14 +0100
Message-ID: <CACRpkdaoU9B+981iF4wvLgY-QNNnsNUE=CYVmfX8zNtUuOtKfQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/11] gpio: wcd934x: Add support to wcd934x gpio controller
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>,
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

On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patch adds support to wcd934x gpio block found in
> WCD9340/WC9341 Audio codecs.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I think I reviewed an earlier version of the patch set yesterday,
the comments are still valid for this version.

Sorry for lag in my reviews :/

Yours,
Linus Walleij
