Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9262B7339
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgKRAkF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRAkE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:40:04 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C52AC061A4F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:40:04 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id o24so410555ljj.6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fpRq5oGbKPQIWf1i8EYl3vqTi7XQsrMlJoxcyJpJKNQ=;
        b=rg9U2K7Llz1s3ghw9hvLqwjk2o3u9dU95otVL20eLEDgygNZpRsb/sSLWiOeDncl18
         Z9ZlnNAKkQYzXBOzoP8p4066v9X8E+lkBlE9K6zlVwaGxNXB2daW6FoM23RSROU0AP+e
         l5UbRlaxteh1YV4DvoaortMefIJ9vEEfoFqOVkKapvJeO0XXBJa7At0YHa/xREuZGZDx
         V9cUUvpjLYKaA7j2BQOO5pkaY8eFkiEbNcnQfFo6Qo5a9O1hI5SiBYGhppQTvqSQcgrq
         PLaOQy/oTp8eDLPhB7EadrlRhfJ6FhdAbcYqUZM2iyYwFlIBD07wyxmXAjPZc08Dn1Yr
         DaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fpRq5oGbKPQIWf1i8EYl3vqTi7XQsrMlJoxcyJpJKNQ=;
        b=k8eL6z9vZnyqe1xvikplQhF9gwZQDVTDEMo0rT0c5X672w+wC1T74eFnHVZWFQRsyZ
         eWkH+cQre4nPuJDaOUMBhVM202+dBClPQqiB1IpLMbq93vR30Jqh6bTqOLkEzx+pWxhL
         0KwIUAle8Un7Pyq9MOzBU7BMWMcnEAHBBLelo00swywAJE/v0LsPMp0fDGm9v6UQWnfi
         +UmNRX2FYRRrVUk12jytqx+SXBYWGxm0s1FnJ0iREeAQ61KZKWZVzGpLDFrhftVVmIs0
         PA1OaC1QQMRKxIujSDkIpg8B/4WZNWtqZisUL8YY6nEwL9sWKk7B1SE3vpe8VmzDCpYW
         uwOA==
X-Gm-Message-State: AOAM533KIXzOLeEvYOD+0BEGbFxbhDMVe1vLjdvEc44lk8WcNRIl1Sg+
        sx9xiYJ4T4m08CuTF3YAuHvCuDR6OpnWeaETcIHnZpEzZPHlWQ==
X-Google-Smtp-Source: ABdhPJwDHv2OLnWaiVJw3Tn/fOTtEHtSJELlqaEXImCpNOkLLD4kW0MqQMaFSXoCNdxMD3ZRlv2kLE3SERO9ndosTTg=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr3183401ljy.293.1605660002899;
 Tue, 17 Nov 2020 16:40:02 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com> <1605201148-4508-9-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1605201148-4508-9-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:39:52 +0100
Message-ID: <CACRpkdZPCHnNiiyu8Tj4cZ=m-NEPKuh664hbc0+PkyLo1kHQCA@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 8/9] gpio: gpio-xilinx: Check return value of of_property_read_u32
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
<srinivas.neeli@xilinx.com> wrote:

> In two different instances the return value of "of_property_read_u32"
> API was neither captured nor checked.
> Fixed it by capturing the return value and then checking for any error.
>
> Addresses-Coverity: "check_return"
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Patch applied.

Yours,
Linus Walleij
