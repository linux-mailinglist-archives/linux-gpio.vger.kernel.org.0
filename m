Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F5510C4CB
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 09:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfK1IQW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 03:16:22 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45310 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfK1IQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 03:16:21 -0500
Received: by mail-lj1-f196.google.com with SMTP id n21so27430510ljg.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 00:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dlwaqEfjT5graM8RWQ1ek299Dj4eK17tSarlzL5nZUM=;
        b=l+E4ygaS3q5mYwlHDuFCSXQ77eYxgnZq4FdzjB4K2crLne5PNmNtouWf5MmH+0mP+a
         KyoynhY40PGrUD+TebyOwFZ7I8rILisxXtwWvkjSjp+QFIcKF3t6ro7XSoXsUbsGa8uH
         XHyTKCRmj/e/0OnKWOD2Y7d+xWz/TgL9/VHd5f1gwQc0UxFZ7PH3t3xWXhoCptaVW2I1
         QmskW4aj5jbewzlKdZv7gv1VOEU0aFmTaAujR/2y70Cbdydft/nWRUpxbAauXDasusdc
         q2007xskJ60GRtI5D8u2I2U9rHNvg6+7n279miEuRgOumNA8L9DgosI68SPwk/58zh8v
         WFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dlwaqEfjT5graM8RWQ1ek299Dj4eK17tSarlzL5nZUM=;
        b=FS9m3ZlNc+CQ5o07K8QqniSbYRXPbh8tcYg0FBTSVO1jPcz3oOJL6FUxeaxUQcKSFE
         anofWWwX5QJ55ex4HUktQkkstccvy/X+yXlv82js29dBGVymgTdj1L7qtaCx5BeFtlmy
         zWgC6Rf7Lc2sMqJH1jDKzRE2zYZoHaFkjZv/vJtAvKNr772yW5GcJcWSSPdBh2OKzfNY
         /s27GDQha5ofWUTMd66sFbCPJiEJK62OINyxIzXUr8BPTA8C+GdMB/gcLroAJIP+NLWA
         YQ49ixGkk7EkU+U/IVceiz7Fj0FGHy+DLxUEJCZR2js71Q/Db3+20DIKA/4LWnysH800
         tdPA==
X-Gm-Message-State: APjAAAWaiMYzbpUEzBMbyP3j8TTfrZc/yoOmduSHwLUd4CcsR8JdPdmb
        g3nImdfuRzS5owlXUyuA6YzD593hBJGUdi0AdsDQdg==
X-Google-Smtp-Source: APXvYqyTE9eYnDMIvHYYYoLUZ9fGJAvAWhf7bt6cQqx4sbnSjEzG3In1wSpDQ95JnJ/UyfSwZGmvFUTCfZ/EW9cdkyw=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr33605730lji.251.1574928978081;
 Thu, 28 Nov 2019 00:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20191128080832.13529-1-rahul.tanwar@linux.intel.com> <20191128080832.13529-2-rahul.tanwar@linux.intel.com>
In-Reply-To: <20191128080832.13529-2-rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Nov 2019 09:16:06 +0100
Message-ID: <CACRpkdbKE6eHsyuCM5oCkhj=bP4H=omiFfdA6qf+g7xQzJBYQQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: Fix warning by adding missing MODULE_LICENSE
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 28, 2019 at 9:08 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Fix below build warning
>
>    WARNING: modpost: missing MODULE_LICENSE() in
>    drivers/pinctrl/pinctrl-equilibrium.o
>
> Introduced by commit
>
>    1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
>
> by adding missing MODULE_LICENSE.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Patch applied, I will send by express to Torvalds once the build
servers are happy :)

Yours,
Linus Walleij
