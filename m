Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D721322B0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 10:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgAGJlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 04:41:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37651 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbgAGJlI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:41:08 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so38416619lfc.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 01:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VfIOZNhlZdgh/n/uYMSTxJWwTYgZo3HWuiXRXM6ZXSw=;
        b=uGZvZf0wu4OI7DIItzsEGe06v3wsmQZnuI0/XnmZi6zizfKbl/y3PCF3lpxqChWTzt
         f3fgXxeMF7QAgRzoSbq/f3snLNSDks7qjjCGdW3dTMc/cW+DrvVSAt3DMaVjggWAEqfK
         pbvlWar3ZohkjFniZxxbTomutxFvJEaM6Mz+aaYbulSgaIi1vJLNuD44g5m0IWJL4s83
         ZHe9LCJhKYoH4RBHvqjY1M7UYTUgvRk6t/X6q5HvgL1EP36Td1Ddxqzcw+BOf0XdqEDd
         ZWJq9E2KhvwTDl/4bVUcH3OCmjoCGRj1qaRF1B2hbzZI8tPeQdZuzCxnrVA7fs+TIe0Q
         Nd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VfIOZNhlZdgh/n/uYMSTxJWwTYgZo3HWuiXRXM6ZXSw=;
        b=fGSgvvJGmyYklb5WmxSI+vNUp9oWjYDBvaaesBs53uEC5AxvrsfLeN8v6xryrfFfC0
         tEwzdE/2cUfMTtFpE/vaQSNtmwW/epjPMcMdZEXkihvPZ+r687kYpgd77gMKKwq/fBhf
         DCl13E8PAZRgEf68czmk+2No7e38ifaEWqQ2D2DndQyUk0d2HmSp5iRLf79c63Cs/1Ee
         IoRKKHWzUajWEbmsBFbq4PVJmCS/49Or0d7WbVEKkZZ2YcSzA/6NTWmqWC0L/s71wehb
         JvreVFvedrVvxflNnvcDgEmr4wdp2qgZL9Tu4EmVy4R+CYFYDXpJM4pUcn9oW+KvoyhK
         TkJQ==
X-Gm-Message-State: APjAAAWBAEGHAY2/YyTQuZ/rlEKYPpYPPqrUyh2KJm/bVUgFvTCA8yiV
        tN+8izvspkC8ZXKlepluiHI6sjLLYnecJTO7rjrm2Q==
X-Google-Smtp-Source: APXvYqzY4jBYpAhIiapLb89kqV99rzLLw6eaFDARwJO779rn2IJe8Y7I+GZio3ixbC80hwVeaYNmb+6RxfNqEiz6tmI=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58149241lfi.93.1578390066348;
 Tue, 07 Jan 2020 01:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20191218102804.2487374-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20191218102804.2487374-1-ben.dooks@codethink.co.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 10:40:55 +0100
Message-ID: <CACRpkdYBqjoZfMpwGPXWoOZWJHst-Htn26LqdbTQQ1Ftqt4gmQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: make 'm_voc_groups' static
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 18, 2019 at 11:30 AM Ben Dooks (Codethink)
<ben.dooks@codethink.co.uk> wrote:

> The m_voc_groups is not declared outside of the
> driver, so make it static to avoid the following
> sparse wanrning:
>
> drivers/pinctrl/qcom/pinctrl-msm8976.c:592:12: warning: symbol 'm_voc_gro=
ups' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>

Patch applied with Bj=C3=B6rn's ACK!

Yours,
Linus Walleij
