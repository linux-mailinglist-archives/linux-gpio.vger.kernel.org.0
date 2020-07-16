Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F1D221ED9
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 10:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGPIrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 04:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgGPIrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 04:47:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E90C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:47:42 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id x9so6229551ljc.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=92XopjWnoleG4glqsG4BU2p6Ba/zWqLgWpalogX+TCM=;
        b=vGgDGorzuOsneFcC3GpsD5YykNaUbLa2RmqVO839gEwfNOPrEWsw+JY2IAm6dSaLr7
         k3vylz47FrnNst/TJjyPiMQb1a9+kOmPpO14osAdLWkhcir/GAA4jdHXBlODomeo9DG7
         N7uN7ZsIsNVu3WtprIIdogMfWtMT6kR121fIeI8aY61Mgy3HW9FDwg48e/LmA+JEbSQW
         ZDujGl2IaFZl2dkLaTotWiouiUsrQTPvDH9zriM2NtdlBkuazB/5SXFRcQJ/catxZEfi
         j0VcnZBGwQXaRQFJA86ZN6hcssSICMTrrFR8sV9GOH+Z2yotj3brmFvCn+0YDgXp3XZU
         2BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=92XopjWnoleG4glqsG4BU2p6Ba/zWqLgWpalogX+TCM=;
        b=j9yeEgifmLtNDmyj1w7eTMtCc23W6Kad83RL/Ks71RHIEQyUwkiXGOJI3WhL+VvuX/
         pePSUCNI/N/lpKgQl3mEhWfglaPFcAlqKwWGir3hK0kuFBQx2Hw5DqPe61GeTKYtgVgO
         26k52U5Narz5L31kT/sxbk3v9pDS9LqX3AIgdnShA97ex7NvAjm2SjPkTsaPnYGODWV3
         WqPa2rnx3MonqE2gkA0y+OAkEqmlNCYsQnRutvQ5iYq1yz12mtfYXhkfj1LoYpfJVCin
         6azwZpqDmuf2aVxf1U3tj521ad55zuutmCh4KKnEqtqF+DBjyp1TfF+Bb6IW2nQSPU4+
         2UMA==
X-Gm-Message-State: AOAM532SdtLggv9nu9Y6THthWpkDsxvYoLKMh4griI/q1Kk2z6/Fr1ue
        YGvsDoByxsOZflHuQcQUL2P143noMvwyUicGYjZzLw==
X-Google-Smtp-Source: ABdhPJy82hgoliVm6eopFXRyK6GD8v0CzkbH74FPpFZaLSVg+5+aHAZq1hO5uiZU7LO2CprZctMqX0Xm68KIEVQ/u6I=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr1558882ljj.283.1594889260812;
 Thu, 16 Jul 2020 01:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200703080646.23233-1-computersforpeace@gmail.com>
In-Reply-To: <20200703080646.23233-1-computersforpeace@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:47:30 +0200
Message-ID: <CACRpkdar+aBBFn6SKJ1a90D-NT3F6qGvouzjt-jxaiR0VSuUOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq4019: add open drain support
To:     Brian Norris <computersforpeace@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.or>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jaiganesh Narayanan <njaigane@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 3, 2020 at 10:06 AM Brian Norris
<computersforpeace@gmail.com> wrote:

> From: Jaiganesh Narayanan <njaigane@codeaurora.org>
>
> Signed-off-by: Jaiganesh Narayanan <njaigane@codeaurora.org>
> [ Brian: adapted from from the Chromium OS kernel used on IPQ4019-based
>   WiFi APs. ]
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Patch applied because this looks innocent and Rob
ACKed the binding.

If Bjorn opposes, I will simply pull the patch out again.

Yours,
Linus Walleij
