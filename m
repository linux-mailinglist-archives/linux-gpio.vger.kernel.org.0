Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF76167EF4
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 14:47:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgBUNr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 08:47:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35590 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgBUNr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 08:47:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so2261749ljb.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 05:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6RiDIgBnM17s0MhdLFdue8lQDMd7IU/QHmr8wXGck+U=;
        b=LrtzUHshefW35GP6ZfEoYXl7PU7Ew/G3Olj5e9FBDEm0N0uRMbD106U333sP+XdFGl
         oKIZmvtCNOzaLh17pnvgyRA9+mFeV7G+9zCVGN0pjQV4Y6p/E5NGzkm9wYYrevaEQjpH
         ejXx6bANY0OhMZKX5OJROiRHYzuvZONL0JDjbAp3mz/MMI1EqSr30aiIXqeP7kOVSXWj
         EOhrQ/o5tEXWomMLfszjof3ypPYs9bKQv/l9AgrwdmLRkYA9mvJuvmRj7Qgwl/h/viag
         DdLp7ObOU0eqfNlWn6lSSo0GUTsCIW+Bmq7+zPEFXWsJrqPGQr0cUm0eWkN6FTONdaeK
         chrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6RiDIgBnM17s0MhdLFdue8lQDMd7IU/QHmr8wXGck+U=;
        b=rh6uXQvOhG7diTyxctgWlXhx7OLTiX7xn5URC1AciRZi4ZvqWmQAL59elwvOpV1HEf
         Dq+Dqyc+989T7w4dvWGhlyUKgt5Sa641xIQAc7KuKiNpIoDZOqBPn+B/y5mMS0MlnPGw
         IkEwGMHsbPLPdk4qshu5+m2I6n9isApZOSijOMhhLORmkfeXHv9/zcWqdaZa0JpHciAM
         VDmzGkQBP/GNOBvFCVl8bJ2O8nZtxhyxHFjn4HaVOKjhTQ5YdSK5IttWwVeEEFsZSLQr
         dRWoYZ8aHROV17H/aGLJlprwVH9J/AzkiDIWr6pW5a3OIW/eFhsi887v4xHkJxdLyICb
         03Dw==
X-Gm-Message-State: APjAAAUpFaUWmemLHESRs+ltkxGr2qe6b/fWMEcXciqPuzHjXSPoIb+R
        eBb6/HNlxCqLKKA+h4E/1gRMQ5XQdpqqSTHtGQg8WQ==
X-Google-Smtp-Source: APXvYqy0v9gcI71kNOOkUK7oygUEUPyQ1/Vc5JOaBADO6tiKLQPSAXDQnjesGOK/oFE4d/DSEaPhvt5lW2ObMIsj1nI=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr21375720ljq.258.1582292846656;
 Fri, 21 Feb 2020 05:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20200125113355.GA22220@Mani-XPS-13-9360> <20200214071856.197028-1-matheus@castello.eng.br>
In-Reply-To: <20200214071856.197028-1-matheus@castello.eng.br>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 14:47:15 +0100
Message-ID: <CACRpkdYbxCi3WGq7WBWVHmNmGSaWO4=VrxruBy87MKLK0464mQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: actions: Fix functions groups names for S700 SoC
To:     Matheus Castello <matheus@castello.eng.br>
Cc:     pn@denx.de, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 14, 2020 at 8:20 AM Matheus Castello
<matheus@castello.eng.br> wrote:

> Group names by function do not match their respective structures and
> documentation defined names.
>
> This fixes following errors when groups names defined on documentation are used:
> [    4.262778] pinctrl-s700 e01b0000.pinctrl: invalid group "sd0_d1_mfp" for function "sd0"
> [    4.271394] pinctrl-s700 e01b0000.pinctrl: invalid group "sd0_d2_d3_mfp" for function "sd0"
> [    4.280248] pinctrl-s700 e01b0000.pinctrl: invalid group "sd1_d0_d3_mfp" for function "sd0"
> [    4.289122] pinctrl-s700 e01b0000.pinctrl: invalid group "sd0_cmd_mfp" for function "sd0"
>
> Fixes: 81c9d563cc74 (pinctrl: actions: Add Actions Semi S700 pinctrl driver)
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>
> Thanks Manivannan for the review.
>
> Changes since v2:
> - Mention s700 SoC on subject

I already fixed up the subject and applied :)

Please check the result.

Yours,
Linus Walleij
