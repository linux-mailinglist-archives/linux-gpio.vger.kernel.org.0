Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40A1EE30E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfKDPEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:04:45 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38204 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbfKDPEn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:04:43 -0500
Received: by mail-lj1-f195.google.com with SMTP id v8so2342045ljh.5
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OKf43Xtd1wEHNciZoBlwFOJ82a1QwEum0MNhO8xHxVU=;
        b=gYkvSCffYZJYwTaXZaDFIUqPk5ipBdl+XNhc/jsUSWqBPohl+dBdezLtdddkCLi0Q8
         AvwAFjZhKC1VLxRvNBbptKhKNAVavvPtMwppnk0QI+Blez2n25Z+c/Q6zTUKyNugN8ET
         kv/TqNeC2PtzHIJihbw8M8j675n8j1VIIL0Cs6ZrprNkWZntmUSHUhcFnb1A1O7DKcZn
         xyjf6eULq4FBeqaMEcu4kUVYfqDf+MZLp0kkmy30Au2zIlv86uv9CbgWRnTqaX9s8Z23
         0ZJqK/MWG988Lvu7mWZnKldNwoTswgpH1txIxNtvTYAEOJenrM18U0Y6+q6/TabMtw0B
         Vtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OKf43Xtd1wEHNciZoBlwFOJ82a1QwEum0MNhO8xHxVU=;
        b=eLyiX7o8Sba2XWGbs+YQcV36hSh3/sCMd3XWdBXRpMjNngEr45D9x3k2ysclCK4JgH
         POYoTS8iyZr93kAYd7OO+gScEva6Tzn8HqqoQYJEC7mfxAGYwhpc1qG2X5C32B6y4e0c
         zrvvWmhtDUErtYD7Az5KhhmYtRkljJvnK5B4zi5xruUeRCKySWjf8L3+Vzkl0sW29or7
         QlaAbURnYA9dAzEldC5FA52NSfhCtw9h6fYfvSYo48IWVHsTrn8pof2bcwzuk3alRi4i
         MYQE4+ycKhrTlaHclgX1EcnSpYkfV6H3oXu7eod48Z7yWiItPD0Uhj+x2cSoBhiScg8x
         BZig==
X-Gm-Message-State: APjAAAXbrc22erhNmX2RJk8w2MayBEfZEqL75+sMec9LNhEFTbG40Cfo
        Ylyz2bS0OC3OFj436g/WGw3MqIMKkhBRMiMm1w29yQ==
X-Google-Smtp-Source: APXvYqxy6M2YfqlgiosgMtrEMRGPVh5BipMF3g7VDZcsoZie0Iue5hC6m1+U1vgt2pyXgw8xrRe/9wm4ygBXT7/F2Pk=
X-Received: by 2002:a2e:90b:: with SMTP id 11mr18696588ljj.233.1572879880204;
 Mon, 04 Nov 2019 07:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20191021141507.24066-1-rnayak@codeaurora.org>
In-Reply-To: <20191021141507.24066-1-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:04:28 +0100
Message-ID: <CACRpkdYFZ3V87kWFaMdMf6vGdr-=dR4=0GiRAQyY-=2uEwNLyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7180: Add missing tile info in SDC_QDSD_PINGROUP/UFS_RESET
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 4:15 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> The SDC_QDSD_PINGROUP/UFS_RESET macros are missing the .tile info needed to
> calculate the right register offsets. Adding them here and also
> adjusting the offsets accordingly.
>
> Fixes: f2ae04c45b1a ("pinctrl: qcom: Add SC7180 pinctrl driver")
>
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Patch applied with Bjorn's review tag!

Yours,
Linus Walleij
