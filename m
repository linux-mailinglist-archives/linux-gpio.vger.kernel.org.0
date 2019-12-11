Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15CFC11BAE1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 19:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730853AbfLKSAO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 13:00:14 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:46995 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730743AbfLKSAO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 13:00:14 -0500
Received: by mail-io1-f68.google.com with SMTP id t26so12185288ioi.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zw8ToasYb8/laTLFqP1g55dqKVSS0xO4pMqGOs5Lio4=;
        b=muIVQgmKlRQQMPU+Jeeyvy8/9sXC3w7NT5fymLadIwje9b9OnbN5ClDxwE8279dvoE
         spwJu8EmwWQkXCJk50n4AhPIlogG3r7l4JpwoizFRBnCNls6ZL5nRadADjzSUVUQtYOF
         hLfTNe36v0MhAjt+3HNQ9L3QJiSHydvtf2gF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zw8ToasYb8/laTLFqP1g55dqKVSS0xO4pMqGOs5Lio4=;
        b=ZDV1CgsiKeAn80mOBD6v31YDe+5AiQdy0luMnPZjm4n8ox+NvtXNCSEHJ4+owRP7+o
         KT1ha/aBAqL8QyI+DwpcHqRcx0tuGwmUwsauEDIa6ddF4z9J6whQRFvLlVNQTheNwtwe
         Qdv4BcAC7yU5wTL49j/UkYTTa27VAzKrT7cqAFt1Q9fcbbBn5YnNysOaaUQU6zFjbz4u
         9lc/WmiwzxyKtgmixE8nZzHDFwpy+rcUCwyEihLrRQbwg9BwnB16FMLzbi/A6skDiFaR
         Bc4r/PmcBrGpDd7u5tyVHFPvacobDWrY5VuZCCUyPAvKhA7gOP+jwplrQEufiwfaagKQ
         fzlw==
X-Gm-Message-State: APjAAAVdOxJjtqLq/JzR6J7tqE+DLX4+MSmKmvjRYM+5hLDsgRw4FtIr
        zFN19bPOBd9VU3YYCyJr7w7DcpT+ugY=
X-Google-Smtp-Source: APXvYqypzHKVbV+rFrRI56vssAQIhj521vdV3SwV/6BmhGw/ST7bBYvQXQsyV8pBtyQIJjANn8b6RQ==
X-Received: by 2002:a6b:ec0f:: with SMTP id c15mr3477127ioh.149.1576087213532;
        Wed, 11 Dec 2019 10:00:13 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id v7sm672173iom.58.2019.12.11.10.00.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 10:00:12 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id a22so8649109ios.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 10:00:12 -0800 (PST)
X-Received: by 2002:a02:711d:: with SMTP id n29mr4090645jac.114.1576087212191;
 Wed, 11 Dec 2019 10:00:12 -0800 (PST)
MIME-Version: 1.0
References: <0101016ef36a5bbc-82d31857-9d9b-454d-82e4-fed407e17443-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016ef36a5bbc-82d31857-9d9b-454d-82e4-fed407e17443-000000@us-west-2.amazonses.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 10:00:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQN4okN8HVrVbwoFA+thagm1w6HkD6WRp_HOenCOBgcw@mail.gmail.com>
Message-ID: <CAD=FV=WQN4okN8HVrVbwoFA+thagm1w6HkD6WRp_HOenCOBgcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add new qup functions
 for sc7180
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     LinusW <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Dec 10, 2019 at 9:24 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> Add new qup functions for qup02/04/11 and qup13 wherein multiple
> functions (for i2c and uart) share the same pin. This allows users
> to identify which specific qup function for the instance one needs
> to use for the pin.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
