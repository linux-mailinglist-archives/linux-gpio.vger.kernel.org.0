Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7DE182E13
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 11:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgCLKow (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 06:44:52 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:43542 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLKow (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 06:44:52 -0400
Received: by mail-vs1-f65.google.com with SMTP id 7so3322018vsr.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hsaG6j90s66b5sAhcEsQTY0J6YR55tJXb5H+vXmq9o=;
        b=BDl6Tah1NgNqpJiG8G3CoDYR87HmHLI8xvK8q2kHUqM97kM38Kbl8lKdPiqJyXtojq
         icwj3qLGQWigurDYhIh0KN4bz9wwIQRkyvCBsdJAFirg41OT+I97DTnbYyFxSTeCeCSO
         MpA11ZmGDCF7Zw2hwDOi90PKeLezH5+npfVwNOnfFOrcsmpBJKj60+JoB7FuNekCCkDk
         oi5UMYTExgop+4c7iTeLXM+MpjwiPw2ZWSaP7SZHg2AHyrKxkfuj9B24Ruyu5B9TLsyo
         Tjajj24+NKBaODEvMCnsL6cU67ag2CIGJluubOaHBItFWdvbcrktOnfOB4lzKx/Utg8k
         YqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hsaG6j90s66b5sAhcEsQTY0J6YR55tJXb5H+vXmq9o=;
        b=GrO0tFAFBF/P/DbrH7m4IPAqb5WMkj+3WMSlI4TkigacG9DYth/kVdySchcwKfDV7P
         u/n5hA+Eezyev89nXLCf7dH27OZ7wV9w4Bz+G5JvYxk4xeVpPG3udr8kFy63LusDCvlh
         wIjnrLKtQ0E3NNWvf6vQC6coSlcUwetSqNdEwQ/Q7LgNTnY1bR+RClOfYZHN3b/3QXo0
         eYpxKNPElE4i2C2Qs2obqeYsfu2WWO7FJc8OiWcb4jtyqoeRWL5M8lpx0h0SSdqKCop0
         hnkgUhtlkciS8F3JrEuRcm+SaB3PAwk4m1GDz9/5ivk8210sU/DDVSMVUvQ1CVOLpgQI
         MpqA==
X-Gm-Message-State: ANhLgQ3MXsGwYEauZEG1GXHN/GXAki6iePln19bt8To26FyAwfnrQm2a
        X8/88Qj5kcv+18MXOEvoP2jCaz56XE9hMFN4aUgZHA==
X-Google-Smtp-Source: ADFU+vuszdscU3XdZ57aAT25416d0k5sPcfl0mAi5hLjgkEZHNfu0Lp82aNKZ+W0OfmUblZbN51k2qpZO8MHLGW1V6A=
X-Received: by 2002:a67:cb84:: with SMTP id h4mr4854919vsl.85.1584009889300;
 Thu, 12 Mar 2020 03:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <1583377666-13378-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1583377666-13378-1-git-send-email-christianshewitt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Mar 2020 11:44:37 +0100
Message-ID: <CACRpkdZgeA-qgWckwAH2_6nqqwkbxfTa0so55mbKJoC1q1O38A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: meson: add tsin pinctrl for meson gxbb/gxl/gxm
To:     Christian Hewitt <christianshewitt@gmail.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Igor Vavro <afl2001@gmail.com>, Otto Meier <gf435@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 5, 2020 at 4:08 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:

> From: Igor Vavro <afl2001@gmail.com>
>
> Add the tsin pinctrl definitions needed for integrated DVB hardware
> support on Meson GXBB/GXL/GXM boards.
>
> changes in v2
> - fix ordering and numbering of uart_c ping flagged by Otto in [1]
>
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2020-March/015906.html
>
> Signed-off-by: Igor Vavro <afl2001@gmail.com>
> [updated commit message]
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Patch applied with Neil's review tag.

Yours,
Linus Walleij
