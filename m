Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2087132555
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 12:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgAGLzc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 06:55:32 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43829 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbgAGLzc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 06:55:32 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so54405960ljm.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 03:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=srVCYWN5C5Eufk05htqMAJUHJORyKr0Vlz9Det0daS4=;
        b=x4W09e6W3tYzPFUA5L3cocu4C28m1vu8wvfPIVtcJZVrttySIpPpOBOxScCKjuNNRn
         OyhMcUwnM45j1nxRiN5G0bCuRyxa4OO8QJEjgJm87+mAfYD5ZXWyADDY2k/7fKinA+yq
         x46qgZYWT1cXuXTxyoTLqtgueith2idAaQl0QpKpm9DWWQXeyE7d7v7jS/oNr2UiSKNN
         m6C7X0ok2d1rKs8X7I64wx/UnFvv/rjXO0HEkKEWuEkCZIwA3EBJDQUcZWPjo67sFJae
         VO0hAUkUiwdg8Mxsg7FFAMxrzsisTkn3tAyhmQKML6FQVwKQY2O4oh24yPneCrUoCJYv
         UMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=srVCYWN5C5Eufk05htqMAJUHJORyKr0Vlz9Det0daS4=;
        b=epLqCGN5iZiExmSMFEM1hMENj3WW4oyIROquK4XoBHdXSo1aCBpOZw6JdIEmsJyNHT
         Yo+pPlYP5NtJ3MRd5v0zzI53RkUrhq2h+VaZVayqsZKo7EgakjzLpp4KUNbY79quCTGn
         YURPG6Ms3QGofFpAr5ZiJDkWEUXhBTq0BFUkymslVhvmVppM2qs4EZG7383Go/2vQgyz
         RKECMaQZVOzUHUTsob2fph8RWbSy6mIZqxgRMsB1ibXGlTjOd8BHyvFxgLbjbzLDD8qh
         eUOJtjv1RFIYdjlQ08uQCFHLrDpkG9f0SZHXrdx91fcZAFYmmVIYz97L3y7Kyc5l9S9J
         CZbw==
X-Gm-Message-State: APjAAAXrzhh4ibFwdTvFpTlpGe/qsu62vcgdzwFdCp9ONMlHXOdZr5wK
        YL9D2/HwyIyqacNq22ipo5GAaeWm8P9BtWObtAHhbA==
X-Google-Smtp-Source: APXvYqzkyD6g7/9CDAlHtA5mKWWnMz52PVnTB6MFjhAOLT8GCecy17Mok8VzpbjzK10JRhbJp55ZQJQKlRcjb1WeUVc=
X-Received: by 2002:a2e:9587:: with SMTP id w7mr60523035ljh.42.1578398130000;
 Tue, 07 Jan 2020 03:55:30 -0800 (PST)
MIME-Version: 1.0
References: <1578052177-6778-1-git-send-email-sricharan@codeaurora.org> <1578052177-6778-2-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1578052177-6778-2-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 12:55:19 +0100
Message-ID: <CACRpkdbjjzwdEgsDV2tGea0t3AMM_FRSd-Um3+2BrYDTGKoNxw@mail.gmail.com>
Subject: Re: [PATCH V3 1/5] dt-bindings: pinctrl: qcom: Add ipq6018 pinctrl bindings
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, sivaprak@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 3, 2020 at 12:49 PM Sricharan R <sricharan@codeaurora.org> wrote:

> Add device tree binding Documentation details for ipq6018
> pinctrl driver.
>
> Co-developed-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
> Co-developed-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Signed-off-by: Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
> Co-developed-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  [v3] Fixed the example dt node, inherited properties

Once you are done with patches 1 & 2, can I merge these
separately to the pinctrl tree?

Yours,
Linus Walleij
