Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FEE319AF0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 08:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhBLH5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 02:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhBLH5C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 02:57:02 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20E6C061756
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 23:56:21 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u4so10508226ljh.6
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2021 23:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QogP32dUSk289sEm+VMFcJgOp3ifNl8gli5/F7VzCkE=;
        b=qtcjp5MGIdyPonGk8pqvatQgZt/HBgNfGQPjrW4fJmDJ+OV3HFh5Xy0el4bLfnCQrs
         2uzl3O9i8qRucye5baCw6DeJC3/thlKp9X2pFImwkOspAvIrcvoeWty+/NBx4Xpje4Bn
         Cve1u5xupVRQhiiwvLBe8CJjfR98JeDr4yj/A1JLQd23xC3DOgls8uhnrCuylIX0xzoq
         FHiYpJrWpllbBXqwPerr9u+k+MMc48kVCdIp1e2CYlSaYUo1u4xtGKo6YMGHv5zAJeAj
         25b2hKanl/6XAGdGzlcCORLtkt8KVsZZkKBsl47MhGocGq2kAJ9KiwJnWxLZMoOvWojF
         0YVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QogP32dUSk289sEm+VMFcJgOp3ifNl8gli5/F7VzCkE=;
        b=GhlNcGBvaX8sVEBqx0g7Z0RtxpF3iuU+sBqG1sIwmAUxzMN4KKFbSkDinm7F/V+7It
         xzZvOoiTF2l+K0WOeDPPJC4BMyneoAb8DXNlmb+Nah9S3IFHODxJGdstvEFz/wYIEU/I
         A25Z+WcTSudJRcI5ib7uDX3QMj7mQz0OB38rVlq2OgNeTeCIqctslmMQm+BFarVpmL32
         UsEcXYwCY+1pI9uO3mQoQejaZT2fSFq3gozWCIUIameOMDBt5Sxa3PcbbD4nKYLhX+fW
         Cl2yh8lNnKXwn73oeciJtyRexTq7/hP88ssLocKHVjRinhqmGvduiYuDHbGvfjq8WS03
         hmxA==
X-Gm-Message-State: AOAM53387DkjljRbOpfEGhqqVMIWOO73JWf9XWEQg+pBzvlxFgWtAIYH
        C6LH9KubBTw9NODnhj8gL4tCQ2LD8TpMuoCl28SnHw==
X-Google-Smtp-Source: ABdhPJwAWhaQ9FI1gF2R7GuKXY4mozPW9Oo6w5q2u4DudIm9FDUa7Nq1U1Pjo74FTvcKAkg3fdkWUhNmZeEPy66njZg=
X-Received: by 2002:a2e:8e84:: with SMTP id z4mr954349ljk.467.1613116580134;
 Thu, 11 Feb 2021 23:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 08:56:09 +0100
Message-ID: <CACRpkdaBcqgiOzovD8KxxBp=_6CCY61Li10SjEO080Qd==xwpg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Define common TLMM binding
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 5:26 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Several properties are shared between all TLMM bindings. By providing a
> common binding to define these properties each platform's binding can be
> reduced to just listing which of these properties should be checked for
> - or further specified.
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patches applied! Good work with the YAML conversion here,
much appreciated!

Yours,
Linus Walleij
