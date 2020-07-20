Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464E322620F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgGTO1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:27:20 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:33678 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgGTO1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:27:19 -0400
Received: by mail-ej1-f65.google.com with SMTP id n26so18300962ejx.0;
        Mon, 20 Jul 2020 07:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MVp/N1cSKfIiCoWIHHaYXJ/b42GmjNCJKzq1XoGLrEI=;
        b=U92z+SNLqi0lTuUNMhqQj92mdJ6LjyGDJB1EA+aQwmPJ34T35OJ2NxtDFZAfmZvSrs
         Apr42TEdXRRorb4WySaa7Q2vfcM9EwRyUU9TdJackfH4EtdrxTAAejpton4sEM7Gpru4
         IL8OL8Pt7Dm1Lh3kdmhzxgEKL2sA39YzMcwZ0twviXq6v77Vl1YxJ5zs9scS57pOohDe
         bcOr8gXpmZpwbWgpY/+KekwYe4Sbco3x6boZ+lLJ4JfSZCczgIy/L5UZ34P1JkA2Qqyu
         qlXcjUqeMxOfyYjUdzcvmTO5O6I8dHaGMOsZCe1hptFK7cWd57D5kWoEGswTgjCv3Jha
         kjUg==
X-Gm-Message-State: AOAM532AsL7aWQQEXMddT8nkT4MtViQft2w7b/QrVKwkISZQ6PRxv0qf
        YJNNspGuPwr0muiQwq3Drts=
X-Google-Smtp-Source: ABdhPJzTT58G0Lg05eXfDTVXv7oanRtSZu0RR0A3J+bLXjHJcgedqcOGfq+QlukWEmL8dIMq0wsiZA==
X-Received: by 2002:a17:906:fa13:: with SMTP id lo19mr20771386ejb.213.1595255237737;
        Mon, 20 Jul 2020 07:27:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id o14sm14739926eja.121.2020.07.20.07.27.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:27:16 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:27:14 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious
 misuse of kerneldoc to standard comment blocks
Message-ID: <20200720142714.GA6747@kozik-lap>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200713144930.1034632-7-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 03:49:11PM +0100, Lee Jones wrote:
> No attempt has been made to document either of the demoted functions here.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/pinctrl/samsung/pinctrl-samsung.c:1149: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_suspend'
>  drivers/pinctrl/samsung/pinctrl-samsung.c:1199: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_resume'
> 
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--

Thanks, applied.

Best regards,
Krzysztof

