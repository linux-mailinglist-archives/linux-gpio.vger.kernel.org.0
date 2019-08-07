Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91A4A84BDF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 14:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfHGMnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Aug 2019 08:43:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42894 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729808AbfHGMnl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 08:43:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id s19so1254579lfb.9
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2019 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3yF1OuQ8WOJDwWnUlO01EbGsBbNmAnc6oHp1K7rziEs=;
        b=Qkscwp0fMEP5YUts5kZ8mBnyK/OpngNCEOAidd5gDqm0omiSQCT3uXzqoJPoysQldz
         4lgN3op4lyvYbnF7bj7XfuUgFO6pwFysEYZMaCCnrUJlzlPGxFwNFeauDS0cgSVcL7BY
         pm4cXe7UqsCsczPq0q/Heh79nqUVbQTn9fVdGaphofDgpniehIo0S+O6IJLzZQyNyX+o
         wIRGwN1AH7uLn2xcWDXs1OYlPr9AqlCmgjBvgMTBdNy3GC4ZQRXWorQnlqPRh63kFRTB
         5zu+oi072EGWXe3id3Q7WIXYE8q7u98sy0ME0/BOW1lQMgBpriiH7N559fFPEU+BNVg5
         WtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3yF1OuQ8WOJDwWnUlO01EbGsBbNmAnc6oHp1K7rziEs=;
        b=OqtlYi7fK3LYQsetx8OSzAEkyUYAaAzRaDzSmunwJPW8P5qUQVXU5cxP3iKIHITIg5
         wrrblWOsYJXhvdGCJIM9HuDSO10QhnKHvF3MzoE5J3yJMzc3D8J5s6PCz2dKgx8SZmuG
         +nisbRBn1n8lS5aVldfq0QQuuk7OTWaUCu5kn0LUDIrnqU8EzQj1zE3zhe9Xzrkd46qB
         UasRPRxqO1ZrrtsOBYbGecEzTbU+qNIo50Jtp8rgSqAB5naynfofvuTe2/rrqkEcHQ0Q
         ZtlapxA1jeH9HbU/9W8M3jHrNnpL+pNxgLhCwZgZXIBkIRyslesQXVksM282iTLNnVI5
         ldjA==
X-Gm-Message-State: APjAAAUyLEroLe/rxDNrIhEoMrey8F0gJse0w+abvJt90KurdrrWnhx/
        LiHpVMR6OZZ234DWNPEKCMeEiINLxvPQLKUsAH9h9w==
X-Google-Smtp-Source: APXvYqyHcn+uEIkjeMH25oklHeb5+qGtHeaOrVJcVtMtUqMfkChzi4CWRJOO4SFcOgHxdBcv6Lm+gTNdGKL7HocbYwI=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr5930898lfi.115.1565181819882;
 Wed, 07 Aug 2019 05:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190806060536.18094-1-rnayak@codeaurora.org>
In-Reply-To: <20190806060536.18094-1-rnayak@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Aug 2019 14:43:28 +0200
Message-ID: <CACRpkdYdVFR3CnC+bO0ZYP9FyXsuGQZAiBxMchSrhpQGtJnd9A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add SC7180 pinctrl binding
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jitendra Sharma <shajit@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 6, 2019 at 8:05 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:

> From: Jitendra Sharma <shajit@codeaurora.org>
>
> Add the binding for the TLMM pinctrl block found in the SC7180 platform
>
> Signed-off-by: Jitendra Sharma <shajit@codeaurora.org>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> [rnayak: Fix some copy-paste issues, sort and fix functions]
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Patch applied.

Yours,
Linus Walleij
